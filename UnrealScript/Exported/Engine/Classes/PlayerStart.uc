//=============================================================================
// Player start location.
// Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class PlayerStart extends NavigationPoint
	placeable
	native
	ClassGroup(Common)
	hidecategories(Collision);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() bool bEnabled;
var() bool bPrimaryStart;		// None primary starts used only if no primary start available

/** Team specific player start, 255 for any team */
var() int TeamIndex;

// Properties used only by the PlayerStart scoring postrender system for visualizing playerstart scoring in multiplayer games.  Set these in
// your RatePlayerStart() or equivalent method.  Will be displayed if PlayerStart's bPostRenderIfNotVisible=true and the PlayerStart is added to 
// the HUD's PostRenderedActors array.
var int Score;
var int SelectionIndex;
var bool bBestStart;

/* epic ===============================================
* ::OnToggle
*
* Scripted support for toggling a playerstart, checks which
* operation to perform by looking at the action input.
*
* Input 1: turn on
* Input 2: turn off
* Input 3: toggle
*
* =====================================================
*/
simulated function OnToggle(SeqAct_Toggle action)
{
	if (action.InputLinks[0].bHasImpulse)
	{
		// turn on
		bEnabled = true;
	}
	else
	if (action.InputLinks[1].bHasImpulse)
	{
		// turn off
		bEnabled = false;
	}
	else
	if (action.InputLinks[2].bHasImpulse)
	{
		// toggle
		bEnabled = !bEnabled;
	}
}

/**
Hook to allow agents to render HUD overlays for themselves.
Called only if the agent was rendered this tick.  Assumes that appropriate font has already been set
Will be displayed if PlayerStart's bPostRenderIfNotVisible=true and the PlayerStart is added to the HUD's PostRenderedActors array.
*/
simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local float NameXL, TextYL, YL, XL, textscale;
	local vector ScreenLoc, ViewLoc;
	local rotator ViewRot;
	local string ScreenName;
	local FontRenderInfo FontInfo;

	PC.GetPlayerViewPoint(ViewLoc, ViewRot);
	if ( (vector(ViewRot) dot (Location - ViewLoc)) < 0.5 )
		return;

	// make sure not clipped out
	screenLoc = Canvas.Project(Location);
	if (screenLoc.X < 0 ||
		screenLoc.X >= Canvas.ClipX ||
		screenLoc.Y < 0 ||
		screenLoc.Y >= Canvas.ClipY)
	{
		return;
	}

	ScreenName = "("$SelectionIndex$")"@Score;
	Canvas.StrLen(ScreenName, NameXL, TextYL);
	XL = FMax(XL, NameXL);
	YL += TextYL;

	textscale = 1.0;
	if ( bBestStart )
	{
		Canvas.DrawColor = class'HUD'.default.GreenColor;
		textscale = 4.0;
	}
	else if ( Score == 10000000.0 )
	{
		Canvas.DrawColor = class'HUD'.default.WhiteColor;
		Canvas.DrawColor.B = 0;
	}
	else if ( Score == 0.0 )
	{
		Canvas.DrawColor.R = 200;
		Canvas.DrawColor.G = 50;
		Canvas.DrawColor.B = 255;
		textscale = 0.5;
	}		
	else
	{
		Canvas.DrawColor = class'HUD'.default.RedColor;
	}

	Canvas.SetPos(ScreenLoc.X-0.5*NameXL,ScreenLoc.Y-1.7*YL);
	FontInfo.bClipText = true;
	Canvas.DrawText(ScreenName, true, textscale, textscale, FontInfo);
}

defaultproperties
{
   bEnabled=True
   bPrimaryStart=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.S_Player'
      SpriteCategoryName="PlayerStart"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   bCollideWhenPlacing=False
   bEdShouldSnap=True
   CollisionComponent=CollisionCylinder
   Name="Default__PlayerStart"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
