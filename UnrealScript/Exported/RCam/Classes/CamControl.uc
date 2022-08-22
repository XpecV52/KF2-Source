//--------------------------------------------
//   RypeL Cam for Red Orchestra 2, C, 2012
//--------------------------------------------
class CamControl extends actor;
	//config(RypelCam);


struct TMultiArray {
	var int Y[121];
};
var TMultiArray M[121];

var /*config*/ bool bxedited, conf, do_not_update_Spline;
var /*config*/ float basic_speed2, Flag_Fovs[121], Flag_Times[121], kabstand, mabstand, X[121];
var /*config*/ int drawdetail, Z;
var /*config*/ rotator Rotation_At_Flags[121];
var /*config*/ vector Flag_Locations[121];

var bool	startCam, bbadaccel, bisdrawing, bpcam, bredox, bSpline_update_required, btimedpath,
			C4D_Export_Target, C4D_Export, combineLoc, dif_tpstart_add, dif_tpstart_subtract,
			draw_Spline, drawSplineWasFalse, enable2, fovplus, fovminus, I_want_to_insert_a_Flag,
			is_spawning, justSpawn, remove_the_specified_Flag, rollplus, rollminus, ssw, start;

var float	accel, carry, counter, CurFrame, d1, derivates[121], dif_tpstart_temp, dif_tpstart, dist,
			Flag_Dist[121], fov, path_length, start_CurTime, StartTimedPath_Later_seconds,
			t, t0, v0, tempdist, testdist, tfov, x_speed;

var int drawcount, flag_zaehler, insert_after_Flag, j, n, remove_Flag, testzaehler, viewing;
var rotator rotat, rotat2, Targetrotation, tr;
var vector TargetLocation, trc4dexport, v, v2, v2old, v3;

var actor thisTarget;
var KFDemoRecSpectator Demo3;
var Knoten OtherKnot;
var rotknoten Other2Rot;
var Viewer viewer01;

var float a_a[121];
var float a_b[121];
var float a_c[121];
var float a_d[121];
var float b_a[121];
var float b_b[121];
var float b_c[121];
var float b_d[121];
var float c_a[121];
var float c_b[121];
var float c_c[121];
var float c_d[121];
var float yaw_a[121];
var float yaw_b[121];
var float yaw_c[121];
var float yaw_d[121];
var float pitch_a[121];
var float pitch_b[121];
var float pitch_c[121];
var float pitch_d[121];
var float roll_a[121];
var float roll_b[121];
var float roll_c[121];
var float roll_d[121];
var float fov_a[121];
var float fov_b[121];
var float fov_c[121];
var float fov_d[121];

function PostBeginPlay()
{
	local int i;
	local Knoten Other;
	local KFDemorecspectator Other2;
	foreach DynamicActors(class'kfDemorecspectator', Other2)
	{
		Demo3 = Other2;
		break;
	}
	foreach DynamicActors(class'Knoten', Other)
	{
		conf = false;
		break;
	}
	if(!conf)
	{
		if(basic_speed2 == 0)
			basic_speed2 = 4;
		z = 0;
		viewing = 0;
		drawDetail = 50;
		foreach DynamicActors(class'Knoten', Other)
		{
			SetLocation(Other.location);
			break;
		}
	}
	else
	{
		is_spawning = true;
		if(basic_speed2 == 0)
			basic_speed2 = 4;
		for(i = 0; i < z; i++)
		{
			Spawn(class'Knoten', , , Flag_Locations[i]);
		}
		i = 0;
		foreach DynamicActors(class'Knoten', Other)
		{
			Other.setRotation(Rotation_At_Flags[i]);
			Other.fov = Flag_Fovs[i];
			Other.time = Flag_times[i];
			i++;
		}
		updateSplinef(true);
		SetLocation(Flag_Locations[0]);
	}
	if(viewer01 == none)
		viewer01 = Spawn(class'Viewer');
	draw_Spline = true;
	drawSplineWasFalse = false;
	I_want_to_insert_a_Flag = false;
	conf = false; // after load, treat class like one without config
	counter = 0;
	t = 0;
	x_speed = 10;
	C4D_Export = false;
	is_spawning = false;
	enable2 = false;
	Demo3.RotationRate.pitch = 65536;
	self.Tag = demo3.Tag;
	fov = 100;
	accel = 0;
	if(thisTarget == none)
		thisTarget = Spawn(class'scl');
	SetTimer(0.005, true);
} // End PostBeginPlay

function get_x(int i, out float fl)
{
	fl = x[i];
}
function set__x(float fl, int i)
{
	x[i] = fl;
}
function get_Flag_Locations(int i, out vector fl)
{
	fl = Flag_Locations[i];
}
function set_Flag_Locations(vector fl, int i)
{
	Flag_Locations[i] = fl;
	update_flags();
}
function get_Flag_Rotations(int i, out rotator fr)
{
	fr = Rotation_At_Flags[i];
}
function set_Flag_Rotations(rotator fr, int i)
{
	local knoten other, knoten2;
	local int jj;
	Rotation_At_Flags[i] = fr;
	jj = 0;
	foreach DynamicActors(class'Knoten', Other)
	{
		if((i == 0) && (jj == 1))
		{
			knoten2 = Other;
			break;
		}
		if(jj == i - 1)
		{
			knoten2 = Other;
			break;
		}
		jj++;
	}
	if(knoten2 != none)
	{
		Rotation_At_Flags[i].yaw = fr.yaw;
		Rotation_At_Flags[i].pitch = fr.pitch;
		if(abs(Rotation_At_Flags[i].yaw - knoten2.rotation.yaw) > 32768)
		{
			while(abs(Rotation_At_Flags[i].yaw - knoten2.rotation.yaw) > 32768)
			{
				if(Rotation_At_Flags[i].yaw > knoten2.rotation.yaw)
					Rotation_At_Flags[i].yaw = Rotation_At_Flags[i].yaw - 65536;
				else
					Rotation_At_Flags[i].yaw = Rotation_At_Flags[i].yaw + 65536;
			}
		}
		else
			Rotation_At_Flags[i].yaw = fr.yaw;
		if(abs(Rotation_At_Flags[i].pitch - knoten2.rotation.pitch) > 32768)
		{
			while(abs(Rotation_At_Flags[i].pitch - knoten2.rotation.pitch) > 32768)
				if(Rotation_At_Flags[i].pitch > knoten2.rotation.pitch)
					Rotation_At_Flags[i].pitch = Rotation_At_Flags[i].pitch - 65536;
				else
					Rotation_At_Flags[i].pitch = Rotation_At_Flags[i].pitch + 65536;
		}
		else
			Rotation_At_Flags[i].pitch = fr.pitch;
	}
	update_flags();
}
function set_Flag_Fovs(float tf, int i)
{
	Flag_Fovs[i] = tf;
	update_flags();
}
function get_Flag_Fovs(int i, out float tf)
{
	tf = Flag_Fovs[i];
}
function set_Flag_Times(float tf, int i)
{
	Flag_Times[i] = tf;
	update_flags();
}
function get_Flag_Times(int i, out float tf)
{
	tf = Flag_Times[i];
}

function update_flags()
{
	local int z2, z3;
	local knoten other, other10;
	local bool negdisp;
	local float disp;
	local vector tv;
	z2 = 0;
	foreach DynamicActors(class'Knoten', Other)
	{
		if(Other.fov != Flag_Fovs[z2])
		{
			Other.fov = Flag_Fovs[z2];
			if((viewing == z2) && (demo3.viewtarget == viewer01))
				fov = Flag_Fovs[z2];
		}
		if(Other.time != Flag_times[z2])
		{
			Other.time = Flag_times[z2];
		}
		if(Other.Location != Flag_Locations[z2])
		{
			if(!combineLoc)
			{
				Other.SetLocation(Flag_Locations[z2]);
				if(viewing == z2) viewer01.setLocation(Flag_Locations[z2]);
			}
			else
			{
				tv = vect(0, 0, 0);
				if(Other.Location.x != Flag_Locations[z2].x)
				{
					negDisp = Other.Location.x < Flag_Locations[z2].x;
					disp = abs(Other.Location.X - Flag_Locations[z2].X);
				}
				if(Other.Location.y != Flag_Locations[z2].y)
				{
					negDisp = Other.Location.y < Flag_Locations[z2].y;
					disp = abs(Other.Location.y - Flag_Locations[z2].y);
				}
				if(Other.Location.z != Flag_Locations[z2].z)
				{
					negDisp = Other.Location.z < Flag_Locations[z2].z;
					disp = abs(Other.Location.z - Flag_Locations[z2].z);
				}
				z3 = 0;
				foreach DynamicActors(class'Knoten', Other10)
				{
					if(Other10 != Other)
					{
						tv = Other10.location;
						if(Other.Location.x != Flag_Locations[z2].x)
							if(negDisp)
								tv.x = Other10.location.X + disp;
							else
								tv.x = Other10.location.X - disp;
						if(Other.Location.y != Flag_Locations[z2].y)
							if(negDisp)
								tv.y = Other10.location.y + disp;
							else
								tv.y = Other10.location.y - disp;
						if(Other.Location.z != Flag_Locations[z2].z)
							if(negDisp)
								tv.z = Other10.location.z + disp;
							else
								tv.z = Other10.location.z - disp;
						Flag_Locations[z3] = tv;
						Other10.SetLocation(tv);
						if(viewing == z3) viewer01.setLocation(Flag_Locations[z3]);
					}
					z3++;
				}
				Other.SetLocation(Flag_Locations[z2]);
				if(viewing == z2) viewer01.setLocation(Flag_Locations[z2]);
			}
			break;
		}
		if(Other.Rotation != Rotation_At_Flags[z2])
		{
			Other.SetRotation(Rotation_At_Flags[z2]);
			if(viewing == z2) viewer01.setRotation(Rotation_At_Flags[z2]);
			break;
		}
		z2++;
	}
}

function timesangleichen()
{
	local float dif;
	local int i;
	local Knoten Other;
	dif = worldinfo.TimeSeconds - Flag_Times[0] + dif_tpstart;
	for(i = 0; i < z; i++)
	{
		Flag_Times[i] = Flag_Times[i] + dif;
	}
	i = 0;
	foreach DynamicActors(class'Knoten', Other)
	{
		Other.time = other.time + dif;
	}
}

function updateViewer(bool dec)
{
	if(Demo3.ViewTarget != viewer01)
	{
		Demo3.setViewTarget(viewer01);
		viewer01.changeView(viewing, z - 1, false, false);
	}
	else
		viewer01.changeView(viewing, z - 1, !dec, dec);
}

function removeFlag()
{
	local Knoten Other;
	local int i;
	i = 0;
	foreach DynamicActors(class'Knoten', Other)
	{
		if(i == remove_Flag)
			Other.destroy();
		i++;
	}
	for(i = remove_Flag; i < z; i++)
	{
		Flag_Locations[i] = Flag_Locations[i + 1];
		Rotation_At_Flags[i] = Rotation_At_Flags[i + 1];
	}
	z = z - 1;
	updateSplinef(true);
}

function FlagEinfuegen()
{
	local Knoten Other;
	local vector v10;
	local int i;
	I_want_to_insert_a_Flag = false;
	i = 0;
	SetTimer(0, false);
	foreach DynamicActors(class'Knoten', Other)
	{
		if(i == z)
			v10 = Other.Location;
		i++;
	}
	for(i = z - 1; i > insert_after_Flag; i--)
	{
		Flag_Locations[i + 1] = Flag_Locations[i];
		Rotation_At_Flags[i + 1] = Rotation_At_Flags[i];
	}
	Flag_Locations[insert_after_Flag + 1] = v10;
	foreach DynamicActors(class'Knoten', Other)
	Other.destroy();
	z = z + 1;
	justSpawn = true;
	for(i = 0; i < z; i++)
		Spawn(class'Knoten', , , Flag_Locations[i]);
	justSpawn = false;
	i = 0;
	foreach DynamicActors(class'Knoten', Other)
	{
		Other.setRotation(Rotation_At_Flags[i]);
		i++;
	}
	updateSplinef(true);
	I_want_to_insert_a_Flag = true;
}

function updateSplinef(bool draw, optional bool force_update_Spline)
{
	local Knoten Other;
	local rotknoten Other2;
	z = 0;
	foreach DynamicActors(class'Knoten', Other) {
		Flag_Locations[z] = Other.Location;
		Rotation_At_Flags[z] = Other.Rotation;
		Flag_Fovs[z] = Other.fov;
		Flag_times[z] = Other.time;
		z++;
	}
	if(!do_not_update_Spline || force_update_Spline || bxedited) {
		SetTimer(0.004, false);
		foreach DynamicActors(class'rotknoten', Other2) {
			Other2.Destroy();
		}
		set_x();
		KubSplineKoeffNat();
		if(draw) {
			drawPath();
			drawcount = 0;
		}
		else
			drawcount = 2;
		dist = 0;
		flag_dist[0] = 0;
		bSpline_update_required = false;
		SetTimer(0.004, false);
	} else {
		bSpline_update_required = true;
	}
}

function calculate_path_length() {
	local int i;
	for(i = 0; i < z; ++i) {
		path_length = flag_dist[i];
	}
}

event Tick(float deltatime)
{
	if(ssw == true)
	{
		if(!start)
			start = true;
		if(btimedpath && (worldinfo.timeseconds > flag_times[z - 1]))
			ssw = false;
		if(t >= x[z - 1])
			ssw = false;
		if((t < x[z - 1]) && start)
		{
			if(btimedpath)
				spline_pchip_val(z, Flag_Times, x, derivates, 1, worldinfo.TimeSeconds, t);
			for(j = 0; j < n - 1; j++)
			{
				if(t >= x[j])
					if(t < x[j + 1])
					{
						KubSplineWertX(t, j);
						KubSplineWertY(t, j);
						KubSplineWertZ(t, j);
						v3 = v2 - v;
						norm(d1, v3);
						tempdist = 0;
						if(carry != 0)
							tempdist = tempdist + carry;
						if(btimedpath && (t >= x[flag_zaehler]) && (flag_zaehler < z))
						{
							flag_zaehler++;
						} else {
							while(!btimedpath && !bpcam && (tempdist < basic_speed2) && (t < x[j + 1]))
							{
								KubSplineWertX(t, j);
								KubSplineWertY(t, j);
								KubSplineWertZ(t, j);
								v3 = v2 - v;
								norm(d1, v3);
								t = t + 0.0005;
								dist = dist + d1;
								tempdist = tempdist + d1;
								v = v2;
								if((t >= x[flag_zaehler]) && (flag_zaehler < z))
								{
									flag_zaehler++;
								}
							}
						}
						if(btimedpath || (tempdist >= basic_speed2) && (t < x[j + 1]))
						{
							v = v2;
							setLocation(v);
							fov = tfov;
							KubSplineWertYaw(t, j);
							KubSplineWertPitch(t, j);
							KubSplineWertRoll(t, j);
							KubSplineWertFov(t, j);
							carry = 0;
							if(!enable2) // view selected target
								setRotation(rotat);
						} else {
							carry = tempdist;
						}
					}
				if(j == n - 2)
					if(t == x[j + 1])
					{
						KubSplineWertX(t, j);
						KubSplineWertY(t, j);
						KubSplineWertZ(t, j);
						KubSplineWertYaw(t, j);
						KubSplineWertPitch(t, j);
						KubSplineWertRoll(t, j);
						KubSplineWertFov(t, j);
						v3 = v2 - v;
						norm(d1, v3);
						dist = dist + d1;
						t = t + 0.0005;
						v = v2;
						setLocation(v);
						fov = tfov;
						if(!enable2) // view selected target
							setRotation(rotat);
					}
			}
		}
	}
	// synchronize camera on timed path
	if(dif_tpstart_add) {
		dif_tpstart_temp += 0.00005;
		dif_tpstart = Flag_Times[0] - worldinfo.timeseconds  + StartTimedPath_Later_seconds - dif_tpstart_temp;
		timesangleichen();
		inittimespline();
	}
	if(dif_tpstart_subtract) {
		dif_tpstart_temp += 0.00005;
		dif_tpstart = Flag_Times[0] - worldinfo.timeseconds  + StartTimedPath_Later_seconds + dif_tpstart_temp;
		timesangleichen();
		inittimespline();
	}
	if(fovplus)
	{
		if(Flag_Fovs[viewing] < 150)
		{
			Flag_Fovs[viewing] += 0.2;
			update_flags();
		}
		else
		{
			fovplus = false;
			updateSplinef(true);
		}
	}
	if(fovminus)
	{
		if(Flag_Fovs[viewing] > 2)
		{
			Flag_Fovs[viewing] -= 0.2;
			update_flags();
		}
		else
		{
			fovminus = false;
			updateSplinef(true);
		}
	}
	if(rollplus)
	{
		rotation_at_flags[viewing].roll -= 70;
		update_flags();
	}
	if(rollminus)
	{
		rotation_at_flags[viewing].roll += 70;
		update_flags();
	}
	if(enable2)
	{
		tr = rotator(thisTarget.Location - Location);
		tr.roll = rotat.roll;
		setRotation(tr);
	}
}

function Timer()
{
	if(Demo3.ViewTarget != None)
	{
		targetLocation = demo3.viewtarget.Location;
		targetRotation = demo3.viewtarget.Rotation;
	}
	if(remove_the_specified_Flag == true)
	{
		setTimer(0.004, false);
		removeFlag();
		remove_the_specified_Flag = false;
	}
	if((draw_Spline == false) && (!drawSplineWasFalse))
	{
		foreach DynamicActors(class'Knoten', OtherKnot)
		OtherKnot.setHidden(true);
		foreach DynamicActors(class'rotknoten', Other2Rot)
		Other2Rot.setHidden(true);
		drawSplineWasFalse = true;
		drawcount = 1;
	}
	if((drawSplineWasFalse == true) && (draw_Spline == true))
	{
		foreach DynamicActors(class'Knoten', OtherKnot)
		OtherKnot.setHidden(false);
		foreach DynamicActors(class'rotknoten', Other2Rot)
		Other2Rot.setHidden(false);
		drawSplineWasFalse = false;
		drawcount = 0;
	}
	if(startCam == true)
	{
		ssw = true;
		startCam = false;
		v2 = vect(0, 0, 0);
		v = Flag_Locations[0];
		rotat = Rotation_At_Flags[0];;
		t = 0;
		setLocation(v);
		setRotation(rotat);
		flag_zaehler = 1;
		dist = 0;
		counter = 2;
		setTimer(0.004, true);
	}
	n = z;
	if((t >= x[z - 1]) && !enable2)
		SetTimer(0.05, true);
}

function norm(out float f2, vector vv3) {
	f2 = sqrt((vv3.X) * (vv3.X) + (vv3.Y) * (vv3.Y) + (vv3.Z) * (vv3.Z));
}


function KubSplineWertX(float tt, int jj)
{
	v2.X = a_a[jj] + a_b[jj] * (tt - x[jj]) + a_c[jj] * (tt - x[jj]) * (tt - x[jj]) + a_d[jj] * (tt - x[jj]) * (tt - x[jj]) * (tt - x[jj]);
}
function KubSplineWertY(float tt, int jj)
{
	v2.Y = b_a[jj] + b_b[jj] * (tt - x[jj]) + b_c[jj] * (tt - x[jj]) * (tt - x[jj]) + b_d[jj] * (tt - x[jj]) * (tt - x[jj]) * (tt - x[jj]);
}
function KubSplineWertZ(float tt, int jj)
{
	v2.Z = c_a[jj] + c_b[jj] * (tt - x[jj]) + c_c[jj] * (tt - x[jj]) * (tt - x[jj]) + c_d[jj] * (tt - x[jj]) * (tt - x[jj]) * (tt - x[jj]);
}
function KubSplineWertYaw(float tt, int jj)
{
	rotat.yaw = yaw_a[jj] + yaw_b[jj] * (tt - x[jj]) + yaw_c[jj] * (tt - x[jj]) * (tt - x[jj]) + yaw_d[jj] * (tt - x[jj]) * (tt - x[jj]) * (tt - x[jj]);
}
function KubSplineWertPitch(float tt, int jj)
{
	rotat.pitch = pitch_a[jj] + pitch_b[jj] * (tt - x[jj]) + pitch_c[jj] * (tt - x[jj]) * (tt - x[jj]) + pitch_d[jj] * (tt - x[jj]) * (tt - x[jj]) * (tt - x[jj]);
}
function KubSplineWertRoll(float tt, int jj)
{
	rotat.roll = roll_a[jj] + roll_b[jj] * (tt - x[jj]) + roll_c[jj] * (tt - x[jj]) * (tt - x[jj]) + roll_d[jj] * (tt - x[jj]) * (tt - x[jj]) * (tt - x[jj]);
}
function KubSplineWertFov(float tt, int jj)
{
	tfov = fov_a[jj] + fov_b[jj] * (tt - x[jj]) + fov_c[jj] * (tt - x[jj]) * (tt - x[jj]) + fov_d[jj] * (tt - x[jj]) * (tt - x[jj]) * (tt - x[jj]);
}

function equalArray(float a1[121], out float b1[121])
{
	local int i;
	for(i = 0; i < 121; i++)
		b1[i] = a1[i];
}

function Cholesky(float k[121], out float erg[121]) {
	local int nn;
	local int i;
	local float d[121];
	local float g[121];
	local float z1[121];
	local float e[121];
	nn = z - 3;
	for(i = 0; i <= nn; i++) {
		d[i] = 0;
		g[i] = 0;
		e[i] = 0;
		z1[i] = 0;
		erg[i] = 0;
	}
	d[0] = M[0].Y[0];
	for(i = 1; i <= n; i++) {
		g[i - 1] = M[i].Y[i - 1] / d[i - 1];
		d[i] = M[i].Y[i] - g[i - 1] * M[i].Y[i - 1];
	}
	d[nn] = M[nn].Y[nn] - M[nn].Y[nn - 1] * g[nn - 1];
	z1[0] = k[0];
	for(i = 1; i <= nn; i++)
		z1[i] = k[i] - g[i - 1] * z1[i - 1];
	for(i = 0; i <= nn; i++)
		e[i] = z1[i] / d[i];
	erg[nn] = e[nn];
	for(i = nn - 1; i >= 0; i--)
		erg[i] = e[i] - g[i] * erg[i + 1];
}

function KubSplineKoeffNat() {
	local int nn;
	local float k[121], y[121], h1[121];
	local float ska[121], skb[121], skc[121], skd[121];
	local int i, h, o, jj;
	nn = z - 1;
	for(i = 0; i < 121; i++)
		for(jj = 0; jj < 121; jj++)
			M[i].Y[jj] = 0;
	for(i = 0; i <= nn; i++) {
		ska[i] = 0;
		skb[i] = 0;
		skc[i] = 0;
		skd[i] = 0;
	}
	h = 7;
	o = 0;
	for(o = 0; o < h; o++) {
		if(o == 0)
			for(i = 0; i < 121; i++)
				y[i] = Flag_Locations[i].X;
		if(o == 1)
			for(i = 0; i < 121; i++)
				y[i] = Flag_Locations[i].Y;
		if(o == 2)
			for(i = 0; i < 121; i++)
				y[i] = Flag_Locations[i].Z;
		if(o == 3)
			for(i = 0; i < 121; i++)
				y[i] = Rotation_At_Flags[i].Yaw;
		if(o == 4)
			for(i = 0; i < 121; i++)
				y[i] = Rotation_At_Flags[i].Pitch;
		if(o == 5)
			for(i = 0; i < 121; i++)
				y[i] = Rotation_At_Flags[i].Roll;
		if(o == 6)
			for(i = 0; i < 121; i++)
				y[i] = Flag_Fovs[i];
		skc[0] = 0;
		skc[nn] = 0;
		skb[0] = 0;
		skb[nn] = 0;
		for(jj = 1; jj <= nn - 1; jj++)
			skb[jj] = 3 * ((y[jj + 1] - y[jj]) / (x[jj + 1] - x[jj]) - (y[jj] - y[jj - 1]) / (x[jj] - x[jj - 1]));
		M[0].Y[0] = 2 * (x[2] - x[0]);
		M[0].Y[1] = x[2] - x[1];
		for(i = 0; i <= nn - 4; i++) {
			M[i + 1].Y[i] = 1 * (x[i + 2] - x[i + 1]);
			M[i + 1].Y[i + 1] = 2 * (x[i + 3] - x[i + 1]);
			M[i + 1].Y[i + 2] = 1 * (x[i + 3] - x[i + 2]);
		}
		M[nn - 2].Y[nn - 3] = 1 * (x[nn - 1] - x[nn - 2]);
		M[nn - 2].Y[nn - 2] = 2 * (x[nn] - x[nn - 2]);
		for(i = 1; i <= nn - 1; i++)
			k[i - 1] = skb[i];
		Cholesky(k, h1);
		for(i = 1; i <= nn - 1; i++)
			skc[i] = h1[i - 1];
// calculate di´s and bi´s from ci´s, xi´s and yi´s
		for(i = 0; i <= nn - 1; i++) {
			skd[i] = (skc[i + 1] - skc[i]) / (3 * (x[i + 1] - x[i]));
			skb[i] = (y[i + 1] - y[i]) / (x[i + 1] - x[i]) - ((x[i + 1] - x[i]) * (skc[i + 1] + 2 * skc[i])) / 3;
		}
		equalArray(y, ska);
		for(i = 0; i < nn; i++)
			k[i] = 0;
		if(o == 0) {
			equalArray(ska, a_a);
			equalArray(skb, a_b);
			equalArray(skc, a_c);
			equalArray(skd, a_d);
		}
		if(o == 1) {
			equalArray(ska, b_a);
			equalArray(skb, b_b);
			equalArray(skc, b_c);
			equalArray(skd, b_d);
		}
		if(o == 2) {
			equalArray(ska, c_a);
			equalArray(skb, c_b);
			equalArray(skc, c_c);
			equalArray(skd, c_d);
		}
		if(o == 3) {
			equalArray(ska, yaw_a);
			equalArray(skb, yaw_b);
			equalArray(skc, yaw_c);
			equalArray(skd, yaw_d);
		}
		if(o == 4) {
			equalArray(ska, pitch_a);
			equalArray(skb, pitch_b);
			equalArray(skc, pitch_c);
			equalArray(skd, pitch_d);
		}
		if(o == 5) {
			equalArray(ska, roll_a);
			equalArray(skb, roll_b);
			equalArray(skc, roll_c);
			equalArray(skd, roll_d);
		}
		if(o == 6) {
			equalArray(ska, fov_a);
			equalArray(skb, fov_b);
			equalArray(skc, fov_c);
			equalArray(skd, fov_d);
		}
	}// for o
}

function edit_x(int i, bool bminus)
{
	local rotknoten other2;
	local int jj;
	local float tempdiff;
	bxedited = true;
	if(i == 0)
		return;
	tempdiff = (x[i] - x[i - 1]) / 7;
	if(bminus)
	{
		if((x[i] - tempdiff) > x[i - 1])
			for(jj = i; jj < z; jj++)
				x[jj] = x[jj] - tempdiff;
	}
	else
	{
		for(jj = i; jj < z; jj++)
			x[jj] = x[jj] + tempdiff;
	}
	KubSplineKoeffNat();
	foreach DynamicActors(class'rotknoten', Other2)
	{
		Other2.Destroy();
	}
	drawPath();
	drawcount = 0;
}

function set_x()
{
	local int i;
	local float t2;
	x[0] = 0;
	if(!bxedited)
	{
		kabstand = VSize(Flag_Locations[1] - Flag_Locations[0]);
		mabstand = kabstand;
		for(i = 1; i < z; i++)
		{
			t2 = VSize(Flag_Locations[i] - Flag_Locations[i - 1]);
			if(t2 < kabstand)
				kabstand = t2;
			else if(t2 > mabstand)
				mabstand = t2;
		}
		for(i = 1; i < z; i++)
			x[i] = x[i - 1] + 2 * (VSize(Flag_Locations[i] - Flag_Locations[i - 1]) / kabstand);
	}
	else
		x[z - 1] = x[z - 2] + 2 * (VSize(Flag_Locations[z - 1] - Flag_Locations[z - 2]) / kabstand);
}

function drawpath()
{
	local int nn;
	local int jj;
	local float dd1, tempdist1;
	local vector vv3;
	flag_dist[0] = 0;
	t = 0;
	v = vect(0, 0, 0);
	v2 = vect(0, 0, 0);
	v = Flag_Locations[0];
	nn = z;
	t = 0;
	dist = 0;
	while(t < x[z - 1])
	{
		bisdrawing = true;
		for(jj = 0; jj < nn - 1; jj++)
		{
			if(t >= x[jj])
				if(t < x[jj + 1])
				{
					KubSplineWertX(t, jj);
					KubSplineWertY(t, jj);
					KubSplineWertZ(t, jj);
					vv3 = v2 - v;
					norm(dd1, vv3);
					tempdist1 = 0;
					if(carry != 0)
						tempdist1 = carry;
					while((tempdist1 < drawDetail) && (t < x[jj + 1]))
					{
						KubSplineWertX(t, jj);
						KubSplineWertY(t, jj);
						KubSplineWertZ(t, jj);
						vv3 = v2 - v;
						norm(dd1, vv3);
						t = t + 0.005;
						tempdist1 = tempdist1 + dd1;
						dist = dist + dd1;
						v = v2;
						flag_dist[j + 1] = dist;
					}
					if((tempdist1 >= drawDetail) && (t < x[jj + 1])) {
						v = v2;
						Spawn(class'rotknoten', , , v);
						flag_dist[j + 1] = dist;
						carry = 0;
					}
					else
						carry = tempdist1;
				}
			if(jj == nn - 2)
				if(t == x[jj + 1]) {
					KubSplineWertX(t, jj);
					KubSplineWertY(t, jj);
					KubSplineWertZ(t, jj);
					vv3 = v2 - v;
					norm(dd1, vv3);
					dist = dist + dd1;
					flag_dist[jj + 1] = dist;
					t = t + 0.005;
					v = v2;
					Spawn(class'rotknoten', , , v);
				}
		}
	}
	if(bisdrawing)
		bisdrawing = false;
}

//------------------------------ timespline functions --------------------------//////////
// function [ fe, next, ierr ] = chfev ( x1, x2, f1, f2, d1, d2, ne, xe )
function chfev(float x1, float x2, float f1, float f2, float dd1, float d2, int ne, float xe,
               out float fe, int next[2])
{
	local float h, xmi, xma, delta, del1, del2, c2, c3, lx;
	h = x2 - x1;
	next[0] = 0;
	next[1] = 0;
	if(h < 0.0)
		xmi = h;
	else
		xmi = 0.0;
	//xmi = min ( 0.0, h );
	if(h > 0.0)
		xma = h;
	else
		xma = 0.0;
	//xma = max ( 0.0, h );
	delta = (f2 - f1) / h;
	del1 = (dd1 - delta) / h;
	del2 = (d2 - delta) / h;
	c2 = -(del1 + del1 + del2);
	c3 = (del1 + del2) / h;
	lx = xe - x1;
	fe = f1 + lx * (dd1 + lx * (c2 + lx * c3));
	if(lx < xmi)
		next[0] = next[0] + 1;
	if(xma < lx)
		next[1] = next[1] + 1;
}
// function value = pchst ( arg1, arg2 )
function pchst(float arg1, float arg2, out float value)
{
	if(arg1 == 0.0)
		value = 0.0;
	else if(arg1 < 0.0)
	{
		if(arg2 < 0.0)
			value = 1.0;
		else if(arg2 == 0.0)
			value = 0.0;
		else if(0.0 < arg2)
			value = -1.0;
	}
	else if(0.0 < arg1)
	{
		if(arg2 < 0.0)
			value = -1.0;
		else if(arg2 == 0.0)
			value = 0.0;
		else if(0.0 < arg2)
			value = 1.0;
	}
}
// function d = spline_pchip_set ( n, x, f )
function spline_pchip_set(int nn, float xx[121], float f[121], out float d[121])
{
	local int nless1, i;
	local float h1, h2, hsum, hsumt3, dmax, dmin, drat1, drat2, w1, w2, del1, del2, /*dsave,*/ value1, value2, temp;
	nless1 = nn - 1;
	h1 = xx[1] - xx[0];
	del1 = (f[1] - f[0]) / h1;
	if(nn == 2)
	{
		d[0] = del1;
		d[nn - 1] = del1;
		return;
	}
	h2 = xx[2] - xx[1];
	del2 = (f[2] - f[1]) / h2;
	hsum = h1 + h2;
	w1 = (h1 + hsum) / hsum;
	w2 = -h1 / hsum;
	d[0] = w1 * del1 + w2 * del2;
	pchst(d[0], del1, value1);
	pchst(del1, del2, value2);
	if(value1 <= 0.0)
		d[0] = 0.0;
	else if(value2 < 0.0)
	{
		dmax = 3.0 * del1;
		if(abs(dmax) < abs(d[0]))
			d[0] = dmax;
	}
	for(i = 2; i <= nless1; i++)
	{
		if(2 < i)
		{
			h1 = h2;
			h2 = xx[i] - xx[i - 1];
			hsum = h1 + h2;
			del1 = del2;
			del2 = (f[i] - f[i - 1]) / h2;
		}
		d[i - 1] = 0.0;
		pchst(del1, del2, temp);
		if(temp < 0.0)
		{
			//dsave = del2;
		}
		else if(temp == 0.0)
			if(del2 != 0)
			{
				//dsave = del2;
			}
		if(temp > 0.0)
		{
			hsumt3 = 3.0 * hsum;
			w1 = (hsum + h1) / hsumt3;
			w2 = (hsum + h2) / hsumt3;
			dmax = fmax(abs(del1), abs(del2));
			dmin = fmin(abs(del1), abs(del2));
			drat1 = del1 / dmax;
			drat2 = del2 / dmax;
			d[i - 1] = dmin / (w1 * drat1 + w2 * drat2);
		}
	}
	w1 = -h2 / hsum;
	w2 = (h2 + hsum) / hsum;
	d[nn - 1] = w1 * del1 + w2 * del2;
	pchst(d[nn - 1], del2, value1);
	pchst(del1, del2, value2);
	if(value1 <= 0.0)
		d[nn - 1] = 0.0;
	else if(value2 < 0.0)
	{
		dmax = 3.0 * del2;
		if(abs(dmax) < abs(d[nn - 1]))
			d[nn - 1] = dmax;
	}
}

// function fe = spline_pchip_val ( n, x, f, d, ne, xe )
function spline_pchip_val(int nn, float xx[121], float f[121], float d[121], int ne, float xe, out float fe)
{
	local int j_first, j_save, ir, jj, i, j_new;
	local int next[2];
	local float nj;
	j_first = 1;
	ir = 2;
	next[0] = 0;
	next[1] = 0;
	while(true)
	{
		if(ne < j_first)
			break;
		j_save = ne + 1;
		// for j = j_first : ne
		for(jj = j_first; jj <= ne; jj++)
			if(xx[ir - 1] <= xe)
			{
				j_save = jj;
				if(ir == nn)
					j_save = ne + 1;
				break;
			}
		jj = j_save;
		nj = jj - j_first;
		if(nj != 0)
		{
			chfev(xx[ir - 2], x[ir - 1], f[ir - 2], f[ir - 1], d[ir - 2], d[ir - 1],  nj, xe, fe, next);
			if(next[0] != 0)
			{
				if(ir > 2)
				{
					j_new = -1;
					if(xe < xx[ir - 2])
					{
						j_new = 1;
						break;
					}
					jj = j_new;
					// for i = 1 : ir-1
					for(i = 1; i <= ir - 1; i++)
						if(xe < xx[i - 1])
							break;
					ir = 1;
				}
			}
			j_first = jj;
		}
		ir = ir + 1;
		if(nn < ir)
			break;
	}
}

function inittimespline()
{
	spline_pchip_set(z, Flag_Times, x, derivates);
}

defaultproperties
{
   bSpline_update_required=True
   bHidden=True
   bAlwaysTick=True
   Name="Default__CamControl"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
