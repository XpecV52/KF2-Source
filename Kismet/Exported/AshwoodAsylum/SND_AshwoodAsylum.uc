Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=453,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=475,OverrideDelta=36)
   InputLinks(2)=(DrawY=497,OverrideDelta=58)
   InputLinks(3)=(DrawY=519,OverrideDelta=80)
   OutputLinks(0)=(DrawY=486,OverrideDelta=47)
   VariableLinks(0)=(DrawX=509,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_AshwoodAsylum.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=432
   ObjPosY=416
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_AshwoodAsylum.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=525,OverrideDelta=14)
   OutputLinks(1)=(DrawY=546,OverrideDelta=35)
   OutputLinks(2)=(DrawY=567,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_AshwoodAsylum.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=160
   ObjPosY=456
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object
