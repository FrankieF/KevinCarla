package level 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundMixer;	
	import popup.PopUp10;
	
	public class Hallway4 extends LevelBase 
	{
		public var sounds:Sounds;
		
		public var picture:Picture;
		
		public var popUp:PopUp;
		
		var playSound:Boolean;		
		
		public function Hallway4()
		{
			sounds = new Sounds();
			
			SoundMixer.stopAll();
			
			sounds.level2.play();
			
			// A new PrismController is created to store the order the prisms must be activated in
			var $pc:PrismController = new PrismController();
			$pc.targets = Vector.<BasePrism>([prism1_mc,prism2_mc,prism3_mc,prism4_mc,prism5_mc,prism6_mc]); //order of names is the order it looks for them
			addChild($pc);
			
			// Door is created as the target that gets destroyed after the correct order of the prisms
			Door(door_mc).playerTarget = $pc;
			
			picture = Picture(GameObject.getType(Picture)[0]);
			popUp = PopUp(GameObject.getType(PopUp10)[0]) as PopUp;
		}
		
		override public function update():void
		{
			if (picture.isVisible)
			{
				if (!playSound)
				{
					GameObject.gamePaused = true;
					playSound = true;
					popUp.visible = true;
					sounds.pictureSounds();
				}
			}
			else
			{
				GameObject.gamePaused = false;
				playSound = false;
				popUp.visible = false;
			}
			
		}
	}
	
}