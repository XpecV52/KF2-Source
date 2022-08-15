//=============================================================================
// KFWeap_ScopedBase
//=============================================================================
// Base class for weapons with scopes
//=============================================================================
// Killing Floor 2
// Copyright (C) 2015 Tripwire Interactive LLC
// John "Ramm-Jaeger" Gibson
//=============================================================================
class KFWeap_ScopedBase extends KFWeapon
	abstract;

/** component that renders the scene to a texture */
var(Scope) const SceneCapture2DComponent SceneCapture;

/** Ratio of the scope texture relative to screen resolution (Should be between 0.0-1.0) */
var (Scope) float ScopeTextureScale;

/** Restrict the scene capture texture from getting too large, especially on ultra wide displays **/
var int MaxSceneCaptureSize;

/** Name of the parameter used to blend between scene capture texture (when in ironsights) and
    regular texture (when hipped)

    1.0 => Scene capture texture
    0.0 => Generic texture
*/
var(Scope) name InterpParamName;

/** Texture target to which the above SceneCapture component renders to */
var TextureRenderTarget2D SniperScopeTextureTarget;

/** Template MIC used by the sniper scope. The MIC actually used by the scope should derive from this.
    This is necessary because Unreal warns against modifying an MIC in a package directly*/
var const MaterialInstanceConstant ScopeLenseMICTemplate;

/** Actual MIC used by the scope */
var MaterialInstanceConstant ScopeLenseMIC;

/** Current length of the square scope texture. This is checked against before modifying the
    ScopeTextureSize in the scenario when InitFOV is called multiple times with the same values */
var int CurrentScopeTextureSize;

var(Scope) float ScopedSensitivityMod;

/**
 * Initialize the FOV settings for this weapon, adjusting for aspect ratio
 * @param SizeX the X resolution of the screen
 * @param SizeY the Y resolution of the screen
 * @param DefaultPlayerFOV the default player FOV of the player holding this weapon
 */
simulated function InitFOV(float SizeX, float SizeY, float DefaultPlayerFOV)
{
    local int NewScopeTextureSize;

    super.InitFOV(SizeX, SizeY, DefaultPlayerFOV);

    NewScopeTextureSize = int(ScopeTextureScale*SizeX);

    if(NewScopeTextureSize > MaxSceneCaptureSize)
        NewScopeTextureSize = MaxSceneCaptureSize;

    if( CurrentScopeTextureSize != NewScopeTextureSize )
    {
        SniperScopeTextureTarget =  class'TextureRenderTarget2D'.static.Create(NewScopeTextureSize, NewScopeTextureSize, PF_A8R8G8B8);
        SceneCapture.SetCaptureParameters(SniperScopeTextureTarget);
        if( ScopeLenseMIC != none )
        {
            ScopeLenseMIC.SetTextureParameterValue('ScopeTextureTarget', SniperScopeTextureTarget);
        }
        CurrentScopeTextureSize = NewScopeTextureSize;
    }
}

/**
 * Set parameters for the weapon once replication is complete (works in Standalone as well)
 */
reliable client function ClientWeaponSet(bool bOptionalSet, optional bool bDoNotActivate)
{
	Super.ClientWeaponSet(bOptionalSet);

    // Only want to spawn sniper lenses on human players, but when PostBeginPlay
    // gets called Instigator isn't valid yet. So using NetMode == NM_Client,
    // since weapons should only exist on owning human clients with that netmode
    if( Instigator != none && Instigator.IsLocallyControlled() && Instigator.IsHumanControlled() )
    {
        ScopeLenseMIC = new class'MaterialInstanceConstant';
    	ScopeLenseMIC.SetParent(ScopeLenseMICTemplate);
    	ScopeLenseMIC.SetTextureParameterValue('ScopeTextureTarget', SniperScopeTextureTarget);
    	ScopeLenseMIC.SetScalarParameterValue(InterpParamName, 0.0);
    	mesh.SetMaterial(2, ScopeLenseMIC);
    }
}

/**
 * This function aligns the gun model in the world
 */
simulated event SetPosition(KFPawn Holder)
{
	if ( !Holder.IsFirstPerson() )
		return;

    super.SetPosition(Holder);

    if( ScopeLenseMIC != none )
    {
    	ScopeLenseMIC.SetScalarParameterValue('u_position_shadow', -WeaponLag.Y);
    	ScopeLenseMIC.SetScalarParameterValue('v_position_shadow', WeaponLag.Z);
	}

    if( bUsingSights )
    {
        SceneCapture.SetView(Location, Rotation);
    }
}

/**
 * Return an FOVAngle used by the PlayerInput class to determine how much to
 * reduce the sensitivity when using sights/scopes. Added since the 3d scope
 * zooms in farther than the player's FOV.
 */
simulated function float GetModifiedFOVAngle()
{
    if( bUsingSights )
    {
        return default.PlayerIronSightFOV/SceneCapture.FieldOfView * ScopedSensitivityMod;
    }
    else
    {
        return Super.GetModifiedFOVAngle();
    }
}

 /**
 * Attach Weapon Mesh, Weapon MuzzleFlash and Muzzle Flash Dynamic Light to a SkeletalMesh
 *
 * @param	who is the pawn to attach to
 */
simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
{
    Super.AttachWeaponTo( MeshCpnt, SocketName );

    if( Instigator != none )
    {
        Instigator.AttachComponent(SceneCapture);
    }
}

/**
 * Detach weapon from skeletal mesh
 *
 * @param	SkeletalMeshComponent weapon is attached to.
 */
simulated function DetachWeapon()
{
    super.DetachWeapon();

    if( Instigator != none )
    {
        Instigator.DetachComponent(SceneCapture);
    }
}

/**
 * Tick the weapon (used for simple updates)
 *
 * @param	DeltaTime Elapsed time.
 */
simulated event Tick(float DeltaTime)
{
    local float InterpValue;
    local float DefaultZoomInTime;

    super.Tick(DeltaTime);

    if( ScopeLenseMIC == none )
    {
        return;
    }

    if( Instigator != none && Instigator.Controller != none && Instigator.IsHumanControlled() )
    {
        if( bZoomingOut && ZoomStartOffset!=IronSightPosition )
        {
            InterpValue = ZoomTime/default.ZoomOutTime;
            ScopeLenseMIC.SetScalarParameterValue(InterpParamName, InterpValue);
        }
        else if( bZoomingIn )
        {
            DefaultZoomInTime = default.ZoomInTime;
            InterpValue = -ZoomTime/DefaultZoomInTime + 1;
            ScopeLenseMIC.SetScalarParameterValue(InterpParamName, InterpValue);
        }
    }
}

/**
 * Called by the native code when the interpolation of the first person weapon to the zoomed position finishes
 */
simulated event OnZoomInFinished()
{
    if( ScopeLenseMIC != none )
    {
        ScopeLenseMIC.SetScalarParameterValue(InterpParamName, 1.0);
    }
	super.OnZoomInFinished();
}

/**
 * Called by the native code when the interpolation of the first person weapon from the zoomed position finishes
 */
simulated event OnZoomOutFinished()
{
    if( ScopeLenseMIC != none )
    {
        ScopeLenseMIC.SetScalarParameterValue(InterpParamName, 0.0);
    }
	super.OnZoomOutFinished();
}

/**
 * Handles all the functionality for zooming in including
 * setting the parameters for the weapon, pawn, and playercontroller
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 */
simulated function ZoomIn(bool bAnimateTransition, float ZoomTimeToGo)
{
    super.ZoomIn(bAnimateTransition, ZoomTimeToGo);
    if( SceneCapture != none && Instigator != none && !Instigator.PlayerReplicationInfo.bBot )
    {
        SceneCapture.bEnabled=true;
        SceneCapture.SetFrameRate(SceneCapture.default.FrameRate);
    }
}

/**
 * Handles all the functionality for zooming out including
 * setting the parameters for the weapon, pawn, and playercontroller
 *
 * @param bAnimateTransition whether or not to animate this zoom transition
 */
simulated function ZoomOut(bool bAnimateTransition, float ZoomTimeToGo)
{
    super.ZoomOut(bAnimateTransition, ZoomTimeToGo);
    if( SceneCapture != none && Instigator != none && !Instigator.PlayerReplicationInfo.bBot )
    {
        SceneCapture.bEnabled=false;
        SceneCapture.SetFrameRate(0.0);
    }
}

DefaultProperties
{
	// 2D scene capture
	Begin Object Class=SceneCapture2DComponent Name=SceneCapture2DComponent0
	   NearPlane=10
	   FarPlane=999999999
	   FieldOfView=6.0 // "4X" (approximate, since you have to eyeball it with 3d scopes)
	   bEnabled=false
	   ViewMode=SceneCapView_Lit
	   FrameRate=60
	   bEnableFog=true
	   bUpdateMatrices=false
	End Object
	SceneCapture=SceneCapture2DComponent0
	Components.Add(SceneCapture2DComponent0)

    ScopedSensitivityMod=6.0

    InterpParamName=mat_blend_scaler

    ScopeTextureScale=0.5

    //currently the materials don't go above 1024
    MaxSceneCaptureSize=1024

	// BASH_FIREMODE
	InstantHitDamage(BASH_FIREMODE)=15.0
    
    // Aim Assist
    AimCorrectionSize=40.f
}
