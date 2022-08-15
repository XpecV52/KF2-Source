Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_Farmhouse.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=413,OverrideDelta=14)
   OutputLinks(1)=(DrawY=434,OverrideDelta=35)
   OutputLinks(2)=(DrawY=455,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Farmhouse.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=344
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'ww_ENV_Farmhouse.WwiseDefaultBank_ww_ENV_Farmhouse'
   InputLinks(0)=(DrawY=476,OverrideDelta=13)
   InputLinks(1)=(DrawY=496,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Farmhouse.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=486,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Farmhouse.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=440
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=493,OverrideDelta=14)
   InputLinks(1)=(DrawY=515,OverrideDelta=36)
   InputLinks(2)=(DrawY=537,OverrideDelta=58)
   InputLinks(3)=(DrawY=559,OverrideDelta=80)
   OutputLinks(0)=(DrawY=526,OverrideDelta=47)
   VariableLinks(0)=(DrawX=1341,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Farmhouse.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1264
   ObjPosY=456
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object
