package level 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundMixer;	
	
	public class Room1 extends LevelBase
	{
		var sounds:Sounds;
		
		public function Room1() 
		{
			sounds = new Sounds();
			
			SoundMixer.stopAll();
			
			// put sound here
		}
		
		override public function update():void
		{
			
		}
		
	}

}