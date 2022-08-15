//=============================================================================
// KFDebugPosedPlayer
//=============================================================================

class KFDebugPosedPlayer extends Actor
	hidecategories(Lighting,LightColor,Force,Collision,Physics,Debug,Attachment,Navigation,Mobile)
	placeable
	config(Game);

/** Config Var for ZED type */
var config string KFPM_Archetype;
/** Can the DebugPlayer be possessed */ 
var() bool                          bCanPossess;

var   DrawCylinderComponent         CylinderComponent;
var   DrawSphereComponent           SphereComponent;
var   transient KFPawn              KFP;
var   transient int                 NumTimesPossessed;

/** Get Archetype from Config */
static function string GetArchetypeName()
{
	return default.KFPM_Archetype;
}

static function StopPosedPlayers( WorldInfo Info )
{
	local KFDebugPosedPlayer PosedPlayer;

	foreach Info.AllActors(class'KFDebugPosedPlayer', PosedPlayer)
	{
		/** Disable PosedPlayer Tick, no more updates for you! */
		PosedPlayer.KFP.SetTickIsDisabled(true);
	}
}

static function SpawnPosedPlayers( WorldInfo Info )
{
	local KFDebugPosedPlayer PosedPlayer;
	local KFCharacterInfo_Monster MonsterInfo;
	local string ArchetypeName;

	ArchetypeName = class'KFDebugPosedPlayer'.static.GetArchetypeName();
	MonsterInfo = KFCharacterInfo_Monster( DynamicLoadObject( ArchetypeName, class'KFCharacterInfo_Monster' ) );

	foreach Info.AllActors(Class'KFDebugPosedPlayer', PosedPlayer)
	{
		if ( PosedPlayer.KFP == none )
		{
			/** Spawn pawn from archetype, Human is not Abstrace and no default content */
			PosedPlayer.KFP = Info.Spawn( class'KFPawn_Human', , , PosedPlayer.Location, PosedPlayer.Rotation );

			/** Close video above head, displays health and armor amount */
			KFPawn_Human(PosedPlayer.KFP).PlayerPartyInfo.Close();

			/** Set Spawned KFPawn_Human archetype to the Monster Archetype */
			PosedPlayer.KFP.SetCharacterArch( MonsterInfo );

			//Animation
			PosedPlayer.KFP.PlayBodyAnim( 'Idle_V1', EAS_FullBody, , , , true );				
		}
	}
}

static function PossessPosedPlayer( WorldInfo Info )
{
	local KFDebugPosedPlayer PosedPlayer, TargetPosedPlayer;
	local Pawn OldPawn;
	local PlayerController PC;
	local int NumPossessions;

	NumPossessions = 1000;
	TargetPosedPlayer = none;

	// Find PosedPlayer Possessed least number of times
	 foreach Info.AllActors( class'KFDebugPosedPlayer', PosedPlayer )
	 {
		 if ( PosedPlayer.bCanPossess && PosedPlayer.KFP != none )
		 {
			 if ( PosedPlayer.NumTimesPossessed < NumPossessions )
			 {
				 NumPossessions = PosedPlayer.NumTimesPossessed;
				 TargetPosedPlayer = PosedPlayer;
			 }
		 }
	 }

	 if ( TargetPosedPlayer != none )
	 {
	 	TargetPosedPlayer.NumTimesPossessed++;

	 	PC = Info.GetALocalPlayerController() ;

	 	if ( PC != none )
	 	{
		 	if( PC.GetViewTarget() != none )
		 	{
		 		OldPawn = Pawn( PC.GetViewTarget() );
		 	}
		 	
		 	/** Change the view target to the next posedplayer and set in 1P */
		 	PC.SetViewTarget( TargetPosedPlayer.KFP );
		 	PC.SetCameraMode( 'FirstPerson' );	

		 	if ( OldPawn != none )
		 	{
		 		/** Stop Movie if there */
		 		if ( KFPawn_Human( OldPawn ).PlayerPartyInfo.bMovieIsOpen )
		 		{
		 			KFPawn_Human( OldPawn ).PlayerPartyInfo.Close();	 
		 		}		
		 	}
		 }
	 }
}

defaultproperties
{
   Begin Object Class=DrawCylinderComponent Name=Cylinder0
      CylinderRadius=25.000000
      CylinderTopRadius=25.000000
      CylinderSides=6
      ReplacementPrimitive=None
      Translation=(X=0.000000,Y=0.000000,Z=50.000000)
      Name="Cylinder0"
      ObjectArchetype=DrawCylinderComponent'Engine.Default__DrawCylinderComponent'
   End Object
   CylinderComponent=Cylinder0
   Begin Object Class=DrawSphereComponent Name=Sphere0
      SphereColor=(B=255,G=0,R=0,A=255)
      SphereRadius=10.000000
      ReplacementPrimitive=None
      Translation=(X=25.000000,Y=0.000000,Z=85.000000)
      Name="Sphere0"
      ObjectArchetype=DrawSphereComponent'Engine.Default__DrawSphereComponent'
   End Object
   SphereComponent=Sphere0
   Components(0)=Cylinder0
   Components(1)=Sphere0
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bNoDelete=True
   bRouteBeginPlayEvenIfStatic=False
   bMovable=False
   bCollideWhenPlacing=True
   bEdShouldSnap=True
   bForceAllowKismetModification=True
   Name="Default__KFDebugPosedPlayer"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
