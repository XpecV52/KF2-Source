//--------------------------------------------
//   RypeL Cam for Red Orchestra 2, C, 2012
//--------------------------------------------
class CamHUD extends Interaction;
		//config(RypelCam);


var /*config*/ float PauseCamMouseSensitivity, speccamspeed, TimedPathStartTime;
var /*config*/ int dumpframes_fps;

var Actor 	ap, HackLockedSavedActor, target_actor, target, targeta, ta;

var bool 	bw, ba, bs, bd, bdown, bup;
var bool 	bact, balternativekey, bdemo04, bserverdemo, behindview, bdrawadvanced,
      bdumpframes, bFirstPersonMovieMode, bFlagsAtTarget, bfollowtarget,
      bfollowtarget_lock_rotation, bfovmode, bgotoloc, bhideweapon, bIncomingCam,
      bIsPaused, waspressed, bLockRotation, bnextframe, bpathedit, bpcam,
      bremovehiteffect, bshowcoords, bshowhelp, bShowHudInfo, bstartpaused,
      bswitched, bTargetnone, btimedpath, btpfastforward, bTypecoords,
      bViewingdemorec, bDrawdemorec, bViewingcam, bViewing_last_set_campoint,
      bweaponeffects, bwh, drawHelp, started, tanone, targetlook, tempbool, velChanged;

var float 	dista, followdist, kabstand, mabstand, overlayPositions[12], soundvolume, specfollowdistance,
     speed, tempfloat, temptime, tf, timecount, v0, t0, velocityDif[2];
var int 	bmotbur, democount, flagcount, i, z, lastmouseX, lastmouseY, mouseX, mouseY,
       maxcampoints, seektime, targetcount, targetcount_anz, typecount, typecount2, veloRelPositionsCount;
var rotator r, tr, rotat, timedrot, typerot;
var string followtarget_mode, watchedname;
var Texture worldinfotex;
var vector distancemeter_pos, myPawnVelocity, targetloc, tv, typeloc, veloRelativePositions[5];

var CamControl other2, cc;
var KFDemoRecSpectator drs;
var knoten kv, other3;
var Pawn pawn;
var PlayerController Cntrl;
var PlayerreplicationInfo pri, tpri;
var projectile targeted_proj, tproj;
var RCamDecalManager RCamDecalManager;
var KFHUDBase h;
var KFPawn tp;
var KFPlayerController PC;

exec function seekTo(int mins, int secs, float fastforwardspeed, optional int fragCount)
{
	seektime = mins * 60 + secs;
	PC.WorldInfo.DemoPlayTimeDilation = fastforwardspeed;
}

exec function toggleMovieMode() {
	// UT3 only
}

function LoadRCamConfig()
{
	LogInternal("***LOADING RYPELCAM CONFIG");
	if(cc != none)
		cc.destroy();
	foreach pc.dynamicactors(class'Knoten', other3)
	Other3.destroy();
	cc = pc.Spawn(class'CamControl');
	flagcount = cc.z;
	kabstand = cc.kabstand;
	mabstand = cc.mabstand;
	cc.calculate_path_length();
}

function startcam()
{
	local knoten ksc;
	local rotknoten rksc;
	if(cc != none && cc.bSpline_update_required) {
		cc.updateSplinef(true, true);
		cc.setTimer(0.004, false);
		cc.calculate_path_length();
	}
	targeta = none;
	tanone = true;
	drs.SetViewTarget(cc);
	behindview = false;
	if(cc.drawcount == 0)
	{
		foreach pc.dynamicactors(class'Knoten', ksc)
		ksc.setHidden(false);
		foreach pc.dynamicactors(class'rotknoten', rksc)
		rksc.setHidden(true);
	}
	v0 = 0;
	t0 = pc.worldinfo.TimeSeconds;
	cc.startcam = true;
	bViewingCam = true;
	bViewingdemorec = false;
	timecount = pc.worldinfo.TimeSeconds;
}

// create a string from the time
static function string FormatTime_likeUT(int Seconds)
{
	local int Hours, Mins;
	local string NewTimeString;
	Seconds = abs(Seconds); // avoid negative numbers (countdown) "00:0-2:-55"
	Hours = Seconds / 3600;
	Seconds -= Hours * 3600;
	Mins = Seconds / 60;
	Seconds -= Mins * 60;
	NewTimeString = "";
	if(Hours > 0)
		NewTimeString = NewTimeString $(Hours > 9 ? String(Hours) : "0"$String(Hours)) $ ":";
	NewTimeString = NewTimeString $(Mins > 9 ? String(Mins) : "0"$String(Mins)) $ ":";
	NewTimeString = NewTimeString $(Seconds > 9 ? String(Seconds) : "0"$String(Seconds));
	return NewTimeString;
}

exec function update() {
	if(cc != none) {
		if(cc.do_not_update_Spline) {
			cc.do_not_update_Spline = false;
			if(cc.bSpline_update_required) {
				cc.updateSplinef(true, true);
				cc.SetTimer(0.004, false);
			}
			cc.calculate_path_length();
		} else if(!cc.do_not_update_Spline) {
			cc.do_not_update_Spline = true;
		}
	}
}

exec function dumpfps(int fps) {
	dumpframes_fps = fps;
	pc.clientmessage("dumpframes fps ="@ fps);
}

exec function Mouse(int MouseSensitivity) {
	PauseCamMouseSensitivity = MouseSensitivity;
}

exec function tpstart(optional float fastforwardspeed, optional int secsstartlater)
{
	if(flagcount < 1) {
		LoadRCamConfig(); // load path
		drs.setviewtarget(cc.viewer01); // go to tp start location
	}
	if(btimedpath == false) {
		btimedpath = !btimedpath;
		if(cc != none)
			cc.btimedpath = btimedpath;
	}
	if(cc != none && cc.bSpline_update_required) {
		cc.updateSplinef(true, true);
		cc.setTimer(0.004, false);
		cc.calculate_path_length();
	}
}

function followtarget(int followmode)
{
	// int followmode:
	// 1= center view on projectile
	// 2= projectiles without locked rotation
	// 3= player+vehicle with locked rotation
	i = 0;
	watchedname = "not available";
	bfollowtarget_lock_rotation = false;
	if(followmode == 3)
	{
		foreach pc.dynamicactors(class'Pawn', pawn)
		{
			// skip pawns without PlayerReplicationInfo
			if(pawn.PlayerReplicationInfo == none)
				continue;
			if(targetcount == i) {
				specfollowdistance = 100;
				drs.SetViewTarget(none);
				target = pawn;
				drs.SetLocation(pawn.Location - vector(pawn.Rotation - rot(2048, 0, 0)) * 100);
				drs.SetRotation(rotator(pawn.location - drs.location));
				watchedname = pawn.PlayerReplicationInfo.playername;
				followtarget_mode = "loc_rot";
			}
			++i;
		}
	}
	if(i != 0) {
		++targetcount;
		targetcount_anz = i;
		targetcount = targetcount % targetcount_anz;
		drs.bCollideWorld = false;
		bviewingcam = true;
		targeta = none;
		tanone = true;
		bViewingdemorec = false;
		bTargetnone = false;
		bFollowTarget = true;
		waspressed = true; // reset relative drs location for new target
	}
}

function timedilation(float percentage)
{
	if(pc.worldinfo.demoplaytimedilation >= 1)
		pc.worldinfo.demoplaytimedilation += pc.worldinfo.demoplaytimedilation * percentage;
	else if(pc.worldinfo.demoplaytimedilation + pc.worldinfo.demoplaytimedilation * percentage > 0)
		pc.worldinfo.demoplaytimedilation += pc.worldinfo.demoplaytimedilation * percentage;
}

function viewpreviousplayer(int n)
{
	local int ii, CurrentIndex, IndexLength;
	if(pc.RealViewTarget != None)
	{
		ii = 0;
		foreach pc.dynamicactors(class'Pawn', pawn)
		{
			if(pawn.PlayerReplicationInfo != none)
			{
				++ii;
				if(pc.RealViewTarget == pawn.PlayerReplicationInfo)
					CurrentIndex = ii;
			}
		}
		IndexLength = ii;
		// leftmouseb. executes drs.DemoViewNextPlayer() and changes from the
		// first entry in the player list to the last one (= IndexLength)
		// View the prior player n=2 + CurrentIndex=0 instead of IndexLength
		if(n == 2 && CurrentIndex == IndexLength)
			CurrentIndex = 0;
		ii = 0;
		foreach pc.dynamicactors(class'Pawn', pawn)
		{
			if(pawn.PlayerReplicationInfo != none)
			{
				++ii;
				// wrap list, select 1st player
				if(IndexLength < CurrentIndex + n)
				{
					pc.SetViewTarget(pawn);
					break;
				}
				// select previous player
				else if(ii == CurrentIndex + n)
				{
					pc.SetViewTarget(pawn);
					break;
				}
			}
		}
	} else
		drs.DemoViewNextPlayer(); // view a player (next available - same action as leftmousebutton)
}

//delegate bool OnReceivedNativeInputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed=1.f, bool bGamepad = FALSE )
function bool InputAxis(int ControllerId, name Key, float Delta, float DeltaTime, bool bGamepad = FALSE)
{
	local rotator tr1;
	switch(key)
	{
	case 'mousex':
		tr1 = drs.rotation;
		tr1.yaw = tr1.yaw + delta * PauseCamMouseSensitivity;
		drs.setrotation(tr1);
		break;
	case 'mousey':
		tr1 = drs.rotation;
		tr1.pitch = tr1.pitch + delta * PauseCamMouseSensitivity;
		drs.setrotation(tr1);
		break;
	}
	return false;
}

function bool InputKey(int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE)
// function bool inputkey( int controllerid, name key, einputevent event, float amountdepressed )
{
	local vector v;
	local rotknoten rk2;
	local vector tvect;
	local bool ballowedflag;
	if(localplayer(pc.player).viewportclient.viewportconsole.isinstate('typing'))
	{
		return false;
	}
	bact = true;

	if(event == ie_pressed)
	{
		if(cc == none)
			foreach pc.dynamicactors(class'camcontrol', other2)
		{
			cc = other2;
			speed = cc.basic_speed2;
			other2.fov = pc.DefaultFOV;
			cc.btimedpath = btimedpath;
			break;
		}
		//pc.clientmessage(key);
		switch(key)
		{
		case 'x':
			balternativekey = true;
			break;
		case 't':
			// prepare timed path start
			if(!btimedpath) {
				pc.consolecommand("tpstart");
			} else {
				// disable timed path
				btimedpath = !btimedpath;
				if(cc != none)
					cc.btimedpath = btimedpath;
			}
			break;
		case 'R':
			bShowHudInfo = !bShowHudInfo;
			break;
		case 'MouseScrollDown':
			if(balternativekey)
				drs.DemoViewNextPlayer();
			else
				timedilation(-0.05);  // decrease demo playback speed by 5%
			break;
		case 'MouseScrollUp':
			if(balternativekey)
				viewpreviousplayer(1);
			else
				timedilation(+0.05);  // increase demo playback speed by 5%
			break;
		case 'PageDown':
			drs.DemoViewNextPlayer();
			break;
		case 'PageUp':
			viewpreviousplayer(1);
			break;
		case 'up':
			pc.worldinfo.demoplaytimedilation = 1.0;
			break;
		case 'left':
			timedilation(-0.20);  // decrease demo playback speed by 20%
			break;
		case 'right':
			timedilation(+0.20);  // increase demo playback speed by 20%
			break;
		case 'down':
			bIsPaused = !bIsPaused;
			if(pc.playerreplicationinfo == none)
				foreach pc.dynamicactors(class'playerreplicationinfo', tpri)
			{
				pc.playerreplicationinfo = tpri;
				break;
			}
			if(bispaused)
				pc.worldinfo.pauser = pc.PlayerReplicationInfo;
			else
				pc.worldinfo.pauser = none;
			break;
		case 'F2':
			bdumpframes = !bdumpframes;
			break;
		case 'F4':
			//cc.conf = true;
			//SaveConfig();
			//cc.SaveConfig();
			break;
		case 'F5':
			LoadRCamConfig();
			break;
		case 'w':
			bw = true;
			break;
		case 's':
			bs = true;
			break;
		case 'a':
			ba = true;
			break;
		case 'd':
			bd = true;
			break;
		case 'leftshift':
			bdown = true;
			break;
		case 'leftalt':
			bup = true;
			break;
		case 'spacebar':
			if(bispaused && pc.worldinfo.pauser != None) {
				bIsPaused = !bIsPaused;
			}
			break;
		case 'Add':
			if(cc != none && flagcount > 2) {
				// correct timed path off-synch
				if(btimedpath && started && drs.viewtarget == cc) {
					cc.StartTimedPath_Later_seconds = 0;
					cc.dif_tpstart_add = true;
					break;
				}
				cc.fov = drs.DefaultFOV;
				drs.SetFOV(drs.DefaultFOV);
				drs.setviewtarget(cc.viewer01);
				cc.ssw = false;
				targeta = none;
				tanone = true;
				cc.updateViewer(false);
				behindview = false;
				bViewingCam = true;
				bViewingdemorec = false;
			}
			break;
		case 'Subtract':
			if(cc != none && flagcount > 2) {
				// correct timed path off-synch
				if(btimedpath && started && drs.viewtarget == cc) {
					cc.StartTimedPath_Later_seconds = 0;
					cc.dif_tpstart_subtract = true;
					break;
				}
				cc.fov = drs.DefaultFOV;
				drs.SetFOV(drs.DefaultFOV);
				drs.setviewtarget(cc.viewer01);
				cc.ssw = false;
				targeta = none;
				tanone = true;
				cc.updateViewer(true);
				behindview = false;
				bViewingCam = true;
				bViewingdemorec = false;
			}
			break;
		case 'O':
			bfovmode = !bfovmode;
			break;
		case 'Z': // reposition cam point
			if(cc != none) {
				z = 0;
				cc.set_flag_locations(drs.viewtarget.location, cc.viewing);
				cc.set_flag_rotations(drs.viewtarget.Rotation, cc.viewing);
				foreach pc.dynamicactors(class'Knoten', kv)
				{
					cc.get_Flag_Locations(z, v);
					if(kv.Location != v)
					{
						cc.get_Flag_Rotations(z, rotat);
						kv.SetLocation(v);
						kv.SetRotation(rotat);
						if(cc.viewing == z)
						{
							cc.viewer01.setLocation(v);
							cc.viewer01.setRotation(rotat);
						}
					}
					z++;
				}
				cc.updateSplinef(true);
				kabstand = cc.kabstand;
				mabstand = cc.mabstand;
				cc.calculate_path_length();
			}
			break;
		case 'Q':
			drs.bCollideWorld = !drs.bCollideWorld;
			break;
		case 'H':   // 'H' show game hud
			pc.myhud.bshowHUD = !pc.myhud.bshowHUD;
			break;
		case 'F':
			bIsPaused = !bIsPaused;
			if(pc.playerreplicationinfo == none)
				foreach pc.dynamicactors(class'playerreplicationinfo', tpri)
			{
				pc.playerreplicationinfo = tpri;
				break;
			}
			if(bispaused)
				pc.worldinfo.pauser = pc.PlayerReplicationInfo;
			else
				pc.worldinfo.pauser = none;
			break;
		case 'one':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 0;
				speed = 0;
			}
			else if(drs.viewtarget == drs)
				speccamspeed = 0;
			break;
		case 'two':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 2;
				speed = 2;
			}
			else if(pc.viewtarget == drs)
				speccamspeed = 2;
			break;
		case 'three':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 4;
				speed = 4;
			}
			else if(pc.viewtarget == drs)
				speccamspeed = 4;
			break;
		case 'four':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 7;
				speed = 7;
			}
			else if(pc.viewtarget == drs)
				speccamspeed = 7;
			break;
		case 'five':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 12;
				speed = 12;
			}
			else if(pc.viewtarget == drs)
				speccamspeed = 12;
			break;
		case 'six':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 18;
				speed = 18;
			}
			else if(drs.viewtarget == drs)
				speccamspeed = 18;
			break;
		case 'seven':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 26;
				speed = 26;
			}
			else if(pc.viewtarget == drs)
				speccamspeed = 26;
			break;
		case 'eight':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 34;
				speed = 34;
			}
			else if(pc.viewtarget == drs)
				speccamspeed = 34;
			break;
		case 'nine':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = 40;
				speed = 40;
			}
			else if(pc.viewtarget == drs)
				speccamspeed = 40;
			break;
		case 'middlemousebutton':
			ballowedflag = true;
			if(flagcount >= 2)
			{
				if(distancemeter_pos == vect(0, 0, 0))
					cc.get_Flag_Locations(flagcount - 1, distancemeter_pos);
				tvect = distancemeter_pos;
				if(((VSize(drs.ViewTarget.location - tvect)
				        / kabstand) > 15) || (mabstand /
				                              (VSize(drs.ViewTarget.location - tvect)) > 15))
				{
					ballowedflag = false;
					pc.clientmessage("RypelCam Error: desired Campointlocation too far or too near to last Campoint!");
					pc.myhud.bshowHUD = true;
				}
			}
			if((drs.ViewTarget.location - tvect) == vect(0, 0, 0))
			{
				ballowedflag = false;
				pc.clientmessage("RypelCam Error: desired Campointlocation too far or too near to last Campoint!");
				pc.myhud.bshowHUD = true;
			}
			if(ballowedflag)
			{
				if(flagcount >= 1)
				{
					tvect = distancemeter_pos;
					if(flagcount == 1)
					{
						kabstand = (VSize(drs.ViewTarget.location - tvect));
						mabstand = (VSize(drs.ViewTarget.location - tvect));
					}
					if((VSize(drs.ViewTarget.location - tvect) < kabstand))
						kabstand = (VSize(drs.ViewTarget.location - tvect));
					if((VSize(drs.ViewTarget.location - tvect) > mabstand))
						mabstand = (VSize(drs.ViewTarget.location - tvect));
				}
				pc.Spawn(class'Knoten', , , drs.viewtarget.location).fov = drs.DefaultFOV;
				flagcount++;
				if(flagcount >= 4) // (re-)draw interpolation
					foreach pc.dynamicactors(class'Knoten', Other3)
					if((Other3.zeichner == true))
						Other3.updateSpline();
				distancemeter_pos = drs.viewtarget.location;
				if(flagcount == 1)
				{
					timedpathstarttime = pc.worldinfo.timeseconds;
				}
			}
			if(cc != none) {
				cc.calculate_path_length();
			}
			break;
		case 'Numpadfive':
			ballowedflag = true;
			if(flagcount >= 2)
			{
				if(distancemeter_pos == vect(0, 0, 0))
					cc.get_Flag_Locations(flagcount - 1, distancemeter_pos);
				tvect = distancemeter_pos;
				if(((VSize(drs.ViewTarget.location - tvect)
				        / kabstand) > 15) || (mabstand /
				                              (VSize(drs.ViewTarget.location - tvect)) > 15))
				{
					ballowedflag = false;
					pc.clientmessage("RypelCam Error: desired Campointlocation too far or too near to last Campoint!");
					pc.myhud.bshowHUD = true;
				}
			}
			if((drs.ViewTarget.location - tvect) == vect(0, 0, 0))
			{
				ballowedflag = false;
				pc.clientmessage("RypelCam Error: desired Campointlocation too far or too near to last Campoint!");
				pc.myhud.bshowHUD = true;
			}
			if(ballowedflag)
			{
				if(flagcount >= 1)
				{
					tvect = distancemeter_pos;
					if(flagcount == 1)
					{
						kabstand = (VSize(drs.ViewTarget.location - tvect));
						mabstand = (VSize(drs.ViewTarget.location - tvect));
					}
					if((VSize(drs.ViewTarget.location - tvect) < kabstand))
						kabstand = (VSize(drs.ViewTarget.location - tvect));
					if((VSize(drs.ViewTarget.location - tvect) > mabstand))
						mabstand = (VSize(drs.ViewTarget.location - tvect));
				}
				pc.Spawn(class'Knoten', , , drs.viewtarget.location).fov = drs.DefaultFOV;
				flagcount++;
				if(flagcount >= 4) // (re-)draw interpolation
					foreach pc.dynamicactors(class'Knoten', Other3)
					if((Other3.zeichner == true))
						Other3.updateSpline();
				distancemeter_pos = drs.viewtarget.location;
				if(flagcount == 1)
				{
					timedpathstarttime = pc.worldinfo.timeseconds;
				}
			}
			if(cc != none) {
				cc.calculate_path_length();
			}
			break;
			break;
		case 'leftmousebutton':
			bViewingdemorec = true;
			bViewingCam = false;
			if(cc != none)
				cc.ssw = false;
			if(bfollowtarget)
				bfollowtarget = false;
			if(balternativekey)
				viewpreviousplayer(2);  // view previous player
			break;
		case 'rightmousebutton':
			if(bfollowtarget)
				bfollowtarget = false;
			if(cc != none)
				cc.ssw = false;
			bshowcoords = true;
			//// JDR
			//pc.StopViewShaking();
			////
			if(drs.ViewTarget != drs) {
				if(cc != none && drs.ViewTarget == cc.viewer01) {
					// keep position when changing from cam point to free cam
					cc.viewer01.changeView(cc.viewing, cc.z, false, false);
					drs.SetRotation(cc.viewer01.Rotation); //clientside demos
					drs.SetLocation(cc.viewer01.Location);
				} else if(cc != none && drs.ViewTarget == cc) {
					drs.SetRotation(cc.Rotation);
					drs.SetLocation(cc.Location);
				} else if(bserverdemo && drs.ViewTarget != none) {
					// right click: free cam appears close to the spectated player (server demos only)
					drs.bCollideWorld = false;
					drs.SetLocation(drs.ViewTarget.Location - vector(drs.Rotation) * 200);
				}
			}
			//drs.SetViewTarget(drs);
			//pc.SetViewTarget(drs);
			bviewingcam = true;
			targeta = none;
			tanone = true;
			bViewingdemorec = false;
			behindview = false;
			drs.SetFOV(drs.DefaultFOV);
			pc.SetFOV(pc.DefaultFOV);
			if(cc != none) {
				cc.fov = pc.DefaultFOV;
				if(cc.drawcount != 3) {
					cc.draw_Spline = true;
					cc.drawSplineWasFalse = true;
					cc.drawcount = 3;
				}
			}
			break;
		case 'Numpadthree':
			if(cc != none && flagcount > 2 && !cc.bisdrawing)
			{
				//remove draw spline at cam start
				cc.draw_Spline = false;
				cc.drawSplineWasFalse = false;
				cc.drawcount = 0;
				startcam();
			}
			break;
		case 'Numpadnine':
			if(cc != none)
				cc.Spawn(class'drawkey');
			break;
		case 'period':
			bshowCoords = !bshowCoords;
			break;
		case 'Numpadone':
			if(drs.ViewTarget == cc)
			{
				if(cc.basic_speed2 - cc.basic_speed2 / 5 > 0)
				{
					cc.basic_speed2 = cc.basic_speed2 - cc.basic_speed2 / 5;
					speed = cc.basic_speed2;
				}
			}
			else if(drs.ViewTarget == pc)
			{
				speccamspeed = speccamspeed - speccamspeed / 5;
				if(speccamspeed < 0)
					speccamspeed = 0;
			}
			break;
		case 'Numpadtwo':
			if(drs.ViewTarget == cc)
			{
				cc.basic_speed2 = cc.basic_speed2 + cc.basic_speed2 / 5;
				speed = cc.basic_speed2;
			}
			else if(drs.ViewTarget == drs)
				speccamspeed = speccamspeed + speccamspeed / 5;
			break;
		case 'Numpadzero':
			if(balternativekey) {
				target = drs.ViewTarget;
				target_actor = target;
				bTargetnone = false;
			}
			else
				followtarget(3);   // follow player, add rotation
			break;
		case 'multiply':
			targetlook = !targetlook;
			pc.clientmessage("targetlook:"@ targetlook);
			if(!bTargetnone)
			{
				if(targetlook && (target != None))
					cc.enable2 = true;
				else
					cc.enable2 = false;
			}
			else
				cc.enable2 = false;
			break;
		case 'Pause':
			bisPaused = !bisPaused;
			break;
		case 'Numpadsix':
			break;
		case 'Numpadseven':
			if(cc != none) {
				if(bfovmode)
				{
					if(cc.fovplus)
					{
						cc.fovplus = false;
						cc.updateSplinef(true);
					}
					else
						cc.fovplus = true;
					cc.get_flag_fovs(cc.viewing, tf);
				}
				else
				{
					if(cc.rollplus)
					{
						cc.rollplus = false;
						cc.updateSplinef(true);
					}
					else
						cc.rollplus = true;
				}
			}
			break;
		case 'Numpadeight':
			if(cc != none) {
				if(bfovmode)
				{
					if(cc.fovminus)
					{
						cc.fovminus = false;
						cc.updateSplinef(true);
					}
					else
						cc.fovminus = true;
				}
				else
				{
					if(cc.rollminus)
					{
						cc.rollminus = false;
						cc.updateSplinef(true);
					}
					else
						cc.rollminus = true;
				}
			}
			break;
		case 'i':
			bhideweapon = !bhideweapon;
			if(KFPawn(pc.viewtarget).weapon.bhidden == false)
				KFPawn(drs.viewtarget).weapon.sethidden(true);
			else
				KFPawn(drs.viewtarget).weapon.sethidden(false);
			break;
		case 'Numpadfour':
			if(flagcount > 0)
				flagcount--;
			Z = 0;
			foreach pc.dynamicactors(class'Knoten', other3)
			{
				z++;
			}
			i = 1;
			if(z == 4)
			{
				cc.destroy();
				cc = none;
			}
			else if(z > 4)
			{
				cc.SetTimer(0.0, false);
				cc.z = cc.z - 1;
			}
			foreach pc.dynamicactors(class'Knoten', other3)
			{
				if(i == z)
					Other3.destroy();
				else
					distancemeter_pos = Other3.location;
				i++;
			}
			if(z > 4)
			{
				cc.updateSplinef(true);
				kabstand = cc.kabstand;
				mabstand = cc.mabstand;
			}
			else
			{
				foreach pc.dynamicactors(class'rotknoten', rk2)
				rk2.setHidden(true);
				tvect = vect(0, 0, 0);
				kabstand = 0;
				mabstand = 0;
				foreach pc.dynamicactors(class'Knoten', other3)
				{
					if(tvect != vect(0, 0, 0))
					{
						if((VSize(other3.location - tvect) < kabstand) || (kabstand == 0))
							kabstand = VSize(other3.location - tvect);
						if((VSize(other3.location - tvect) > mabstand) || (mabstand == 0))
							mabstand = VSize(other3.location - tvect);
					}
					tvect = other3.location;
				}
			}
			if(cc != none) {
				cc.calculate_path_length();
			}
			break;
		}
	}

	/*
	if ( event == ie_repeat )
	{
	}
	*/

	else if(event == ie_released)
	{
		switch(key)
		{
		case 'w':
			bw = false;
			break;
		case 's':
			bs = false;
			break;
		case 'a':
			ba = false;
			break;
		case 'd':
			bd = false;
			break;
		case 'leftshift':
			bdown = false;
			break;
		case 'leftalt':
			bup = false;
			break;
		case 'x':
			balternativekey = false;
			break;
		case 'Add':
			if(cc != none && flagcount > 2) {
				cc.dif_tpstart_temp = 0; // stop synchronizing camera on timed path
				cc.dif_tpstart_add = false;
			}
		case 'Subtract':
			if(cc != none && flagcount > 2) {
				cc.dif_tpstart_temp = 0;
				cc.dif_tpstart_subtract = false;
			}
		case 'Numpadseven':
			if(cc != none) {
				if(bfovmode)
				{
					if(cc.fovplus)
					{
						cc.fovplus = false;
						cc.updateSplinef(true);
					}
				} else {
					if(cc.rollplus)
					{
						cc.rollplus = false;
						cc.updateSplinef(true);
					}
				}
			}
			break;
		case 'Numpadeight':
			if(cc != none) {
				if(bfovmode)
				{
					if(cc.fovminus)
					{
						cc.fovminus = false;
						cc.updateSplinef(true);
					}
				} else {
					if(cc.rollminus)
					{
						cc.rollminus = false;
						cc.updateSplinef(true);
					}
				}
			}
			break;
		}
	}
	return false;
}

function NotifyworldinfoChange()
{
	pc.Interactions[0] = none;
	pc = none;
	cc.destroy();
}

event Tick(float deltatime)
{
	if(bLockRotation) {
		// UT3 only
	}
	if(bhideweapon)
	{
		if(KFPawn(drs.viewtarget).weapon.bhidden == false)
			KFPawn(drs.viewtarget).weapon.sethidden(true);
	}
	if(bnextframe)
	{
		if(pc.playerreplicationinfo == none)
			foreach pc.dynamicactors(class'playerreplicationinfo', tpri)
		{
			pc.playerreplicationinfo = tpri;
			break;
		}
		pc.worldinfo.pauser = pc.playerreplicationinfo;
		bnextframe = false;
	}
	if(seektime != 0)
	{
		if(pc.worldinfo.gri.RemainingTime <= seektime) {
			pc.worldinfo.Pauser = pc.PlayerReplicationInfo;
			pc.worldinfo.demoplaytimedilation = 1.0;
			bispaused = true;
			seektime = 0;
		}
	}
	if(cc != none) {
		if(btpfastforward == true)
		{
			if(pc.worldinfo.timeseconds >= TimedPathStartTime + cc.StartTimedPath_Later_seconds - 2) {
				pc.worldinfo.demoplaytimedilation = 1.0;
				btpfastforward = false;
			}
		}
		if(btimedpath && !started) //begin timedpath code
		{
			if(pc.worldinfo.timeseconds >= TimedPathStartTime + cc.StartTimedPath_Later_seconds)
			{
				bispaused = true;
				if(pc.playerreplicationinfo == none)
					foreach pc.dynamicactors(class'playerreplicationinfo', tpri)
				{
					pc.playerreplicationinfo = tpri;
					break;
				}
				pc.worldinfo.Pauser = pc.PlayerReplicationInfo;
				seektime = 0;
				cc.timesangleichen();
				cc.inittimespline();
				startcam();
				started = true;
				//remove draw spline at cam start
				cc.draw_Spline = false;
				cc.drawSplineWasFalse = false;
				cc.drawcount = 0;
				//remove rcam hud
				if(bShowHudInfo)
					bShowHudInfo = false;
			}
		}
	}
	if(bIncomingCam) {
		drs.SetViewTarget(pc);
		cc.setlocation(target_actor.location);
		drs.setviewtarget(cc);
		cc.SetRotation(rotator(target.location - cc.location));
	}
}

event PostRender(Canvas canvas)
{
	//local Vector2D TextSize;
	local string timeleft;
	local string viewing_mode_name;
	local float textscale;
	local float indent1;
	local float indent2;
	local float YLine; // Height of the current font
	local float YPos; // Y position on Canvas. out_YPos += out_YL, gives position to draw text for next line.

	if(bShowHudInfo) {
		textscale = 0.7;
		YPos = 480;
		YLine = 20;
		indent1 = 75;
		indent2 = 200;
		Canvas.Font = Font'enginefonts.SmallFont';

// RypelCam HUD info
		Canvas.SetDrawColor(0, 255, 0);
		Canvas.SetPos(100, 430);
		Canvas.DrawText("Rypel Cam");
		Canvas.SetPos(115, 460);
		Canvas.DrawText("Hide Info: R", , 0.6, 0.6);

// playback speed
		Canvas.SetPos(indent1, YPos);
		Canvas.DrawText("demo speed:", , textscale, textscale);
		Canvas.SetPos(indent2, YPos);
		if(pc.worldinfo.demoplaytimedilation <= 0.3) {
			Canvas.SetDrawColor(204, 51, 51); //red
		} else if(pc.worldinfo.demoplaytimedilation <= 0.5) {
			Canvas.SetDrawColor(204, 153, 51); //orange
		} else if(pc.worldinfo.demoplaytimedilation <= 0.9) {
			Canvas.SetDrawColor(204, 204, 102); //yellow
		} else if(pc.worldinfo.demoplaytimedilation == 1) {
			Canvas.SetDrawColor(255, 255, 255); //bright white
		} else if(pc.worldinfo.demoplaytimedilation <= 1.2) {
			Canvas.SetDrawColor(240, 240, 240); //white
		} else if(pc.worldinfo.demoplaytimedilation <= 2) {
			Canvas.SetDrawColor(204, 204, 102); //yellow
		} else if(pc.worldinfo.demoplaytimedilation <= 4) {
			Canvas.SetDrawColor(204, 153, 51); //orange
		} else if(pc.worldinfo.demoplaytimedilation <= 10) {
			Canvas.SetDrawColor(204, 51, 51); //red
		} else if(pc.worldinfo.demoplaytimedilation > 10) {
			Canvas.SetDrawColor(255, 0, 0); //intense red
		}
		Canvas.DrawText(pc.worldinfo.demoplaytimedilation, , textscale, textscale);

		if(cc != none) {
			if(cc.fov > 0) { // show if there is a cam path (actually, if fov is set)
				YPos += YLine;
				Canvas.SetPos(indent1, YPos);
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText("timed path:", , textscale, textscale);
				Canvas.SetDrawColor(255, 255, 255);
				Canvas.SetPos(indent2, YPos);
				if(bTimedPAth)
				{
					if(pc.worldinfo.timeseconds < TimedPathStartTime + cc.StartTimedPath_Later_seconds)
						Canvas.DrawText("enabled, starts in:" @ TimedPathStartTime - pc.worldinfo.timeseconds  + cc.StartTimedPath_Later_seconds, , textscale, textscale);
					else
						Canvas.DrawText("enabled, start:" @ -1 * (TimedPathStartTime - pc.worldinfo.timeseconds  + cc.StartTimedPath_Later_seconds) @ "sec ago", , textscale, textscale);
					YPos += YLine;
					Canvas.SetPos(indent1, YPos);
					Canvas.SetDrawColor(0, 255, 0);
					Canvas.DrawText("tp start: ", , textscale, textscale);
					Canvas.SetPos(indent2, YPos);
					Canvas.SetDrawColor(255, 255, 255);
					Canvas.DrawText(timedpathstarttime$"    (currently: "$pc.worldinfo.timeseconds$")", , textscale, textscale);
				} else {
					Canvas.DrawText("disabled", , textscale, textscale);
				}
			}

// number of campoints set
			if(pc.viewtarget != cc.viewer01) {
				YPos += YLine;
				Canvas.SetPos(indent1, YPos);
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText("cam points: ", , textscale, textscale);
				Canvas.SetPos(indent2, YPos);
				Canvas.SetDrawColor(255, 255, 255);
				Canvas.DrawText(flagcount, , textscale, textscale);
			}

// range: recommended cam point distance (average dist.)
			if(CC != none && !cc.ssw && pc.ViewTarget == drs && !cc.do_not_update_Spline && !bFollowTarget) {
				YPos += YLine;
				Canvas.SetPos(indent1, YPos);
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText("range: ", , textscale, textscale);
				Canvas.SetPos(indent2, YPos);
				if(cc.z == 4 && cc.path_length == 0) {
					cc.calculate_path_length();
				} else if(VSize(pc.ViewTarget.location) == VSize(distancemeter_pos)) {
					Canvas.SetDrawColor(204, 51, 51, 222); //red
					Canvas.DrawText("too close", , textscale, textscale);
				} else if(VSize(pc.ViewTarget.location - distancemeter_pos) < cc.path_length / cc.z) {
					if(mabstand / VSize(pc.ViewTarget.location - distancemeter_pos) > 15) {
						Canvas.SetDrawColor(204, 51, 51, 222);
						Canvas.DrawText("too close", , textscale, textscale);
					} else {
						Canvas.SetDrawColor(255, 255, 255, 222);
						Canvas.DrawText(VSize(pc.ViewTarget.location - distancemeter_pos) / (int (cc.path_length / cc.z)), , textscale, textscale);
					}
				} else if(VSize(pc.ViewTarget.location - distancemeter_pos) > cc.path_length / cc.z) {
					if(VSize(pc.ViewTarget.location - distancemeter_pos) / kabstand > 15) {
						Canvas.SetDrawColor(204, 51, 51, 222);
						Canvas.DrawText("too distant", , textscale, textscale);
					} else {
						Canvas.SetDrawColor(255, 255, 255, 222);
						Canvas.DrawText(1 - int (VSize(pc.ViewTarget.location - distancemeter_pos) - cc.path_length / cc.z)
						                / ((15 * kabstand) - cc.path_length / cc.z), , textscale, textscale);
					}
				}
			}
		} // end: show if camera class is spawned

// player name (viewing_mode_name)
		YPos += YLine;
		Canvas.SetPos(indent1, YPos);
		Canvas.SetDrawColor(0, 255, 0);
		Canvas.DrawText("viewing:", , textscale, textscale);
		Canvas.SetDrawColor(255, 255, 255);
		Canvas.SetPos(indent2, YPos);
		if(pawn(pc.viewtarget) != none) {
			if(pawn(pc.viewtarget).playerreplicationinfo != none) {
				viewing_mode_name = pawn(pc.viewtarget).playerreplicationinfo.playername;
			} else
				viewing_mode_name = "not available";
		}
		else if(cc != none && cc.ssw && !btimedpath) {
			viewing_mode_name = "rcam mode (progress:" @ int (cc.dist / cc.path_length * 100) $ "%)"; // progress on path [%]
		}
		else if(cc != none && cc.ssw) {
			viewing_mode_name = "rcam mode";
		}
		else if(bfollowtarget && target != none) {
			viewing_mode_name = watchedname;
		}
		else if(pc.ViewTarget == drs) {
			viewing_mode_name = "free camera";
		}
		else if(cc != none && pc.viewtarget == cc.viewer01) {
			viewing_mode_name = "cam point" @(cc.viewing + 1) $ "/" $ flagcount;
		}
		else {
			viewing_mode_name = "demorec spectator";
		};
		if(viewing_mode_name != "")
		{
			Canvas.DrawText(viewing_mode_name, , textscale, textscale);
		}

// show fov and roll values if cam point is viewtarget
		if(cc != none && pc.viewtarget == cc.viewer01) {
			YPos += YLine;
			Canvas.SetPos(indent1, YPos);
			if(bfovmode) // fov mode
			{
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText("  FOV: ", , textscale, textscale);
			}
			else
			{
				Canvas.SetDrawColor(0, 255, 0, 90); // draw fov transparent during roll mode
				Canvas.DrawText("  FOV(o): ", , textscale, textscale);
			}
			if(bfovmode)
				Canvas.SetDrawColor(255, 255, 255);
			else
				Canvas.SetDrawColor(255, 255, 255, 90);
			Canvas.SetPos(indent2, YPos);
			Canvas.DrawText(cc.fov, , textscale, textscale);
			YPos += YLine;
			Canvas.SetPos(indent1, YPos);
			if(!bfovmode) // roll mode
			{
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText("  Roll�: ", , textscale, textscale);
			}
			else
			{
				Canvas.SetDrawColor(0, 255, 0, 90); // draw roll transparent during fov mode
				Canvas.DrawText("  Roll�(o): ", , textscale, textscale);
			}
			if(!bfovmode)
				Canvas.SetDrawColor(255, 255, 255);
			else
				Canvas.SetDrawColor(255, 255, 255, 90);
			Canvas.SetPos(indent2, YPos);
			Canvas.DrawText((360.0 * pc.viewtarget.rotation.roll / 65536), , textscale, textscale);
			Canvas.SetDrawColor(0, 255, 0);
		}

//time
		YPos += YLine;
		Canvas.SetPos(indent1, YPos);
		Canvas.SetDrawColor(0, 255, 0);
		Canvas.DrawText("time:", , textscale, textscale);
		Canvas.SetDrawColor(255, 255, 255);
		Canvas.SetPos(indent2, YPos);
		timeleft = static.FormatTime_likeUT(pc.worldinfo.GRI.TimeLimit != 0 ? pc.worldinfo.GRI.RemainingTime : pc.worldinfo.GRI.ElapsedTime);
		Canvas.DrawText(timeleft, , textscale, textscale);
	}		// end HUD Info
}		// end event PostRender(Canvas canvas)

defaultproperties
{
   bShowHudInfo=True
   specfollowdistance=100.000000
   __OnReceivedNativeInputKey__Delegate=Default__CamHUD.InputKey
   __OnReceivedNativeInputAxis__Delegate=Default__CamHUD.InputAxis
   Name="Default__CamHUD"
   ObjectArchetype=Interaction'Engine.Default__Interaction'
}
