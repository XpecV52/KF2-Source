//=============================================================================
// KFPersistentBloodActor
//=============================================================================
// Placeable actor that sprays persistent blood on level load
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//  - Sakib Saikia 4/7/2014
//=============================================================================

class KFPersistentBloodActor extends Actor
	native(Effect)
	placeable;

/** CONST values */
var const float ConeSpreadRadius;
var const  float MaxConeSpreadDegrees;

/** Activate/Deactivate the persistent blood actor */
var() bool bEnabled;
/** Scalar for amount of blood */
var() float BloodScale<UIMin=0.0|UIMax=1.0|ClampMin=0.0|ClampMax=1.0>;
/** Used to specify whether to spawn the blood in a specific direction (0) or a cone effect (>0) */
var() float BloodSpread<UIMin=0.0|UIMax=1.0|ClampMin=0.0|ClampMax=1.0>;

/** Used to visualize the blood spread */
var const DrawConeComponent PreviewCone;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function LeaveBloodSplats()
{
	local KFGoreManager GoreManager;
	local vector FaceDir, UpDir, RightDir;
	local vector ConeRimCenter, SamplePoint, TraceDir;
	local int NumConeSegmentTraces, Y, Z, Trace;
	local float ConeRimRadius, UpDistance, RightDistance;

	// Grab the gore manager
	GoreManager = KFGoreManager(WorldInfo.MyGoreEffectManager);
	if( GoreManager != none )
	{
		GetAxes(Rotation, FaceDir, RightDir, UpDir);

		if( BloodSpread == 0.f )
		{
			// Leave a splat on level geometry along the direction being shot at
			TraceDir = FaceDir;
			GoreManager.LeaveAPersistentBloodSplat(Location, TraceDir,BloodScale, false, true);
		}
		else
		{
			NumConeSegmentTraces = FCeil(25*BloodSpread);
        	ConeRimCenter = Location + ConeSpreadRadius*FaceDir;
        	ConeRimRadius = Tan(MaxConeSpreadDegrees * BloodSpread * PI / 180.f) * ConeSpreadRadius;

			for( Y=-1; Y<=1; Y+=2 )
			{
				for(Z=-1; Z<=1; Z+=2 )
				{
					for( Trace = 0; Trace < NumConeSegmentTraces; Trace++ )
					{
						RightDistance = FRand() * ConeRimRadius;
						UpDistance = FRand() * ConeRimRadius;
						SamplePoint = ConeRimCenter + Y * RightDir * RightDistance + Z * UpDir * UpDistance;
						TraceDir = Normal(SamplePoint - Location);
						GoreManager.LeaveAPersistentBloodSplat(Location, TraceDir,BloodScale, false, true);

						// START DEBUG
						// DrawDebugLine(Location, Location + 500*TraceDir, 255, 255, 255, true);
						// DrawDebugStar(Location + 500*TraceDir, 5, 255, 0, 0, true);
						// END DEBUG
					}
				}
			}
		}
	}
}

simulated event PreBeginPlay()
{
	if( bEnabled && BloodScale > 0.f )
	{
		LeaveBloodSplats();
	}
}

defaultproperties
{
   ConeSpreadRadius=500.000000
   MaxConeSpreadDegrees=60.000000
   bEnabled=True
   BloodScale=1.000000
   Begin Object Class=DrawConeComponent Name=SpreadCone
      ConeRadius=500.000000
      ReplacementPrimitive=None
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="SpreadCone"
      ObjectArchetype=DrawConeComponent'Engine.Default__DrawConeComponent'
   End Object
   PreviewCone=SpreadCone
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'ENG_EditorResources_TEX.Gore.S_PersistentBloodActor'
      SpriteCategoryName="PersistentBlood"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Begin Object Class=ArrowComponent Name=Arrow
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(1)=Arrow
   Components(2)=SpreadCone
   bStatic=True
   bMovable=False
   Name="Default__KFPersistentBloodActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
