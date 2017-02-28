package
{
	// The Prism class is used to control the Prisms on the stage when they are activated
	// The Prism class changes their animation only
	
	//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////
	// BLUE PRISM CLASS
	////////////////////////////////////////////////////
	///////////////////////////////////////////////////
	
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.media.Sound;	
	import flash.media.SoundChannel;
	
	public class Prism extends BasePrism
	{
		var sounds:Sounds;
		
		var playSound:Boolean;
		
		var keyPressed:Boolean;
		
		public function Prism()
		{	
			sounds = new Sounds();
			
			stateReference = [
				{name:"idle",animation:CryBlueOff },
				{name:"lit", animation:CryBlueOn },
							];
			setState("idle");
			
			playSound = true;
		}
		
		override public function update():void
		{
			// A new list is created of Players on the stage
			var $list:Vector.<GameObject> = getType(Player);
			
			// This is used to check if the Prism is being activated
			var $check:Boolean;
			
			keyPressed = false;
			
			// This for loop checks the list of Players to see if they are interacting with the Prisms
			for (var i:int = 0; i < $list.length; i++)
			{
				// This variable is an object of the Player class and is equal to the list we created
				var $player:Player = Player($list[i]);
				
				// The MathUtil function isWithinRange is called to see if the players are close enough to the Prism to interact with it
				if ((MathUtil.isWithinRange(25, $player.x, $player.y, height, x, y) && Key.isKeyPressed($player.activateKey) || activated))
				{
					// The players interact with the Prism and it plays the lit animation
					
					setState("lit");
					
					keyPressed = true;
					
					// Check becomes true which can be used to change activated
					$check = true;
				}				
			}
			
			if (keyPressed)
			{				
				if (playSound)
				{
					playSound = false;
					sounds.pictureSounds();
				}
			}
			
			// activated becomes equal to check
			if($check)
				activated = $check;
				
			if (!activated)
				setState("unlit");
		}
		override public function get activated():Boolean
		{
			return _activated;
		}
		
		override public function set activated(value:Boolean):void 
		{
			_activated = value;
			
		}
		
		override public function get complete():Boolean 
		{
			return _complete;
		}
		
		override public function set complete(value:Boolean):void 
		{
			_complete = value;
		}
	}

}