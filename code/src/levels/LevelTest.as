package level 
{
	public class LevelTest extends LevelBase
	{		
		public function LevelTest() 
		{
			// A new PrismController is created to store the order the prisms must be activated in
			var $pc:PrismController = new PrismController();
			$pc.targets = Vector.<BasePrism>([prism1_mc,prism2_mc]); //order of names is the order it looks for them
			
			// Door is created as the target that gets destroyed after the correct order of the prisms
			Door(door_mc).playerTarget = $pc;
		}
		
	}

}