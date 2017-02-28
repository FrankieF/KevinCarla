package 
{
	// The Key class is used to detect which keys were pressed
	// After seeing what keys were pressed we can check if they are the keys we are looking for
	
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;

	public class Key
	{
		// This list is created to see which key is pressed and becomes equal to the second list
		static private var currentKeyList:Array = [];
		
		// The second list is used to see what keys are pressed
		static private var NewList:Array = [];
		
		// The Key function has stage:Stage because it has to reference the stage to be used
		public function Key(stage:Stage)
		{
			// These two event listeners are used to check when keys are up or down
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			
			// This creates an update listener
			stage.addEventListener(Event.EXIT_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			// This for loop creates a key which is an object
			// Then checks to see if there are any keys in the second list
			for (var $key:Object in  NewList)
			{
				// The first list becomes equal to the second list
				currentKeyList[$key] = NewList[$key];
				
				// The second list is then deleted
				delete NewList[$key];
			}
		}
		
		// If the keys are up 
		private function onKeyUp(e:KeyboardEvent):void
		{
			// The second list does not get a key added to it
			NewList[e.keyCode] = false;
		}
		
		// If the key is down
		private function onKeyDown(e:KeyboardEvent):void
		{
			// The second list gets a key added to it
			NewList[e.keyCode] = true;
		}
		
		// isKeyPressed returns a bool if the key is pressed
		static public function isKeyPressed($key:uint):Boolean
		{
			// Returns true of false if the key is pressed
			return currentKeyList[$key];
		}
		
		// isKeyReleased returns a bool if the key is released
		static public function isKeyReleased($key:uint):Boolean
		{
			// The second list is false and the first list is true
			return (NewList[$key] == false &&  currentKeyList[$key] == true);
		}
		
		// isKeyDown checks if the key is down and returns a bool
		static public function isKeyDown($key:uint):Boolean
		{
			// The second list is true and first list is false
			return (NewList[$key] == true && !currentKeyList[$key]);
		}
	}

}