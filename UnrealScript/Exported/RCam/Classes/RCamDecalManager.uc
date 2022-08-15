//--------------------------------------------
//   RypeL Cam for Red Orchestra 2, C, 2012
//--------------------------------------------
class RCamDecalManager extends DecalManager;

var KFPlayerController kfpc, pc;
var CamHUD overlay;
var KFHUDBase other_Hud;
var vector tv;
var rotator tr;
var bool bdotick;

var LocalPlayer lp;
var PlayerController lpc;
var KFDemoRecSpectator drs;
var bool bServerdemo;
var rotator r1, r2, r3, r4, relrot;
var vector relpos1, relpos2;

function PostBeginPlay()
{
	super.postbeginplay();
}

event tick(float deltatime)
{
	if(pc == none)
    {
		findOrCreatePlayerControllerAndDemorecSpectator();
		if( pc == none )
		{
		    return;
		}

		if(overlay == none && findCamHUD() == None && pc.owner == none && PC.WorldInfo.IsPlayingDemo())
        {
			if(pc.playercamera != none)
			{
				pc.playercamera.blockedfov = false;
			}

			overlay = new(pc) class'RCam.CamHUD';
			pc.Interactions.Insert(0, 1);
			pc.Interactions[0] = overlay;
			overlay.pc = pc;
			overlay.drs = drs;
			overlay.bIsPaused = false;
			overlay.bDrawdemorec = false;
			overlay.bViewingdemorec = true;

			if(overlay.PauseCamMouseSensitivity == 0)
            {
				overlay.PauseCamMouseSensitivity = 30;
			}

			if(overlay.speccamspeed == 0)
            {
				if(!bServerdemo)
                {
					overlay.speccamspeed = 7;
				}
                else
                {
					overlay.speccamspeed = 3;
				}
			}

			overlay.bTargetnone = false;
			overlay.dista = 0;
			overlay.timecount = 0;
			overlay.followdist = 60;
			overlay.myPawnVelocity = vect(5, 5, 5);
			overlay.bserverdemo = bServerdemo;

			foreach AllActors(class'KFHUDBase', other_hud)
            {
				overlay.h = other_hud;
				break;
			}
		}
	}
    else if(overlay != none && overlay.bact)
    {
		if(overlay != none)
        {
			if(overlay.bw)
            {
				if(overlay.bfollowtarget && overlay.bfollowtarget_lock_rotation)
                {
					if(overlay.specfollowdistance >= 30)
                    {
						overlay.specfollowdistance -= overlay.speccamspeed / 2;
					}
				}
                else
                {
					tv = drs.location;
					tr = drs.rotation;
					tv = tv + vector(tr) * overlay.speccamspeed;
					drs.SetLocation(tv);
				}
			}

			if(overlay.bs)
            {
				if(overlay.bfollowtarget && overlay.bfollowtarget_lock_rotation)
                {
					overlay.specfollowdistance += overlay.speccamspeed / 2;
				}
                else
                {
					tv = drs.location;
					tr = drs.rotation;
					tv = tv - vector(tr) * overlay.speccamspeed;
					drs.SetLocation(tv);
				}
			}

			if(overlay.ba)
            {
				tv = drs.location;
				tr = drs.rotation;
				tr.yaw = tr.yaw + 16384;
				tr.pitch = 0;
				tv = tv - vector(tr) * overlay.speccamspeed;
				drs.SetLocation(tv);
			}

			if(overlay.bd)
            {
				tv = drs.location;
				tr = drs.rotation;
				tr.yaw = tr.yaw + 16384;
				tr.pitch = 0;
				tv = tv + vector(tr) * overlay.speccamspeed;
				drs.SetLocation(tv);
			}

			if(overlay.bdown)
            {
				tv = drs.location;
				tr = drs.rotation;
				tr.yaw = tr.yaw - 16384;
				tr.pitch = 0;
				tv.z = tv.z - overlay.speccamspeed;
				drs.SetLocation(tv);
			}

			if(overlay.bup)
            {
				tv = drs.location;
				tr = drs.rotation;
				tr.yaw = tr.yaw - 16384;
				tr.pitch = 0;
				tv.z = tv.z + overlay.speccamspeed;
				drs.SetLocation(tv);
			}
		}

		if(!overlay.bViewingDemorec && pc.viewtarget != drs.ViewTarget)
        {
			pc.SetViewTarget(drs.viewtarget);
		}

		if(!overlay.bTargetnone)
        {
			if(overlay.target != none && overlay.cc != none)
            {
				overlay.cc.thistarget = overlay.target;
			}

			if(overlay.target == none)
            {
				overlay.bTargetnone = true;
			}
		}

		if(!overlay.btargetnone && overlay.bfollowtarget)
		{
			if(overlay.waspressed)
            {
				relpos2 = overlay.target.Location;
				relrot = overlay.target.Rotation;
				overlay.waspressed = false;
			}
            else
            {
				if(overlay.followtarget_mode == "loc")
                {
					relpos1 = relpos2 - overlay.target.location;
					drs.SetLocation(drs.Location - relpos1);
					relpos2 = overlay.target.Location;
				}
                else if(overlay.followtarget_mode == "center_target")
                {
					drs.SetLocation(overlay.target.Location - vector(drs.rotation)*overlay.specfollowdistance);
					drs.SetRotation(rotator(overlay.target.location - drs.location));
				}
                else
                {
					drs.SetLocation(overlay.target.location
					                - vector(rotator(relpos2 - drs.location) + overlay.target.Rotation - relrot)
					                *vsize(relpos2 - drs.location)
					               );
					drs.setrotation(drs.rotation + overlay.target.rotation - relrot);
					relpos2 = overlay.target.Location;
					relrot = overlay.target.Rotation;
				}
			}
		}

		if(overlay.bdumpframes)
        {
			if(overlay.dumpframes_fps <= 0)
			{
				overlay.dumpframes_fps = 30;
			}

			pc.worldinfo.demoplaytimedilation = 30 / overlay.dumpframes_fps;
			pc.consolecommand("shot");
		}

		if(overlay.cc != none)
        {
			if( (pc != none) &&
                (overlay.bviewingcam) &&
                ((pc.ViewTarget == overlay.cc) || (pc.ViewTarget == overlay.cc.viewer01)) &&
                (pc.GetFovAngle() != overlay.cc.fov) )
            {
				pc.SetFOV(overlay.cc.fov);
			}

			// view cam point
			if(pc.viewtarget == overlay.cc.viewer01 && overlay.bserverdemo)
            {
				pc.setrotation(drs.viewtarget.rotation);
			}

			if(overlay.cc.ssw)
            {
				pc.setrotation(drs.viewtarget.rotation);
			}
		}

		if(!overlay.bserverdemo && overlay.bViewingCam && !overlay.bviewingdemorec)
        {
            //// JDR
			//pc.StopViewShaking();
			//pc.StopCameraAnim(true);
			////
			r1 = pc.rotation;
			r2 = drs.viewtarget.rotation;

			if(r1 != r4 && pc.pawn != none)
            {
				pc.Pawn.FaceRotation(r1, deltatime);
			}

			if(r2 != r1)
            {
				pc.setrotation(r2);
			}

			r4 = pc.rotation;
			pc.setrotation(r2);
		}
	}
}

function findOrCreatePlayerControllerAndDemorecSpectator()
{
/*
`ifdef(RO_)
    local DemoRecSpectator DemRecSpec;
	foreach allactors(class'DemoRecSpectator', DemRecSpec)
    {
		pc = DemRecSpec;
		drs = DemRecSpec;
		if( WorldInfo.NetMode == NM_DedicatedServer )
		{
			bServerdemo = true;
		}

		break;
	}
`else
*/
	foreach allactors(class'KFPlayerController', kfpc)
    {
		if(kfpc.pawn != none)
        {
			drs = kfpc.Spawn(class'KFDemoRecSpectator');
		}
        else
        {
			drs = KFDemoRecSpectator(kfpc);
			if(drs != none)
            {
				bServerdemo = true;
			}
            else
            {
				drs = kfpc.Spawn(class'KFDemoRecSpectator');
			}
		}
		pc = kfpc;
		break;
	}
//`endif
}

function CamHUD findCamHUD()
{
	local Interaction inter;
	local int i;

	if(pc != none)
    {
		for(i = 0; i < pc.Interactions.Length; i++)
        {
			inter = pc.Interactions[i];
			if(inter.isA('CamHUD'))
            {
				return CamHUD(inter);
			}
		}
	}

	return None;
}

defaultproperties
{
   Begin Object Class=DecalComponent Name=BaseDecal Archetype=DecalComponent'Engine.Default__DecalManager:BaseDecal'
      ReplacementPrimitive=None
      bIgnoreOwnerHidden=True
      Name="BaseDecal"
      ObjectArchetype=DecalComponent'Engine.Default__DecalManager:BaseDecal'
   End Object
   DecalTemplate=BaseDecal
   bHidden=True
   bAlwaysTick=True
   Name="Default__RCamDecalManager"
   ObjectArchetype=DecalManager'Engine.Default__DecalManager'
}
