//=============================================================================
// KFFracturedMeshGlass
//=============================================================================
// A custom FracturedMeshActor used for fragile, translucent glass
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Andrew "Strago" Ladenberger
//=============================================================================
class KFFracturedMeshGlass extends KFFracturedMeshActor
	placeable
	native(Effect);

/** Amount of damage taken before before bump destroys (aka Fragile) */
var deprecated int DestroyOnBumpThreshold;

/** If true, AI bump will completely destroy the glass regardless of other settings */
var() bool bInstiKillOnAIBump;

/** Cached MICs that are generated for material params */
var transient MaterialInstanceConstant 	MIC;
var transient bool						bTickMaterialParam;

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
// (cpptext)
// (cpptext)

/*
 * Set network role based on type setting
 */
simulated event PreBeginPlay()
{
	Super.PreBeginPlay();

	// initialize Light MIC
	if ( MaterialLightParams.LightActor != None )
	{
		MIC = FracturedStaticMeshComponent.CreateAndSetMaterialInstanceConstant(MaterialLightParams.MatID);
		bTickMaterialParam = true;
	}	
}

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// we need tick for light material params
	if ( bTickMaterialParam && bTickIsDisabled )
	{
		SetTickIsDisabled(false);
	}
}

/** TakeDamage will hide/spawn chunks when they get shot. */
simulated event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	Super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}

/** Check bDestroyOnBumpIfWeakened, requires bWorldGeometry==false */
event Bump( Actor Other, PrimitiveComponent OtherComp, Vector HitNormal )
{
	local Pawn OtherPawn;

	if ( !bHasBeenDestroyed )
	{
		if ( bHasLostChunk )
		{
			BreakOffAllFragments(Other.Velocity);
		}
		else if ( bInstiKillOnAIBump )
		{
			OtherPawn = Pawn(other);
			if ( OtherPawn != None && !OtherPawn.IsHumanControlled() )
			{
				BreakOffAllFragments(Other.Velocity);
			}
		}
	}
}

/** Ignore StopsProjectile for non-bullets (e.g. Greandes, Rockets) when cracked */
simulated function bool StopsProjectile(Projectile P)
{
	local KFProjectile KFProj;
	local bool bShatter;

	if( P.bBounce )
	{
		KFProj = KFProjectile( P );
		if( KFProj != none )
		{
			switch( KFProj.GlassShatterType )
			{
			case FMGS_ShatterNone:
				bShatter = false;
				break;

			case FMGS_ShatterDamaged:
				bShatter = bHasLostChunk;
				break;

			case FMGS_ShatterAll:
				bShatter = true;
				break;
			};
		}
	}

	if( bShatter )
	{
		// on the server break off the rest of the glass
		if ( Role == ROLE_Authority && !bHasBeenDestroyed )
		{
			BreakOffAllFragments(Normal(P.Velocity) * 200);
		}
		return false;
	}
	else if( ReplicationMode == RT_Clientside )
	{
		// not entirely safe to bounce off of clientside-only meshes
		// maybe shatter?
	}

	return Super.StopsProjectile(P);
}

/** Disable falloff to amp up destruction effects */
simulated function TakeRadiusDamage
(
	Controller			InstigatedBy,
	float				BaseDamage,
	float				DamageRadius,
	class<DamageType>	DamageType,
	float				Momentum,
	vector				HurtOrigin,
	bool				bFullDamage,
	Actor				DamageCauser,
	optional float      DamageFalloffExponent=1.f
)
{
	Super.TakeRadiusDamage(InstigatedBy, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, true, DamageCauser, DamageFalloffExponent);
}

defaultproperties
{
   bInstiKillOnAIBump=True
   TotalHealth=300
   VulnerableDamageType(0)=Class'KFGame.KFDT_Sonic'
   Begin Object Class=FracturedStaticMeshComponent Name=FracturedStaticMeshComponent0 Archetype=FracturedStaticMeshComponent'KFGame.Default__KFFracturedMeshActor:FracturedStaticMeshComponent0'
      bUseDynamicIBWithHiddenFragments=True
      WireframeColor=(B=255,G=128,R=0,A=255)
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      Name="FracturedStaticMeshComponent0"
      ObjectArchetype=FracturedStaticMeshComponent'KFGame.Default__KFFracturedMeshActor:FracturedStaticMeshComponent0'
   End Object
   FracturedStaticMeshComponent=FracturedStaticMeshComponent0
   Begin Object Class=FracturedSkinnedMeshComponent Name=FracturedSkinnedComponent0 Archetype=FracturedSkinnedMeshComponent'KFGame.Default__KFFracturedMeshActor:FracturedSkinnedComponent0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'KFGame.Default__KFFracturedMeshGlass:LightEnvironment0'
      bDisableAllRigidBody=True
      Name="FracturedSkinnedComponent0"
      ObjectArchetype=FracturedSkinnedMeshComponent'KFGame.Default__KFFracturedMeshActor:FracturedSkinnedComponent0'
   End Object
   SkinnedComponent=FracturedSkinnedComponent0
   bDestroyFragmentsOnImpact=True
   Components(0)=FracturedSkinnedComponent0
   Components(1)=FracturedStaticMeshComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFFracturedMeshActor:Sprite'
      Sprite=Texture2D'EditorResources.Ambientcreatures'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFFracturedMeshActor:Sprite'
   End Object
   Components(2)=Sprite
   bWorldGeometry=False
   CollisionComponent=FracturedStaticMeshComponent0
   Name="Default__KFFracturedMeshGlass"
   ObjectArchetype=KFFracturedMeshActor'KFGame.Default__KFFracturedMeshActor'
}
