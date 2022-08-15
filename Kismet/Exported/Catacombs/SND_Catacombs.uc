Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_Catacombs.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=165,OverrideDelta=14)
   OutputLinks(1)=(DrawY=186,OverrideDelta=35)
   OutputLinks(2)=(DrawY=207,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Catacombs.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=288
   ObjPosY=96
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_Catacombs.WwiseDefaultBank_WW_ENV_Catacombs'
   InputLinks(0)=(DrawY=212,OverrideDelta=13)
   InputLinks(1)=(DrawY=232,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Catacombs.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=222,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Catacombs.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=176
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=277,OverrideDelta=14)
   InputLinks(1)=(DrawY=299,OverrideDelta=36)
   InputLinks(2)=(DrawY=321,OverrideDelta=58)
   InputLinks(3)=(DrawY=343,OverrideDelta=80)
   OutputLinks(0)=(DrawY=310,OverrideDelta=47)
   VariableLinks(0)=(DrawX=845,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Catacombs.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=768
   ObjPosY=240
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object
