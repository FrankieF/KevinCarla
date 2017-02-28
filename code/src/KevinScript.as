package 
{
	// The KevinScript class is used for the first player Kevin
	// This class only changes the keys from the Player class
	
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import GameObject;
	import Key;
	import Door;
	import Wall;

	public class KevinScript extends Player
	{		
		public function KevinScript()
		{	
			// Makes the hitbox of the player a seperate movieclip so they can go through the Door
			target = hitbox_mc;
			
			// This changes the keys to the arrow keys and 0 on the number pad for interacting
			moveUpKey = Keyboard.UP;
			moveDownKey = Keyboard.DOWN;
			moveLeftKey = Keyboard.LEFT;
			moveRightKey = Keyboard.RIGHT;
			activateKey = Keyboard.NUMPAD_0;
			pictureKey = Keyboard.NUMPAD_1;
			
			
			stateReference = [
				{name:"downIdle",animation:KevIdleFront},
				{name:"downWalk",animation:KevWalkDown},
				{name:"upIdle",animation:KevIdleBack},
				{name:"upWalk",animation:KevWalkUp},
				{name:"leftIdle",animation:KevIdleSide},
				{name:"leftWalk",animation:KevWalkSide},				
			
			];
			
			setState("downIdle");

		}

		override public function update():void 
		{ 
			super.update();
		}		
	}
}