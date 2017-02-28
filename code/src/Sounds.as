package  
{
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.media.SoundMixer;
	import flash.net.Socket;
	import level.Level1;
	
	public class Sounds 
	{
		
	//////////////////////////////////////////////////////////////////////
	/*
	
	PLAYER SOUNDS
	
	*/
	//////////////////////////////////////////////////////////////////////
		
		public var carlaSteps:Sound;
		public var carlaDeath:Sound;
		public var carlaDeath2:Sound;
		public var pictureReactionC:Sound;
		public var pictureReactionC2:Sound;
		public var carlaSuccess:Sound;
		public var carlaSuccess2:Sound;
		public var carlaFailed:Sound;
		
		
		public var kevinFailed:Sound;
		public var kevinSuccess:Sound;
		public var kevinDeath:Sound;
		public var pictureReactionK:Sound;
		
	//////////////////////////////////////////////////////////////////////
	/*
	
	ENEMY SOUNDS
	
	*/
	//////////////////////////////////////////////////////////////////////
		
			
		public var ghostAware:Sound;
		public var ghostAware2:Sound;
		public var ghostAware3:Sound;
		public var ghostAware4:Sound;
		public var ghostDeath:Sound;
		public var ghostRoam:Sound;
		public var ghostRoam2:Sound;
		public var ghostRoam3:Sound;
		public var ghostRoam4:Sound;
		public var ghostRoam5:Sound;
		public var ghostRoam6:Sound;
		public var ghostSucceed:Sound;
		public var ghostSucceed2:Sound;
		
	//////////////////////////////////////////////////////////////////////
	/*
		
	ENVIONMENT SOUNDS
		
	*/
	//////////////////////////////////////////////////////////////////////
	
		public var prismOn:Sound;
		public var allPrisms:Sound;
		public var doorLocked:Sound;
		public var doorOpened:Sound;		
		public var backgroundMain:Sound;
		public var level1:Sound;
		public var level2:Sound;
		public var level3:Sound;
	//////////////////////////////////////////////////////////////////////

		
		public function Sounds() 
		{
		//////////////////////////////////////////////////////////////////////
		/*
		
		PLAYER SOUNDS
		
		*/
		//////////////////////////////////////////////////////////////////////
		
			carlaSteps = new CarlaSteps();
			pictureReactionC = new PictureReactionC();
			pictureReactionC2 = new PictureReactionC2();
			carlaDeath = new CarlaDeath();
			carlaDeath2 = new CarlaDeath2();
			carlaSuccess = new CarlaSuccess();
			carlaSuccess2 = new CarlaSuccess2();
			carlaFailed = new CarlaFailed();
			
			
			kevinFailed = new KevinFailed();
			kevinSuccess = new KevinSuccess();
			kevinDeath = new KevinDeath();
			pictureReactionK = new PictureReactionK();
		
		//////////////////////////////////////////////////////////////////////
		/*
		
		ENEMY SOUNDS
		
		*/
		//////////////////////////////////////////////////////////////////////
		
			ghostAware = new GhostAware(); 
			ghostAware2 = new GhostAware2() 
			ghostAware3 = new GhostAware3() 
			ghostAware4 = new GhostAware4() 
			ghostDeath = new GhostDeath(); 
			ghostRoam = new GhostRoam();
			ghostRoam2 = new GhostRoam2();
			ghostRoam3 = new GhostRoam3();
			ghostRoam4 = new GhostRoam4();
			ghostRoam5 = new GhostRoam5();
			ghostRoam6 = new GhostRoam6();
			ghostSucceed = new GhostSuccess();  
			ghostSucceed2 = new GhostSuccess2(); 
			
		//////////////////////////////////////////////////////////////////////
		/*
		
		ENVIORNEMT SOUNDS
		
		*/
		//////////////////////////////////////////////////////////////////////
					
			//prismOn = new PrismOn();
			//allPrisms = new AllPrisms();
			doorLocked = new DoorLocked();
			doorOpened = new OpenDoor(); 			
			backgroundMain = new MainMusic();
			level1 = new Level1Music();
			level2 = new Level2Music();
			level3 = new Level3Music();
			
			
		}
		
		//////////////////////////////////////////////////////////////////////
		/*
		
		PLAYER FUNCTIONS
		
		*/
		//////////////////////////////////////////////////////////////////////
		
		public function playerFailure(): void 
		{
			var playerFail:Array = [];
			
			var playFailed:int = Math.random() * 2;
			
			playerFail.push(carlaFailed);
			playerFail.push(kevinFailed);
			
			playerFail[playFailed].play();
		}
		
		public function carSuccess():void
		{
			var aCarSuccess:Array = [];
			
			var playCarSuccess:int = Math.random() * 2;
			
			aCarSuccess.push(carlaSuccess);
			aCarSuccess.push(carlaSuccess2);
			
			aCarSuccess[playCarSuccess].play();
		}
		
		public function pictureSounds()
		{
			var picSounds:Array = [];
			
			var playPicSounds:int = Math.random() * 3;
			
			picSounds.push(pictureReactionC);
			picSounds.push(pictureReactionC2);
			picSounds.push(pictureReactionK);
			
			picSounds[playPicSounds].play();
		}
		
		public function carDeath():void
		{
			var cDeath:Array = [];
			
			var playDeath:int = Math.random() * 2;
			
			cDeath.push(carlaDeath);
			cDeath.push(carlaDeath2);
			
			cDeath[playDeath].play();
		}
		
		//////////////////////////////////////////////////////////////////////
		/*
		
		ENEMY FUNCTIONS
		
		*/
		//////////////////////////////////////////////////////////////////////
		
		public function roaming():void
		{
			var roam:Array = [];
			
			var playRoam:int = Math.random() * 6;
			
			roam.push(ghostRoam);
			roam.push(ghostRoam2);
			roam.push(ghostRoam3);
			roam.push(ghostRoam4);
			roam.push(ghostRoam5);
			roam.push(ghostRoam6);
			
			roam[playRoam].play();
		}
		
		public function success():void 
		{
			var gSuccess:Array = [];
			
			var playSuccess:int = Math.random() * 2;
			
			gSuccess.push(ghostSucceed);
			gSuccess.push(ghostSucceed2);
			
			gSuccess[playSuccess].play();
		}
		
		public function Aware():void
		{
			var aware:Array = [];
			
			var playAware:int = Math.random() * 4;
			
			aware.push(ghostAware);
			aware.push(ghostAware2);
			aware.push(ghostAware3);
			aware.push(ghostAware4);
			
			aware[playAware].play();
		}
		//////////////////////////////////////////////////////////////////////		
	}

}