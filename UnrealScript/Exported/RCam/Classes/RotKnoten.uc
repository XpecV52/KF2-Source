//--------------------------------------------
//   RypeL Cam for Red Orchestra 2, C, 2012   
//--------------------------------------------

// RotKnoten is used to draw the inpoints of the Camerapath
class RotKnoten extends Actor;

var float dct;
var float a[100];
var float b[100];
var float c[100];
var int i;
var int n;
var vector v;

function PostBeginPlay()
{
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_WhiteCircle'
      ReplacementPrimitive=None
      Scale=0.400000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   Name="Default__RotKnoten"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
