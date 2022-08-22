Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=814
   SizeY=1237
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_InfernalRealm.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=-344
   ObjComment="Sounds Banks"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_2
   InputLinks(0)=(DrawY=157,OverrideDelta=14)
   InputLinks(1)=(DrawY=179,OverrideDelta=36)
   InputLinks(2)=(DrawY=201,OverrideDelta=58)
   InputLinks(3)=(DrawY=223,OverrideDelta=80)
   OutputLinks(0)=(DrawY=190,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-347,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_InfernalRealm.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-424
   ObjPosY=120
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_2"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_InfernalRealm.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_2')),DrawY=165,OverrideDelta=14)
   OutputLinks(1)=(DrawY=186,OverrideDelta=35)
   OutputLinks(2)=(DrawY=207,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_InfernalRealm.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=96
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_2
   Bank=AkBank'WW_ENV_BurningParis.WwiseDefaultBank_WW_ENV_BurningParis'
   InputLinks(0)=(DrawY=172,OverrideDelta=13)
   InputLinks(1)=(DrawY=192,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_InfernalRealm.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_2')),ActivateDelay=3.000000,DrawY=182,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_InfernalRealm.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-624
   ObjPosY=136
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_2"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object
