package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import GameObject;
	import EnemySpawnPoint;
	import Enemy;
	
	public class LevelBase extends MovieClip
	{
		
		static public const LEVEL_COMPLETE:String = "onLevelComplete";
		static public const SPAWN_ENEMY:String = "onEnemySpawn";
		
		public var pictureReaction:Boolean;
		
		public var eSpawn:EnemySpawnPoint;
		
		public function LevelBase() 
		{
			addEventListener(LevelBase.SPAWN_ENEMY, onSpawnEnemy);
			addEventListener(Event.ENTER_FRAME, onUpdate);
			
			//eSpawn = new EnemySpawnPoint();
		}		
		
		private function onUpdate(e:Event):void 
		{			
			update();
		}
		
		public function update():void 
		{
			
		}
		
		private function onSpawnEnemy(e:Event):void 
		{
			var $enemy:Enemy = new Enemy();
			addChild($enemy);
			
			$enemy.x = EnemySpawnPoint.pos.x;
			$enemy.y = EnemySpawnPoint.pos.y;
			//$enemy.x = stage.stageWidth * .5;
			//$enemy.y = stage.stageHeight * .5;
		}
		
		public function destroy():void
		{
			removeEventListener(LevelBase.SPAWN_ENEMY, onSpawnEnemy);
			removeEventListener(Event.ENTER_FRAME, update);
			
			while(GameObject.list.length) 
				GameObject.list[0].destroy();			
		}
		
	}
}