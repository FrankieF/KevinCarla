package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////
	// RED PRISM CLASS
	////////////////////////////////////////////////////
	///////////////////////////////////////////////////
	
	public class DoublePrism extends BasePrism
	{
		var stayLit:Boolean;
		
		var keyPressed:Boolean;
		var playSound:Boolean;
		
		var sounds:Sounds;
		
		public function DoublePrism() 
		{
			sounds = new Sounds();
			
			playSound = true;
			
			stateReference = [
				{name:"idle", animation:CryRedOff},
				{name:"lit",animation:CryRedOn},
							];
							
			setState("idle");
		}
		
		override public function update():void 
		{
			var $list:Vector.<GameObject> = getType(Player);
			
			var $check:Boolean;
			
			var $numInRange:int = 0;
			var $targetInRange:int = 2;
			
			keyPressed = false;
			
			for (var i:int = 0; i < $list.length; i++) 
			{
				var $player:Player = Player($list[i]);
			if(MathUtil.isWithinRange(25, $player.x, $player.y, height, x, y) && Key.isKeyPressed($player.activateKey) || activated)
				{
					stayLit = true;
					$numInRange++;
				}
				
				if ($numInRange >= $targetInRange)
				{
					keyPressed = true;
					$check = true;
					setState("lit");
				}
			}
			
			//if(!stayLit)
			//{
				//setState("idle");
			//}
			
			if (keyPressed)
			{				
				if (playSound)
				{
					playSound = false;
					sounds.pictureSounds();
				}
			}
			
			if ($check)
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