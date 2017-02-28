package
{
	// The Prism class is used to control the Prisms on the stage when they are activated
	// The Prism class changes their animation only
	
	//////////////////////////////////////////////////////
	/////////////////////////////////////////////////////
	// GREEN PRISM CLASS
	////////////////////////////////////////////////////
	///////////////////////////////////////////////////
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class FlashingPrism extends BasePrism
	{
		var prismNumber:Number = 0;
		
		var sounds:Sounds;
		
		var keyPressed:Boolean;
		var playSound:Boolean;
		
		public function FlashingPrism()
		{
			sounds = new Sounds();
			playSound = true;
			
			stateReference = [
				{name:"idle", animation:CryGreenOff },
				{name:"lit", animation:CryGreenOn },
							];
			setState("idle");
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
				if ((MathUtil.isWithinRange(25, $player.x, $player.y, height, x, y) && Key.isKeyPressed($player.activateKey)))
				{
					prismNumber++;
					
					if (prismNumber >= 2)
					{					
						// Check becomes true which can be used to change activated
						$check = true;
						keyPressed = true;
					}
				}
				
			}
			// activated becomes equal to check
			//if($check)
				//activated = $check;
			if (!_complete)
			{
				activated = $check;
				
				activated ? setState("lit"):setState("idle");
			}
			
			if (keyPressed)
			{
				if (playSound)
				{
					playSound = false;
					sounds.pictureSounds();
				}
			}
			
		}
		
		// This function is used to get the true or false value of activated from other classes
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