Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_Prison.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_1')),DrawY=213,OverrideDelta=14)
   OutputLinks(1)=(DrawY=234,OverrideDelta=35)
   OutputLinks(2)=(DrawY=255,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Prison.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=440
   ObjPosY=144
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=237,OverrideDelta=14)
   InputLinks(1)=(DrawY=259,OverrideDelta=36)
   InputLinks(2)=(DrawY=281,OverrideDelta=58)
   InputLinks(3)=(DrawY=303,OverrideDelta=80)
   OutputLinks(0)=(DrawY=270,OverrideDelta=47)
   VariableLinks(0)=(DrawX=837,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Prison.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=200
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_1
   Bank=AkBank'WW_ENV_Prison.WwiseDefaultBank_WW_ENV_Prison'
   InputLinks(0)=(DrawY=132,OverrideDelta=13)
   InputLinks(1)=(DrawY=152,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Prison.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=142,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Prison.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=96
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_1"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object
