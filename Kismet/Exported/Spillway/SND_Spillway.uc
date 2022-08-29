Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=389,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=411,OverrideDelta=36)
   InputLinks(2)=(DrawY=433,OverrideDelta=58)
   InputLinks(3)=(DrawY=455,OverrideDelta=80)
   OutputLinks(0)=(DrawY=422,OverrideDelta=47)
   VariableLinks(0)=(DrawX=717,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Spillway.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=352
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Spillway.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=469,OverrideDelta=14)
   OutputLinks(1)=(DrawY=490,OverrideDelta=35)
   OutputLinks(2)=(DrawY=511,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Spillway.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=400
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object
