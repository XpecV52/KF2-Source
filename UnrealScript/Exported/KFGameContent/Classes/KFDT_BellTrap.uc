//=============================================================================
// KFDT_BellTrap
//=============================================================================
// Damage caused by the swinging bells in Monster Ball
//=============================================================================
// Killing Floor 2
// Copyright (C) 2018 Tripwire Interactive LLC
//=============================================================================
class KFDT_BellTrap extends KFDT_SwingMinigame;

defaultproperties
{
   OverrideImpactSound=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Bell_Impact'
   Name="Default__KFDT_BellTrap"
   ObjectArchetype=KFDT_SwingMinigame'kfgamecontent.Default__KFDT_SwingMinigame'
}
