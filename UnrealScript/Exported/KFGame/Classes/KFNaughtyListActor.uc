class KFNaughtyListActor extends Actor
	placeable;

var KFGFxMoviePlayer_NaughtyList MyMoviePlayer;
var class<KFGFxMoviePlayer_NaughtyList> MyNaughtyListClass;
var KFGameReplicationInfo KFGRI;
var float UpdateInterval;


simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	Init();
}

simulated function Init()
{
	if (Role == ROLE_Authority && WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}
	MyMoviePlayer = new() MyNaughtyListClass;
	MyMoviePlayer.SetTimingMode(TM_Real);
	if( MyMoviePlayer.MovieInfo != None )
	{
		if( MyMoviePlayer.bAutoPlay )
		{
			MyMoviePlayer.Start();
			MyMoviePlayer.Advance(0.f);
		}
	}
	KFGRI = KFGameReplicationInfo(WorldInfo.GRI);
	MyMoviePlayer.KFGRI = KFGRI;
	SetTimer(UpdateInterval, true, nameof(Update));
	Update();
}

simulated function Update()
{
	if (Role == ROLE_Authority && WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}
	MyMoviePlayer.Refresh();
}

defaultproperties
{
   MyNaughtyListClass=Class'KFGame.KFGFxMoviePlayer_NaughtyList'
   UpdateInterval=5.000000
   Begin Object Class=SpriteComponent Name=Sprite
      Sprite=Texture2D'EditorResources.S_Trigger'
      SpriteCategoryName="Triggers"
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpriteComponent'
   End Object
   Components(0)=Sprite
   RemoteRole=ROLE_SimulatedProxy
   bGameRelevant=True
   Name="Default__KFNaughtyListActor"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
