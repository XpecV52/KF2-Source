/**
 * Example 
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class MobileSecondaryViewportClient extends SecondaryViewportClient
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Called after rendering the player views and HUDs to render menus, the console, etc.
 * This is the last rendering cal in the render loop
 * @param Canvas - The canvas to use for rendering.
 */
event PostRender(Canvas Canvas)
{
	local PlayerController PC;
	local MobilePlayerInput MPI;
	local MobileHUD MH;

	// boost the HUD from main screen, for now
	foreach class'Engine'.static.GetCurrentWorldInfo().LocalPlayerControllers(class'PlayerController', PC)
	{
		MPI = MobilePlayerInput(PC.PlayerInput);
		if( MPI != none )
		{
			MH = MobileHUD(PC.myHUD);
			if( MH != none )
			{
				MH.Canvas = Canvas;
				MH.DrawInputZoneOverlays();
				MH.RenderMobileMenu();
				break;
			}
		}
	}
}

defaultproperties
{
   Name="Default__MobileSecondaryViewportClient"
   ObjectArchetype=SecondaryViewportClient'GameFramework.Default__SecondaryViewportClient'
}
