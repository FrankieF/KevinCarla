package
{
	import flash.events.Event;
	
	// The PrismController class is used to check the Prisms and the order they are being pressed
	// The PrismController class also opens the door
	
	public class PrismController extends BasePrism
	{
		// This variable is a list of Prims 
		private var _targets:Vector.<BasePrism> = new Vector.<BasePrism>;
		
		// This is a counter that is used to see how many Prisms are activated
		private var _completeCounter:int = 0;
		
		// This will become true when the right order of Prisms has been activated
		// The door will then open
		public var openDoor:Boolean;
		
		// The number of prisms in the current level
		public var prismsInLevel:Number = 2;
		
		// If there are no double prisms
		public var evenNumer:Number = 2;
		
		// If there is a double prism
		public var oddNumer:Number = 3;
		
		public var sounds:Sounds;
		
		static public var resetState:Boolean;
		
		public function PrismController()
		{
			sounds = new Sounds();
		}
		
		override public function update():void
		{
			// This is a bool to see if one Prism has been lit
			var $lastLit:Boolean;
			var $failed:Boolean;
			
			// This for loop goes through the target list and checks if the Prisms are being activated
			for (var i:int = 0; i < _targets.length; i++)
			{
				//if (_targets[_completeCounter] is DoublePrism)
				//{
					//prismsInLevel = oddNumer;
				//}
				//else 
				//{
					//prismsInLevel = evenNumer;
				//}
				//
				// If the number of Prisms activated is less than 2
				if (i < _completeCounter + prismsInLevel)
				{
					// If the number of Prisms lit are greater than or equal to the counter 
					if (i >= _completeCounter)
					{
						// This checks a Prism is lit and lastLit is not true
						if (_targets[i].activated && !$lastLit)
						{
							// lastlit becomes true
							$lastLit = true;
						}
						
						// This will run if the players interact with a second Prism while the first one is being lit
						else if (_targets[i].activated && $lastLit)
						{
							_targets[i].complete = _targets[i - 1].complete = true;
							
							// The counter increases by 2
							_completeCounter += 2;
						}
					}
				}
				
				// If no Prisms are activated at the current frame
				else if (_targets[i].activated)
				{
					_targets[i].activated = false;
					_targets[i].complete = false;
					$failed = true;
					break;					
				}				
			}
			
			if ($failed)
			{				
				if (_targets[_completeCounter + 1].activated && !_targets[_completeCounter].activated)
						_completeCounter++;
				
				for (var j:int = _completeCounter; j >= 0; j--)
				{
					_targets[j].activated = false;
					dispatchEvent(new Event(LevelBase.SPAWN_ENEMY, true)); 
					sounds.playerFailure();
				}
				
				// The counter is reset to 0
				_completeCounter = 0;
			}
			
			// If the counter is greater than the number of Prisms in the target list the door will open
			if (_completeCounter >= _targets.length)
			{
				// openDoor becomes true and removes the door from the stage
				openDoor = true;
			}
		}
		
		// This function allows us to set the value of targets outside the class PrismController
		public function set targets(value:Vector.<BasePrism>):void
		{
			_targets = value;
		}

	}

}