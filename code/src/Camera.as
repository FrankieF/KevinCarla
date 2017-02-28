package  
{
	// This the camera system
	// The camera system will be used if the levels exceed the screen size
	// The camera system checks both player positions and moves accordingly
	
	public class Camera 
	{
		// Kevin's X and Y position are taken and put into stagePositionP1
		var stagePositionP1X:Number = levelPrototype.x + KevinScript.x;
		var stagePositionP1Y:Number = levelPrototype.y + KevinScript.y;
		
		// Carlas's X and Y position are taken and put into stagePositionP2
		var stagePositionP2X:Number = levelPrototype.x + KevinScript.x;
		var stagePositionP2Y:Number = levelPrototype.y + KevinScript.y;
		
		// edgeDistance is used to calculate the distance from the edge the players must be in for the camera to move 
		var edgeDistance:Number = 100;
		
		// These 4 variables take edge distance and subtract or add it to the edges of the screen 
		// to get an area for the camera to reference if the player is in it so the camera can move
		var rightEdge:Number = stage.stageWidth - edgeDistance;
		var leftEdge:Number = edgeDistance;
		var topEdge:Number = edgeDistance;
		var bottomEdge:Number = stage.stageHeight - edgeDistance;
		
		public function Camera() 
		{
			// Calls scrolling function
			scrolling();
		}
		
		public function scrolling():void
		{
			// Checks Kevin's Position on the right side of the screen and Carla's on the left
			// Checks to see if the camera can move right
			if (stagePositionP1X > rightEdge && stagePositionP2X > (leftEdge + edgeDistance))
			{
				// Kevin is within the rightEdge and Carla is not within the leftEdge
				// The camera moves to the right
				levelPrototype.x -= stagePositionP1X - rightEdge;
				
				if (levelPrototype.x < -(levelPrototype.width - stage.stageWidth))
				{
					// If the camera moves past the stage width, the camera will stop moving
					levelPrototype.x = -(levelPrototype.width - stage.stageWidth)
				}
			}
			
				// Checks Kevin's Position on the left side of the screen and Carla's on the right
				// Checks to see if the camera can move left
			if (stagePositionP1X < leftEdge && stagePositionP2X > (rightEdge - edgeDistance))
			{
				// Kevin is within the leftEdge and Carla is not within the rightEdge
				// The camera moves to the left
				levelPrototype.x += leftEdge - stagePositionP1X;
				
				if (levelPrototype.x > 0)
				{
					// If the camera moves past the stage width the camera will stop moving
					levelPrototype.x = 0;
				}
			}
			
			// Checks Kevin's Position on the top of the screen and Carla's on the bottom
			// Checks to see if the camera can move up
			if (stagePositionP1Y < topEdge && stagePositionP2Y < (bottomEdge - edgeDistance))
			{
				// Kevin is within the topEdge and Carla is not within the bottomEdge
				// The camera moves up
				levelPrototype.y -= stagePositionP1Y - topEdge;
				
				if (levelPrototype.y > 0)
				{
					// If the camera moves higher the stage height the camera will stop moving
					levelPrototype.y = 0;
				}
			}
			
			// Checks Kevin's Position on the bottom of the screen and Carla's on the top
			// Checks to see if the camera can move down
			if (stagePositionP1Y > bottomEdge && stagePositionP2Y > (topEdge - edgeDistance))
			{
				// Kevin is within the bottomEdge and Carla is not within the topEdge
				// The camera moves down
				levelPrototype.y -= stagePositionP1Y - bottomEdge;
				
				if (levelPrototype.y < -(levelPrototype.height - stage.stageHeight))
				{
					// If the camera moves lower the stage height the camera will stop moving
					levelPrototype.y = -(levelPrototype.height - stage.stageHeight)
				}
			}
			
			// Checks Carla's Position on the right side of the screen and Kevin's on the left
			// Checks to see if the camera can move right
			if (stagePositionP2X > rightEdge && stagePositionP1X > (leftEdge + edgeDistance))
			{
				// Carla is within the rightEdge and Kevin is not within the leftEdge
				// The camera moves to the right
				levelPrototype.x -= stagePositionP2X - rightEdge;
				
				if (levelPrototype.x < -(levelPrototype.width - stage.stageWidth))
				{
					// If the camera moves past the stage width, the camera will stop moving
					levelPrototype.x = -(levelPrototype.width - stage.stageWidth)
				}
			}
			
			// Checks Carla's Position on the left side of the screen and Kevin's on the right
			// Checks to see if the camera can move left
			if (stagePositionP2X < leftEdge && stagePositionP1X < (rightEdge - edgeDistance))
			{
				// Carla is within the leftEdge and Kevin is not within the rightEdge
				// The camera moves to the left
				stagePositionP2X += leftEdge - stagePositionP2X;
				
				if (levelPrototype.x < 0)
				{
					// If the camera moves past the stage width, the camera will stop moving
					levelPrototype.x = 0;
				}
			}
			
			// Checks Carla's Position on the top of the screen and Kevin's on the bottom
			// Checks to see if the camera can move up
			if (stagePositionP2Y < topEdge && stagePositionP1Y < (bottomEdge - edgeDistance))
			{
				// Carla is within the topEdge and Kevin is not within the bottomEdge
				// The camera moves to the up
				levelPrototype.y -= stagePositionP2Y - topEdge;
				
				if (levelPrototype.y > 0)
				{
					// If the camera moves higher the stage height the camera will stop moving
					levelPrototype.y = 0;
				}
			}
			
			// Checks Carla's Position on the bottom of the screen and Kevin's on the top
			// Checks to see if the camera can move down
			if (stagePositionP2Y > bottomEdge && stagePositionP1Y > (topEdge - edgeDistance))
			{
				// Carla is within the bottomEdge and Kevin is not within the topEdge
				// The camera moves to the down
				levelPrototype.y += stagePositionP2Y - bottomEdge;
				
				if (levelPrototype.y < -(levelPrototype.height - stage.stageHeight))
				{
					// If the camera moves higher the stage height the camera will stop moving
					levelPrototype.y = -(levelPrototype.height - stagePositionP1X.stageHeight)
				}
			}
		}
		
	}

}

	
