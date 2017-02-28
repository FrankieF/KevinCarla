package level 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundMixer;	
	
	public class Hallway1 extends LevelBase 
	{
		public var sounds:Sounds;	
		
		public function Hallway1()
		{
			// Sounds is created to reference the sound class
			sounds = new Sounds();
			
			// Stops current sound playing
			SoundMixer.stopAll();
			
			// Plays music for level
			sounds.level2.play();
		}
		
		override public function update():void
		{
			
		}
	}
	
}
