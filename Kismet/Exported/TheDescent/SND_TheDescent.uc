Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_TheDescent.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0'),(LinkedOp=SeqAct_AkPostEvent'SND_TheDescent.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0'),(LinkedOp=SeqAct_AkSetState'SND_TheDescent.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_0')),DrawY=541,OverrideDelta=14)
   OutputLinks(1)=(DrawY=562,OverrideDelta=35)
   OutputLinks(2)=(DrawY=583,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_TheDescent.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=480
   ObjPosY=472
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=533,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=555,OverrideDelta=36)
   InputLinks(2)=(DrawY=577,OverrideDelta=58)
   InputLinks(3)=(DrawY=599,OverrideDelta=80)
   OutputLinks(0)=(DrawY=566,OverrideDelta=47)
   VariableLinks(0)=(DrawX=821,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_TheDescent.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=744
   ObjPosY=496
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_Zed_Landing.Set_ZL_Lava'
   InputLinks(0)=(DrawY=722,ActivateDelay=1.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=722,OverrideDelta=11)
   VariableLinks(0)=(DrawX=800,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_TheDescent.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=688
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_0
   StateGroup="ENV_Prison"
   State="Outdoor"
   InputLinks(0)=(DrawY=818,ActivateDelay=1.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=818,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_TheDescent.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=784
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_0"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object
