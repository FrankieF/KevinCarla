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

	public class EnemyExample extends GameObject
	{		
		public var sounds:Sounds;

		public function EnemyExample()
		{
			// Causes the enemy class to update on the main with the rest of the game object updates
			super();
			
			sounds = new Sounds();
			
			// Changes the target from null to the target movie clip on the back of the enemy
			target = target_mc;
			
			stateReference = [ 
						{name:"idle",animation:Gh1Idle},
							];
							
			setState("idle");
		}

		override public function update():void
		{
			// Calls the movement function 
			eCollision();

		}
		
		public function eCollision():void
		{
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
				}
			}
			
		}
	}
}