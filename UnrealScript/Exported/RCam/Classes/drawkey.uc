//--------------------------------------------
//   RypeL Cam for Red Orchestra 2, C, 2012   
//--------------------------------------------
class drawkey extends actor;
var float speed;

function PostBeginPlay()
{
	local CamControl Cam;
	local rotknoten other2;
	local knoten other3;
	foreach AllActors(class'CamControl', Cam)
	{
		if(Cam.drawcount == 0)
			Cam.draw_Spline = false;
		if(Cam.drawcount == 1)
		{
			foreach AllActors(class'Knoten', other3)
			other3.setHidden(false);
			foreach AllActors(class'rotknoten', other2)
			other2.setHidden(true);
		}
		if(Cam.drawcount == 2)
		{
			Cam.draw_Spline = true;
		}
		Cam.drawcount++;
		if(Cam.drawcount == 3)
			Cam.drawcount = 0;
		break;
	}
	other2.destroy();
}

defaultproperties
{
   bHidden=True
   bAlwaysTick=True
   Name="Default__drawkey"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
