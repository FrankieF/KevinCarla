package  
{
	public class BasePrism extends GameObject
	{
		public var _activated:Boolean;
		public var _complete:Boolean;
		
		public var prismState:String = "";
		
		public function BasePrism() 
		{
			
		}
		
		override public function update ():void 
		{
			
		}
		
		 // This function is used to get the true or false value of activated from other classes
		public function get activated():Boolean
		{
			return _activated;
		}
		
		public function set activated(value:Boolean):void 
		{
			_activated = value;
			
		}
		
		public function get complete():Boolean 
		{
			return _complete;
		}
		
		public function set complete(value:Boolean):void 
		{
			_complete = value;
		}
		
	}

}