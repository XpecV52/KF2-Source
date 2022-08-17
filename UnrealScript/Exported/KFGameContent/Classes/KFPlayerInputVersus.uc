//=============================================================================
// KFPlayerInputVersus
//=============================================================================
// Player Input class for versus survival game mode
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
//=============================================================================

class KFPlayerInputVersus extends KFPlayerInput;

/** GBA_IronsightsToggle, GBA_IronsightsHold
 * @params bHoldButtonMode	If true, use hold mode instead of toggle
 */
simulated exec function IronSights(optional bool bHoldButtonMode)
{
	// For pawns without weapons let KFPawn_Monster::StartFire() have a chance to perform
	// an alt-fire for zeds.  Since PendingFire is not set no StopFire() is needed.
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StartFire(1);
		return;
	}

	Super.IronSights(bHoldButtonMode);
}

/** GBA_IronsightsToggle, GBA_IronsightsHold
 * @params bHoldButtonMode	If true, use hold mode instead of toggle
 */
simulated exec function IronSightsRelease(optional bool bHoldButtonMode)
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StopFire(1);
		return;
	}

	super.IronSightsRelease(bHoldButtonMode);
}

/** GBA_SwitchAltFire */
exec function SwitchFire()
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StartFire(4);
		return;
	}

	super.SwitchFire();
}

/** GBA_SwitchAltFire
 * Weapons that override AltFireMode (e.g. welder) and call StartFire
 * also need to call StopFire.  For most weapons this is unnecessary.
 */
exec function SwitchFireRelease()
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StopFire(4);
		return;
	}

	super.SwitchFireRelease();
}

exec function Jump()
{
	local KFPawn_Monster KFPM;

	if ( WorldInfo.Pauser == PlayerReplicationInfo )
	{
		SetPause( False );
	}
	else
	{
		if( Pawn != none )
		{
			KFPM = KFPawn_Monster(Pawn);
			if( KFPM != none )
			{
				if( KFPM.GetSpecialMoveCooldownTimeRemainingByHandle(SM_Jump) > 0.f )
				{
					return;
				}
			}
		}

		bPressedJump = true;
	}
}

/** GBA_Grenade */
exec function Grenade()
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StartFire(6);
		return;
	}

	super.Grenade();
}


/** Quick heal key was pressed */
exec function QuickHeal()
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StartFire(5);
		return;
	}

	Super.QuickHeal();
}

/** GBA_Grenade */
exec function GrenadeRelease()
{
	if( Pawn != none && (Pawn.Weapon == none || Pawn.Weapon.ShouldWeaponIgnoreStartFire()) )
	{
		Pawn.StopFire(6);
		return;
	}

	super.GrenadeRelease();
}

exec function ShowVoiceComms()
{
	if(PlayerReplicationInfo.GetTeamNum() == 255)
	{
		return;
	}

	super.ShowVoiceComms();
}

defaultproperties
{
   Name="Default__KFPlayerInputVersus"
   ObjectArchetype=KFPlayerInput'KFGame.Default__KFPlayerInput'
}
