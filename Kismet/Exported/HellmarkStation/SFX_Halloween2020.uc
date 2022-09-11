Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=301,OverrideDelta=14)
   InputLinks(1)=(DrawY=323,OverrideDelta=36)
   InputLinks(2)=(DrawY=345,OverrideDelta=58)
   InputLinks(3)=(DrawY=367,OverrideDelta=80)
   OutputLinks(0)=(DrawY=334,OverrideDelta=47)
   VariableLinks(0)=(DrawX=1037,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX_Halloween2020.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=960
   ObjPosY=264
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SFX_Halloween2020.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),ActivateDelay=2.000000,DrawY=261,OverrideDelta=14)
   OutputLinks(1)=(DrawY=282,OverrideDelta=35)
   OutputLinks(2)=(DrawY=303,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SFX_Halloween2020.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=192
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object
