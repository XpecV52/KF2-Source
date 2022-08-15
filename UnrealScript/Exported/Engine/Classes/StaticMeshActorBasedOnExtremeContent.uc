/**
 * This is an actor which can be used to change its material based on whether Extreme Content is on or not  
 *
 * We need to subclass Actor instead of StaticMeshActorBase in order to get PostBeginPlay() called on us 
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class StaticMeshActorBasedOnExtremeContent extends Actor
	ClassGroup(StaticMeshes)
	native
	placeable;


var() const editconst StaticMeshComponent StaticMeshComponent;


/** This is set so the LD can map specific MaterialIndex on the target to some material **/
struct native SMMaterialSetterDatum
{
	var() int MaterialIndex;
	var() MaterialInterface TheMaterial;
};

/** The material to use for ExtremeContent (e.g. blood and gore!) **/
var() array<SMMaterialSetterDatum> ExtremeContent;

/** The material to use for NonExtremeContent (e.g. blackness everywhere there used to be blood and gore) **/
var() array<SMMaterialSetterDatum> NonExtremeContent;




simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	SetMaterialBasedOnExtremeContent();
}


/** This will set the material of this Actor based on the ExtremeContent setting. **/
simulated function SetMaterialBasedOnExtremeContent()
{
	local int Idx;

	if( WorldInfo.GRI.ShouldShowGore() )
	{
		for( Idx = 0; Idx < ExtremeContent.Length; ++Idx )
		{
			//`log( "SMA ExtremeContent" @ ExtremeContent[Idx].MaterialIndex @ ExtremeContent[Idx].TheMaterial );
			StaticMeshComponent.SetMaterial( ExtremeContent[Idx].MaterialIndex, ExtremeContent[Idx].TheMaterial );
		}
	}
	else
	{
		for( Idx = 0; Idx < NonExtremeContent.Length; ++Idx )
		{
			//`log( "SMA NonExtremeContent" @ NonExtremeContent[Idx].MaterialIndex @ NonExtremeContent[Idx].TheMaterial );
			StaticMeshComponent.SetMaterial( NonExtremeContent[Idx].MaterialIndex, NonExtremeContent[Idx].TheMaterial );
		}
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Components(0)=StaticMeshComponent0
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bWorldGeometry=True
   bGameRelevant=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   bEdShouldSnap=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__StaticMeshActorBasedOnExtremeContent"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
