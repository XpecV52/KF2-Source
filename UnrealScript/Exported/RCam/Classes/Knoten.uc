//--------------------------------------------
//   RypeL Cam for Red Orchestra 2, C, 2012
//--------------------------------------------
class Knoten extends actor;

var float dct, fov, time;
var int i, z;
var bool hasSpawnedcc, b, b2, zeichner;
var vector v;
var rotator rotat;
var CamControl cc;
var Knoten knoten2, other;

function PostBeginPlay()
{
	local CamControl Other2;
	local KFDemorecspectator Other3;
	hasSpawnedcc = false;
	z = 0;
	zeichner = false;
	rotat = rot(0, 0, 0);
	setRotation(rotat);
	b = false;
	b2 = false;
	fov = 100;
	time = worldinfo.Timeseconds;
	foreach AllActors(class'CamControl', Other2)
	{
		b = Other2.I_want_to_insert_a_Flag;
		b2 = other2.is_spawning;
		cc = Other2;
	}
	foreach AllActors(class'Knoten', Other)
	{
		z++;
	}
	if(!b2)
	{
		if(cc != none && cc.justspawn)
			return;
		knoten2 = self;
		i = 0;
		foreach AllActors(class'Knoten', Other)
		{
			i++;
			if(i == z - 1)
				knoten2 = Other;
		}
		foreach AllActors(class'KFDemorecspectator', Other3)
		{
			rotat.yaw = Other3.viewtarget.rotation.yaw;
			rotat.pitch = Other3.viewtarget.rotation.pitch;
			if(abs(rotat.yaw - knoten2.rotation.yaw) > 32768)
			{
				while(abs(rotat.yaw - knoten2.rotation.yaw) > 32768)
				{
					if(rotat.yaw > knoten2.rotation.yaw)
						rotat.yaw = rotat.yaw - 65536;
					else
						rotat.yaw = rotat.yaw + 65536;
				}
			}
			else
				rotat.yaw = Other3.viewtarget.Rotation.yaw;
			if(abs(rotat.pitch - knoten2.rotation.pitch) > 32768)
			{
				while(abs(rotat.pitch - knoten2.rotation.pitch) > 32768)
					if(rotat.pitch > knoten2.rotation.pitch)
						rotat.pitch = rotat.pitch - 65536;
					else
						rotat.pitch = rotat.pitch + 65536;
			}
			else
				rotat.pitch = Other3.viewtarget.Rotation.pitch;
			setlocation(Other3.viewtarget.Location);
			setRotation(rotat);
			break;
		}
	}
	if(!b)
	{
		if(z == 4)
			zeichner = true;
	}
	if(b)
		cc.FlagEinfuegen();
}

function setscale(float newscale)
{
}

function updateSpline()
{
	local CamControl OtherCC;
	foreach AllActors(class'CamControl', OtherCC)
	{
		hasSpawnedcc = true;
		cc = OtherCC;
	}
	if(!hasSpawnedcc)
	{
		cc = Spawn(class'CamControl');
		hasSpawnedcc = true;
	}
	cc.updateSplinef(true);
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_RadForce'
      ReplacementPrimitive=None
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   bAlwaysTick=True
   Name="Default__Knoten"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
