package 
{
	// This is the main class that the stage runs from
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.SoundTransform;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import GameObject;
	import KevinScript;
	import CarlaScript;
	import level.*;
	
	public class Main extends MovieClip
	{		
		static public var paused:Boolean = false;
		
		public var player1PictureActivated:Boolean = false;
		
		public var player2PictureActivated:Boolean = false;
		
		
		public var pauseKey:uint = Keyboard.P;
		public var player1Picture:uint = Keyboard.NUMPAD_1;
		public var player2Picture:uint = Keyboard.Q;
		
		// The levelList contains all of the game levels and is used to load levels
		public var levelList:Array = [
			BlankLevel, 
			Hallway1, 
			Room2, 
			Room1,
			Bedroom1,
			Room4,
			Library, 
			Bedroom2, 
			Hallway2, 
			Room5, 
			Library2, 
			Room3, 
			Hallway7, 
			Bedroom3, 
			Library3,
			Bedroom4,
			Hallway6,
			Hallway5,
			Hallway3,
			Hallway8,
			Hallway9,
			Room6,
			Hallway4,
			];
		
		
		///////////////////////////////////////////////////////////////////////////////
		/*
		
		LEVEL ORDER:
		1. Blank Level
		2. Hallway 1
		3. Room 2
		4. Room 1
		5. Bedroom 1
		6. Room 4
		7. Library
		8. Bedroom 2
		9. Hallway 2
		10. Room 5
		11. Library 2
		12. Room3 
		13. Hallway 7
		14. Bedroom 3
		15. Library 3
		16. Bedroom 4
		17. Hallway 6
		18. Hallway 5
		19. Hallway 3
		20. Hallway 8
		21. Hallway 9
		22. Room 6
		23. Hallway 4
		
		*/
		///////////////////////////////////////////////////////////////////////////////
		
		// CurrentLevel is the level the players are on 
		// Changing the currentLevel, changes the level in the game
		public var currentLevel:LevelBase;
		
		// CurrentLevelIndex is set to 0. This will always run the function onLevelComplete
		// The currentLevelIndex is used to see what level should be played next
		public var currentLevelIndex:int = -1;
		
		
		// Bools check to see if players are alive and are used to reload the level
		static public var player1Alive:Boolean = true;
		static public var player2Alive:Boolean = true;
		
		var mainMusic:Boolean = true;
		
		var sounds:Sounds;
		var st:SoundTransform;
		
		var playMusic:Number = 100;
		
		var check:Boolean=true;
		
		public function Main()
		{			
			// Creates a new Key on the stage so we can track which keys are pressed
			new Key(stage);

			// This creates the update function to run everything in the game
			stage.addEventListener(Event.ENTER_FRAME, update);

			// onLevelComplete is used to destroy the current level from memory and load a new one
			addEventListener(LevelBase.LEVEL_COMPLETE, onLevelComplete);			
			
			addEventListener(MouseEvent.CLICK, navigate);
			
			// 
			onLevelComplete(null);
			
			sounds = new Sounds();
			st = new SoundTransform(.5,0);
		}
		
		public function navigate(e:MouseEvent):void
		{
			if (e.target.name == "btnPlay_mc")
			{
				gotoAndStop("Game");
				dispatchEvent(new Event(LevelBase.LEVEL_COMPLETE, true));
			}
			
			if (e.target.name == "btnCredits_mc")
			{
				gotoAndStop("Credits");
			}
			
			if (e.target.name == "btnMenu_mc")
			{
				gotoAndStop("MainMenu");
			}
		}
		
		private function onLevelComplete(e:Event):void 
		{
			// Checks to see if the currentLevelIndex is less than the list of levels
			if(currentLevelIndex<levelList.length)
			{
				// If a level is loaded
				if (currentLevel)
				{
					// The level is destroyed and removed from memory
					currentLevel.destroy();
					currentLevel.parent.removeChild(currentLevel);
				}	
			
				// CurrentLevel becomes equal to the next level in the list of levels
				currentLevel = LevelBase(new levelList[++currentLevelIndex]);
				addChild(currentLevel);
				//stage.focus = stage;
		
			}			
		}
		
		private function reloadLevel():void 
		{
			stage.focus = stage;
			if (!player1Alive && !player2Alive)
			{
				// If a level is loaded
				if (currentLevel)
				{
					// The level is destroyed and removed from memory
					currentLevel.destroy();
					currentLevel.parent.removeChild(currentLevel);
				}	
		
				// CurrentLevelIndex subtracts 1 to become equal to the current level
				//currentLevelIndex = currentLevelIndex - 1;
				
				// The current level is reset to the currentLevelIndex
				currentLevel = new levelList[currentLevelIndex];
				addChild(currentLevel);
				
				// The playerAlive bools are reset
				player1Alive = true; 
				player2Alive = true;
			}
			
		}
		
		private function goBack():void 
		{
			stage.focus = stage;
				// If a level is loaded
				if (currentLevel)
				{
					// The level is destroyed and removed from memory
					currentLevel.destroy();
					currentLevel.parent.removeChild(currentLevel);
				}	
		
				// CurrentLevelIndex subtracts 1 to become equal to the current level
				//currentLevelIndex = currentLevelIndex - 1;
				
				// The current level is reset to the currentLevelIndex
				currentLevel = new levelList[currentLevelIndex--];
				addChild(currentLevel);			
		}
		
		public function update(e:Event):void
		{
			if (check)
			{
				if(playMusic <= 0)
					{
						check = false;
						
						if(mainMusic)
						{
							!mainMusic;
							sounds.backgroundMain.play(0,0,st);
						}
						
					}
			}
			
			//if (Key.isKeyPressed(pauseKey))
				//paused = true;
			//else
				//paused = false;
				
			if (Key.isKeyPressed(pauseKey) ? paused: !paused)
			
			if (Key.isKeyPressed(player1Picture) ? player1PictureActivated: !player1PictureActivated)
			
			if (Key.isKeyPressed(player2Picture) ? player2PictureActivated: !player2PictureActivated)
			
			if (!paused || !player1Picture || !player2Picture)
			{
			
				// This for loop checks to see which GameObjects have an override update function and it runs them
				for (var i:int = 0; i < GameObject.list.length; i++) 
				{
					GameObject.list[i].update();
				}
			
				reloadLevel();
				
				if(Key.isKeyDown(Keyboard.N))
				{
					dispatchEvent(new Event(LevelBase.LEVEL_COMPLETE, true));
				}
				else if (Key.isKeyDown(Keyboard.B))
				{
					goBack();
				}
			}
			else
			{ 
				
			}
			playMusic--;
		}
	}
}

