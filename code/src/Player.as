package  
{
	// The player class is used to hold the variables for Kevin and Calra
	// The class is also used for the getType function
	// Using getType to look for player it can reference both players
	// This saves code by only checking for this class and not both of them
	
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	public class Player extends GameObject 
	{
		// This point is used to make the players move
		protected var velocity:Point = new Point();	
		
		// These variables are the keys needed to make the players move in a direction or interacting with an object
		// These are not defined here but in the seperate player classes so the players have different buttons
		public var moveUpKey:uint;
		public var moveDownKey:uint;
		public var moveLeftKey:uint;
		public var moveRightKey:uint;
		public var activateKey:uint;
		public var pictureKey:uint;

		public var keyPressed:Boolean = false;
		
		public var nosounds:Boolean;
		
		//Vars for life and movement speed of players
		protected var moveSpeed:Number = 5;		
		
		protected var directionState:String = "";

		//Var to see if player is moving an object
		public var MoveObject:Boolean;
		
		public var sounds:Sounds;
		public var sc:SoundChannel;
		public var isSoundPlaying:Boolean;
		public var st:SoundTransform;
		
		public function Player() 
		{
			sounds = new Sounds();
			sc = new SoundChannel();			
			sc.addEventListener(Event.SOUND_COMPLETE, resetIsPlaying);
		}
		
		public function resetIsPlaying(e:Event)
		{
			st = new SoundTransform(.2,0);
			isSoundPlaying = false;			
		}
		
		override public function update():void 
		{		if (Key.isKeyPressed(activateKey)) trace("pressed");

			//filters
			// The velocity of the players is reset if nothing is being pressed
			velocity.x =  0;
			velocity.y =  0;
			var moveState:String = "Idle";
			// if the key to move up is pressed the player will rotate and move up
			
			keyPressed  = false;
			if (Key.isKeyPressed(moveUpKey))	
			{
				velocity.y -=  moveSpeed;
				keyPressed = true;
				directionState = "up";	
			}
			
			// if the key to move down is pressed the player will rotate and move down
			if (Key.isKeyPressed(moveDownKey))
			{
				velocity.y +=  moveSpeed;
				keyPressed = true;
				directionState = "down";
			}
			
			// if the key to move right is pressed the player will rotate and move right
			if (Key.isKeyPressed(moveRightKey))
			{
				velocity.x +=  moveSpeed;
				keyPressed = true;
				scaleX = -1;
				directionState = "left";
			}
			
			// if the key to move left is pressed the player will rotate and move left
			if (Key.isKeyPressed(moveLeftKey))
			{
				velocity.x -=  moveSpeed;
				keyPressed = true;
				scaleX = 1;
				directionState = "left";
			}
			
			if (keyPressed)
			{
				moveState = "Walk";
			}
			
						
			// Normalizes the velocity of the players
			velocity.normalize(moveSpeed);
			
			// Stops the player from moving through the specified objects
			
			velocity.x = Math.floor(velocity.x * 10) / 10;
			velocity.y = Math.floor(velocity.y * 10) / 10;
			moveBy([Wall,Player, WallPassable,Door],velocity.x, velocity.y);
			
			// Checks to see if the player is interactnig with an object
			if (Key.isKeyPressed(activateKey))
			{
				// The bool becomes true
				MoveObject=true;
			}
			 
			// Player is not interacting so the bool is set to false
			else 
			{
				MoveObject=false;
			}	
			
			setState(directionState+moveState);
			
			if (keyPressed)
			{
				if (!isSoundPlaying)
				{					
					sc = sounds.carlaSteps.play(0,1,st);					
					isSoundPlaying = true;
				}					
			}
			else
			{	
				sc.stop();
				isSoundPlaying = false;
			}
		}
		
		override public function onCollideX($collision:GameObject):void
		{
			
		}
		
		override public function onCollideY($collision:GameObject):void 
		{
			
		}
	}


}