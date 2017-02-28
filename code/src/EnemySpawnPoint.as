package  
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class EnemySpawnPoint extends GameObject
	{
		public static var pos:Point;
		
		public function EnemySpawnPoint() 
		{
			pos = new Point(this.x, this.y);
		}
		
	}

}