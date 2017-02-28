package level 
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	
	public class Bedroom1 extends LevelBase
	{
		public var sounds:Sounds;
		
		public var picture:Picture;
		
		public var popUp:PopUp;
		
		var playSound:Boolean;		
		
		public function Bedroom1()
		{
			sounds = new Sounds();
			
			SoundMixer.stopAll();
			
			sounds.level3.play();
			
			// A new PrismController is created to store the order the prisms must be activated in
			var $pc:PrismController = new PrismController();
			$pc.targets = Vector.<BasePrism>([prism1_mc,prism2_mc]); //order of names is the order it looks for them
			addChild($pc);
			
			// Door is created as the target that gets destroyed after the correct order of the prisms
			Door(door_mc).playerTarget = $pc;
		}
		
		override public function update():void
		{
			
		}
	}
	
}
