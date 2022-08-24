Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=277,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=299,OverrideDelta=36)
   InputLinks(2)=(DrawY=321,OverrideDelta=58)
   InputLinks(3)=(DrawY=343,OverrideDelta=80)
   OutputLinks(0)=(DrawY=310,OverrideDelta=47)
   VariableLinks(0)=(DrawX=685,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_KrampusLair.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=240
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_KrampusLair.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=429,OverrideDelta=14)
   OutputLinks(1)=(DrawY=450,OverrideDelta=35)
   OutputLinks(2)=(DrawY=471,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_KrampusLair.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=360
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object
