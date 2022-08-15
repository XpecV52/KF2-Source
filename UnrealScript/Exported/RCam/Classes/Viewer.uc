//--------------------------------------------
//   RypeL Cam for Red Orchestra 2, C, 2012   
//--------------------------------------------
class Viewer extends actor;

var vector v;
var int viewing;
var int fov;

function PostBeginPlay()
{
	viewing = 0;
}

function changeView(int k, int n, bool inc, bool dec)
{
	local Knoten Other;
	local CamControl other2;
	local int z;
	if(viewing != k)
		viewing = k;
	else if(inc)
		viewing = viewing + 1;
	if(dec)
		viewing = viewing - 1;
	if(viewing > n)
		viewing = 0;
	if(viewing < 0)
		viewing = n;
	z = 0;
	foreach AllActors(class'Knoten', Other)
	{
		if(z == viewing)
		{
			if(viewing != 0)
				Other.setscale(3);
			setLocation(Other.Location);
			setRotation(Other.Rotation);
			fov = Other.fov;
		}
		else
			Other.setscale(1);
		z++;
	}
	foreach AllActors(class'CamControl', Other2)
	{
		Other2.viewing = viewing;
		other2.fov = fov;
	}
}

defaultproperties
{
   bHidden=True
   bAlwaysTick=True
   Name="Default__Viewer"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
