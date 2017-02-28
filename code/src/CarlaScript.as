package
{
	// This is the code for the second player of the game Carla
	// Carla is the girl player
	// This code only changes the keys that need to be pressed to make Carla move
	
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import GameObject;
	import Key;
	import flash.geom.Point;
	
	public class CarlaScript extends Player
	{
		
		public function CarlaScript()
		{	
			// Makes the hitbox of the player a seperate movieclip so they can go through the Door
			target = hitbox_mc;
			
			// Changes the keys to WSDA for the control style and Spacebar for interacting
			moveUpKey = Keyboard.W;
			moveDownKey = Keyboard.S;
			moveLeftKey = Keyboard.A;
			moveRightKey = Keyboard.D;
			activateKey = Keyboard.E;
			pictureKey = Keyboard.Q;
			
			
			stateReference = [
					{name:"downIdle", animation:CarIdleFront},			
					{name:"downWalk", animation:CarWalkDown},			
					{name:"upIdle", animation:CarIdleBack},			
					{name:"upWalk", animation:CarWalkUp},			
					{name:"leftIdle", animation:CarIdleSide},			
					{name:"leftWalk", animation:CarWalkSide},			
					{name:"downIdle", animation:CarIdleFront},			
			
			];
			
			setState("downIdle");
		}
	}
}