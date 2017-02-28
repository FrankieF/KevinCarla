package
{
	import flash.geom.Point;
	
	public class MathUtil
	{
		
		public function MathUtil()
		{
		
		}
		
		static public function isWithinRange(target1Range:Number, target1X:Number, target1Y:Number, target2Range:Number, target2X:Number, target2Y:Number):Boolean
		{
			var dX:Number = target1X - target2X;
			var dY:Number = target1Y - target2Y;
			
			var minDistance:Number = (target1Range + target2Range);
			var distance:Number = Math.sqrt(dX * dX + dY * dY);
			
			//trace("minDistance:"  +minDistance);
			//trace("distance:"  +distance);
			if (distance < minDistance)
			{
				return true;
			}
			return false;
		}	
		
		static public function areBothWithinRange(target1Range:Number, target1X:Number, target1Y:Number, target2Range:Number, target2X:Number, target2Y:Number, target3X:Number, target3Y:Number):Boolean
		{
			var dX1:Number = target1X - target3X;
			var dY1:Number = target1Y - target3Y;
			
			var dX2:Number = target2X - target3X;
			var dY2:Number = target2Y - target3Y;
			
			var minDistance:Number = (target1Range + target2Range);
			
			var distance1:Number = Math.sqrt(dX1 * dX1 + dY1 * dY1);
			var distance2:Number = Math.sqrt(dX2 * dX2 + dY2 * dY2);
			
			if (distance1 < minDistance && distance2 < minDistance)
				return true;
				
			return false;
		}
		
		static public function  dotProduct(target1X:Number, target1Y:Number, target2X:Number, target2Y:Number):Number 
		{
			var dot:Number = target1X * target2X + target1Y * target2Y;
			return dot;
		}
		
		static public function angleBetween(valuePoint1:Point, valuePoint2:Point, valuePoint3:Point):Number
        {
			//valuePoint1: enemy's location
			//valuePoint2: where the enemy is looking at
			//valuePoint3: the player's location
			//valuePoint4: where the player is looking at
			
			var xDistance:Number = valuePoint3.x - valuePoint1.x;
			var yDistance:Number = valuePoint3.y - valuePoint1.y;

			var angle_Enemy_Player:Number = Math.atan2(yDistance, xDistance);
			if (angle_Enemy_Player < 0) angle_Enemy_Player += Math.PI * 2;

			xDistance = valuePoint2.x - valuePoint1.x;
			yDistance = valuePoint2.y - valuePoint1.y;
			
			var angle_Enemy_Direction:Number = Math.atan2(yDistance, xDistance);
			if (angle_Enemy_Direction < 0) angle_Enemy_Direction += Math.PI * 2;

			
			var result;
			
			if (angle_Enemy_Player > angle_Enemy_Direction)
				result = angle_Enemy_Player - angle_Enemy_Direction;
			else
				result = Math.PI * 2 + (angle_Enemy_Player - angle_Enemy_Direction);
			
			//trace("angle_Enemy_Player = " + (angle_Enemy_Player * 180 / Math.PI));
			//trace("angle_Enemy_Direction = " + (angle_Enemy_Direction * 180 / Math.PI));
			//trace("result = " + result*180 / Math.PI);
			
			return result * 180 / Math.PI;
			
			
			/*
            var vector1:Point = new Point(valuePoint1.x - valuePoint2.x, valuePoint1.y - valuePoint2.y);
            var vector2:Point = new Point(valuePoint3.x - valuePoint4.x, valuePoint3.y - valuePoint4.y);
			//trace("Vector 1 = (" + vector1.x + ", " + vector1.y + ")");
            //trace("Vector 2 = (" + vector2.x + ", " + vector2.y + ")");
            
            var vector1Magnitude:Number = Math.sqrt(Math.pow(vector1.x, 2) + Math.pow(vector1.y, 2));
            var vector2Magnitude:Number = Math.sqrt(Math.pow(vector2.x, 2) + Math.pow(vector2.y, 2));
            
            var dotProduct:Number = (vector1.x * vector2.x) + (vector1.y * vector2.y);
            
            var resultado:Number = (Math.acos(dotProduct / (vector1Magnitude * vector2Magnitude))) * (180/Math.PI);            
            */
            //return(resultado);
        }
	}

}