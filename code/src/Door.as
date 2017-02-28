package 
{
	import flash.events.Event;
	import flash.media.Sound;
	// This references the door in the game levels
	// The door will be deleted when the correct prisms have been lit
	
	public class Door extends GameObject
	{
		public var playerTarget:PrismController;
		
		var sounds:Sounds;
		
		public function Door()
		{
			sounds = new Sounds();
			
			stateReference = [
				{name:"idle",animation:IdleDoor},
							];				
							
			setState("idle");
		}		
		//Checks to see ifcorrect prisms are lit and destroys the door
		override public function update():void
		{
			// The prisms are lit 
			if (playerTarget != null && playerTarget.openDoor)
			{
				sounds.doorOpened.play();
				
				// Door gets destroyed
				destroy();
			}
		}
	}
}