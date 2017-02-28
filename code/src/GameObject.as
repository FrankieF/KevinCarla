package
{
	// This is the GameObject class
	// Everything in the game extends from this class
	// Collision and other functions for everything in the game are located in this class
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.sensors.Accelerometer;
	//import flashx.textLayout.elements.ListElement;
	
	public class GameObject extends MovieClip
	{
		// Checks to see if enemies should stop movement when the game is paused
		static public var gamePaused:Boolean = false;
		
		// This list is created to take in a list of all the GameObjects 
		static public var list:Vector.<GameObject> = new Vector.<GameObject>;
		
		// The target is used for collision
		// The target can be used to see if something is colliding with a specific part of something else
		public var target:MovieClip;
		
		//static public var isVisible = false;
		
		public var state:String = "";
		
		public var stateAnimation:Sprite;
		
		public var stateReference:Array;
		
		public function GameObject()
		{
			// The target becomes equal to the GameObject by default
			target = this;
			
			// The list is pushed so the class and get the reference to it
			list.push(this);
		}
		
		public function update():void
		{
		
		}
		
		// This is the collision function
		// The function works by taking the list created in this class
		// The list is then checked to see what is coliding with what and returns the value of the collision in the form of a GameObject
		public function collision(typesColliding:Array, $target:DisplayObject = null):GameObject
		{
			// If the target is equal to null it becomes equal to the target above which is the GameObject
			if($target == null)
				$target = target;
			
			// This for loop goes through the entire list 	
			for (var i:int = list.length - 1; i >= 0; i--)
			{
				// A new variable is created and is a GameObject in the list
				// This can be used to see if the part in the list colliding is the GameObject the class is looking for
				// The bool is created to check if the object we are looking for is colliding
				var item:GameObject = list[i], found:Boolean = false;
				
				// This for loop takes in the objects colliding and goes through them
				for (var f:int = typesColliding.length - 1; f >= 0; f--)
				{
					// Checks to see if the item we are looking for is colliding
					if (item is typesColliding[f])
					{
						// If the item is what we are looking for the bool becomes true and breaks out of the for loop
						found = true;
						break;
					}
				}
				
				// If we found the object we are looking for and the object is colliding with something that is not itself
				if (found && $target.hitTestObject(item.target) && this != item)
				{
					// The item will be returned
					return item;
				}
			}
			
			// Nothing was found and it returns null
			return null;
		}
		
		// The moveBy function takes in the objects colliding from the collision function
		// A new X and Y variable are created and set to 0
		// The X and Y are created to use against an object if they are colliding against something they are not suppsoed to go through
		// The function is used to stop objects from moving through things we do not want them moving through
		public function moveBy(typesColliding:Array, $x:Number = 0, $y:Number = 0, $target:DisplayObject = null):void
		{
			// This variable is equal to a GameObject but not assigned a value
			var $collision:GameObject;
			
			// The X of whatever is calling the function increased by the X we created in the function
			x += $x;
			
			// Checks collision to see if it is colliding with what the object calling the function specified
			// And then checks to make sure it is not colliding with nothing or null
			if (($collision = collision(typesColliding, $target)) != null)
			{
				// The X value of the object calling the function subtracts a X value equal to it's own X value
				// This stops the object from moving
				x -= $x;
				onCollideX($collision);
			}
			
			// The Y of whatever is calling the function increased by the Y we created in the function
			y += $y;
			if (($collision = collision(typesColliding, $target)) != null)
			{
				// The Y value of the object calling the function subtracts a Y value equal to it's own Y value
				// This stops the object from moving
				y -= $y;
				onCollideY($collision);
			}
		}
		
		public function onCollideX($collision:GameObject):void 
		{
			
		}
		
		public function onCollideY($collision:GameObject):void 
		{
			
		}
		
		// The getType function returns a specific GameObject type
		// This is used to quickly check for collision with a certain object 
		static public function getType($class:Class):Vector.<GameObject>
		{
			// This new list is created and is a list of GameObjects
			var $list:Vector.<GameObject> = new Vector.<GameObject>;
			
			// The for loop goes through the original list
			for (var i:int = 0; i < list.length; i++)
			{
				// If the specific thing we are looking for is a class and it is found
				if (list[i] is $class)
				{
					// The new list is a list of the class
					// The new list will be equal to the number of that class on stage
					$list.push(list[i]);
				}
			}
			
			// The new list is returned
			return $list;
		}
		
		// The destroy function is used to remove objects from the stage and memory
		public function destroy():void
		{
			// indexOf is an int that is equal to a list of the GameObject
			var indexOf:int = list.indexOf(this);
			
			// If the list if greater than -1 the object will be removed from the list
			if (indexOf > -1)
			{
				// The list will remove the object from the list
				list.splice(indexOf, 1);
			}
			
			// If the object has a parent
			if (parent)
			{
				// The object will be removed as a child
				parent.removeChild(this);
			}
				
			//trace("removing item: "+this+" list: " + list.length + ": " + list);
		}
		
		
		
		
		public function setState($state:String):void
		{
			if ($state != state)
			{
				state = $state;
				
				if (stateReference)
				{
					for (var i:int = 0; i < stateReference.length; i++) 
					{
						if (stateReference[i].name == state)
						{
							break;
						}
					}
					if (i < stateReference.length)
					{
						if (stateAnimation != null && stateAnimation.parent != null)
						{
							stateAnimation.parent.removeChild(stateAnimation);
						}
						stateAnimation = new stateReference[i].animation;
						addChild(stateAnimation);
					}					
				}
			}
		}
	}

}