Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=277,OverrideDelta=14)
   InputLinks(1)=(DrawY=299,OverrideDelta=36)
   InputLinks(2)=(DrawY=321,OverrideDelta=58)
   InputLinks(3)=(DrawY=343,OverrideDelta=80)
   OutputLinks(0)=(DrawY=310,OverrideDelta=47)
   VariableLinks(0)=(DrawX=765,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=688
   ObjPosY=240
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND-BlackForest.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),ActivateDelay=2.000000,DrawY=293,OverrideDelta=14)
   OutputLinks(1)=(DrawY=314,OverrideDelta=35)
   OutputLinks(2)=(DrawY=335,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND-BlackForest.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=296
   ObjPosY=224
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object
