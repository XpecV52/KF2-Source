Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4'),(LinkedOp=SeqAct_AkPostEvent'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3'),(LinkedOp=SeqAct_AkStartAmbientSound'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=221,OverrideDelta=14)
   OutputLinks(1)=(DrawY=242,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0',InputLinkIdx=1),(LinkedOp=SeqAct_AkStartAmbientSound'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=263,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=256
   ObjPosY=152
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=333,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=355,OverrideDelta=36)
   InputLinks(2)=(DrawY=377,OverrideDelta=58)
   InputLinks(3)=(DrawY=399,OverrideDelta=80)
   OutputLinks(0)=(DrawY=366,OverrideDelta=47)
   VariableLinks(0)=(DrawX=653,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=296
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_Zed_Landing.Set_ZL_Wind_Pre'
   InputLinks(0)=(DrawY=210,OverrideDelta=11)
   OutputLinks(0)=(DrawY=210,OverrideDelta=11)
   VariableLinks(0)=(DrawX=656,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=176
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_Zed_Landing.Set_ZL_Water'
   InputLinks(0)=(DrawY=130,OverrideDelta=11)
   OutputLinks(0)=(DrawY=130,OverrideDelta=11)
   VariableLinks(0)=(DrawX=648,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=96
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Stop_ZL_Thunder'
   InputLinks(0)=(DrawY=858,OverrideDelta=11)
   OutputLinks(0)=(DrawY=858,OverrideDelta=11)
   VariableLinks(0)=(DrawX=600,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=552
   ObjPosY=824
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(DrawY=781,OverrideDelta=14)
   OutputLinks(1)=(DrawY=802,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2'),(LinkedOp=SeqAct_AkPostEvent'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1'),(LinkedOp=SeqAct_AkPostEvent'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=823,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=712
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Set_ZL_Water'
   InputLinks(0)=(DrawY=650,OverrideDelta=11)
   OutputLinks(0)=(DrawY=650,OverrideDelta=11)
   VariableLinks(0)=(DrawX=624,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=616
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Set_ZL_Wind_Pre'
   InputLinks(0)=(DrawY=746,OverrideDelta=11)
   OutputLinks(0)=(DrawY=746,OverrideDelta=11)
   VariableLinks(0)=(DrawX=608,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=560
   ObjPosY=712
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object
