//=============================================================================
// KFPickupFactory_Ammo
//=============================================================================
// Pickup that gives some ammo for all weapons in inventory
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================

class KFPickupFactory_Ammo extends KFPickupFactory;

/** Sound to play when picking up ammo */
var() AkEvent AmmoPickupSound;

/** Overloaded to add this pickup to its proper list in the gameinfo */
simulated function InitializePickup()
{
	local KFGameInfo KFGI;

	if( bKismetDriven )
	{
		return;
	}

	KFGI = KFGameInfo( WorldInfo.Game );
	if ( KFGI != none )
	{
     	KFGI.AmmoPickups.AddItem( self );
	}
}

/** Bypass PickupFactory implementation. This class doesn't use InventoryType. */
simulated event SetInitialState()
{
	super.SetInitialState();

	bScriptInitialized = true;
}

/** give pickup to player */
function GiveTo( Pawn P )
{
	local KFInventoryManager KFIM;
	local KFGameReplicationInfo KFGRI;

	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	if(KFGRI != none && KFGRI.bIsEndlessPaused)
	{
		return;
	}

	KFIM = KFInventoryManager(P.InvManager);
	if ( KFIM != None )
	{
		if( KFIM.GiveWeaponsAmmo( true ) )
		{
			if(class'KFGameInfo'.static.AllowBalanceLogging()) WorldInfo.LogGameBalance(class'KFGameInfo'.const.GBE_Pickup$","$P.PlayerReplicationInfo.PlayerName$","$"Ammo");
			if(WorldInfo.GRI != none && WorldInfo.GRI.GameClass.static.AllowAnalyticsLogging()) WorldInfo.TWLogEvent ( "pickup", P.PlayerReplicationInfo, "ammo");
			PickedUpBy( P );
		}
	}
}

/** Activate a different pickup after the 'RespawnDelay' has finished */
function PickedUpBy(Pawn P)
{
	local KFGameInfo KFGI;

	if( bKismetDriven )
	{
		super.PickedUpBy( P );
		return;
	}

	KFGI = KFGameInfo( WorldInfo.Game );
	if ( KFGI != none )
	{
		KFGI.EnableNewPickup( KFGI.AmmoPickups, KFGI.DifficultyInfo.GetAmmoPickupInterval(KFGI.GetLivingPlayerCount()), self );
	}
}

/** Determine what kind of pickup is visible. Used for dialog. */
function bool CurrentPickupIsAmmo()
{
	return true;
}

defaultproperties
{
   AmmoPickupSound=AkEvent'WW_UI_PlayerCharacter.Play_UI_Pickup_Ammo'
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      StaticMesh=StaticMesh'ENV_Horzine_MESH.crates.ENV_Horzine_Equiptment_Crate_02'
      Materials(0)=MaterialInstanceConstant'GP_Mat_Lib.GP_Ammo_MIC'
      ReplacementPrimitive=None
      bCastDynamicShadow=False
      CollideActors=False
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Scale=0.500000
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   PickupMesh=StaticMeshComponent0
   bNotBased=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFPickupFactory:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFPickupFactory:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFPickupFactory:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'KFGame.Default__KFPickupFactory:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      SpriteCategoryName="Navigation"
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'KFGame.Default__KFPickupFactory:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'KFGame.Default__KFPickupFactory:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'KFGame.Default__KFPickupFactory:PathRenderer'
   End Object
   Components(4)=PathRenderer
   Components(5)=StaticMeshComponent0
   CollisionComponent=CollisionCylinder
   Name="Default__KFPickupFactory_Ammo"
   ObjectArchetype=KFPickupFactory'KFGame.Default__KFPickupFactory'
}
