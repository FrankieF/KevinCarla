package level 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundMixer;	
	
	public class Room2 extends LevelBase
	{
		var sounds:Sounds;
		
		public function Room2() 
		{
			sounds = new Sounds();
			
			SoundMixer.stopAll();
			
			sounds.level2.play();
		}
		
		override public function update():void
		{
			
		}
		
	}

}