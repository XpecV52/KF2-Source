//=============================================================================
// KFTrigger_MinigameCash
//=============================================================================
// Trigger variant used to start triggerable minigames specifically with cash.
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// - Dan Weiss
//=============================================================================

class KFTrigger_MinigameCash extends KFTrigger_MinigameButton
    native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function bool GetIsUsable(Pawn User)
{
    return false;
}

/** HUD */
event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    local KFDroppedPickup_Cash Cash;
    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    
    //Since this is only usable if cash hits it, we assume things are fine if
    //      the base implementation treats the game as valid for activation.
    Cash = KFDroppedPickup_Cash(Other);
    if (Cash != none && ReadyToActivate())
    {
        UsedBy(Cash.Instigator);
        Cash.Destroy();
    }
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'KFGame.Default__KFTrigger_MinigameButton:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=40.000000
      bAlwaysRenderIfSelected=True
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'KFGame.Default__KFTrigger_MinigameButton:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'KFGame.Default__KFTrigger_MinigameButton:Sprite'
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'KFGame.Default__KFTrigger_MinigameButton:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__KFTrigger_MinigameCash"
   ObjectArchetype=KFTrigger_MinigameButton'KFGame.Default__KFTrigger_MinigameButton'
}
