//=============================================================================
// KFPhysicsDamageByPawnVolume
//=============================================================================
// PhysicsVolume are, by default, used for traps on all maps. This KFPhysicsDamageByPawnVolume
// gives the ability to make different damage values for Humans and Monsters.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2021 Tripwire Interactive LLC
// Roberto Moreno
//=============================================================================
class KFPhysicsDamageByPawnVolume extends PhysicsVolume
    placeable;

var()		float				DamagePerSecMultiplierForHuman;				
var()		float				DamagePerSecMultiplierForMonster;			

function CausePainTo(Actor Other)
{
    local float DamagePerSecModified;

    DamagePerSecModified = DamagePerSec;

    if (KFPawn_Human(Other) != None)
    {
        DamagePerSecModified *= DamagePerSecMultiplierForHuman;
    }
    else if (KFPawn_Monster(Other) != None)
    {
        DamagePerSecModified *= DamagePerSecMultiplierForMonster;
    }

	if (DamagePerSecModified > 0)
	{
		if ( WorldInfo.bSoftKillZ && (Other.Physics != PHYS_Walking) )
			return;
		if ( (DamageType == None) || (DamageType == class'DamageType') )
			LogInternal("No valid damagetype ("$DamageType$") specified for "$PathName(self));
		Other.TakeDamage(DamagePerSecModified*PainInterval, DamageInstigator, Location, vect(0,0,1), DamageType,, self);
	}
	else
	{
		Other.HealDamage(-DamagePerSecModified * PainInterval, DamageInstigator, DamageType);
	}
}

defaultproperties
{
   DamagePerSecMultiplierForHuman=1.000000
   DamagePerSecMultiplierForMonster=1.000000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Indoor=True,Outdoor=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__KFPhysicsDamageByPawnVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
