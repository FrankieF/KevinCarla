package  
{
import flash.events.Event;	
import flash.media.Sound;
	
	public class FlashingPrismController extends BasePrism
	{
		private var _targets:Vector.<FlashingPrism> = new Vector.<FlashingPrism>;
		
		private var _completeCounter:int = 0;
		
		public var openDoor:Boolean;
		
		public var prismsInLevel:Number = 2;
		
		public var sounds:Sound;
		
		public function FlashingPrismController() 
		{
			
		}
		
	}

}