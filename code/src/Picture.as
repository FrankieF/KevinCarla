package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	public class Picture extends GameObject
	{
		public var isVisible:Boolean = false;
		
		public var bInRange:Boolean;
		
		//public var pictureMC:MovieClip = null;
		
		public function Picture() 
		{
			//pictureMC = this;
			isVisible = false;
		}
		
		override public function update():void 
		{
			// List of players on the stage to see if any players are near the picture
			var $list:Vector.<GameObject> = getType(Player);
			
			// For loop to check if the players are interacting with the picture
			for (var i:int = 0; i < $list.length; i++) 
			{
				// If there is a player it is stored inside of this variable
				var $player:Player = Player($list[i]); 										  
				 bInRange = MathUtil.isWithinRange(25, $player.x, $player.y, height, x, y) && Key.isKeyDown($player.pictureKey);
				 
				trace("In range: " + $player.pictureKey);
				
				if(bInRange)
				{
					isVisible = true;
					break;
				}
				else
				{
					isVisible = false;
				}
			}
		}
		
	}

}