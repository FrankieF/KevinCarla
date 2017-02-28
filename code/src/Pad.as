package  
{
	// The Pad class is used to load levels
	// The Pad is behind the doors and only touchable once the Door is opened
	// Touching the pad loads levels
	import flash.events.Event;
	
	public class Pad extends GameObject
	{
		
		public function Pad() 
		{
			
		}
		
		override public function update():void
		{
			// If the player touches the prism
			if (collision([Player]))
			{
				// This calls the event to load the next level in the array
				dispatchEvent(new Event(LevelBase.LEVEL_COMPLETE, true));
			}
		}
	}

}