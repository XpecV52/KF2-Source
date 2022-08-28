/*******************************************************************************
 * KFWeldableComponent generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class KFWeldableComponent extends Actor
    native
    notplaceable
    hidecategories(Navigation);

var int MaxWeldIntegrity;
var repnotify transient int WeldIntegrity;
var repnotify byte RepairProgress;
var int DemoWeldRequired;
var transient int DemoWeld;
var transient bool bIsDestroyed;
var bool bWeldable;
var bool bUnweldable;
var bool bRepairable;
var delegate<Delegate_AdjustWeldAmount> __Delegate_AdjustWeldAmount__Delegate;
var delegate<Delegate_OnWeldIntegrityChanged> __Delegate_OnWeldIntegrityChanged__Delegate;
var delegate<Delegate_OnRepairProgressChanged> __Delegate_OnRepairProgressChanged__Delegate;

replication
{
     if(bNetDirty && Role == ROLE_Authority)
        DemoWeld, RepairProgress, 
        WeldIntegrity, bIsDestroyed;
}

delegate Delegate_AdjustWeldAmount(out int Amount);

delegate Delegate_OnWeldIntegrityChanged(optional int Amount, optional KFPawn Welder);

delegate Delegate_OnRepairProgressChanged(optional float Amount, optional KFPawn Welder);

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'WeldIntegrity')
    {
        if(__Delegate_OnWeldIntegrityChanged__Delegate != none)
        {
            Delegate_OnWeldIntegrityChanged(0, none);
        }        
    }
    else
    {
        if(VarName == 'RepairProgress')
        {
            if(__Delegate_OnRepairProgressChanged__Delegate != none)
            {
                Delegate_OnRepairProgressChanged(0, none);
            }            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
}

function Weld(int Amount, optional KFPawn Welder)
{
    local int OriginalAmount;
    local KFPerk WelderPerk;

    if(((Amount > 0) && !CanBeWelded()) || (Amount < 0) && !CanBeUnwelded())
    {
        return;
    }
    OriginalAmount = Amount;
    if(__Delegate_AdjustWeldAmount__Delegate != none)
    {
        Delegate_AdjustWeldAmount(Amount);
    }
    UpdateWeldIntegrity(Amount);
    if((Welder != none) && Amount > 0)
    {
        WelderPerk = KFPlayerController(Welder.Controller).GetPerk();
        if((WelderPerk != none) && WelderPerk.CanExplosiveWeld())
        {
            UpdateDemoWeld(Amount);
        }
    }
    if(__Delegate_OnWeldIntegrityChanged__Delegate != none)
    {
        Delegate_OnWeldIntegrityChanged(OriginalAmount, Welder);
    }
}

function UpdateWeldIntegrity(int Amount)
{
    SetWeldIntegrity(WeldIntegrity + Amount);
}

function SetWeldIntegrity(int Amount)
{
    WeldIntegrity = Clamp(Amount, 0, MaxWeldIntegrity);
    bForceNetUpdate = true;
}

function SetRepairProgress(int Amount)
{
    RepairProgress = byte(Clamp(Amount, 0, 255));
    bForceNetUpdate = true;
}

function UpdateDemoWeld(int Amount)
{
    SetDemoWeld(DemoWeld + Amount);
}

function SetDemoWeld(int Amount)
{
    DemoWeld = Clamp(Amount, 0, DemoWeldRequired);
    bForceNetUpdate = true;
}

function SetDestroyed(bool bDestroyed)
{
    bIsDestroyed = bDestroyed;
}

function Repair(float Amount, optional KFPawn Welder)
{
    local byte ByteAmount;

    if(!CanBeRepaired())
    {
        return;
    }
    ByteAmount = FloatToByte(Amount);
    if((RepairProgress + ByteAmount) >= 255)
    {
        RepairProgress = 255;        
    }
    else
    {
        RepairProgress += ByteAmount;
    }
    bForceNetUpdate = true;
    if(__Delegate_OnRepairProgressChanged__Delegate != none)
    {
        Delegate_OnRepairProgressChanged(Amount, Welder);
    }
}

simulated function bool CanBeWelded()
{
    return bWeldable && WeldIntegrity < MaxWeldIntegrity;
}

simulated function bool CanBeUnwelded()
{
    return bUnweldable && WeldIntegrity > 0;
}

simulated function bool CanBeRepaired()
{
    return bRepairable;
}

simulated function bool CanBeDemoWelded()
{
    return (DemoWeldRequired > 0) && DemoWeld < DemoWeldRequired;
}

simulated function float GetWeldPct()
{
    return (float(WeldIntegrity) / float(MaxWeldIntegrity)) * 100;
}

simulated function SetCollisionCylinderSize(float Radius, float Height)
{
    CylinderComponent(CollisionComponent).SetCylinderSize(Radius, Height);
}

defaultproperties
{
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=100
        CollisionRadius=100
        bAlwaysRenderIfSelected=true
        ReplacementPrimitive=none
        CollideActors=true
    object end
    // Reference: CylinderComponent'Default__KFWeldableComponent.CollisionCylinder'
    Components(0)=CollisionCylinder
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_CustomDefault
    bHidden=true
    bAlwaysRelevant=true
    bCollideActors=true
    begin object name=CollisionCylinder class=CylinderComponent
        CollisionHeight=100
        CollisionRadius=100
        bAlwaysRenderIfSelected=true
        ReplacementPrimitive=none
        CollideActors=true
    object end
    // Reference: CylinderComponent'Default__KFWeldableComponent.CollisionCylinder'
    CollisionComponent=CollisionCylinder
}