package 
{
	// This is the base enemy class for the ghosts to reference
	// The enemy moves 75 frames in one direction and then calculates another angle to move at
	// If the enemy detects the player in their raduis they will go after the player

	import flash.automation.ActionGenerator;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.ui.GameInput;

	public class Enemy extends GameObject
	{	
		// Pauses the enemy movement
		static public var pauseMovement:Boolean = false;
		
		// Used to reset enemy speed if it increases
		var originalSpeed:Number = 2;

		// The speed the enemy will move at
		var speed:Number = originalSpeed;

		// This determins how fast the enemy will rotate
		var rotatingSpeed:Number = 2;

		// This sets the number of frames the enemy will move in one direction before switching
		var originalValue:Number = 75;

		// Sets the number of frames to be counted down before the enemy changes direction
		var changeDirection:Number = originalValue;

		// Checks to see if changeDirection is above 75, if it is it generates a new angle to rotate at
		// If it is 74 or lower it will continue moving at it's current angle
		var checkDirection:Number = 74;

		// Creates a variable to take in a game object that can be referenced later to check if the player is near the enemy
		var currentPlayer:GameObject;

		// Creates a variable that can be given a value later and be kept throughout the class, outside of the function movement
		var numberGen:Number;

		// Checks to see if the enemy has detected the player
		var detected:Boolean;

		// A new point is created to take the current position of the player and apply it to the velocity of the enemy
		// This makes the enemy move towards the player
		var $delta:Point = new Point;
		
		var ghostAware:Boolean;
		
		var ghostRoamReset:Number = 50;
		
		var ghostRoam:Number = ghostRoamReset;
		
		var checkRoam:Number = 49;
		
		public var sounds:Sounds;

		public var playersDead:Number = 0;

		public function Enemy()
		{
			// Causes the enemy class to update on the main with the rest of the game object updates
			super();
			
			sounds = new Sounds();
			
			// Changes the target from null to the target movie clip on the back of the enemy
			target = target_mc;
			
			stateReference = [
					{name:"idle", animation:Gh1Idle},
					{name:"aggro", animation:Gh1Aggro},
			];
		}

		override public function update():void
		{
			// Calls the movement function 
			movement();

		}

		private function movement():void
		{
			if (pauseMovement == false) //trace("Enemy paused: " + pauseMovement);
				{
					// Forces the enemy to either move towards the player or move at a constant angle that is generated
					if (changeDirection >= 0)
					{
						// If the change direction is 75 it will generate a new anlge for the movement
						if (changeDirection > checkDirection)
						{
							// Creates new angle for the enemy to move at
							numberGen = (Math.random() * 360) / 180 * Math.PI;
						}

						// Creates a point that can be used to move the enemy
						var velocity:Point = new Point();

						// Creates a list of GameObjects that is equal to the Player class
						// The list is used to check if the player is within the enemy raduis
						var $list:Vector.<GameObject >  = getType(Player);


						// The for loop goes through the list (the list if GameObjects of type Player)
						for (var i:int = 0; i < $list.length; i++)
						{
							// If one of the players are near the enemy it puts the player into current player
							if (! detected)
							{
								currentPlayer = $list[i];
							}

							// Calls the function from the MathUtils class
							// The function checks if the player's X and Y and within a radius around the enemy
							var bTest:Boolean = MathUtil.isWithinRange(currentPlayer.width, currentPlayer.x, currentPlayer.y, 200, x, y);
							
							if (bTest)
							{
								if (!ghostAware)
								{
									sounds.Aware();
									ghostAware = true;
								}
								
								// Increases speed if enenmy sees player
								speed++;
								
								setState("aggro");
								
								// The player sees the enemy making detect true
								detected = true;

								// The delta takes in the current players X and Y 
								$delta.x = currentPlayer.x - x;
								$delta.y = currentPlayer.y - y;

								// The enemy will now move towards the player
								velocity = $delta;

								// Normalizes speed so the enemy will move at a constant rate and not move in one direction endlessly
								velocity.normalize(speed);
							}
							else
							{
								detected = false;
								setState("idle");
								!ghostAware;
							}
						}

						// If the velocity of the enemy is 0
						// This means the enemy has not seen the player
						if (velocity.length == 0)
						{
							// The enemies velocity will become the direction he is facing
							// The polar function takes two cordinates and subtracts one from the other
							velocity = Point.polar(2, numberGen);
							!ghostAware;
							
							if (ghostRoam > checkRoam)
							{
								// Plays ghost roaming sound
								sounds.roaming();
							}

						}

						// changeDirection goes down by one every frame
						changeDirection--;
						
						// counts frames to check when the ghost should make noise
						ghostRoam--;
						
						// checks to see the value of the ghostroam, if it is 0 it resets it back to 50
						if (ghostRoam <= 0)
						{
							ghostRoam = ghostRoamReset;
						}
						
						// When changeDirection reaches 0
						if (changeDirection == 0)
						{
							// changeDirection is reset to 75
							changeDirection = originalValue;
						}
					}

				// The velocity of the enemy is converted to a whole number and not kept a decimal
				velocity.x = Math.floor(velocity.x * 10) * .1;
				velocity.y = Math.floor(velocity.y * 10) * .1;

				// Checks the velocity and sets the scale of the enemy
				// 1 is left and -1 is right
				scaleX = velocity.x > 0 ? -1:1;

				// This determines what the enemy cannot move through
				moveBy([Wall, Door, Enemy, WallPassable], velocity.x, velocity.y, collides_mc);

				// This variable is a GameObject that is equal to the Player Class
				// It is used for collision
				var $collides:GameObject = collision([Player]);

				// If the enemy colldies with the player 
				// The player will be destryoed
				if ($collides != null)
				{
					sounds.ghostDeath.play();
					
					// This removes the player from the screen and the list in the GameObject class
					destroy();
					
					if ($collides is KevinScript)
					{
						sounds.kevinSuccess.play();
					}
					
					if ($collides is CarlaScript)
					{
						sounds.carSuccess();
					}
				}

				// If the enemy is not colliding with anything
				if ($collides == null)
				{
					// This checks to see if the player is colliding with the back of the enemy
					$collides = collision([Player],collides_mc);
					if ($collides != null)
					{
						if ($collides is KevinScript)
						{
							Main.player1Alive = false;
							sounds.kevinDeath.play();
						}

						if ($collides is CarlaScript)
						{
							Main.player2Alive = false;
							sounds.carDeath();
						}
						
						sounds.success();

						// This removes the enemy from the screen and the GameObject list
						$collides.destroy();

						detected = false;
					}
				}

				// This is the hitbox of the enemy
				// The hitbox rotates in the opposite direction of the player
				//collides_mc.rotation =  -  rotation;

				// Resets the enemy speed
				speed = originalSpeed;
			}
		}

	}

}