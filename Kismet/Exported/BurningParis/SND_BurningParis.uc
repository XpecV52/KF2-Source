Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_BurningParis.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=429,OverrideDelta=14)
   OutputLinks(1)=(DrawY=450,OverrideDelta=35)
   OutputLinks(2)=(DrawY=471,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_BurningParis.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=712
   ObjPosY=360
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_BurningParis.WwiseDefaultBank_WW_ENV_BurningParis'
   InputLinks(0)=(DrawY=428,OverrideDelta=13)
   InputLinks(1)=(DrawY=448,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_BurningParis.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=438,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BurningParis.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=392
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=477,OverrideDelta=14)
   InputLinks(1)=(DrawY=499,OverrideDelta=36)
   InputLinks(2)=(DrawY=521,OverrideDelta=58)
   InputLinks(3)=(DrawY=543,OverrideDelta=80)
   OutputLinks(0)=(DrawY=510,OverrideDelta=47)
   VariableLinks(0)=(DrawX=1197,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BurningParis.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=440
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object
