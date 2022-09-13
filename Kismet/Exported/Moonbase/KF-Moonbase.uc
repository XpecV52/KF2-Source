Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_16
   SizeX=688
   SizeY=440
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4952
   ObjPosY=-8128
   ObjComment="WRF_PlayerSpawns"
   Name="SequenceFrameWrapped_16"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-9422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-1136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1184
   ObjPosY=-9456
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=-9224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Electric On1"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=-9398,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1478,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=-9464
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Electric1Off1"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-9214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1475,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=-9280
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=656
   SizeY=453
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1632
   ObjPosY=-9528
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_0
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_2'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=-9411,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9389,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-9367,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-9345,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3775,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3696,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3904
   ObjPosY=-9480
   ObjName="KFTrigger_MinigameButton_2 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_0"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_61
   InputLinks(0)=(DrawY=-8963,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8942,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8921,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8942,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=-2474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-9000
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_61"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=-9088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Electric On1"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_61'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_2'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_0'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30',InputLinkIdx=1)),DrawY=-9166,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2734,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-9232
   ObjComment="Electric On1"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="Electric On1"
   InputLinks(0)=(DrawY=-9158,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9158,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3159,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-9192
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="Electric1Off1"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_61',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_1'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7')),DrawY=-8934,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2739,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=-9000
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_0
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-9142,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9142,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),DrawX=-2446,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-9176
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_0"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="Electric1Off1"
   InputLinks(0)=(DrawY=-9278,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2061,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2192
   ObjPosY=-9312
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_1
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-8750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=-2462,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-8784
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_1"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-8696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=17.000000
   InputLinks(0)=(DrawY=-9283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9241,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=-9278,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9246,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2400
   ObjPosY=-9320
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_60
   SizeX=3114
   SizeY=1211
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3992
   ObjPosY=-9736
   ObjComment="Shock Trap"
   DrawWidth=3114
   DrawHeight=1211
   Name="SequenceFrame_60"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-9374,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9374,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=-3192,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=-9408
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3224
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2464
   ObjPosY=-8864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2376
   ObjPosY=-8864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2288
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_1
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_3'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=-8883,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8861,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-8839,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-8817,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3799,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3720,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3928
   ObjPosY=-8952
   ObjName="KFTrigger_MinigameButton_3 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_1"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-8654,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8654,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),DrawX=-3256,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-8688
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_2
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-9470,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=-9470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83'),DrawX=-2494,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-9504
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_2"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_3
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-9470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85'),DrawX=-2086,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-9504
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_3"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2064
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=15.000000
   InputLinks(0)=(DrawY=-9475,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9454,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9433,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_3')),DrawY=-9470,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9438,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2336
   ObjPosY=-9512
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=3235
   SizeY=9003
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9536
   ObjPosY=-8256
   ObjComment="Portal spawns"
   DrawWidth=3235
   DrawHeight=9003
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_73')),DrawY=-8011,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7990,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7969,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7825,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7911
   ObjPosY=-8080
   ObjName="TriggerVolume_16 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
   InputLinks(0)=(DrawY=-8011,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7990,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7969,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7990,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_484'),DrawX=-7537,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7486,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7437,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7575
   ObjPosY=-8048
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_73"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_484
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-7880
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_484"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7944
   ObjPosY=-8112
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-7995,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7974,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7953,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7050,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-8064
   ObjName="TriggerVolume_12 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-7995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-6770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-8032
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6800
   ObjPosY=-7872
   ObjComment="PARENT - wall high spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7160
   ObjPosY=-8096
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=-8019,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7998,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7977,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8626,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-8088
   ObjName="TriggerVolume_18 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=-8120
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_0
   MaxTriggerCount=0
   MaxWidth=216
   OutputLinks(0)=(DrawY=-9338,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9315,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9292,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9269,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9246,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9223,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9200,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-9177,OverrideDelta=176)
   OutputLinks(8)=(DrawY=-9154,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5864
   ObjPosY=-9408
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_0"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(DrawY=-7715,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7694,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43')),DrawY=-7673,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5656
   ObjPosY=-7784
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_1
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43',InputLinkIdx=1),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-7494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5296,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5226,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5344
   ObjPosY=-7560
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_1"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
   InputLinks(0)=(DrawY=-7683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7641,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7662,OverrideDelta=35)
   VariableLinks(0)=(DrawX=-5346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5295,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_1'),DrawX=-5246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5384
   ObjPosY=-7720
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=-7502,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47')),DrawY=-7502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4996,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5120
   ObjPosY=-7536
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
   InputLinks(0)=(DrawY=-7531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7489,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_397',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_398',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_399',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_400',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_401',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_402'),DrawX=-4746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4784
   ObjPosY=-7568
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_47"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=-9110,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),ActivateDelay=1.000000,DrawY=-9110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5452,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5576
   ObjPosY=-9144
   ObjComment="SpawnsOFF"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_73
   EventName="SpawnsOff"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_91',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_89',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1)),DrawY=-8830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5218,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5312
   ObjPosY=-8896
   ObjComment="SpawnsOFF"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_73"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=4
   IncrementAmount=0
   bLooping=True
   Indices(0)=8
   InputLinks(0)=(DrawY=-9208,OverrideDelta=25)
   InputLinks(1)=(DrawY=-9164,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_91')),DrawY=-9219,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84')),LinkDesc="Link 2",DrawY=-9197,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_89')),LinkDesc="Link 3",DrawY=-9175,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),LinkDesc="Link 4",DrawY=-9153,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5196,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-9256
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_91
   InputLinks(0)=(DrawY=-9459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9417,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9438,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-4762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-9496
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_91"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
   InputLinks(0)=(DrawY=-8971,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8950,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8929,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8950,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-4794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-9008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_84"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-8035,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8014,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7993,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8014,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-4762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-8072
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_89
   InputLinks(0)=(DrawY=-8507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_180'),DrawX=-4834,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4783,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4734,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-8544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_89"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_69
   SizeX=1731
   SizeY=2495
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5904
   ObjPosY=-9624
   ObjComment="Random Start Locations"
   DrawWidth=1731
   DrawHeight=2495
   Name="SequenceFrame_69"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4896
   ObjPosY=-9240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-9240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=-9240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=-9240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-9240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4392
   ObjPosY=-9240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4888
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4688
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4392
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4896
   ObjPosY=-8320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-8320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=-8320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4600
   ObjPosY=-8320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-8320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4896
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4392
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_397
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_397"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_398
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_398"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_399
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_399"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_400
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4672
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_400"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_401
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4576
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_401"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_402
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4472
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_402"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=KFPlayerStart'KF-MOONBASE.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-8320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-7744
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=-7643,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7622,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7601,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8598,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-7712
   ObjName="TriggerVolume_4 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-7360
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_28
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_27'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),DrawY=-7259,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7238,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7217,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8594,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-7328
   ObjName="TriggerVolume_27 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_28"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-7768
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-7544
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-7667,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7646,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7625,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7646,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-9058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-7704
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-7667,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7646,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7625,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9334,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-7736
   ObjName="TriggerVolume_7 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-7392
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-7168
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-7291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7249,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7270,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-9058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-7328
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-7291,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7270,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7249,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9334,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-7360
   ObjName="TriggerVolume_8 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-7032
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-6808
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-6931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6889,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6910,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-9058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-6968
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-6931,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6910,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6889,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9334,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-7000
   ObjName="TriggerVolume_9 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-6555,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6534,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6513,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9342,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-6624
   ObjName="TriggerVolume_1 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-6555,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6534,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6513,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6534,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-9066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-6592
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-6432
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-6656
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9472
   ObjPosY=-6248
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-6024
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-6147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-9090,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9039,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8990,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-6184
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-6147,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6126,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6105,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9362,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-6216
   ObjName="TriggerVolume_13 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_35
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-7712
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_35"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-7488
   ObjComment="PARENT - wall high spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=-7611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7569,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47'),DrawX=-6754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=-7648
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_33
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=-7611,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7590,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7569,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7034,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7120
   ObjPosY=-7680
   ObjName="TriggerVolume_11 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_33"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_37'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_80')),DrawY=-5779,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5758,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5737,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9378,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-5848
   ObjName="TriggerVolume_37 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
   InputLinks(0)=(DrawY=-5779,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5758,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5737,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5758,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_491'),DrawX=-9106,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9055,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9006,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-5816
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_80"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_491
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-5656
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_491"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-5880
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7944
   ObjPosY=-7688
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_485
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-7456
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_485"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_74
   InputLinks(0)=(DrawY=-7587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_485'),DrawX=-7530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7568
   ObjPosY=-7624
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_74"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_74')),DrawY=-7587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7566,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7545,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7818,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=-7656
   ObjName="TriggerVolume_15 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_75')),DrawY=-7186,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7165,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7144,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7830,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-7255
   ObjName="TriggerVolume_0 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
   InputLinks(0)=(DrawY=-7186,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7165,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7144,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7165,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_486'),DrawX=-7538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-7223
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_75"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_486
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-7055
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_486"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7952
   ObjPosY=-7280
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-6880
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_487
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-6656
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_487"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-6787,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6745,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_487'),DrawX=-7546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-6824
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_35'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-6787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6745,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=-6856
   ObjName="TriggerVolume_35 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_19"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_77')),DrawY=-6371,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6350,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6329,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=-6440
   ObjName="TriggerVolume_19 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_20"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_77
   InputLinks(0)=(DrawY=-6371,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6350,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6329,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6350,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_488'),DrawX=-7546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-6408
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_77"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_488
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-6240
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_488"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-6464
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_25
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7952
   ObjPosY=-6072
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_25"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_489
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-5848
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_489"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_78
   InputLinks(0)=(DrawY=-5979,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5958,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5937,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5958,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_489'),DrawX=-7538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-6016
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_78"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_21
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_78')),DrawY=-5979,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5958,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5937,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7826,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-6048
   ObjName="TriggerVolume_20 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_21"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_17'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_79')),DrawY=-5595,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5574,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5553,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7826,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-5664
   ObjName="TriggerVolume_17 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_79
   InputLinks(0)=(DrawY=-5595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5553,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5574,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_490'),DrawX=-7538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-5632
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_79"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_490
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-5464
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_490"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7952
   ObjPosY=-5688
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=553
   SizeY=316
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9480
   ObjPosY=-5432
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=553
   DrawHeight=316
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-5208
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_70
   InputLinks(0)=(DrawY=-5331,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5310,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5289,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5310,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-9098,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9047,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8998,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-5368
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_70"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_70')),DrawY=-5331,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5310,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5289,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9370,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-5400
   ObjName="TriggerVolume_10 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-5240
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-5016
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-5147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-7554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-5184
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_21'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),DrawY=-5147,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5126,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5105,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7842,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-5216
   ObjName="TriggerVolume_21 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_17"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_22
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),DrawY=-4731,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4710,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4689,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7842,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-4800
   ObjName="TriggerVolume_22 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_22"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-4731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4689,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=-7554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-4768
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-4600
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-4824
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-4416
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-4192
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-4323,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4302,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4281,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4302,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=-7554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-4360
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_24
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_25'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=-4323,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4302,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4281,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7842,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-4392
   ObjName="TriggerVolume_25 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_24"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_25
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_24'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=-3923,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3902,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3881,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7850,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7936
   ObjPosY=-3992
   ObjName="TriggerVolume_24 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_25"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-3923,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3902,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3881,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3902,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-7562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-3960
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7608
   ObjPosY=-3792
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7976
   ObjPosY=-4016
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_28
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-3616
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_28"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-3392
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-3523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=-7554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-3560
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_26
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),DrawY=-3523,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3502,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3481,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7842,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-3592
   ObjName="TriggerVolume_14 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_26"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_27
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_26'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29')),DrawY=-3139,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3118,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3097,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7834,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=-3208
   ObjName="TriggerVolume_26 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_27"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=-3139,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3118,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3097,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3118,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-7546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-3176
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-3008
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_29
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-3232
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_29"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_37
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7952
   ObjPosY=-2856
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-2632
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=-2763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2742,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=-7538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-2800
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_35
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_23'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=-2763,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7826,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-2832
   ObjName="TriggerVolume_23 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_35"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_29
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_29'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),DrawY=-6867,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6846,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6825,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8602,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=-6936
   ObjName="TriggerVolume_29 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_29"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_31
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-6968
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_31"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_32
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-6544
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_32"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_30
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_30'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=-6443,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6422,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6401,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8602,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=-6512
   ObjName="TriggerVolume_30 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_30"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_31
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_32'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23')),DrawY=-6059,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6038,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6017,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8602,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=-6128
   ObjName="TriggerVolume_32 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_31"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_33
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-6160
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_33"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_34
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-5791
   ObjComment="Portal spawn: Floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_34"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_32
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_31'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-5690,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5669,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5648,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8610,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-5759
   ObjName="TriggerVolume_31 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_32"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_37
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_28'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=-5323,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5302,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5281,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8610,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-5392
   ObjName="TriggerVolume_28 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_37"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_39
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-5424
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_39"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_34
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_34'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36')),DrawY=-7251,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7230,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7209,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7026,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7112
   ObjPosY=-7320
   ObjName="TriggerVolume_34 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_34"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=-7251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7209,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-6746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-7288
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-7128
   ObjComment="PARENT - wall high spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_36
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-7352
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_36"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=578
   SizeY=309
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7128
   ObjPosY=-7000
   ObjComment="Portal spawn: wall high"
   DrawWidth=578
   DrawHeight=309
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-6776
   ObjComment="PARENT - wall high spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-6899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6857,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6878,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-6738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-6936
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-6899,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6878,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6857,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7022,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-6968
   ObjName="TriggerVolume_3 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_39
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_39'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41')),DrawY=-2339,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2318,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2297,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7818,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=-2408
   ObjName="TriggerVolume_39 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_39"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
   InputLinks(0)=(DrawY=-2339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2297,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2318,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),DrawX=-7530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7568
   ObjPosY=-2376
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_41"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-2208
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_41
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7944
   ObjPosY=-2432
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_41"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=-4539,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4518,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4497,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9358,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-4608
   ObjName="TriggerVolume_6 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-4531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4489,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=-9074,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9023,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8974,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=-4568
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=-4408
   ObjComment="PARENT - ceiling spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9472
   ObjPosY=-4640
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_42
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7936
   ObjPosY=-2024
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_42"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7568
   ObjPosY=-1800
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_42
   InputLinks(0)=(DrawY=-1931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1889,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1910,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-7522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-1968
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_42"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_40
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_40'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_42')),DrawY=-1931,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1910,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1889,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7810,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7896
   ObjPosY=-2000
   ObjName="TriggerVolume_40 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_40"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_45
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_46'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49')),DrawY=-1555,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1534,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1513,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7826,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-1624
   ObjName="TriggerVolume_46 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_45"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
   InputLinks(0)=(DrawY=-1555,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1534,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1513,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1534,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=-7538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-1592
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_49"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-1424
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_47
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7952
   ObjPosY=-1648
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_47"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_42
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_42'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45')),DrawY=-3795,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3774,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3753,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9370,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-3864
   ObjName="TriggerVolume_42 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_42"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
   InputLinks(0)=(DrawY=-3795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-9082,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9031,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8982,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-3832
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_45"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-3664
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_44
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9496
   ObjPosY=-3888
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_44"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_43
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_44'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46')),DrawY=-3419,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3398,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3377,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9362,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-3488
   ObjName="TriggerVolume_44 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_43"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
   InputLinks(0)=(DrawY=-3419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3377,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3398,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-9074,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9023,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8974,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=-3456
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_46"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-3288
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_45
   SizeX=619
   SizeY=339
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-3512
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=619
   DrawHeight=339
   Name="SequenceFrame_45"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_46
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9480
   ObjPosY=-3120
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_46"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=-2896
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
   InputLinks(0)=(DrawY=-3027,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3006,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2985,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3006,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),DrawX=-9066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-3064
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_48"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_44
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_45'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_48')),DrawY=-3027,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3006,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2985,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9354,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-3096
   ObjName="TriggerVolume_45 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_44"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_43'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-2643,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2622,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2601,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-2712
   ObjName="TriggerVolume_43 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-2643,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2622,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2601,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2622,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=-9050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-2680
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-2512
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_48
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-2736
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_48"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_53
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7944
   ObjPosY=-1272
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_53"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-1048
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_54
   InputLinks(0)=(DrawY=-1179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1137,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1158,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),DrawX=-7530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7568
   ObjPosY=-1216
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_54"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_50
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_52'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_54')),DrawY=-1179,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1158,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1137,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7818,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=-1248
   ObjName="TriggerVolume_52 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_50"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_49
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-2360
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_49"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-2136
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-2267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2225,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61'),DrawX=-9050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-2304
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_46
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_33'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-2267,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2246,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2225,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-2336
   ObjName="TriggerVolume_33 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_46"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_47
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_47'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51')),DrawY=-1883,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1862,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1841,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9322,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-1952
   ObjName="TriggerVolume_47 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_47"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_51
   InputLinks(0)=(DrawY=-1883,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1862,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1841,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1862,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=-9034,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8983,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8934,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9072
   ObjPosY=-1920
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_51"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-1752
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_50
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-1976
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_50"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_51
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-1600
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_51"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-1376
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_52
   InputLinks(0)=(DrawY=-1507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=-9034,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8983,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8934,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9072
   ObjPosY=-1544
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_52"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_48
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_49'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_52')),DrawY=-1507,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1486,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1465,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9322,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-1576
   ObjName="TriggerVolume_49 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_48"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_49
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_51'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_53')),DrawY=-1123,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1102,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1081,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9330,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-1192
   ObjName="TriggerVolume_51 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_49"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_53
   InputLinks(0)=(DrawY=-1123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1081,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1102,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64'),DrawX=-9042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-1160
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_53"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-992
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_52
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-1216
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_52"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_56
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-824
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_56"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-600
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_57
   InputLinks(0)=(DrawY=-731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-689,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=-9050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-768
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_57"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_53
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_36'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57')),DrawY=-731,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-710,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-689,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-800
   ObjName="TriggerVolume_36 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_53"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_51
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_54'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_55')),DrawY=-787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-745,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7802,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7888
   ObjPosY=-856
   ObjName="TriggerVolume_54 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_51"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
   InputLinks(0)=(DrawY=-787,OverrideDelta=14)
   InputLinks(1)=(DrawY=-766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-745,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),DrawX=-7514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7552
   ObjPosY=-824
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_55"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-656
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_54
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-880
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_54"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_54
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_48'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_58')),DrawY=13,OverrideDelta=14)
   OutputLinks(1)=(DrawY=34,OverrideDelta=35)
   OutputLinks(2)=(DrawY=55,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7794,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7880
   ObjPosY=-56
   ObjName="TriggerVolume_48 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_54"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_58
   InputLinks(0)=(DrawY=13,OverrideDelta=14)
   InputLinks(1)=(DrawY=34,OverrideDelta=35)
   InputLinks(2)=(DrawY=55,OverrideDelta=56)
   OutputLinks(0)=(DrawY=34,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=-7506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7544
   ObjPosY=-24
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_58"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7552
   ObjPosY=136
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_57
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=-80
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_57"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_55
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_56'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_59')),DrawY=-323,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-302,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-281,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9338,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-392
   ObjName="TriggerVolume_56 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_55"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_59
   InputLinks(0)=(DrawY=-323,OverrideDelta=14)
   InputLinks(1)=(DrawY=-302,OverrideDelta=35)
   InputLinks(2)=(DrawY=-281,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-302,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=-9050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-360
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_59"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-192
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_58
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-416
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_58"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_38
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=296
   ObjComment="Portal spawn: floor"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_38"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7544
   ObjPosY=512
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(DrawY=410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=-7498,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7447,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7398,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=352
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_36
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_53'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38')),DrawY=389,OverrideDelta=14)
   OutputLinks(1)=(DrawY=410,OverrideDelta=35)
   OutputLinks(2)=(DrawY=431,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7786,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7872
   ObjPosY=320
   ObjName="TriggerVolume_53 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_36"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_23
   Originator=TriggerVolume'KF-MOONBASE.TheWorld:PersistentLevel.TriggerVolume_50'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=482,OverrideDelta=35)
   OutputLinks(2)=(DrawY=503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9330,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=392
   ObjName="TriggerVolume_50 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_23"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=453,OverrideDelta=14)
   InputLinks(1)=(DrawY=474,OverrideDelta=35)
   InputLinks(2)=(DrawY=495,OverrideDelta=56)
   OutputLinks(0)=(DrawY=474,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9042,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8991,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8942,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=416
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=584
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=609
   SizeY=337
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=368
   ObjComment="Portal spawn: wall (248 UU)"
   DrawWidth=609
   DrawHeight=337
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=15.000000
   InputLinks(0)=(DrawY=-7763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7721,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_4')),DrawY=-7758,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7726,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2276,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2328
   ObjPosY=-7800
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2056
   ObjPosY=-7696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=-7696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_4
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-7758,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7758,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=-2078,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2136
   ObjPosY=-7792
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_4"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2464
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_5
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-7758,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=-7758,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-2486,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-7792
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_5"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-6942,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6942,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105'),DrawX=-3240,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-6976
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_2
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_4'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),DrawY=-7171,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7149,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-7127,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-7105,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3783,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3704,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=-7240
   ObjName="KFTrigger_MinigameButton_4 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_2"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2280
   ObjPosY=-7176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2368
   ObjPosY=-7152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-7152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3216
   ObjPosY=-7616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-7662,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7662,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98'),DrawX=-3184,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3232
   ObjPosY=-7696
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_61
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-8024
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_61"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=17.000000
   InputLinks(0)=(DrawY=-7571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7529,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),DrawY=-7566,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7534,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2340,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=-7608
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-6984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_6
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-7038,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7038,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),DrawX=-2454,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-7072
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_6"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="Electric1Off2"
   InputLinks(0)=(DrawY=-7566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2053,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2184
   ObjPosY=-7600
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_7
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-7430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7430,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=-2438,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=-7464
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_7"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Electric1Off2"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_62',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_6'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_35')),DrawY=-7222,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2731,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-7288
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="Electric On2"
   InputLinks(0)=(DrawY=-7446,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7446,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3151,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-7480
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="Electric On2"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_62'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_5'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_7'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_94'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_10',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_95',InputLinkIdx=1)),DrawY=-7454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2726,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2824
   ObjPosY=-7520
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2464
   ObjPosY=-7376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_62
   InputLinks(0)=(DrawY=-7251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7209,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-2466,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2415,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2366,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-7288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_62"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_3
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_5'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),DrawY=-7699,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7677,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-7655,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-7633,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3759,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3680,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-7768
   ObjName="KFTrigger_MinigameButton_5 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_3"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="Electric1Off2"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=-7502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1467,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1568
   ObjPosY=-7568
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_7
   EventName="Electric On2"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-7686,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1470,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1568
   ObjPosY=-7752
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_7"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1160
   ObjPosY=-7512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-7710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7710,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),DrawX=-1128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=-7744
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-7534,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7534,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),DrawX=-1256,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1304
   ObjPosY=-7568
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-6880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-8592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-5480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-6134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6134,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),DrawX=-1264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=-6168
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-6310,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6310,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),DrawX=-1136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1184
   ObjPosY=-6344
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=-6112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_8
   EventName="Electric On"
   MaxWidth=189
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-6286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1482,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=-6352
   ObjComment="Electric On"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_8"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="Electric1Off"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-6102,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1479,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=-6168
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_4
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_15'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-6299,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6277,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-6255,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-6233,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3763,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3684,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-6368
   ObjName="KFTrigger_MinigameButton_15 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_4"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
   InputLinks(0)=(DrawY=-5851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=-2474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-5888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_63"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=-5976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="Electric On"
   MaxWidth=189
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_63'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_10'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_8'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_92'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_93',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_9',InputLinkIdx=1)),DrawY=-6054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2738,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-6120
   ObjComment="Electric On"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="Electric On"
   InputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3163,OverrideDelta=93)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-6080
   ObjComment="Electric On"
   DrawWidth=250
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_11
   EventName="Electric1Off"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_63',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_9'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_34')),DrawY=-5822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2743,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=-5888
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_11"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_8
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-6030,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=-2446,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-6064
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_8"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_8
   EventName="Electric1Off"
   InputLinks(0)=(DrawY=-6166,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6166,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2065,OverrideDelta=95)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2192
   ObjPosY=-6200
   DrawWidth=255
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_8"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_9
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-5638,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5638,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),DrawX=-2462,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-5672
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_9"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=17.000000
   InputLinks(0)=(DrawY=-6171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6129,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_8')),DrawY=-6166,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6134,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2400
   ObjPosY=-6208
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_62
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3992
   ObjPosY=-6624
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_62"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-6262,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112'),DrawX=-3192,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=-6296
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3224
   ObjPosY=-6216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-5768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2464
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2376
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2288
   ObjPosY=-5776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_5
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_14'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-5771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5749,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-5727,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-5705,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3787,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3708,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3920
   ObjPosY=-5840
   ObjName="KFTrigger_MinigameButton_14 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_5"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-5542,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5542,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106'),DrawX=-3248,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-5576
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_10
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-6358,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),DrawY=-6358,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),DrawX=-2494,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-6392
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_10"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=-6304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=-6304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_11
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-6358,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6358,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=-2086,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-6392
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_11"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-6296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2064
   ObjPosY=-6296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   Duration=15.000000
   InputLinks(0)=(DrawY=-6363,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6342,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6321,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_11')),DrawY=-6358,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6326,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2336
   ObjPosY=-6400
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_6
   Duration=15.000000
   InputLinks(0)=(DrawY=-5019,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4998,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4977,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_12')),DrawY=-5014,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4982,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2300,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2352
   ObjPosY=-5056
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_6"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-4952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-4952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_12
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-5014,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5014,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),DrawX=-2102,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-5048
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_12"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-4960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2584
   ObjPosY=-4960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_13
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-5014,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6')),DrawY=-5014,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=-2510,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=-5048
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_13"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-4198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=-3264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-4232
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_6
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_7'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),DrawY=-4427,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4405,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-4383,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-4361,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3807,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3728,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-4496
   ObjName="KFTrigger_MinigameButton_7 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_6"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2304
   ObjPosY=-4432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=-4408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-4408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2576
   ObjPosY=-4424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=-4872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-4918,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4918,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135'),DrawX=-3208,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-4952
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_63
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4008
   ObjPosY=-5280
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_63"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_24
   Duration=17.000000
   InputLinks(0)=(DrawY=-4827,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4806,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4785,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-4822,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4790,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2364,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2416
   ObjPosY=-4864
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_24"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-4240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_14
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-4294,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4294,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137'),DrawX=-2478,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=-4328
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_14"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="Electric1Off4"
   InputLinks(0)=(DrawY=-4822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2077,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2208
   ObjPosY=-4856
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_15
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-4686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),DrawX=-2462,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-4720
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_15"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_13
   EventName="Electric1Off4"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_64',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_14'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_33')),DrawY=-4478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2755,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2856
   ObjPosY=-4544
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_13"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="Electric On4"
   InputLinks(0)=(DrawY=-4702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3175,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-4736
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_14
   EventName="Electric On4"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_64'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_13'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_15'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_88'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_90',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_8',InputLinkIdx=1)),DrawY=-4710,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2750,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2848
   ObjPosY=-4776
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_14"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-4632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_64
   InputLinks(0)=(DrawY=-4507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131'),DrawX=-2490,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2439,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2390,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=-4544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_64"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_7
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_6'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),DrawY=-4955,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4933,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-4911,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-4889,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3783,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3704,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=-5024
   ObjName="KFTrigger_MinigameButton_6 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_7"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_15
   EventName="Electric1Off4"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17')),DrawY=-4758,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1491,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1592
   ObjPosY=-4824
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_15"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_17
   EventName="Electric On4"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),DrawY=-4942,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1494,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1592
   ObjPosY=-5008
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_17"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1184
   ObjPosY=-4768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-4966,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4966,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=-1152,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1200
   ObjPosY=-5000
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-4790,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4790,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=-1280,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1328
   ObjPosY=-4824
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-4136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-2736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-3390,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142'),DrawX=-1248,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1296
   ObjPosY=-3424
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-3566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142'),DrawX=-1120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=-3600
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_18
   EventName="Electric On5"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),DrawY=-3542,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1462,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=-3608
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_18"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_19
   EventName="Electric1Off5"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),DrawY=-3358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1459,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=-3424
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_19"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_8
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_10'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),DrawY=-3555,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3533,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-3511,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-3489,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3747,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3668,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3880
   ObjPosY=-3624
   ObjName="KFTrigger_MinigameButton_10 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_8"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_65
   InputLinks(0)=(DrawY=-3107,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3086,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3065,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3086,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243'),DrawX=-2458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=-3144
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_65"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-3232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_20
   EventName="Electric On5"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_65'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_20'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_8'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_16'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_86'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_87',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_7',InputLinkIdx=1)),DrawY=-3310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2718,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-3376
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_20"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="Electric On5"
   InputLinks(0)=(DrawY=-3302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3302,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3143,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-3336
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_23
   EventName="Electric1Off5"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_65',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_17'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_32')),DrawY=-3078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2723,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2824
   ObjPosY=-3144
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_23"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_16
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-3286,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3286,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-2430,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-3320
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_16"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_12
   EventName="Electric1Off5"
   InputLinks(0)=(DrawY=-3422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2045,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-3456
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_12"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_17
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-2894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2894,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),DrawX=-2446,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-2928
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_17"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=-2840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_8
   Duration=17.000000
   InputLinks(0)=(DrawY=-3427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3385,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_12')),DrawY=-3422,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3390,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2332,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=-3464
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_8"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_64
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-3880
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_64"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-3518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3518,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145'),DrawX=-3176,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3224
   ObjPosY=-3552
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3208
   ObjPosY=-3472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-3024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2448
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2272
   ObjPosY=-3032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_9
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_8'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_23'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),DrawY=-3027,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3005,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-2983,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-2961,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3775,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3696,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3904
   ObjPosY=-3096
   ObjName="KFTrigger_MinigameButton_8 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_9"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_23
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),DrawX=-3232,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-2832
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_23"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_20
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-3614,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_10')),DrawY=-3614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165'),DrawX=-2478,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=-3648
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_20"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-3560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-3560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_21
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-3614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_167'),DrawX=-2070,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=-3648
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_21"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-3552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2048
   ObjPosY=-3552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_10
   Duration=15.000000
   InputLinks(0)=(DrawY=-3619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3598,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3577,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_21')),DrawY=-3614,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3582,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2268,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=-3656
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_10"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_11
   Duration=15.000000
   InputLinks(0)=(DrawY=-2131,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2110,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2089,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_22')),DrawY=-2126,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2094,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2268,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=-2168
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_11"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2048
   ObjPosY=-2064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-2064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_22
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_169',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168'),DrawX=-2070,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=-2160
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_22"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-2072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-2072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_23
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_11')),DrawY=-2126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170'),DrawX=-2478,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=-2160
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_23"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_24
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-1358,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1358,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_185'),DrawX=-3240,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-1392
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_24"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_12
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_12'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_24'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_22')),DrawY=-1587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1565,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-1543,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-1521,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3779,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3700,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=-1656
   ObjName="KFTrigger_MinigameButton_12 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_12"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2272
   ObjPosY=-1544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2368
   ObjPosY=-1520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-1520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_178
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-1536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_178"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3216
   ObjPosY=-2032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-2078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2078,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181'),DrawX=-3184,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3232
   ObjPosY=-2112
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_25"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_65
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-2392
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_65"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_12
   Duration=17.000000
   InputLinks(0)=(DrawY=-1939,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1918,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1897,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_13')),DrawY=-1934,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1902,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2332,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=-1976
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_12"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_182
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_182"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_24
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-1406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1406,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_182'),DrawX=-2454,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-1440
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_24"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
   EventName="Electric1Off6"
   InputLinks(0)=(DrawY=-1934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1934,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2045,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=-1968
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_13"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_25
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-1798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1798,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_183'),DrawX=-2430,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-1832
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_25"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_24
   EventName="Electric1Off6"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_66',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_24'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_31')),DrawY=-1590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2731,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-1656
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_24"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_22
   EventName="Electric On6"
   InputLinks(0)=(DrawY=-1862,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1862,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3151,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-1896
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_22"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_25
   EventName="Electric On6"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_66'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_23'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_12'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_25'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_83'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_6',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_85',InputLinkIdx=1)),DrawY=-1822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2718,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-1888
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_25"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-1744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_66
   InputLinks(0)=(DrawY=-1619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1598,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1577,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1598,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_178',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_177',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_175',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_174'),DrawX=-2458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=-1656
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_66"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_13
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_13'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_25'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_22')),DrawY=-2115,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2093,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-2071,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-2049,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3755,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3676,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-2184
   ObjName="KFTrigger_MinigameButton_13 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_13"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_26
   EventName="Electric1Off6"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_27')),DrawY=-1870,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1459,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=-1936
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_26"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_27
   EventName="Electric On6"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_26')),DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1462,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=-2120
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_27"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_184
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=-1880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_184"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_26
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-2078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2078,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_184'),DrawX=-1120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=-2112
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_26"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_27
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-1902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1902,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_184'),DrawX=-1248,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1296
   ObjPosY=-1936
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_27"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_185
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-1296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_185"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_186
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_186"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_28
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_187'),DrawX=-1272,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1320
   ObjPosY=-456
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_28"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_29
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-598,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_187'),DrawX=-1144,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=-632
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_29"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_187
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=-400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_187"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_28
   EventName="Electric On8"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_29')),DrawY=-574,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1486,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=-640
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_28"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_29
   EventName="Electric1Off8"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_28')),DrawY=-390,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1483,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=-456
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_29"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_14
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_21'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_30'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),DrawY=-635,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-613,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-591,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-569,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3779,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3700,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=-704
   ObjName="KFTrigger_MinigameButton_21 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_14"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_67
   InputLinks(0)=(DrawY=-139,OverrideDelta=14)
   InputLinks(1)=(DrawY=-118,OverrideDelta=35)
   InputLinks(2)=(DrawY=-97,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-118,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_191',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_193',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_194'),DrawX=-2482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-176
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_67"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_188
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_188"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_30
   EventName="Electric On8"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_67'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_30'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_13'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_27'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_82'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_5',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_81',InputLinkIdx=1)),DrawY=-342,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2742,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=-408
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_30"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_15
   EventName="Electric On8"
   InputLinks(0)=(DrawY=-382,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-382,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3175,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-416
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_15"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
   EventName="Electric1Off8"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_67',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_29'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_30')),DrawY=-110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2755,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2856
   ObjPosY=-176
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_31"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_27
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-318,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-318,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_188'),DrawX=-2454,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-352
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_27"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_16
   EventName="Electric1Off8"
   InputLinks(0)=(DrawY=-454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2069,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2200
   ObjPosY=-488
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_16"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_29
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=66,OverrideDelta=11)
   OutputLinks(0)=(DrawY=66,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_189'),DrawX=-2478,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=32
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_29"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_189
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_189"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_13
   Duration=17.000000
   InputLinks(0)=(DrawY=-459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-417,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),DrawY=-454,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-422,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2356,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2408
   ObjPosY=-496
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_13"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_66
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4000
   ObjPosY=-912
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_66"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_30
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-598,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_190'),DrawX=-3208,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-632
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_30"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_190
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=-552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_190"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_191
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2576
   ObjPosY=-56
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_191"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_192"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_193
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=-40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_193"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_194
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2296
   ObjPosY=-64
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_194"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_15
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_20'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_31'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),DrawY=-107,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-85,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-63,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-41,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3803,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3724,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-176
   ObjName="KFTrigger_MinigameButton_20 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_15"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_31
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=114,OverrideDelta=11)
   OutputLinks(0)=(DrawY=114,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_186'),DrawX=-3264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=80
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_31"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_30
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-646,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_15')),DrawY=-646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_198'),DrawX=-2502,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-680
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_30"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2576
   ObjPosY=-592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_31
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_200'),DrawX=-2094,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=-680
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_31"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=-584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2072
   ObjPosY=-584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_15
   Duration=15.000000
   InputLinks(0)=(DrawY=-651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-609,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_31')),DrawY=-646,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-614,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2292,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2344
   ObjPosY=-688
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_15"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_16
   Duration=60.000000
   InputLinks(0)=(DrawY=725,OverrideDelta=14)
   InputLinks(1)=(DrawY=746,OverrideDelta=35)
   InputLinks(2)=(DrawY=767,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_32')),DrawY=730,OverrideDelta=19)
   OutputLinks(1)=(DrawY=762,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2292,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2344
   ObjPosY=688
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_16"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2072
   ObjPosY=792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_202
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_202"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_32
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=730,OverrideDelta=11)
   OutputLinks(0)=(DrawY=730,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_202',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201'),DrawX=-2094,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=696
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_32"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2576
   ObjPosY=784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_33
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=730,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_16')),DrawY=730,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203'),DrawX=-2502,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=696
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_33"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_32
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=1498,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1498,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215'),DrawX=-3264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=1464
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_32"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_16
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_1'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_32'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_19')),DrawY=1269,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1291,OverrideDelta=36)
   OutputLinks(2)=(DrawY=1313,OverrideDelta=58)
   OutputLinks(3)=(DrawY=1335,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3807,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3728,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=1200
   ObjName="KFTrigger_MinigameButton_1 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_16"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_207
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2296
   ObjPosY=1312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_207"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_208
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_208"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2576
   ObjPosY=1320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_33
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=778,OverrideDelta=11)
   OutputLinks(0)=(DrawY=778,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211'),DrawX=-3208,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=744
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_33"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_67
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4000
   ObjPosY=464
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_67"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_17
   Duration=17.000000
   InputLinks(0)=(DrawY=917,OverrideDelta=14)
   InputLinks(1)=(DrawY=938,OverrideDelta=35)
   InputLinks(2)=(DrawY=959,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_18')),DrawY=922,OverrideDelta=19)
   OutputLinks(1)=(DrawY=954,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2356,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2408
   ObjPosY=880
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_17"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=1504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_34
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=1450,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1450,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212'),DrawX=-2478,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=1416
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_34"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_18
   EventName="Electric1Off7"
   InputLinks(0)=(DrawY=922,OverrideDelta=11)
   OutputLinks(0)=(DrawY=922,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2069,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2200
   ObjPosY=888
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_18"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_35
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=1058,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1058,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213'),DrawX=-2454,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=1024
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_35"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_32
   EventName="Electric1Off7"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_68',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_34'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_29')),DrawY=1266,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2755,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2856
   ObjPosY=1200
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_32"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_19
   EventName="Electric On7"
   InputLinks(0)=(DrawY=994,OverrideDelta=11)
   OutputLinks(0)=(DrawY=994,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3175,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=960
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_19"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_33
   EventName="Electric On7"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_68'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_33'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_17'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_35'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_4',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44',InputLinkIdx=1)),DrawY=1034,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2742,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=968
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_33"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=1112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_68
   InputLinks(0)=(DrawY=1237,OverrideDelta=14)
   InputLinks(1)=(DrawY=1258,OverrideDelta=35)
   InputLinks(2)=(DrawY=1279,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1258,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207'),DrawX=-2482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=1200
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_68"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_17
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_19')),DrawY=741,OverrideDelta=14)
   OutputLinks(1)=(DrawY=763,OverrideDelta=36)
   OutputLinks(2)=(DrawY=785,OverrideDelta=58)
   OutputLinks(3)=(DrawY=807,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3783,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3704,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=672
   ObjName="KFTrigger_MinigameButton_0 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_17"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_34
   EventName="Electric1Off7"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_35')),DrawY=986,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1483,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=920
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_34"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_35
   EventName="Electric On7"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_34')),DrawY=802,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1486,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=736
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_35"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_34
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=778,OverrideDelta=11)
   OutputLinks(0)=(DrawY=778,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214'),DrawX=-1144,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=744
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_34"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_35
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=954,OverrideDelta=11)
   OutputLinks(0)=(DrawY=954,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214'),DrawX=-1272,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1320
   ObjPosY=920
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_35"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=1560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=2936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_36
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=2330,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2330,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_217'),DrawX=-1264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=2296
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_36"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_37
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=2154,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2154,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_217'),DrawX=-1136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1184
   ObjPosY=2120
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_37"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_217
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=2352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_217"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_36
   EventName="Electric On9"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_37')),DrawY=2178,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1478,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=2112
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_36"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_37
   EventName="Electric1Off9"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=2362,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1475,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=2296
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_37"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_18
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_17'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_38'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_20')),DrawY=2117,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2139,OverrideDelta=36)
   OutputLinks(2)=(DrawY=2161,OverrideDelta=58)
   OutputLinks(3)=(DrawY=2183,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3771,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3692,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3904
   ObjPosY=2048
   ObjName="KFTrigger_MinigameButton_17 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_18"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_69
   InputLinks(0)=(DrawY=2613,OverrideDelta=14)
   InputLinks(1)=(DrawY=2634,OverrideDelta=35)
   InputLinks(2)=(DrawY=2655,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2634,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224'),DrawX=-2474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=2576
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_69"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=2488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_38
   EventName="Electric On9"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_69'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_38'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_18'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_36'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2',InputLinkIdx=1)),DrawY=2410,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2734,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=2344
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_38"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_20
   EventName="Electric On9"
   InputLinks(0)=(DrawY=2370,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2370,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3167,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=2336
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_20"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_39
   EventName="Electric1Off9"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_69',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_37'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_26')),DrawY=2642,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2747,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2848
   ObjPosY=2576
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_39"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_36
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=2434,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2434,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218'),DrawX=-2446,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=2400
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_36"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_21
   EventName="Electric1Off9"
   InputLinks(0)=(DrawY=2298,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2298,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2061,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2192
   ObjPosY=2264
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_21"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_37
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=2826,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2826,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_219'),DrawX=-2470,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=2792
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_37"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=2880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_18
   Duration=17.000000
   InputLinks(0)=(DrawY=2293,OverrideDelta=14)
   InputLinks(1)=(DrawY=2314,OverrideDelta=35)
   InputLinks(2)=(DrawY=2335,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_21')),DrawY=2298,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2330,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2400
   ObjPosY=2256
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_18"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_68
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3992
   ObjPosY=1840
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_68"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_38
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=2154,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2154,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220'),DrawX=-3200,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3248
   ObjPosY=2120
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_38"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3232
   ObjPosY=2200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=2696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2288
   ObjPosY=2688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_19
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_16'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_39'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_20')),DrawY=2637,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2659,OverrideDelta=36)
   OutputLinks(2)=(DrawY=2681,OverrideDelta=58)
   OutputLinks(3)=(DrawY=2703,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3795,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3716,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3928
   ObjPosY=2568
   ObjName="KFTrigger_MinigameButton_16 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_19"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_39
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=2874,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2874,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216'),DrawX=-3256,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=2840
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_39"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_38
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=2106,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_19')),DrawY=2106,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_227',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228'),DrawX=-2494,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=2072
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_38"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_227
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2568
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_227"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_39
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=2106,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2106,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_229',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_230'),DrawX=-2086,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=2072
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_39"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=2168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_229"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_230
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2064
   ObjPosY=2168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_230"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_19
   Duration=15.000000
   InputLinks(0)=(DrawY=2101,OverrideDelta=14)
   InputLinks(1)=(DrawY=2122,OverrideDelta=35)
   InputLinks(2)=(DrawY=2143,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_39')),DrawY=2106,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2138,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2336
   ObjPosY=2064
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_19"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
   FloatValue=120.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   ObjPosY=-4416
   ObjComment="B. Trap Reactivation Delay"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_0"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_1
   FloatValue=10.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1976
   ObjPosY=-4584
   ObjComment="A. Trap Damage Duration"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_1"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=192
   SizeY=384
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=-4672
   ObjComment="Trap Timers. A must be smaller or equal to B."
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-9027,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9006,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8985,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9006,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_237',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_252',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_253',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_254',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_255',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_256',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_257',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_258',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_259',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_266',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_267',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_268',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_269',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_270',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_271',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_272',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_273',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_274',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_276',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_278',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_279',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_280',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_282',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_283',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_285',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_292',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_293',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_294',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_295',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_296',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_297',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_298',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_299',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_300',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_301',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_302',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_303',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_304',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_305',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_306',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_307',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_308',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_309',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_310',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_311',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_312',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=782,OverrideDelta=16)
   VariableLinks(1)=(DrawX=833,OverrideDelta=76)
   EventLinks(0)=(DrawX=882,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=744
   ObjPosY=-9064
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_72
   InputLinks(0)=(DrawY=-9579,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9558,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9537,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9558,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_231',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_315',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_321',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_323',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_324',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_326',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_327',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_330',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_331',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_332',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_333',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_334',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_335',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_336',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_337',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_338',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_340',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_341',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_342',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_347',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_349',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_350',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_351',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_352',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_353',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_354',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_356',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_357',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_358',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_359',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_360',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_361',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_362',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_363',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_364',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_365',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_366',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_367',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_368',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_369',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_370',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_371',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_372',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_374',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_375',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_376',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_377',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_378',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_379',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_380',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_381',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_382',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_383',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_384',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_385',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_404',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_405',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_406',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_407',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_408',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_409',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_410',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_411',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_412',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_413',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_414',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_415',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_416',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_417',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_418',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_419',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_420',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_421',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_422',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_423',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_424',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_425',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_426',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_427',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_428',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_429',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_430',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_431',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_432',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_433',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_434',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_435',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_436',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_437',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_438',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_439',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_440',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_441',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_442',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_443',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_444',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_445',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_446',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_447',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_448',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_449',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_450',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_451',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_452',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_453',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_454',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_455',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_456',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_457',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_458',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_459',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_460',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_461',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_462',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_463',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_464',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_465',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_466',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_467',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_468',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_469',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_470',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_471',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_472',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_473',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_474',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_475'),DrawX=1870,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1921,OverrideDelta=76)
   EventLinks(0)=(DrawX=1970,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-9616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_72"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_22')),DrawY=-9259,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9238,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9217,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-9328
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   InputLinks(0)=(DrawY=-8854,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8854,OverrideDelta=11)
   VariableLinks(0)=(DrawX=501,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=456
   ObjPosY=-8888
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(DrawY=-9000,OverrideDelta=33)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_0'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_22'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_23')),DrawY=-9020,OverrideDelta=13)
   VariableLinks(0)=(DrawX=75,OverrideDelta=16)
   VariableLinks(1)=(DrawX=136,OverrideDelta=86)
   VariableLinks(2)=(DrawX=217,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=32
   ObjPosY=-9088
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_0"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(DrawY=-9488,OverrideDelta=33)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_21'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_20')),DrawY=-9508,OverrideDelta=13)
   VariableLinks(0)=(DrawX=75,OverrideDelta=16)
   VariableLinks(1)=(DrawX=136,OverrideDelta=86)
   VariableLinks(2)=(DrawX=217,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=32
   ObjPosY=-9576
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_0"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=1642
   SizeY=962
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=-9632
   ObjComment="Lighting Switch"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   InputLinks(0)=(DrawY=-9558,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=509,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=-9592
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_231
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_155'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=934
   ObjPosY=-9247
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_231"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_143'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=942
   ObjPosY=-9015
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_237"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_154'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1042
   ObjPosY=-9015
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1142
   ObjPosY=-9015
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_146'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1242
   ObjPosY=-9015
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_147'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1342
   ObjPosY=-9015
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_148'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1442
   ObjPosY=-9015
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1615
   SizeY=651
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9280
   ObjPosY=1680
   ObjComment="Benchmark"
   DrawWidth=1615
   DrawHeight=651
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8400
   ObjPosY=2104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=1802,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9153,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=1736
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=1818,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1818,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-8360,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8424
   ObjPosY=1784
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=1802,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=1802,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-8896,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8960
   ObjPosY=1768
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=CameraActor'KF-MOONBASE.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=2016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=1090.496582,Y=-31.905029,Z=-4.189270),ArriveTangent=(X=286.968719,Y=0.000000,Z=0.000000),LeaveTangent=(X=286.968719,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=1721.812256,Y=101.157471,Z=0.979279),ArriveTangent=(X=103.408371,Y=70.295952,Z=0.000000),LeaveTangent=(X=103.408371,Y=70.295952,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=1886.917725,Y=404.028809,Z=-5.058929),ArriveTangent=(X=120.816498,Y=72.055595,Z=-2.548065),LeaveTangent=(X=120.816498,Y=72.055595,Z=-2.548065),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=3340.837402,Y=542.771240,Z=-14.309113),ArriveTangent=(X=265.675110,Y=37.000366,Z=0.000000),LeaveTangent=(X=265.675110,Y=37.000366,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=3783.473877,Y=626.031006,Z=-7.216370),ArriveTangent=(X=187.664719,Y=0.000000,Z=3.359100),LeaveTangent=(X=187.664719,Y=0.000000,Z=3.359100),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=4466.825684,Y=350.331299,Z=5.845490),ArriveTangent=(X=239.608521,Y=0.000000,Z=0.000000),LeaveTangent=(X=239.608521,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=5221.125000,Y=375.839111,Z=5.163147),ArriveTangent=(X=212.686691,Y=0.000000,Z=-0.512049),LeaveTangent=(X=212.686691,Y=0.000000,Z=-0.512049),InterpMode=CIM_CurveAutoClamped),(InVal=24.000000,OutVal=(X=5742.945801,Y=345.440674,Z=-2.343719),ArriveTangent=(X=129.023514,Y=-21.021751,Z=0.000000),LeaveTangent=(X=129.023514,Y=-21.021751,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=28.000000,OutVal=(X=6124.289551,Y=-53.988770,Z=-1.054993),ArriveTangent=(X=177.612839,Y=0.000000,Z=0.621438),LeaveTangent=(X=177.612839,Y=0.000000,Z=0.621438),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=8170.982422,Y=50.185547,Z=7.192566),ArriveTangent=(X=0.000000,Y=51.717590,Z=0.874093),LeaveTangent=(X=0.000000,Y=51.717590,Z=0.874093),InterpMode=CIM_CurveAutoClamped),(InVal=37.000000,OutVal=(X=7943.749023,Y=1627.262329,Z=9.191956),ArriveTangent=(X=-66.915039,Y=364.615570,Z=0.000000),LeaveTangent=(X=-66.915039,Y=364.615570,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=7568.747070,Y=3331.725586,Z=-0.133087),ArriveTangent=(X=-93.397827,Y=336.857117,Z=-2.325024),LeaveTangent=(X=-93.397827,Y=336.857117,Z=-2.325024),InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=(X=7196.566406,Y=4322.119141,Z=-9.408234),ArriveTangent=(X=-63.975624,Y=282.807129,Z=0.000000),LeaveTangent=(X=-63.975624,Y=282.807129,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=48.000000,OutVal=(X=7092.580566,Y=5028.568359,Z=308.774139),ArriveTangent=(X=0.000000,Y=265.765472,Z=19.296230),LeaveTangent=(X=0.000000,Y=265.765472,Z=19.296230),InterpMode=CIM_CurveAutoClamped),(InVal=51.000000,OutVal=(X=7269.174805,Y=5916.711914,Z=334.169037),ArriveTangent=(X=113.816895,Y=247.454666,Z=0.000000),LeaveTangent=(X=113.816895,Y=247.454666,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=8026.281250,Y=6513.296387,Z=328.340729),ArriveTangent=(X=119.759354,Y=0.000000,Z=0.000000),LeaveTangent=(X=119.759354,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=57.000000,OutVal=(X=8215.193359,Y=5988.961914,Z=364.060333),ArriveTangent=(X=0.000000,Y=-277.332916,Z=26.072212),LeaveTangent=(X=0.000000,Y=-277.332916,Z=26.072212),InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=(X=8180.646484,Y=4791.938965,Z=672.404907),ArriveTangent=(X=0.000000,Y=-225.703445,Z=0.000000),LeaveTangent=(X=0.000000,Y=-225.703445,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=63.000000,OutVal=(X=8673.466797,Y=4410.708984,Z=609.871582),ArriveTangent=(X=154.304199,Y=-40.082970,Z=-7.716111),LeaveTangent=(X=154.304199,Y=-40.082970,Z=-7.716111),InterpMode=CIM_CurveAutoClamped),(InVal=66.000000,OutVal=(X=9106.471680,Y=4353.750000,Z=598.526245),ArriveTangent=(X=103.471359,Y=-42.188274,Z=0.000000),LeaveTangent=(X=103.471359,Y=-42.188274,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=69.000000,OutVal=(X=9306.333984,Y=3798.658203,Z=620.554688),ArriveTangent=(X=122.511963,Y=0.000000,Z=4.614799),LeaveTangent=(X=122.511963,Y=0.000000,Z=4.614799),InterpMode=CIM_CurveAutoClamped),(InVal=72.000000,OutVal=(X=10012.337891,Y=3889.608154,Z=628.765625),ArriveTangent=(X=194.667313,Y=70.202866,Z=3.588684),LeaveTangent=(X=194.667313,Y=70.202866,Z=3.588684),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=10474.337891,Y=5268.268555,Z=642.086792),ArriveTangent=(X=30.582371,Y=260.467407,Z=0.183265),LeaveTangent=(X=30.582371,Y=260.467407,Z=0.183265),InterpMode=CIM_CurveAutoClamped),(InVal=78.000000,OutVal=(X=10514.955078,Y=5708.609375,Z=642.311035),ArriveTangent=(X=0.000000,Y=123.626465,Z=0.181563),LeaveTangent=(X=0.000000,Y=123.626465,Z=0.181563),InterpMode=CIM_CurveAutoClamped),(InVal=81.000000,OutVal=(X=10145.548828,Y=6010.027344,Z=651.376831),ArriveTangent=(X=0.000000,Y=181.916962,Z=0.000000),LeaveTangent=(X=0.000000,Y=181.916962,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=84.000000,OutVal=(X=10443.534180,Y=7018.744629,Z=649.502197),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.532129),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.532129),InterpMode=CIM_CurveAutoClamped),(InVal=87.000000,OutVal=(X=9966.900391,Y=6987.710449,Z=537.912720),ArriveTangent=(X=-215.471024,Y=0.000000,Z=-53.973537),LeaveTangent=(X=-215.471024,Y=0.000000,Z=-53.973537),InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,OutVal=(X=9150.708008,Y=7015.090820,Z=325.660980),ArriveTangent=(X=-283.995941,Y=0.000000,Z=-3.409801),LeaveTangent=(X=-283.995941,Y=0.000000,Z=-3.409801),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=8262.924805,Y=6869.698242,Z=321.474457),ArriveTangent=(X=-111.929527,Y=-99.092911,Z=-0.610266),LeaveTangent=(X=-111.929527,Y=-99.092911,Z=-0.610266),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=8097.497070,Y=6059.361816,Z=320.536469),ArriveTangent=(X=0.000000,Y=-356.490570,Z=0.000000),LeaveTangent=(X=0.000000,Y=-356.490570,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=99.000000,OutVal=(X=8151.630859,Y=4730.754883,Z=603.090332),ArriveTangent=(X=16.375488,Y=-304.446350,Z=0.000000),LeaveTangent=(X=16.375488,Y=-304.446350,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=102.000000,OutVal=(X=8195.750000,Y=4159.335938,Z=425.851776),ArriveTangent=(X=33.147587,Y=-89.057938,Z=-8.287731),LeaveTangent=(X=33.147587,Y=-89.057938,Z=-8.287731),InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=(X=8686.852539,Y=4019.546143,Z=415.185638),ArriveTangent=(X=26.886448,Y=-88.078644,Z=-7.319806),LeaveTangent=(X=26.886448,Y=-88.078644,Z=-7.319806),InterpMode=CIM_CurveAutoClamped),(InVal=108.000000,OutVal=(X=8721.899414,Y=3472.579834,Z=353.499969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-23.655630),LeaveTangent=(X=0.000000,Y=0.000000,Z=-23.655630),InterpMode=CIM_CurveAutoClamped),(InVal=111.000000,OutVal=(X=8114.964844,Y=3531.928711,Z=273.251862),ArriveTangent=(X=0.000000,Y=46.807434,Z=-47.617538),LeaveTangent=(X=0.000000,Y=46.807434,Z=-47.617538),InterpMode=CIM_CurveAutoClamped),(InVal=114.000000,OutVal=(X=8168.133789,Y=4788.350586,Z=19.431305),ArriveTangent=(X=41.556458,Y=376.994476,Z=0.000000),LeaveTangent=(X=41.556458,Y=376.994476,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=9133.748047,Y=5793.895508,Z=29.605255),ArriveTangent=(X=259.469879,Y=318.628418,Z=0.000000),LeaveTangent=(X=259.469879,Y=318.628418,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=(X=9724.953125,Y=6700.121094,Z=8.697754),ArriveTangent=(X=99.737747,Y=312.083252,Z=-8.258525),LeaveTangent=(X=99.737747,Y=312.083252,Z=-8.258525),InterpMode=CIM_CurveAutoClamped),(InVal=123.000000,OutVal=(X=9885.919922,Y=7666.395020,Z=-19.945892),ArriveTangent=(X=113.878952,Y=128.737030,Z=-2.706929),LeaveTangent=(X=113.878952,Y=128.737030,Z=-2.706929),InterpMode=CIM_CurveAutoClamped),(InVal=126.000000,OutVal=(X=11000.050781,Y=7859.339355,Z=-23.719635),ArriveTangent=(X=229.912964,Y=103.846962,Z=-2.010705),LeaveTangent=(X=229.912964,Y=103.846962,Z=-2.010705),InterpMode=CIM_CurveAutoClamped),(InVal=129.000000,OutVal=(X=11405.835938,Y=8319.744141,Z=-32.494995),ArriveTangent=(X=0.000000,Y=207.336349,Z=0.000000),LeaveTangent=(X=0.000000,Y=207.336349,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=132.000000,OutVal=(X=11322.183594,Y=9103.357422,Z=-23.393646),ArriveTangent=(X=-61.326637,Y=174.336792,Z=5.065557),LeaveTangent=(X=-61.326637,Y=174.336792,Z=5.065557),InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=(X=10574.465820,Y=9424.511719,Z=0.363708),ArriveTangent=(X=-330.667816,Y=0.000000,Z=0.000000),LeaveTangent=(X=-330.667816,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=9338.176758,Y=9385.780273,Z=-10.251892),ArriveTangent=(X=-427.439606,Y=0.000000,Z=-3.020131),LeaveTangent=(X=-427.439606,Y=0.000000,Z=-3.020131),InterpMode=CIM_CurveAutoClamped),(InVal=141.000000,OutVal=(X=8009.828125,Y=9415.133789,Z=-17.757080),ArriveTangent=(X=-313.210449,Y=19.068220,Z=-0.829700),LeaveTangent=(X=-313.210449,Y=19.068220,Z=-0.829700),InterpMode=CIM_CurveAutoClamped),(InVal=144.000000,OutVal=(X=7410.525391,Y=9545.272461,Z=-18.947876),ArriveTangent=(X=-270.717621,Y=0.000000,Z=0.000000),LeaveTangent=(X=-270.717621,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=147.000000,OutVal=(X=6385.522461,Y=8082.511230,Z=-8.352997),ArriveTangent=(X=-302.792328,Y=-28.958908,Z=0.000000),LeaveTangent=(X=-302.792328,Y=-28.958908,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=(X=5593.771484,Y=8046.757324,Z=-13.017059),ArriveTangent=(X=-210.421143,Y=-26.733509,Z=0.000000),LeaveTangent=(X=-210.421143,Y=-26.733509,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=153.000000,OutVal=(X=5122.995605,Y=7666.956055,Z=44.820709),ArriveTangent=(X=-231.773438,Y=-40.877258,Z=38.067226),LeaveTangent=(X=-231.773438,Y=-40.877258,Z=38.067226),InterpMode=CIM_CurveAutoClamped),(InVal=156.000000,OutVal=(X=4203.130859,Y=7608.603516,Z=316.569672),ArriveTangent=(X=-27.420883,Y=-40.118710,Z=0.000000),LeaveTangent=(X=-27.420883,Y=-40.118710,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=159.000000,OutVal=(X=4168.759277,Y=7267.730957,Z=313.962921),ArriveTangent=(X=0.000000,Y=-149.719238,Z=-1.620177),LeaveTangent=(X=0.000000,Y=-149.719238,Z=-1.620177),InterpMode=CIM_CurveAutoClamped),(InVal=162.000000,OutVal=(X=4989.712891,Y=6710.288086,Z=304.278900),ArriveTangent=(X=0.000000,Y=-152.247482,Z=0.000000),LeaveTangent=(X=0.000000,Y=-152.247482,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=4734.151367,Y=6354.246094,Z=338.069244),ArriveTangent=(X=-157.395142,Y=0.000000,Z=24.596254),LeaveTangent=(X=-157.395142,Y=0.000000,Z=24.596254),InterpMode=CIM_CurveAutoClamped),(InVal=168.000000,OutVal=(X=3815.992188,Y=6407.938477,Z=623.597656),ArriveTangent=(X=0.000000,Y=42.367462,Z=0.000000),LeaveTangent=(X=0.000000,Y=42.367462,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=171.000000,OutVal=(X=3863.874512,Y=7555.112793,Z=623.016724),ArriveTangent=(X=14.549886,Y=319.502441,Z=-0.460769),LeaveTangent=(X=14.549886,Y=319.502441,Z=-0.460769),InterpMode=CIM_CurveAutoClamped),(InVal=174.000000,OutVal=(X=3903.291504,Y=8324.953125,Z=609.302979),ArriveTangent=(X=0.000000,Y=317.365967,Z=0.000000),LeaveTangent=(X=0.000000,Y=317.365967,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=177.000000,OutVal=(X=3856.470703,Y=9459.308594,Z=627.512939),ArriveTangent=(X=-34.602097,Y=174.500366,Z=0.000000),LeaveTangent=(X=-34.602097,Y=174.500366,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=3408.913574,Y=9732.046875,Z=601.046875),ArriveTangent=(X=-164.773392,Y=121.347168,Z=0.000000),LeaveTangent=(X=-164.773392,Y=121.347168,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=2867.830322,Y=10187.391602,Z=606.826782),ArriveTangent=(X=-114.951820,Y=202.447922,Z=0.000000),LeaveTangent=(X=-114.951820,Y=202.447922,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=186.000000,OutVal=(X=2661.715332,Y=10946.734375,Z=601.555176),ArriveTangent=(X=0.000000,Y=109.738319,Z=0.000000),LeaveTangent=(X=0.000000,Y=109.738319,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=189.000000,OutVal=(X=3869.971924,Y=11114.972656,Z=650.559570),ArriveTangent=(X=351.004791,Y=0.000000,Z=0.000000),LeaveTangent=(X=351.004791,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=4767.744141,Y=10927.078125,Z=637.283691),ArriveTangent=(X=319.446259,Y=-124.302383,Z=0.000000),LeaveTangent=(X=319.446259,Y=-124.302383,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=(X=5786.649414,Y=10023.245117,Z=637.875977),ArriveTangent=(X=0.000000,Y=-292.442383,Z=0.470431),LeaveTangent=(X=0.000000,Y=-292.442383,Z=0.470431),InterpMode=CIM_CurveAutoClamped),(InVal=198.000000,OutVal=(X=5610.023926,Y=9172.423828,Z=652.266724),ArriveTangent=(X=-115.457718,Y=0.000000,Z=7.715769),LeaveTangent=(X=-115.457718,Y=0.000000,Z=7.715769),InterpMode=CIM_CurveAutoClamped),(InVal=201.000000,OutVal=(X=4805.217285,Y=9543.187500,Z=686.268677),ArriveTangent=(X=-296.472656,Y=97.683594,Z=0.000000),LeaveTangent=(X=-296.472656,Y=97.683594,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=204.000000,OutVal=(X=3831.187988,Y=9758.525391,Z=666.174561),ArriveTangent=(X=0.000000,Y=137.375763,Z=-2.455011),LeaveTangent=(X=0.000000,Y=137.375763,Z=-2.455011),InterpMode=CIM_CurveAutoClamped),(InVal=207.000000,OutVal=(X=4340.416992,Y=10643.626953,Z=662.573242),ArriveTangent=(X=208.546066,Y=0.000000,Z=-1.950194),LeaveTangent=(X=208.546066,Y=0.000000,Z=-1.950194),InterpMode=CIM_CurveAutoClamped),(InVal=213.000000,OutVal=(X=5811.006836,Y=8606.107422,Z=637.445068),ArriveTangent=(X=9.912857,Y=-254.606232,Z=0.000000),LeaveTangent=(X=9.912857,Y=-254.606232,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=(X=5822.483398,Y=8198.926758,Z=637.967773),InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,OutVal=(X=5070.897949,Y=8293.118164,Z=444.434418),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.994675),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.994675),InterpMode=CIM_CurveAutoClamped),(InVal=221.500000,OutVal=(X=5200.843262,Y=7619.358887,Z=414.401093),ArriveTangent=(X=83.326370,Y=0.000000,Z=-18.610863),LeaveTangent=(X=83.326370,Y=0.000000,Z=-18.610863),InterpMode=CIM_CurveAutoClamped),(InVal=224.000000,OutVal=(X=5839.959961,Y=7639.009766,Z=289.706024),InterpMode=CIM_CurveAutoClamped),(InVal=225.500000,OutVal=(X=5590.024414,Y=7085.504395,Z=295.559845),ArriveTangent=(X=-214.195221,Y=-136.371811,Z=0.000000),LeaveTangent=(X=-214.195221,Y=-136.371811,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=228.000000,OutVal=(X=4947.102051,Y=6932.348633,Z=282.895477),InterpMode=CIM_CurveAutoClamped),(InVal=231.000000,OutVal=(X=5795.431641,Y=7489.490723,Z=304.427460),ArriveTangent=(X=0.000000,Y=96.484802,Z=2.269075),LeaveTangent=(X=0.000000,Y=96.484802,Z=2.269075),InterpMode=CIM_CurveAutoClamped),(InVal=234.000000,OutVal=(X=5766.332520,Y=7646.769043,Z=307.653290),ArriveTangent=(X=-23.119446,Y=25.588480,Z=2.613865),LeaveTangent=(X=-23.119446,Y=25.588480,Z=2.613865),InterpMode=CIM_CurveAutoClamped),(InVal=237.000000,OutVal=(X=5054.767578,Y=7687.526855,Z=441.591156),ArriveTangent=(X=-40.804100,Y=31.167839,Z=33.822742),LeaveTangent=(X=-40.804100,Y=31.167839,Z=33.822742),InterpMode=CIM_CurveAutoClamped),(InVal=240.000000,OutVal=(X=5001.354980,Y=8236.979492,Z=510.589752),ArriveTangent=(X=-39.042648,Y=61.243092,Z=24.541584),LeaveTangent=(X=-39.042648,Y=61.243092,Z=24.541584),InterpMode=CIM_CurveAutoClamped),(InVal=243.500000,OutVal=(X=4224.167480,Y=8336.350586,Z=601.111450),ArriveTangent=(X=0.000000,Y=65.378784,Z=0.000000),LeaveTangent=(X=0.000000,Y=65.378784,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=247.000000,OutVal=(X=4242.269531,Y=9738.330078,Z=159.183624),ArriveTangent=(X=0.000000,Y=40.174133,Z=0.000000),LeaveTangent=(X=0.000000,Y=40.174133,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=248.500000,OutVal=(X=3801.768066,Y=9771.222656,Z=159.183624),ArriveTangent=(X=-2.609528,Y=0.000000,Z=0.000000),LeaveTangent=(X=-2.609528,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=250.500000,OutVal=(X=3799.837158,Y=9046.059570,Z=11.914368),ArriveTangent=(X=0.000000,Y=-210.223373,Z=0.000000),LeaveTangent=(X=0.000000,Y=-210.223373,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=(X=4957.367188,Y=8614.994141,Z=29.169708),ArriveTangent=(X=109.878944,Y=-159.794830,Z=0.000000),LeaveTangent=(X=109.878944,Y=-159.794830,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=256.000000,OutVal=(X=5079.021973,Y=8167.187988,Z=18.293732),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.890989),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.890989),InterpMode=CIM_CurveAutoClamped),(InVal=259.000000,OutVal=(X=4294.419434,Y=8222.783203,Z=15.753448),ArriveTangent=(X=-240.789352,Y=0.965310,Z=0.000000),LeaveTangent=(X=-240.789352,Y=0.965310,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=261.000000,OutVal=(X=3875.075195,Y=8223.679688,Z=18.682159),ArriveTangent=(X=-50.389427,Y=0.000000,Z=0.000000),LeaveTangent=(X=-50.389427,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=265.500000,OutVal=(X=3786.304443,Y=6567.528320,Z=-22.445709),ArriveTangent=(X=-48.779877,Y=-105.077988,Z=0.000000),LeaveTangent=(X=-48.779877,Y=-105.077988,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=267.000000,OutVal=(X=3533.081543,Y=6467.780762,Z=-5.943573),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.380207),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.380207),InterpMode=CIM_CurveAutoClamped),(InVal=272.000000,OutVal=(X=3694.971924,Y=8290.072266,Z=6.025635),ArriveTangent=(X=0.000000,Y=19.356064,Z=6.150689),LeaveTangent=(X=0.000000,Y=19.356064,Z=6.150689),InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=(X=2626.642822,Y=8317.978516,Z=110.947418),ArriveTangent=(X=0.000000,Y=24.354713,Z=25.247305),LeaveTangent=(X=0.000000,Y=24.354713,Z=25.247305),InterpMode=CIM_CurveAutoClamped),(InVal=277.000000,OutVal=(X=3105.484863,Y=8746.507813,Z=145.659332),InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,OutVal=(X=2252.870850,Y=8567.818359,Z=130.990692),ArriveTangent=(X=-179.867905,Y=0.000000,Z=0.000000),LeaveTangent=(X=-179.867905,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=283.000000,OutVal=(X=1931.612793,Y=9301.486328,Z=161.005768),ArriveTangent=(X=0.000000,Y=102.126999,Z=15.655308),LeaveTangent=(X=0.000000,Y=102.126999,Z=15.655308),InterpMode=CIM_CurveAutoClamped),(InVal=286.000000,OutVal=(X=3099.935547,Y=9456.378906,Z=227.211334),ArriveTangent=(X=0.000000,Y=76.861328,Z=45.211266),LeaveTangent=(X=0.000000,Y=76.861328,Z=45.211266),InterpMode=CIM_CurveAutoClamped),(InVal=289.000000,OutVal=(X=1900.264893,Y=9762.654297,Z=600.061768),ArriveTangent=(X=-8.426590,Y=160.124802,Z=2.523651),LeaveTangent=(X=-8.426590,Y=160.124802,Z=2.523651),InterpMode=CIM_CurveAutoClamped),(InVal=292.000000,OutVal=(X=1890.055664,Y=10442.107422,Z=603.118164),ArriveTangent=(X=0.000000,Y=182.978516,Z=1.827452),LeaveTangent=(X=0.000000,Y=182.978516,Z=1.827452),InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=(X=2116.569092,Y=10860.525391,Z=613.029785),ArriveTangent=(X=0.000000,Y=145.160477,Z=2.332130),LeaveTangent=(X=0.000000,Y=145.160477,Z=2.332130),InterpMode=CIM_CurveAutoClamped),(InVal=298.000000,OutVal=(X=1317.871826,Y=11313.070313,Z=617.485596),ArriveTangent=(X=-357.482025,Y=32.851017,Z=0.000000),LeaveTangent=(X=-357.482025,Y=32.851017,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=302.000000,OutVal=(X=-423.512695,Y=11368.033203,Z=519.748779),ArriveTangent=(X=-39.606018,Y=0.000000,Z=0.000000),LeaveTangent=(X=-39.606018,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=306.000000,OutVal=(X=-489.758789,Y=9660.015625,Z=556.377686),ArriveTangent=(X=0.000000,Y=-108.085281,Z=11.827184),LeaveTangent=(X=0.000000,Y=-108.085281,Z=11.827184),InterpMode=CIM_CurveAutoClamped),(InVal=309.000000,OutVal=(X=731.987305,Y=9500.299805,Z=602.539063),ArriveTangent=(X=60.704742,Y=0.000000,Z=0.000000),LeaveTangent=(X=60.704742,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=311.000000,OutVal=(X=790.832275,Y=10084.875000,Z=587.687866),ArriveTangent=(X=26.578075,Y=342.280670,Z=-15.641090),LeaveTangent=(X=26.578075,Y=342.280670,Z=-15.641090),InterpMode=CIM_CurveAutoClamped),(InVal=314.000000,OutVal=(X=864.877686,Y=11211.703125,Z=132.229706),ArriveTangent=(X=0.000000,Y=136.433792,Z=0.000000),LeaveTangent=(X=0.000000,Y=136.433792,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=318.000000,OutVal=(X=-414.631348,Y=11463.476563,Z=154.813629),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.025215),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.025215),InterpMode=CIM_CurveAutoClamped),(InVal=322.000000,OutVal=(X=-385.935547,Y=9791.822266,Z=172.431427),ArriveTangent=(X=18.833342,Y=-364.991089,Z=0.000000),LeaveTangent=(X=18.833342,Y=-364.991089,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=324.000000,OutVal=(X=-185.909668,Y=9183.276367,Z=172.042084),ArriveTangent=(X=46.398857,Y=-272.598389,Z=0.000000),LeaveTangent=(X=46.398857,Y=-272.598389,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=326.000000,OutVal=(X=-137.480469,Y=8701.428711,Z=314.905548),ArriveTangent=(X=11.953983,Y=-214.585205,Z=13.048872),LeaveTangent=(X=11.953983,Y=-214.585205,Z=13.048872),InterpMode=CIM_CurveAutoClamped),(InVal=328.000000,OutVal=(X=-124.735352,Y=8324.935547,Z=326.358856),ArriveTangent=(X=12.042130,Y=-200.684692,Z=0.000000),LeaveTangent=(X=12.042130,Y=-200.684692,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=332.500000,OutVal=(X=977.842041,Y=7383.589844,Z=285.928558),ArriveTangent=(X=0.000000,Y=-108.812431,Z=0.000000),LeaveTangent=(X=0.000000,Y=-108.812431,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=334.000000,OutVal=(X=770.738770,Y=7269.049805,Z=309.497955),ArriveTangent=(X=-220.193909,Y=-11.138393,Z=8.198107),LeaveTangent=(X=-220.193909,Y=-11.138393,Z=8.198107),InterpMode=CIM_CurveAutoClamped),(InVal=337.000000,OutVal=(X=-553.298340,Y=7256.720215,Z=322.820038),ArriveTangent=(X=0.000000,Y=0.000000,Z=10.501335),LeaveTangent=(X=0.000000,Y=0.000000,Z=10.501335),InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,OutVal=(X=-549.178223,Y=8068.337891,Z=602.142578),ArriveTangent=(X=0.000000,Y=149.001831,Z=4.228302),LeaveTangent=(X=0.000000,Y=149.001831,Z=4.228302),InterpMode=CIM_CurveAutoClamped),(InVal=343.000000,OutVal=(X=-626.759277,Y=8317.083008,Z=607.326904),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.113277),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.113277),InterpMode=CIM_CurveAutoClamped),(InVal=346.000000,OutVal=(X=-378.897461,Y=8288.781250,Z=609.335205),ArriveTangent=(X=112.066406,Y=0.000000,Z=0.000000),LeaveTangent=(X=112.066406,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=348.000000,OutVal=(X=-66.427246,Y=8303.869141,Z=279.408783),ArriveTangent=(X=0.000000,Y=18.112930,Z=0.000000),LeaveTangent=(X=0.000000,Y=18.112930,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,OutVal=(X=-202.000977,Y=8739.560547,Z=284.212006),ArriveTangent=(X=-101.223511,Y=307.245605,Z=0.000000),LeaveTangent=(X=-101.223511,Y=307.245605,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=352.000000,OutVal=(X=-471.321289,Y=9532.851563,Z=132.787201),ArriveTangent=(X=0.000000,Y=349.145264,Z=0.000000),LeaveTangent=(X=0.000000,Y=349.145264,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=358.000000,OutVal=(X=-434.621094,Y=11532.722656,Z=150.760284),ArriveTangent=(X=17.854813,Y=0.000000,Z=4.358785),LeaveTangent=(X=17.854813,Y=0.000000,Z=4.358785),InterpMode=CIM_CurveAutoClamped),(InVal=361.000000,OutVal=(X=856.918457,Y=11477.160156,Z=172.016266),ArriveTangent=(X=12.157303,Y=-39.174328,Z=1.057214),LeaveTangent=(X=12.157303,Y=-39.174328,Z=1.057214),InterpMode=CIM_CurveAutoClamped),(InVal=364.000000,OutVal=(X=871.699219,Y=11100.851563,Z=173.383331),ArriveTangent=(X=9.886103,Y=-221.709152,Z=1.135445),LeaveTangent=(X=9.886103,Y=-221.709152,Z=1.135445),InterpMode=CIM_CurveAutoClamped),(InVal=367.000000,OutVal=(X=946.596924,Y=9937.566406,Z=591.031738),ArriveTangent=(X=0.000000,Y=-214.528473,Z=5.685909),LeaveTangent=(X=0.000000,Y=-214.528473,Z=5.685909),InterpMode=CIM_CurveAutoClamped),(InVal=371.000000,OutVal=(X=-481.990723,Y=9477.404297,Z=599.595947),ArriveTangent=(X=-51.190689,Y=0.000000,Z=0.000000),LeaveTangent=(X=-51.190689,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=373.000000,OutVal=(X=-536.121582,Y=9985.734375,Z=586.741943),ArriveTangent=(X=0.000000,Y=253.213669,Z=-11.343212),LeaveTangent=(X=0.000000,Y=253.213669,Z=-11.343212),InterpMode=CIM_CurveAutoClamped),(InVal=376.000000,OutVal=(X=-447.986816,Y=10743.472656,Z=511.117340),ArriveTangent=(X=0.000000,Y=241.270508,Z=0.000000),LeaveTangent=(X=0.000000,Y=241.270508,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=379.000000,OutVal=(X=-541.076172,Y=11433.357422,Z=524.481934),ArriveTangent=(X=-69.331215,Y=0.000000,Z=0.000000),LeaveTangent=(X=-69.331215,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=382.000000,OutVal=(X=-1494.363770,Y=11182.410156,Z=439.723480),ArriveTangent=(X=-116.099327,Y=-129.672318,Z=-13.097778),LeaveTangent=(X=-116.099327,Y=-129.672318,Z=-13.097778),InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,OutVal=(X=-1664.546875,Y=10641.189453,Z=419.221954),ArriveTangent=(X=-73.336830,Y=-220.335617,Z=-14.343628),LeaveTangent=(X=-73.336830,Y=-220.335617,Z=-14.343628),InterpMode=CIM_CurveAutoClamped),(InVal=388.000000,OutVal=(X=-1934.384766,Y=9860.396484,Z=286.798370),ArriveTangent=(X=-173.105698,Y=-233.868164,Z=0.000000),LeaveTangent=(X=-173.105698,Y=-233.868164,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=391.000000,OutVal=(X=-3069.044434,Y=9237.980469,Z=318.275238),ArriveTangent=(X=0.000000,Y=-247.733398,Z=0.000000),LeaveTangent=(X=0.000000,Y=-247.733398,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=394.000000,OutVal=(X=-3015.946289,Y=8373.996094,Z=314.177826),ArriveTangent=(X=0.000000,Y=-230.256027,Z=-1.697154),LeaveTangent=(X=0.000000,Y=-230.256027,Z=-1.697154),InterpMode=CIM_CurveAutoClamped),(InVal=397.000000,OutVal=(X=-3698.054688,Y=7856.444336,Z=308.092316),ArriveTangent=(X=-0.384857,Y=-214.497238,Z=-3.781040),LeaveTangent=(X=-0.384857,Y=-214.497238,Z=-3.781040),InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=(X=-3698.516602,Y=7087.012695,Z=285.513519),ArriveTangent=(X=0.000000,Y=-244.253738,Z=-17.188927),LeaveTangent=(X=0.000000,Y=-244.253738,Z=-17.188927),InterpMode=CIM_CurveAutoClamped),(InVal=403.000000,OutVal=(X=-3606.822266,Y=6390.921875,Z=-3.446930),ArriveTangent=(X=0.000000,Y=-73.423294,Z=-26.283529),LeaveTangent=(X=0.000000,Y=-73.423294,Z=-26.283529),InterpMode=CIM_CurveAutoClamped),(InVal=406.000000,OutVal=(X=-4142.348145,Y=6286.520996,Z=-39.860321),InterpMode=CIM_CurveAutoClamped),(InVal=409.000000,OutVal=(X=-4098.707520,Y=7010.953125,Z=-36.703400),ArriveTangent=(X=27.049847,Y=0.000000,Z=0.752606),LeaveTangent=(X=27.049847,Y=0.000000,Z=0.752606),InterpMode=CIM_CurveAutoClamped),(InVal=412.000000,OutVal=(X=-3938.217773,Y=6318.371582,Z=-35.252136),ArriveTangent=(X=62.461102,Y=0.000000,Z=1.157773),LeaveTangent=(X=62.461102,Y=0.000000,Z=1.157773),InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,OutVal=(X=-3723.940918,Y=6403.672852,Z=3.577545),ArriveTangent=(X=34.337669,Y=64.559837,Z=27.695581),LeaveTangent=(X=34.337669,Y=64.559837,Z=27.695581),InterpMode=CIM_CurveAutoClamped),(InVal=418.000000,OutVal=(X=-3669.535156,Y=7427.450684,Z=287.105682),ArriveTangent=(X=42.009445,Y=116.350479,Z=4.009708),LeaveTangent=(X=42.009445,Y=116.350479,Z=4.009708),InterpMode=CIM_CurveAutoClamped),(InVal=421.000000,OutVal=(X=-2841.037109,Y=7595.402344,Z=292.014740),ArriveTangent=(X=162.512207,Y=0.000000,Z=0.000000),LeaveTangent=(X=162.512207,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=424.000000,OutVal=(X=-2561.455566,Y=7375.684570,Z=287.338837),ArriveTangent=(X=105.368164,Y=-33.486580,Z=0.000000),LeaveTangent=(X=105.368164,Y=-33.486580,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=427.000000,OutVal=(X=-2208.828125,Y=7323.502441,Z=291.023041),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.027138),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.027138),InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=(X=-2334.780273,Y=8292.509766,Z=590.099609),ArriveTangent=(X=0.000000,Y=1.350830,Z=13.069759),LeaveTangent=(X=0.000000,Y=1.350830,Z=13.069759),InterpMode=CIM_CurveAutoClamped),(InVal=432.000000,OutVal=(X=-1768.083008,Y=8293.739258,Z=602.666016),ArriveTangent=(X=285.632996,Y=0.000000,Z=0.000000),LeaveTangent=(X=285.632996,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,OutVal=(X=-906.615234,Y=8256.402344,Z=601.198730),ArriveTangent=(X=0.000000,Y=-30.006439,Z=-1.090927),LeaveTangent=(X=0.000000,Y=-30.006439,Z=-1.090927),InterpMode=CIM_CurveAutoClamped),(InVal=438.000000,OutVal=(X=-1007.450684,Y=7054.822754,Z=586.406738),ArriveTangent=(X=-36.765789,Y=0.000000,Z=-4.466024),LeaveTangent=(X=-36.765789,Y=0.000000,Z=-4.466024),InterpMode=CIM_CurveAutoClamped),(InVal=441.000000,OutVal=(X=-1127.209961,Y=7351.586426,Z=574.402588),ArriveTangent=(X=-94.448532,Y=0.000000,Z=0.000000),LeaveTangent=(X=-94.448532,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=443.000000,OutVal=(X=-1832.605957,Y=7024.746094,Z=582.503662),ArriveTangent=(X=-14.325989,Y=0.000000,Z=0.000000),LeaveTangent=(X=-14.325989,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=446.000000,OutVal=(X=-1848.312012,Y=7272.326660,Z=576.696533),ArriveTangent=(X=0.000000,Y=136.275681,Z=0.000000),LeaveTangent=(X=0.000000,Y=136.275681,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=448.000000,OutVal=(X=-1326.338379,Y=7706.124512,Z=608.309570),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.311859),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.311859),InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=(X=-1383.548340,Y=6579.149414,Z=633.943970),ArriveTangent=(X=-53.000298,Y=-382.273071,Z=26.544958),LeaveTangent=(X=-53.000298,Y=-382.273071,Z=26.544958),InterpMode=CIM_CurveAutoClamped),(InVal=452.000000,OutVal=(X=-1591.191895,Y=6104.878906,Z=787.142090),ArriveTangent=(X=0.000000,Y=-254.068939,Z=0.000000),LeaveTangent=(X=0.000000,Y=-254.068939,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,OutVal=(X=-1489.948242,Y=5308.804688,Z=651.484863),ArriveTangent=(X=23.338379,Y=-211.593338,Z=-33.953411),LeaveTangent=(X=23.338379,Y=-211.593338,Z=-33.953411),InterpMode=CIM_CurveAutoClamped),(InVal=458.000000,OutVal=(X=-1445.972168,Y=4835.318848,Z=583.421631),ArriveTangent=(X=0.000000,Y=-229.374908,Z=-50.923691),LeaveTangent=(X=0.000000,Y=-229.374908,Z=-50.923691),InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,OutVal=(X=-1461.431641,Y=4161.930176,Z=284.697845),ArriveTangent=(X=0.000000,Y=-82.738274,Z=-9.103764),LeaveTangent=(X=0.000000,Y=-82.738274,Z=-9.103764),InterpMode=CIM_CurveAutoClamped),(InVal=463.000000,OutVal=(X=-886.972656,Y=4058.607422,Z=274.595917),ArriveTangent=(X=40.404190,Y=0.000000,Z=-4.205872),LeaveTangent=(X=40.404190,Y=0.000000,Z=-4.205872),InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=(X=-846.654297,Y=4471.484375,Z=263.668488),ArriveTangent=(X=46.842690,Y=0.000000,Z=-6.652344),LeaveTangent=(X=46.842690,Y=0.000000,Z=-6.652344),InterpMode=CIM_CurveAutoClamped),(InVal=467.000000,OutVal=(X=-206.236328,Y=4442.428223,Z=247.986542),ArriveTangent=(X=0.000000,Y=-34.375481,Z=0.000000),LeaveTangent=(X=0.000000,Y=-34.375481,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=469.000000,OutVal=(X=-365.571777,Y=3826.866699,Z=283.876190),InterpMode=CIM_CurveAutoClamped),(InVal=471.000000,OutVal=(X=49.307129,Y=3829.069092,Z=261.863068),ArriveTangent=(X=22.643143,Y=0.000000,Z=-22.832502),LeaveTangent=(X=22.643143,Y=0.000000,Z=-22.832502),InterpMode=CIM_CurveAutoClamped),(InVal=473.000000,OutVal=(X=68.421387,Y=3174.409180,Z=129.083038),ArriveTangent=(X=21.832180,Y=-35.672287,Z=0.000000),LeaveTangent=(X=21.832180,Y=-35.672287,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,OutVal=(X=313.684326,Y=3144.299072,Z=129.083038),ArriveTangent=(X=203.589722,Y=0.000000,Z=0.000000),LeaveTangent=(X=203.589722,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=477.000000,OutVal=(X=943.854980,Y=3214.119385,Z=-20.362000),ArriveTangent=(X=0.000000,Y=9.080800,Z=0.000000),LeaveTangent=(X=0.000000,Y=9.080800,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=479.000000,OutVal=(X=331.031250,Y=3222.444336,Z=102.710602),ArriveTangent=(X=-241.681885,Y=3.214111,Z=0.000000),LeaveTangent=(X=-241.681885,Y=3.214111,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=481.000000,OutVal=(X=-22.872559,Y=3226.975830,Z=102.710602),ArriveTangent=(X=0.000000,Y=5.232956,Z=0.000000),LeaveTangent=(X=0.000000,Y=5.232956,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=483.500000,OutVal=(X=41.796387,Y=3765.164063,Z=287.423798),ArriveTangent=(X=0.000000,Y=65.946022,Z=12.460466),LeaveTangent=(X=0.000000,Y=65.946022,Z=12.460466),InterpMode=CIM_CurveAutoClamped),(InVal=485.500000,OutVal=(X=-254.393066,Y=3830.846191,Z=298.972137),ArriveTangent=(X=-74.961609,Y=0.000000,Z=0.000000),LeaveTangent=(X=-74.961609,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=487.000000,OutVal=(X=-318.563477,Y=3379.878662,Z=294.782440),ArriveTangent=(X=-23.965071,Y=-344.482208,Z=0.000000),LeaveTangent=(X=-23.965071,Y=-344.482208,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=489.000000,OutVal=(X=-344.423828,Y=2625.158447,Z=300.054901),ArriveTangent=(X=-30.599899,Y=-87.980850,Z=0.000000),LeaveTangent=(X=-30.599899,Y=-87.980850,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=491.000000,OutVal=(X=-894.016113,Y=2545.738281,Z=280.387787),ArriveTangent=(X=-33.028793,Y=0.000000,Z=0.000000),LeaveTangent=(X=-33.028793,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=492.500000,OutVal=(X=-916.877930,Y=2929.076904,Z=281.138519),ArriveTangent=(X=-28.254425,Y=0.000000,Z=0.000000),LeaveTangent=(X=-28.254425,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=496.000000,OutVal=(X=-2352.184570,Y=2717.077393,Z=280.080780),InterpMode=CIM_CurveAutoClamped),(InVal=499.000000,OutVal=(X=-2320.069336,Y=4112.500488,Z=303.467438),ArriveTangent=(X=25.816208,Y=367.989594,Z=4.334988),LeaveTangent=(X=25.816208,Y=367.989594,Z=4.334988),InterpMode=CIM_CurveAutoClamped),(InVal=501.000000,OutVal=(X=-2105.034180,Y=4652.207031,Z=308.720795),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.604733),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.604733),InterpMode=CIM_CurveAutoClamped),(InVal=502.500000,OutVal=(X=-2762.826660,Y=4589.758789,Z=330.563019),ArriveTangent=(X=-64.450249,Y=-83.216064,Z=28.349678),LeaveTangent=(X=-64.450249,Y=-83.216064,Z=28.349678),InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,OutVal=(X=-2824.321777,Y=3178.883057,Z=674.685303),ArriveTangent=(X=-68.679726,Y=-87.170471,Z=0.000000),LeaveTangent=(X=-68.679726,Y=-87.170471,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=506.000000,OutVal=(X=-3286.086914,Y=3129.239502,Z=666.107910),ArriveTangent=(X=-213.953934,Y=0.000000,Z=-9.247263),LeaveTangent=(X=-213.953934,Y=0.000000,Z=-9.247263),InterpMode=CIM_CurveAutoClamped),(InVal=511.000000,OutVal=(X=-4108.045410,Y=5224.163574,Z=613.705811),ArriveTangent=(X=0.000000,Y=202.863235,Z=0.000000),LeaveTangent=(X=0.000000,Y=202.863235,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=514.000000,OutVal=(X=-3740.143555,Y=5585.476563,Z=645.036011),ArriveTangent=(X=0.000000,Y=141.369049,Z=0.748537),LeaveTangent=(X=0.000000,Y=141.369049,Z=0.748537),InterpMode=CIM_CurveAutoClamped),(InVal=516.000000,OutVal=(X=-4135.912598,Y=5931.008789,Z=645.737061),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.366150),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.366150),InterpMode=CIM_CurveAutoClamped),(InVal=518.000000,OutVal=(X=-3470.633789,Y=5863.512695,Z=646.500610),ArriveTangent=(X=334.706421,Y=0.000000,Z=0.000000),LeaveTangent=(X=334.706421,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,OutVal=(X=-2797.086914,Y=5997.004883,Z=446.540619),ArriveTangent=(X=185.676804,Y=0.000000,Z=-29.501503),LeaveTangent=(X=185.676804,Y=0.000000,Z=-29.501503),InterpMode=CIM_CurveAutoClamped),(InVal=522.000000,OutVal=(X=-2590.346191,Y=5815.714844,Z=418.932831),ArriveTangent=(X=0.000000,Y=-102.302002,Z=0.000000),LeaveTangent=(X=0.000000,Y=-102.302002,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=524.000000,OutVal=(X=-2746.396973,Y=5587.796875,Z=437.324799),ArriveTangent=(X=-37.432480,Y=-164.082153,Z=0.000000),LeaveTangent=(X=-37.432480,Y=-164.082153,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=526.000000,OutVal=(X=-2785.908203,Y=5159.386230,Z=326.680450),ArriveTangent=(X=0.000000,Y=-138.368347,Z=-12.195494),LeaveTangent=(X=0.000000,Y=-138.368347,Z=-12.195494),InterpMode=CIM_CurveAutoClamped),(InVal=528.000000,OutVal=(X=-2392.535645,Y=4992.721680,Z=315.750214),ArriveTangent=(X=305.360107,Y=0.000000,Z=-8.512826),LeaveTangent=(X=305.360107,Y=0.000000,Z=-8.512826),InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,OutVal=(X=-1541.096191,Y=5103.131836,Z=291.903717),ArriveTangent=(X=383.828247,Y=0.000000,Z=0.000000),LeaveTangent=(X=383.828247,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=532.000000,OutVal=(X=-857.222656,Y=5028.951172,Z=313.077362),ArriveTangent=(X=298.826782,Y=-56.634266,Z=0.000000),LeaveTangent=(X=298.826782,Y=-56.634266,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=534.000000,OutVal=(X=-345.789063,Y=4874.555176,Z=284.308563),InterpMode=CIM_CurveAutoClamped),(InVal=536.000000,OutVal=(X=-366.070801,Y=5257.195313,Z=289.950409),ArriveTangent=(X=0.000000,Y=224.007690,Z=0.000000),LeaveTangent=(X=0.000000,Y=224.007690,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=538.000000,OutVal=(X=-328.750488,Y=5770.585938,Z=74.781891),ArriveTangent=(X=0.000000,Y=25.405472,Z=-50.598885),LeaveTangent=(X=0.000000,Y=25.405472,Z=-50.598885),InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=(X=-843.213379,Y=5791.919922,Z=21.730255),ArriveTangent=(X=0.000000,Y=0.000000,Z=-20.031013),LeaveTangent=(X=0.000000,Y=0.000000,Z=-20.031013),InterpMode=CIM_CurveAutoClamped),(InVal=542.500000,OutVal=(X=-816.937012,Y=4842.458984,Z=-15.357666),InterpMode=CIM_CurveAutoClamped),(InVal=545.500000,OutVal=(X=-2307.975586,Y=5178.112305,Z=-14.181458),ArriveTangent=(X=-63.589447,Y=228.022369,Z=0.000000),LeaveTangent=(X=-63.589447,Y=228.022369,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=547.000000,OutVal=(X=-2358.089355,Y=5888.084961,Z=-22.434265),ArriveTangent=(X=0.000000,Y=429.917419,Z=-8.144273),LeaveTangent=(X=0.000000,Y=429.917419,Z=-8.144273),InterpMode=CIM_CurveAutoClamped),(InVal=549.000000,OutVal=(X=-2314.046875,Y=6682.823242,Z=-44.902100),ArriveTangent=(X=0.000000,Y=162.744308,Z=0.000000),LeaveTangent=(X=0.000000,Y=162.744308,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=551.000000,OutVal=(X=-3216.261719,Y=6846.495117,Z=-20.820160),ArriveTangent=(X=0.000000,Y=0.000000,Z=16.468925),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.468925),InterpMode=CIM_CurveAutoClamped),(InVal=553.000000,OutVal=(X=-3177.127930,Y=6080.385742,Z=20.973602),ArriveTangent=(X=9.651792,Y=-432.484009,Z=43.868744),LeaveTangent=(X=9.651792,Y=-432.484009,Z=43.868744),InterpMode=CIM_CurveAutoClamped),(InVal=555.000000,OutVal=(X=-3166.840332,Y=5116.559082,Z=291.226410),ArriveTangent=(X=13.535828,Y=-78.117264,Z=6.978523),LeaveTangent=(X=13.535828,Y=-78.117264,Z=6.978523),InterpMode=CIM_CurveAutoClamped),(InVal=556.500000,OutVal=(X=-2811.596680,Y=5061.403320,Z=295.908173),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.412071),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.412071),InterpMode=CIM_CurveAutoClamped),(InVal=559.000000,OutVal=(X=-2815.789063,Y=5886.775879,Z=487.179352),ArriveTangent=(X=0.000000,Y=335.442017,Z=0.000000),LeaveTangent=(X=0.000000,Y=335.442017,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=560.500000,OutVal=(X=-2801.979492,Y=6403.171387,Z=-48.138123),ArriveTangent=(X=20.297363,Y=290.354340,Z=0.000000),LeaveTangent=(X=20.297363,Y=290.354340,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=562.500000,OutVal=(X=-2311.862305,Y=6903.016113,Z=-19.873901),ArriveTangent=(X=268.181366,Y=45.334732,Z=0.000000),LeaveTangent=(X=268.181366,Y=45.334732,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=564.000000,OutVal=(X=-1863.344727,Y=6935.326172,Z=-32.018402),ArriveTangent=(X=374.272186,Y=9.564314,Z=0.000000),LeaveTangent=(X=374.272186,Y=9.564314,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=566.000000,OutVal=(X=-1001.909668,Y=6944.699707,Z=297.715729),ArriveTangent=(X=235.319565,Y=0.000000,Z=0.000000),LeaveTangent=(X=235.319565,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=568.000000,OutVal=(X=-740.909180,Y=6702.841797,Z=295.811615),ArriveTangent=(X=0.000000,Y=-223.907990,Z=0.000000),LeaveTangent=(X=0.000000,Y=-223.907990,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=570.500000,OutVal=(X=-908.054688,Y=5441.289063,Z=608.469971),ArriveTangent=(X=0.000000,Y=-124.404007,Z=0.000000),LeaveTangent=(X=0.000000,Y=-124.404007,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=572.000000,OutVal=(X=-647.420898,Y=5343.605469,Z=606.717285),ArriveTangent=(X=178.857101,Y=-41.913792,Z=-2.906448),LeaveTangent=(X=178.857101,Y=-41.913792,Z=-2.906448),InterpMode=CIM_CurveAutoClamped),(InVal=573.500000,OutVal=(X=-371.483398,Y=5305.820313,Z=234.687042),ArriveTangent=(X=1.897392,Y=0.000000,Z=-164.867126),LeaveTangent=(X=1.897392,Y=0.000000,Z=-164.867126),InterpMode=CIM_CurveAutoClamped),(InVal=576.000000,OutVal=(X=-369.824219,Y=6225.427734,Z=-52.751190),ArriveTangent=(X=1.565964,Y=96.607018,Z=0.000000),LeaveTangent=(X=1.565964,Y=96.607018,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=579.000000,OutVal=(X=541.739502,Y=6352.977539,Z=-20.914734),ArriveTangent=(X=211.044647,Y=0.000000,Z=9.956396),LeaveTangent=(X=211.044647,Y=0.000000,Z=9.956396),InterpMode=CIM_CurveAutoClamped),(InVal=581.000000,OutVal=(X=825.251465,Y=5813.941895,Z=-2.969208),ArriveTangent=(X=98.744919,Y=-371.021851,Z=0.000000),LeaveTangent=(X=98.744919,Y=-371.021851,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=583.000000,OutVal=(X=949.895020,Y=4868.890137,Z=-9.787506),ArriveTangent=(X=51.441650,Y=-295.587341,Z=-6.684296),LeaveTangent=(X=51.441650,Y=-295.587341,Z=-6.684296),InterpMode=CIM_CurveAutoClamped),(InVal=585.000000,OutVal=(X=1031.018066,Y=4519.158203,Z=-40.829895),ArriveTangent=(X=0.000000,Y=-217.220703,Z=-33.655811),LeaveTangent=(X=0.000000,Y=-217.220703,Z=-33.655811),InterpMode=CIM_CurveAutoClamped),(InVal=586.500000,OutVal=(X=984.815674,Y=4108.617676,Z=-180.014496),ArriveTangent=(X=-65.444031,Y=0.000000,Z=-6.989952),LeaveTangent=(X=-65.444031,Y=0.000000,Z=-6.989952),InterpMode=CIM_CurveAutoClamped),(InVal=588.500000,OutVal=(X=176.171875,Y=4346.048828,Z=-185.382111),ArriveTangent=(X=-53.091705,Y=0.000000,Z=0.000000),LeaveTangent=(X=-53.091705,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=(X=139.230957,Y=3544.050049,Z=-158.810364),ArriveTangent=(X=0.000000,Y=-201.513336,Z=35.089218),LeaveTangent=(X=0.000000,Y=-201.513336,Z=35.089218),InterpMode=CIM_CurveAutoClamped),(InVal=591.500000,OutVal=(X=963.727539,Y=3395.263428,Z=-32.131256),ArriveTangent=(X=508.951752,Y=-124.892090,Z=3.040733),LeaveTangent=(X=508.951752,Y=-124.892090,Z=3.040733),InterpMode=CIM_CurveAutoClamped),(InVal=592.500000,OutVal=(X=1411.610352,Y=3231.819824,Z=-30.728912),ArriveTangent=(X=469.563965,Y=0.000000,Z=0.000000),LeaveTangent=(X=469.563965,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=594.000000,OutVal=(X=2137.637451,Y=3392.951172,Z=-185.120026),ArriveTangent=(X=275.289825,Y=196.322113,Z=-35.021698),LeaveTangent=(X=275.289825,Y=196.322113,Z=-35.021698),InterpMode=CIM_CurveAutoClamped),(InVal=595.500000,OutVal=(X=2370.703125,Y=3949.841309,Z=-210.386078),ArriveTangent=(X=224.558105,Y=454.528320,Z=-39.619160),LeaveTangent=(X=224.558105,Y=454.528320,Z=-39.619160),InterpMode=CIM_CurveAutoClamped),(InVal=596.500000,OutVal=(X=2699.032715,Y=4529.271973,Z=-353.847626),ArriveTangent=(X=254.371216,Y=480.844482,Z=0.000000),LeaveTangent=(X=254.371216,Y=480.844482,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=597.500000,OutVal=(X=2879.445557,Y=4911.530273,Z=-347.076965),ArriveTangent=(X=287.782532,Y=154.644577,Z=0.000000),LeaveTangent=(X=287.782532,Y=154.644577,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=598.500000,OutVal=(X=3296.781250,Y=4989.036133,Z=-347.778870),ArriveTangent=(X=239.265930,Y=0.000000,Z=0.000000),LeaveTangent=(X=239.265930,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,OutVal=(X=3490.968994,Y=4271.661133,Z=-325.982178),ArriveTangent=(X=280.528778,Y=-56.044922,Z=0.000000),LeaveTangent=(X=280.528778,Y=-56.044922,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=601.000000,OutVal=(X=4215.321777,Y=4244.885742,Z=-338.114746),ArriveTangent=(X=385.167603,Y=0.000000,Z=0.000000),LeaveTangent=(X=385.167603,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=602.000000,OutVal=(X=4426.543457,Y=4930.925781,Z=-309.562561),ArriveTangent=(X=415.919189,Y=32.824707,Z=63.288704),LeaveTangent=(X=415.919189,Y=32.824707,Z=63.288704),InterpMode=CIM_CurveAutoClamped),(InVal=603.000000,OutVal=(X=5406.742188,Y=4944.357422,Z=-37.163055),ArriveTangent=(X=651.896484,Y=0.000000,Z=15.947151),LeaveTangent=(X=651.896484,Y=0.000000,Z=15.947151),InterpMode=CIM_CurveAutoClamped),(InVal=604.500000,OutVal=(X=6056.284668,Y=3994.689697,Z=-28.327942),ArriveTangent=(X=557.224609,Y=-41.298279,Z=4.676768),LeaveTangent=(X=557.224609,Y=-41.298279,Z=4.676768),InterpMode=CIM_CurveAutoClamped),(InVal=606.000000,OutVal=(X=7078.416016,Y=3969.120850,Z=-23.132751),ArriveTangent=(X=540.857239,Y=-39.004097,Z=0.000000),LeaveTangent=(X=540.857239,Y=-39.004097,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=607.500000,OutVal=(X=7678.856445,Y=3634.746582,Z=-29.177917),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.272120),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.272120),InterpMode=CIM_CurveAutoClamped),(InVal=609.000000,OutVal=(X=7559.726563,Y=4053.916504,Z=-49.176117),ArriveTangent=(X=-169.073654,Y=0.000000,Z=0.000000),LeaveTangent=(X=-169.073654,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=610.500000,OutVal=(X=6718.833008,Y=4003.288574,Z=-31.037659),ArriveTangent=(X=-668.347168,Y=0.000000,Z=0.000000),LeaveTangent=(X=-668.347168,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=612.000000,OutVal=(X=5554.685059,Y=4907.403320,Z=-34.930023),ArriveTangent=(X=-756.528076,Y=105.417725,Z=-7.631926),LeaveTangent=(X=-756.528076,Y=105.417725,Z=-7.631926),InterpMode=CIM_CurveAutoClamped),(InVal=612.500000,OutVal=(X=5187.890137,Y=4939.383789,Z=-68.605499),ArriveTangent=(X=-742.800537,Y=0.000000,Z=-111.151711),LeaveTangent=(X=-742.800537,Y=0.000000,Z=-111.151711),InterpMode=CIM_CurveAutoClamped),(InVal=613.500000,OutVal=(X=4440.322754,Y=4912.946289,Z=-323.317993),ArriveTangent=(X=-740.776367,Y=0.000000,Z=0.000000),LeaveTangent=(X=-740.776367,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=614.500000,OutVal=(X=3706.337402,Y=5391.804688,Z=-308.049316),ArriveTangent=(X=-12.298950,Y=722.656677,Z=35.963875),LeaveTangent=(X=-12.298950,Y=722.656677,Z=35.963875),InterpMode=CIM_CurveAutoClamped),(InVal=615.500000,OutVal=(X=3701.380859,Y=6362.004883,Z=-9.477722),ArriveTangent=(X=0.000000,Y=937.819031,Z=58.917847),LeaveTangent=(X=0.000000,Y=937.819031,Z=58.917847),InterpMode=CIM_CurveAutoClamped),(InVal=617.500000,OutVal=(X=3759.264160,Y=8205.261719,Z=35.718781),ArriveTangent=(X=0.000000,Y=477.208313,Z=5.180265),LeaveTangent=(X=0.000000,Y=477.208313,Z=5.180265),InterpMode=CIM_CurveAutoClamped),(InVal=619.000000,OutVal=(X=3707.687500,Y=8616.945313,Z=39.499664),ArriveTangent=(X=-54.668663,Y=0.000000,Z=2.519796),LeaveTangent=(X=-54.668663,Y=0.000000,Z=2.519796),InterpMode=CIM_CurveAutoClamped),(InVal=620.500000,OutVal=(X=3589.355469,Y=7212.700195,Z=43.278168),ArriveTangent=(X=0.000000,Y=-927.001160,Z=0.000000),LeaveTangent=(X=0.000000,Y=-927.001160,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=621.500000,OutVal=(X=3682.276367,Y=6299.442383,Z=-13.622406),ArriveTangent=(X=0.000000,Y=-923.781616,Z=-99.839333),LeaveTangent=(X=0.000000,Y=-923.781616,Z=-99.839333),InterpMode=CIM_CurveAutoClamped),(InVal=623.000000,OutVal=(X=3419.716309,Y=4903.246094,Z=-339.352356),ArriveTangent=(X=-374.645416,Y=-118.468750,Z=-10.449066),LeaveTangent=(X=-374.645416,Y=-118.468750,Z=-10.449066),InterpMode=CIM_CurveAutoClamped),(InVal=624.000000,OutVal=(X=2490.264648,Y=4846.391113,Z=-344.196167),ArriveTangent=(X=-700.966309,Y=-114.798096,Z=-4.956512),LeaveTangent=(X=-700.966309,Y=-114.798096,Z=-4.956512),InterpMode=CIM_CurveAutoClamped),(InVal=625.000000,OutVal=(X=2017.783691,Y=4549.289063,Z=-349.265381),ArriveTangent=(X=-530.558716,Y=0.000000,Z=0.000000),LeaveTangent=(X=-530.558716,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=626.000000,OutVal=(X=1429.147217,Y=5125.144043,Z=-346.916321),ArriveTangent=(X=0.000000,Y=823.779602,Z=0.000000),LeaveTangent=(X=0.000000,Y=823.779602,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=626.500000,OutVal=(X=1436.530029,Y=5784.958496,Z=-507.104279),ArriveTangent=(X=9.996778,Y=1000.923462,Z=0.000000),LeaveTangent=(X=9.996778,Y=1000.923462,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=628.500000,OutVal=(X=1454.139160,Y=7627.452637,Z=-504.818665),ArriveTangent=(X=23.543579,Y=196.561920,Z=2.673465),LeaveTangent=(X=23.543579,Y=196.561920,Z=2.673465),InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=(X=2696.135742,Y=7769.773926,Z=-488.879639),ArriveTangent=(X=62.101929,Y=0.000000,Z=20.925842),LeaveTangent=(X=62.101929,Y=0.000000,Z=20.925842),InterpMode=CIM_CurveAutoClamped),(InVal=631.000000,OutVal=(X=2725.258789,Y=7267.364258,Z=-447.323181),ArriveTangent=(X=16.839666,Y=-681.794189,Z=80.502205),LeaveTangent=(X=16.839666,Y=-681.794189,Z=80.502205),InterpMode=CIM_CurveAutoClamped),(InVal=632.500000,OutVal=(X=2738.989746,Y=5982.493652,Z=-16.218109),ArriveTangent=(X=0.000000,Y=-236.514252,Z=0.000000),LeaveTangent=(X=0.000000,Y=-236.514252,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=633.500000,OutVal=(X=1884.130615,Y=5860.647461,Z=-18.757690),ArriveTangent=(X=-523.458984,Y=0.000000,Z=0.000000),LeaveTangent=(X=-523.458984,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,OutVal=(X=1430.342285,Y=6831.054688,Z=1.403351),ArriveTangent=(X=-350.785553,Y=103.417435,Z=10.177907),LeaveTangent=(X=-350.785553,Y=103.417435,Z=10.177907),InterpMode=CIM_CurveAutoClamped),(InVal=636.500000,OutVal=(X=831.773926,Y=6898.299316,Z=11.776031),ArriveTangent=(X=-536.760925,Y=0.000000,Z=8.796509),LeaveTangent=(X=-536.760925,Y=0.000000,Z=8.796509),InterpMode=CIM_CurveAutoClamped),(InVal=638.000000,OutVal=(X=-179.940430,Y=6099.946289,Z=27.792877),ArriveTangent=(X=-318.539734,Y=-585.030457,Z=25.016151),LeaveTangent=(X=-318.539734,Y=-585.030457,Z=25.016151),InterpMode=CIM_CurveAutoClamped),(InVal=639.500000,OutVal=(X=-430.773926,Y=5143.208008,Z=314.848236),ArriveTangent=(X=-260.353455,Y=-705.474182,Z=3.697639),LeaveTangent=(X=-260.353455,Y=-705.474182,Z=3.697639),InterpMode=CIM_CurveAutoClamped),(InVal=641.000000,OutVal=(X=-977.395996,Y=3983.523682,Z=317.086273),ArriveTangent=(X=-519.347473,Y=0.000000,Z=0.000000),LeaveTangent=(X=-519.347473,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=642.500000,OutVal=(X=-1988.816406,Y=4047.381592,Z=316.465057),ArriveTangent=(X=-475.303589,Y=92.613129,Z=-0.973311),LeaveTangent=(X=-475.303589,Y=92.613129,Z=-0.973311),InterpMode=CIM_CurveAutoClamped),(InVal=644.000000,OutVal=(X=-2442.445801,Y=4571.668457,Z=304.758392),ArriveTangent=(X=-315.362885,Y=0.000000,Z=0.000000),LeaveTangent=(X=-315.362885,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=645.000000,OutVal=(X=-2777.223633,Y=4398.473633,Z=340.954376),ArriveTangent=(X=-20.295113,Y=-284.238434,Z=59.705997),LeaveTangent=(X=-20.295113,Y=-284.238434,Z=59.705997),InterpMode=CIM_CurveAutoClamped),(InVal=647.000000,OutVal=(X=-2791.313965,Y=3126.340820,Z=614.011597),ArriveTangent=(X=-18.845367,Y=0.000000,Z=11.686981),LeaveTangent=(X=-18.845367,Y=0.000000,Z=11.686981),InterpMode=CIM_CurveAutoClamped),(InVal=648.500000,OutVal=(X=-3807.576660,Y=3305.037842,Z=621.973022),ArriveTangent=(X=-520.934875,Y=78.311913,Z=3.945171),LeaveTangent=(X=-520.934875,Y=78.311913,Z=3.945171),InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=(X=-4354.118652,Y=3376.509277,Z=625.887939),InterpMode=CIM_CurveAutoClamped),(InVal=651.000000,OutVal=(X=-4318.976074,Y=3039.154785,Z=612.966309),ArriveTangent=(X=0.000000,Y=-424.402313,Z=-24.928249),LeaveTangent=(X=0.000000,Y=-424.402313,Z=-24.928249),InterpMode=CIM_CurveAutoClamped),(InVal=652.500000,OutVal=(X=-4489.929199,Y=2302.391113,Z=483.234467),ArriveTangent=(X=-148.283859,Y=0.000000,Z=-57.782322),LeaveTangent=(X=-148.283859,Y=0.000000,Z=-57.782322),InterpMode=CIM_CurveAutoClamped),(InVal=654.000000,OutVal=(X=-4763.827637,Y=2645.675293,Z=429.980194),ArriveTangent=(X=0.000000,Y=395.554626,Z=-72.544189),LeaveTangent=(X=0.000000,Y=395.554626,Z=-72.544189),InterpMode=CIM_CurveAutoClamped),(InVal=655.500000,OutVal=(X=-4711.057129,Y=3635.827637,Z=134.185516),ArriveTangent=(X=77.954033,Y=127.886353,Z=0.000000),LeaveTangent=(X=77.954033,Y=127.886353,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=657.000000,OutVal=(X=-4209.078613,Y=3720.525635,Z=143.770050),InterpMode=CIM_CurveAutoClamped),(InVal=658.500000,OutVal=(X=-4295.149902,Y=2881.562988,Z=-14.680389),ArriveTangent=(X=-18.919432,Y=-530.707336,Z=0.000000),LeaveTangent=(X=-18.919432,Y=-530.707336,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,OutVal=(X=-4308.710449,Y=2128.403564,Z=-7.487305),ArriveTangent=(X=-19.937790,Y=-592.338135,Z=0.000000),LeaveTangent=(X=-19.937790,Y=-592.338135,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=661.500000,OutVal=(X=-4432.687012,Y=1104.548584,Z=-25.457794),ArriveTangent=(X=0.000000,Y=-707.996521,Z=-0.688409),LeaveTangent=(X=0.000000,Y=-707.996521,Z=-0.688409),InterpMode=CIM_CurveAutoClamped),(InVal=663.000000,OutVal=(X=-4194.188965,Y=4.414063,Z=-25.882355),ArriveTangent=(X=326.328644,Y=-300.512421,Z=0.000000),LeaveTangent=(X=326.328644,Y=-300.512421,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=664.500000,OutVal=(X=-2837.930664,Y=-222.282715,Z=-5.657928),ArriveTangent=(X=586.684998,Y=-83.729454,Z=0.000000),LeaveTangent=(X=586.684998,Y=-83.729454,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=666.500000,OutVal=(X=-2140.791504,Y=-312.143066,Z=-12.076294),ArriveTangent=(X=350.887543,Y=0.000000,Z=0.000000),LeaveTangent=(X=350.887543,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=668.000000,OutVal=(X=-1609.824219,Y=302.390625,Z=17.498260),ArriveTangent=(X=425.844452,Y=0.000000,Z=0.000000),LeaveTangent=(X=425.844452,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=(X=-650.335938,Y=298.807617,Z=-12.136841),ArriveTangent=(X=0.000000,Y=-5.321548,Z=0.000000),LeaveTangent=(X=0.000000,Y=-5.321548,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=671.000000,OutVal=(X=-671.713867,Y=-38.478760,Z=9.044800),ArriveTangent=(X=0.000000,Y=-11.669197,Z=3.578946),LeaveTangent=(X=0.000000,Y=-11.669197,Z=3.578946),InterpMode=CIM_CurveAutoClamped),(InVal=673.000000,OutVal=(X=-218.949707,Y=-46.436523,Z=11.731750),ArriveTangent=(X=438.706360,Y=-8.558373,Z=0.000000),LeaveTangent=(X=438.706360,Y=-8.558373,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=674.500000,OutVal=(X=1075.687988,Y=-80.770752,Z=-17.084412),ArriveTangent=(X=56.570496,Y=-51.140236,Z=-15.649974),LeaveTangent=(X=56.570496,Y=-51.140236,Z=-15.649974),InterpMode=CIM_CurveAutoClamped),(InVal=676.000000,OutVal=(X=1110.717773,Y=-432.199707,Z=-35.218170),ArriveTangent=(X=48.340481,Y=-330.162354,Z=-28.259361),LeaveTangent=(X=48.340481,Y=-330.162354,Z=-28.259361),InterpMode=CIM_CurveAutoClamped),(InVal=677.500000,OutVal=(X=1319.460205,Y=-1071.257813,Z=-349.283203),ArriveTangent=(X=220.469879,Y=-333.126709,Z=0.000000),LeaveTangent=(X=220.469879,Y=-333.126709,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=(X=2267.586914,Y=-1764.706543,Z=-314.569763),ArriveTangent=(X=361.763184,Y=-271.997498,Z=25.751978),LeaveTangent=(X=361.763184,Y=-271.997498,Z=25.751978),InterpMode=CIM_CurveAutoClamped),(InVal=682.000000,OutVal=(X=2947.394531,Y=-2295.246582,Z=-221.175110),ArriveTangent=(X=259.467529,Y=-418.901917,Z=27.234236),LeaveTangent=(X=259.467529,Y=-418.901917,Z=27.234236),InterpMode=CIM_CurveAutoClamped),(InVal=683.500000,OutVal=(X=3220.082275,Y=-3230.863281,Z=-196.581421),ArriveTangent=(X=342.032318,Y=0.000000,Z=13.181895),LeaveTangent=(X=342.032318,Y=0.000000,Z=13.181895),InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,OutVal=(X=4268.063477,Y=-3176.764648,Z=-181.629425),ArriveTangent=(X=175.983032,Y=83.203445,Z=0.000000),LeaveTangent=(X=175.983032,Y=83.203445,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=686.500000,OutVal=(X=4388.490723,Y=-2395.638184,Z=-187.772278),ArriveTangent=(X=166.087280,Y=371.140930,Z=-9.781284),LeaveTangent=(X=166.087280,Y=371.140930,Z=-9.781284),InterpMode=CIM_CurveAutoClamped),(InVal=688.000000,OutVal=(X=5103.700195,Y=-2038.686523,Z=-344.810425),ArriveTangent=(X=502.421051,Y=231.061356,Z=0.000000),LeaveTangent=(X=502.421051,Y=231.061356,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=689.500000,OutVal=(X=5895.753906,Y=-1702.454102,Z=-340.925598),ArriveTangent=(X=297.756653,Y=308.666504,Z=5.549951),LeaveTangent=(X=297.756653,Y=308.666504,Z=5.549951),InterpMode=CIM_CurveAutoClamped),(InVal=691.000000,OutVal=(X=6146.868652,Y=-1112.687012,Z=-312.275024),ArriveTangent=(X=120.611351,Y=468.519531,Z=42.653358),LeaveTangent=(X=120.611351,Y=468.519531,Z=42.653358),InterpMode=CIM_CurveAutoClamped),(InVal=692.500000,OutVal=(X=6263.771973,Y=-296.895508,Z=-20.350403),ArriveTangent=(X=0.000000,Y=329.536102,Z=7.392319),LeaveTangent=(X=0.000000,Y=329.536102,Z=7.392319),InterpMode=CIM_CurveAutoClamped),(InVal=694.000000,OutVal=(X=6226.431641,Y=-9.306885,Z=-15.835114),InterpMode=CIM_CurveAutoClamped),(InVal=695.500000,OutVal=(X=6268.056641,Y=-511.447266,Z=-16.300781),ArriveTangent=(X=0.000000,Y=-382.913177,Z=-0.775200),LeaveTangent=(X=0.000000,Y=-382.913177,Z=-0.775200),InterpMode=CIM_CurveAutoClamped),(InVal=697.000000,OutVal=(X=5786.683594,Y=-1158.046387,Z=-331.152740),ArriveTangent=(X=-435.707031,Y=0.000000,Z=0.000000),LeaveTangent=(X=-435.707031,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=698.500000,OutVal=(X=4960.935547,Y=-879.102539,Z=-315.644714),ArriveTangent=(X=-454.439117,Y=0.000000,Z=0.000000),LeaveTangent=(X=-454.439117,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,OutVal=(X=4423.366211,Y=-1068.797363,Z=-317.589508),ArriveTangent=(X=-266.234711,Y=-147.080566,Z=-2.734783),LeaveTangent=(X=-266.234711,Y=-147.080566,Z=-2.734783),InterpMode=CIM_CurveAutoClamped),(InVal=701.500000,OutVal=(X=4159.289551,Y=-1320.344238,Z=-330.536011),ArriveTangent=(X=0.000000,Y=-150.094406,Z=0.000000),LeaveTangent=(X=0.000000,Y=-150.094406,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=703.000000,OutVal=(X=4571.697266,Y=-1519.080566,Z=-325.166016),ArriveTangent=(X=0.000000,Y=-235.664871,Z=8.568020),LeaveTangent=(X=0.000000,Y=-235.664871,Z=8.568020),InterpMode=CIM_CurveAutoClamped),(InVal=704.500000,OutVal=(X=4465.992676,Y=-2146.057129,Z=-181.493713),ArriveTangent=(X=-147.923737,Y=-295.914825,Z=0.000000),LeaveTangent=(X=-147.923737,Y=-295.914825,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=706.000000,OutVal=(X=3782.834473,Y=-2429.325684,Z=-190.845642),ArriveTangent=(X=-541.712402,Y=-77.061218,Z=0.000000),LeaveTangent=(X=-541.712402,Y=-77.061218,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=707.500000,OutVal=(X=2840.855469,Y=-2487.393555,Z=-177.761230),ArriveTangent=(X=-493.163086,Y=0.000000,Z=0.000000),LeaveTangent=(X=-493.163086,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=709.000000,OutVal=(X=2303.345215,Y=-1908.863281,Z=-346.507935),ArriveTangent=(X=0.000000,Y=311.374664,Z=0.000000),LeaveTangent=(X=0.000000,Y=311.374664,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=710.500000,OutVal=(X=2730.378418,Y=-1553.269531,Z=-317.019592),ArriveTangent=(X=284.933441,Y=166.190613,Z=0.000000),LeaveTangent=(X=284.933441,Y=166.190613,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=712.000000,OutVal=(X=3158.145508,Y=-1395.254395,Z=-320.823364),ArriveTangent=(X=0.000000,Y=208.505951,Z=0.000000),LeaveTangent=(X=0.000000,Y=208.505951,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=713.500000,OutVal=(X=2971.099609,Y=-644.583008,Z=-309.704224),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.748726),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.748726),InterpMode=CIM_CurveAutoClamped),(InVal=715.000000,OutVal=(X=3913.344971,Y=-860.922119,Z=-9.205750),ArriveTangent=(X=281.976715,Y=0.000000,Z=0.000000),LeaveTangent=(X=281.976715,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=716.000000,OutVal=(X=4073.007813,Y=-763.686768,Z=-13.041748),ArriveTangent=(X=0.000000,Y=166.936401,Z=0.000000),LeaveTangent=(X=0.000000,Y=166.936401,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=717.000000,OutVal=(X=4043.196045,Y=-488.795166,Z=-6.824799),ArriveTangent=(X=-21.165043,Y=361.578735,Z=3.759038),LeaveTangent=(X=-21.165043,Y=361.578735,Z=3.759038),InterpMode=CIM_CurveAutoClamped),(InVal=718.000000,OutVal=(X=4029.662354,Y=-40.529297,Z=-4.640106),ArriveTangent=(X=-33.065491,Y=420.493896,Z=3.514211),LeaveTangent=(X=-33.065491,Y=420.493896,Z=3.514211),InterpMode=CIM_CurveAutoClamped),(InVal=719.000000,OutVal=(X=3346.112061,Y=352.192627,Z=0.522430),ArriveTangent=(X=0.000000,Y=515.983032,Z=0.000000),LeaveTangent=(X=0.000000,Y=515.983032,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=(X=3349.863770,Y=991.436768,Z=-8.951355),ArriveTangent=(X=0.000000,Y=587.872192,Z=-15.273941),LeaveTangent=(X=0.000000,Y=587.872192,Z=-15.273941),InterpMode=CIM_CurveAutoClamped),(InVal=721.000000,OutVal=(X=3333.535156,Y=1527.937012,Z=-31.469910),ArriveTangent=(X=-32.824551,Y=0.000000,Z=0.000000),LeaveTangent=(X=-32.824551,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=722.000000,OutVal=(X=3250.048096,Y=1431.718872,Z=-28.808228),ArriveTangent=(X=0.000000,Y=-144.883362,Z=5.679645),LeaveTangent=(X=0.000000,Y=-144.883362,Z=5.679645),InterpMode=CIM_CurveAutoClamped),(InVal=723.000000,OutVal=(X=3788.951172,Y=1237.752075,Z=-9.728790),ArriveTangent=(X=693.174927,Y=-129.560043,Z=0.000000),LeaveTangent=(X=693.174927,Y=-129.560043,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=724.000000,OutVal=(X=4636.397949,Y=1158.158081,Z=-320.741394),ArriveTangent=(X=695.223267,Y=-100.738174,Z=0.000000),LeaveTangent=(X=695.223267,Y=-100.738174,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=725.500000,OutVal=(X=5527.009277,Y=982.265137,Z=-320.375977),InterpMode=CIM_CurveAutoClamped),(InVal=727.000000,OutVal=(X=5374.880371,Y=1921.720215,Z=-327.582336),ArriveTangent=(X=-155.217560,Y=300.675354,Z=0.000000),LeaveTangent=(X=-155.217560,Y=300.675354,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=728.500000,OutVal=(X=5056.544434,Y=2159.806396,Z=-318.898071),ArriveTangent=(X=-356.771851,Y=0.000000,Z=8.658589),LeaveTangent=(X=-356.771851,Y=0.000000,Z=8.658589),InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=(X=4209.626953,Y=1838.433350,Z=-301.606567),ArriveTangent=(X=-336.407288,Y=0.000000,Z=0.000000),LeaveTangent=(X=-336.407288,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=731.500000,OutVal=(X=3918.497803,Y=2303.546875,Z=-308.056519),ArriveTangent=(X=-259.636719,Y=0.000000,Z=-1.209957),LeaveTangent=(X=-259.636719,Y=0.000000,Z=-1.209957),InterpMode=CIM_CurveAutoClamped),(InVal=733.000000,OutVal=(X=3430.716797,Y=2049.513184,Z=-308.898865),ArriveTangent=(X=-299.459076,Y=-137.841675,Z=-0.703522),LeaveTangent=(X=-299.459076,Y=-137.841675,Z=-0.703522),InterpMode=CIM_CurveAutoClamped),(InVal=734.500000,OutVal=(X=3020.120605,Y=1890.021851,Z=-310.167084),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.578185),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.578185),InterpMode=CIM_CurveAutoClamped),(InVal=736.000000,OutVal=(X=3308.929443,Y=1924.504395,Z=-314.897522),ArriveTangent=(X=223.786301,Y=53.299423,Z=-5.990335),LeaveTangent=(X=223.786301,Y=53.299423,Z=-5.990335),InterpMode=CIM_CurveAutoClamped),(InVal=737.500000,OutVal=(X=3691.479492,Y=2455.993408,Z=-333.764526),ArriveTangent=(X=0.000000,Y=371.432953,Z=0.000000),LeaveTangent=(X=0.000000,Y=371.432953,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=739.000000,OutVal=(X=3686.014404,Y=3038.803223,Z=-328.253326),ArriveTangent=(X=0.000000,Y=569.093689,Z=3.703288),LeaveTangent=(X=0.000000,Y=569.093689,Z=3.703288),InterpMode=CIM_CurveAutoClamped),(InVal=740.500000,OutVal=(X=3729.352539,Y=4163.274414,Z=-322.654663),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.000000,Y=-0.878906,Z=-82.968750),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.000000,Y=1.054688,Z=45.351563),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=-1.054688,Z=4.218750),ArriveTangent=(X=0.000000,Y=-0.242871,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.242871,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.000000,Y=-1.406250,Z=90.175781),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=2.285156,Z=-31.464844),ArriveTangent=(X=0.000000,Y=1.025391,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.025391,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=0.000000,Y=4.746094,Z=-3.164063),ArriveTangent=(X=0.000000,Y=0.000000,Z=16.997589),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.997589),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=0.000000,Y=-0.175781,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.000000,OutVal=(X=0.000000,Y=0.703125,Z=-69.082031),ArriveTangent=(X=0.000000,Y=0.450073,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.450073,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=28.000000,OutVal=(X=0.000000,Y=3.339844,Z=4.042969),ArriveTangent=(X=0.000000,Y=0.000000,Z=19.531250),LeaveTangent=(X=0.000000,Y=0.000000,Z=19.531250),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=0.000000,Y=0.703125,Z=106.699219),ArriveTangent=(X=0.000000,Y=-0.449219,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.449219,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=37.000000,OutVal=(X=0.000000,Y=-0.703125,Z=103.535156),ArriveTangent=(X=0.000000,Y=-0.195047,Z=-1.410457),LeaveTangent=(X=0.000000,Y=-0.195047,Z=-1.410457),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=0.000000,Y=-1.230469,Z=89.472656),ArriveTangent=(X=0.000000,Y=-0.208404,Z=-6.548577),LeaveTangent=(X=0.000000,Y=-0.208404,Z=-6.548577),InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=(X=0.000000,Y=-2.460938,Z=26.542969),InterpMode=CIM_CurveAutoClamped),(InVal=48.000000,OutVal=(X=0.000000,Y=3.867188,Z=65.390625),InterpMode=CIM_CurveAutoClamped),(InVal=51.000000,OutVal=(X=0.000000,Y=0.878906,Z=-21.796875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-23.466797),LeaveTangent=(X=0.000000,Y=0.000000,Z=-23.466797),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=0.000000,Y=3.691406,Z=-75.410156),ArriveTangent=(X=0.000000,Y=1.201172,Z=-5.046860),LeaveTangent=(X=0.000000,Y=1.201172,Z=-5.046860),InterpMode=CIM_CurveAutoClamped),(InVal=57.000000,OutVal=(X=0.000000,Y=8.085938,Z=-82.441406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.757813),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.757813),InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=(X=0.000000,Y=-17.753906,Z=-85.957031),InterpMode=CIM_CurveAutoClamped),(InVal=63.000000,OutVal=(X=0.000000,Y=3.164063,Z=-0.878906),ArriveTangent=(X=0.000000,Y=0.000000,Z=25.839844),LeaveTangent=(X=0.000000,Y=0.000000,Z=25.839844),InterpMode=CIM_CurveAutoClamped),(InVal=66.000000,OutVal=(X=0.000000,Y=2.636719,Z=69.082031),ArriveTangent=(X=0.000000,Y=-0.234375,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.234375,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=69.000000,OutVal=(X=0.000000,Y=1.757813,Z=4.570313),InterpMode=CIM_CurveAutoClamped),(InVal=72.000000,OutVal=(X=0.000000,Y=2.460938,Z=83.144531),ArriveTangent=(X=0.000000,Y=0.205078,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.205078,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=0.000000,Y=2.988281,Z=0.527344),ArriveTangent=(X=0.000000,Y=0.000000,Z=-42.784943),LeaveTangent=(X=0.000000,Y=0.000000,Z=-42.784943),InterpMode=CIM_CurveAutoClamped),(InVal=78.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-178.593750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-48.339844),LeaveTangent=(X=0.000000,Y=0.000000,Z=-48.339844),InterpMode=CIM_CurveAutoClamped),(InVal=81.000000,OutVal=(X=0.000000,Y=4.746094,Z=-289.511719),InterpMode=CIM_CurveAutoClamped),(InVal=84.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-172.441406),ArriveTangent=(X=0.000000,Y=-1.547166,Z=22.422680),LeaveTangent=(X=0.000000,Y=-1.547166,Z=22.422680),InterpMode=CIM_CurveAutoClamped),(InVal=87.000000,OutVal=(X=0.000000,Y=-9.843750,Z=-134.296875),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.713047),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.713047),InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-133.417969),ArriveTangent=(X=0.000000,Y=1.504017,Z=0.688428),LeaveTangent=(X=0.000000,Y=1.504017,Z=0.688428),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=0.000000,Y=0.175781,Z=-116.894531),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.232422),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.232422),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=0.000000,Y=0.175781,Z=-84.023438),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.504767),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.504767),InterpMode=CIM_CurveAutoClamped),(InVal=99.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-82.089844),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.557138),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.557138),InterpMode=CIM_CurveAutoClamped),(InVal=102.000000,OutVal=(X=0.000000,Y=7.734375,Z=-16.171875),InterpMode=CIM_CurveAutoClamped),(InVal=105.000000,OutVal=(X=0.000000,Y=-2.109375,Z=-97.207031),ArriveTangent=(X=0.000000,Y=-2.871094,Z=-28.095703),LeaveTangent=(X=0.000000,Y=-2.871094,Z=-28.095703),InterpMode=CIM_CurveAutoClamped),(InVal=108.000000,OutVal=(X=0.000000,Y=-9.492188,Z=-184.746094),ArriveTangent=(X=0.000000,Y=-1.875000,Z=-30.615234),LeaveTangent=(X=0.000000,Y=-1.875000,Z=-30.615234),InterpMode=CIM_CurveAutoClamped),(InVal=111.000000,OutVal=(X=0.000000,Y=-13.359375,Z=-280.898438),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.381683),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.381683),InterpMode=CIM_CurveAutoClamped),(InVal=114.000000,OutVal=(X=0.000000,Y=-0.878906,Z=-309.726563),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=0.000000,Y=-1.054688,Z=-296.718750),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.625000),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=(X=0.000000,Y=0.351563,Z=-275.976563),InterpMode=CIM_CurveAutoClamped),(InVal=123.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-343.828125),InterpMode=CIM_CurveAutoClamped),(InVal=126.000000,OutVal=(X=0.000000,Y=-1.406250,Z=-323.437500),ArriveTangent=(X=0.000000,Y=0.281356,Z=11.431380),LeaveTangent=(X=0.000000,Y=0.281356,Z=11.431380),InterpMode=CIM_CurveAutoClamped),(InVal=129.000000,OutVal=(X=0.000000,Y=-0.175781,Z=-269.121094),ArriveTangent=(X=0.000000,Y=0.615234,Z=18.310547),LeaveTangent=(X=0.000000,Y=0.615234,Z=18.310547),InterpMode=CIM_CurveAutoClamped),(InVal=132.000000,OutVal=(X=0.000000,Y=2.285156,Z=-213.574219),ArriveTangent=(X=0.000000,Y=0.000000,Z=15.732422),LeaveTangent=(X=0.000000,Y=0.000000,Z=15.732422),InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=(X=0.000000,Y=0.878906,Z=-174.726563),ArriveTangent=(X=0.000000,Y=-0.380859,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.380859,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=0.000000,Y=0.000000,Z=-178.769531),InterpMode=CIM_CurveAutoClamped),(InVal=141.000000,OutVal=(X=0.000000,Y=0.878906,Z=-168.398438),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.273711),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.273711),InterpMode=CIM_CurveAutoClamped),(InVal=144.000000,OutVal=(X=0.000000,Y=0.175781,Z=-133.417969),ArriveTangent=(X=0.000000,Y=-0.205078,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.205078,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=147.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-180.000000),ArriveTangent=(X=0.000000,Y=-0.146484,Z=-9.708738),LeaveTangent=(X=0.000000,Y=-0.146484,Z=-9.708738),InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=(X=0.000000,Y=-0.703125,Z=-197.226563),InterpMode=CIM_CurveAutoClamped),(InVal=153.000000,OutVal=(X=0.000000,Y=5.976563,Z=-177.714844),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.778438),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.778438),InterpMode=CIM_CurveAutoClamped),(InVal=156.000000,OutVal=(X=0.000000,Y=-3.164063,Z=-88.066406),ArriveTangent=(X=0.000000,Y=0.000000,Z=30.029297),LeaveTangent=(X=0.000000,Y=0.000000,Z=30.029297),InterpMode=CIM_CurveAutoClamped),(InVal=159.000000,OutVal=(X=0.000000,Y=-0.527344,Z=2.460938),ArriveTangent=(X=0.000000,Y=1.677659,Z=42.626953),LeaveTangent=(X=0.000000,Y=1.677659,Z=42.626953),InterpMode=CIM_CurveAutoClamped),(InVal=162.000000,OutVal=(X=0.000000,Y=10.195313,Z=167.695313),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.707952),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.707952),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=0.000000,Y=9.316406,Z=174.902344),ArriveTangent=(X=0.000000,Y=-0.607178,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.607178,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=168.000000,OutVal=(X=0.000000,Y=4.042969,Z=90.351563),ArriveTangent=(X=0.000000,Y=-1.845703,Z=-24.814453),LeaveTangent=(X=0.000000,Y=-1.845703,Z=-24.814453),InterpMode=CIM_CurveAutoClamped),(InVal=171.000000,OutVal=(X=0.000000,Y=-1.757813,Z=26.015625),ArriveTangent=(X=0.000000,Y=-0.141397,Z=-14.943524),LeaveTangent=(X=0.000000,Y=-0.141397,Z=-14.943524),InterpMode=CIM_CurveAutoClamped),(InVal=174.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-2.285156),InterpMode=CIM_CurveAutoClamped),(InVal=177.000000,OutVal=(X=0.000000,Y=1.054688,Z=87.011719),ArriveTangent=(X=0.000000,Y=0.532910,Z=33.427734),LeaveTangent=(X=0.000000,Y=0.532910,Z=33.427734),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=0.000000,Y=1.933594,Z=198.281250),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=0.000000,Y=0.351563,Z=143.261719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-32.119484),LeaveTangent=(X=0.000000,Y=0.000000,Z=-32.119484),InterpMode=CIM_CurveAutoClamped),(InVal=186.000000,OutVal=(X=0.000000,Y=3.164063,Z=-21.972656),ArriveTangent=(X=0.000000,Y=0.000000,Z=-37.099037),LeaveTangent=(X=0.000000,Y=0.000000,Z=-37.099037),InterpMode=CIM_CurveAutoClamped),(InVal=189.000000,OutVal=(X=0.000000,Y=-0.527344,Z=-90.703125),ArriveTangent=(X=0.000000,Y=-0.262543,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.262543,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=0.000000,Y=-0.878906,Z=-66.621094),ArriveTangent=(X=0.000000,Y=-0.146484,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.146484,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=(X=0.000000,Y=-1.406250,Z=-94.921875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.817430),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.817430),InterpMode=CIM_CurveAutoClamped),(InVal=198.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-205.312500),ArriveTangent=(X=0.000000,Y=0.527344,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.527344,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=201.000000,OutVal=(X=0.000000,Y=1.757813,Z=-197.929688),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.701591),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.701591),InterpMode=CIM_CurveAutoClamped),(InVal=204.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-85.253906),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.404228),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.404228),InterpMode=CIM_CurveAutoClamped),(InVal=207.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-55.898438),ArriveTangent=(X=0.000000,Y=0.263819,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.263819,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=213.000000,OutVal=(X=0.000000,Y=-0.527344,Z=-94.921875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.940398),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.940398),InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=(X=0.000000,Y=-0.878906,Z=-178.593750),ArriveTangent=(X=0.000000,Y=-0.336656,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.336656,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-83.144531),ArriveTangent=(X=0.000000,Y=0.000000,Z=28.449520),LeaveTangent=(X=0.000000,Y=0.000000,Z=28.449520),InterpMode=CIM_CurveAutoClamped),(InVal=221.500000,OutVal=(X=0.000000,Y=-2.109375,Z=6.328125),InterpMode=CIM_CurveAutoClamped),(InVal=224.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-99.667969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-48.164063),LeaveTangent=(X=0.000000,Y=0.000000,Z=-48.164063),InterpMode=CIM_CurveAutoClamped),(InVal=225.500000,OutVal=(X=0.000000,Y=0.703125,Z=-186.328125),ArriveTangent=(X=0.000000,Y=2.153320,Z=-56.469727),LeaveTangent=(X=0.000000,Y=2.153320,Z=-56.469727),InterpMode=CIM_CurveAutoClamped),(InVal=228.000000,OutVal=(X=0.000000,Y=5.273438,Z=-325.546875),InterpMode=CIM_CurveAutoClamped),(InVal=231.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-264.375000),ArriveTangent=(X=0.000000,Y=0.000000,Z=23.671875),LeaveTangent=(X=0.000000,Y=0.000000,Z=23.671875),InterpMode=CIM_CurveAutoClamped),(InVal=234.000000,OutVal=(X=0.000000,Y=2.109375,Z=-183.515625),InterpMode=CIM_CurveAutoClamped),(InVal=237.000000,OutVal=(X=0.000000,Y=1.406250,Z=-262.089844),InterpMode=CIM_CurveAutoClamped),(InVal=240.000000,OutVal=(X=0.000000,Y=3.164063,Z=-177.539063),InterpMode=CIM_CurveAutoClamped),(InVal=243.500000,OutVal=(X=0.000000,Y=-10.195313,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=247.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-130.078125),ArriveTangent=(X=0.000000,Y=0.000000,Z=33.579323),LeaveTangent=(X=0.000000,Y=0.000000,Z=33.579323),InterpMode=CIM_CurveAutoClamped),(InVal=248.500000,OutVal=(X=0.000000,Y=-3.164063,Z=-88.593750),ArriveTangent=(X=0.000000,Y=0.000000,Z=33.046875),LeaveTangent=(X=0.000000,Y=0.000000,Z=33.046875),InterpMode=CIM_CurveAutoClamped),(InVal=250.500000,OutVal=(X=0.000000,Y=-0.703125,Z=-14.414063),InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-33.925781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.267998),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.267998),InterpMode=CIM_CurveAutoClamped),(InVal=256.000000,OutVal=(X=0.000000,Y=1.757813,Z=-181.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.099203),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.099203),InterpMode=CIM_CurveAutoClamped),(InVal=259.000000,OutVal=(X=0.000000,Y=1.757813,Z=-183.339844),InterpMode=CIM_CurveAutoClamped),(InVal=261.000000,OutVal=(X=0.000000,Y=1.230469,Z=-95.097656),ArriveTangent=(X=0.000000,Y=-0.375337,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.375337,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=265.500000,OutVal=(X=0.000000,Y=-1.406250,Z=-97.207031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.508125),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.508125),InterpMode=CIM_CurveAutoClamped),(InVal=267.000000,OutVal=(X=0.000000,Y=3.691406,Z=-276.503906),InterpMode=CIM_CurveAutoClamped),(InVal=272.000000,OutVal=(X=0.000000,Y=-0.527344,Z=-179.121094),InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=(X=0.000000,Y=16.875000,Z=-289.335938),ArriveTangent=(X=0.000000,Y=1.389851,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.389851,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=277.000000,OutVal=(X=0.000000,Y=18.281250,Z=-241.171875),InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,OutVal=(X=0.000000,Y=9.492188,Z=-267.890625),ArriveTangent=(X=0.000000,Y=-1.263266,Z=-16.193195),LeaveTangent=(X=0.000000,Y=-1.263266,Z=-16.193195),InterpMode=CIM_CurveAutoClamped),(InVal=283.000000,OutVal=(X=0.000000,Y=7.558594,Z=-358.593750),InterpMode=CIM_CurveAutoClamped),(InVal=286.000000,OutVal=(X=0.000000,Y=22.324219,Z=-210.937500),InterpMode=CIM_CurveAutoClamped),(InVal=289.000000,OutVal=(X=0.000000,Y=2.812500,Z=-276.503906),ArriveTangent=(X=0.000000,Y=-0.952940,Z=-24.638672),LeaveTangent=(X=0.000000,Y=-0.952940,Z=-24.638672),InterpMode=CIM_CurveAutoClamped),(InVal=292.000000,OutVal=(X=0.000000,Y=1.582031,Z=-358.769531),InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=(X=0.000000,Y=2.636719,Z=-199.335938),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.139897),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.139897),InterpMode=CIM_CurveAutoClamped),(InVal=298.000000,OutVal=(X=0.000000,Y=-0.527344,Z=-179.824219),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.449531),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.449531),InterpMode=CIM_CurveAutoClamped),(InVal=302.000000,OutVal=(X=0.000000,Y=0.878906,Z=-88.066406),ArriveTangent=(X=0.000000,Y=0.631024,Z=23.444824),LeaveTangent=(X=0.000000,Y=0.631024,Z=23.444824),InterpMode=CIM_CurveAutoClamped),(InVal=306.000000,OutVal=(X=0.000000,Y=5.449219,Z=7.734375),ArriveTangent=(X=0.000000,Y=0.000000,Z=25.689175),LeaveTangent=(X=0.000000,Y=0.000000,Z=25.689175),InterpMode=CIM_CurveAutoClamped),(InVal=309.000000,OutVal=(X=0.000000,Y=-0.175781,Z=91.757813),ArriveTangent=(X=0.000000,Y=-3.928524,Z=0.000000),LeaveTangent=(X=0.000000,Y=-3.928524,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=311.000000,OutVal=(X=0.000000,Y=-18.457031,Z=90.175781),InterpMode=CIM_CurveAutoClamped),(InVal=314.000000,OutVal=(X=0.000000,Y=7.031250,Z=156.269531),ArriveTangent=(X=0.000000,Y=0.000000,Z=27.572544),LeaveTangent=(X=0.000000,Y=0.000000,Z=27.572544),InterpMode=CIM_CurveAutoClamped),(InVal=318.000000,OutVal=(X=0.000000,Y=2.636719,Z=283.183594),ArriveTangent=(X=0.000000,Y=-0.506323,Z=2.536408),LeaveTangent=(X=0.000000,Y=-0.506323,Z=2.536408),InterpMode=CIM_CurveAutoClamped),(InVal=322.000000,OutVal=(X=0.000000,Y=1.582031,Z=287.402344),InterpMode=CIM_CurveAutoClamped),(InVal=324.000000,OutVal=(X=0.000000,Y=8.261719,Z=277.558594),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.262695),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.262695),InterpMode=CIM_CurveAutoClamped),(InVal=326.000000,OutVal=(X=0.000000,Y=1.054688,Z=270.351563),ArriveTangent=(X=0.000000,Y=-1.414136,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.414136,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=328.000000,OutVal=(X=0.000000,Y=-0.351563,Z=309.199219),InterpMode=CIM_CurveAutoClamped),(InVal=332.500000,OutVal=(X=0.000000,Y=1.406250,Z=263.847656),ArriveTangent=(X=0.000000,Y=0.925397,Z=-23.300541),LeaveTangent=(X=0.000000,Y=0.925397,Z=-23.300541),InterpMode=CIM_CurveAutoClamped),(InVal=334.000000,OutVal=(X=0.000000,Y=5.625000,Z=164.355469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-42.382813),LeaveTangent=(X=0.000000,Y=0.000000,Z=-42.382813),InterpMode=CIM_CurveAutoClamped),(InVal=337.000000,OutVal=(X=0.000000,Y=-0.703125,Z=73.125000),InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,OutVal=(X=0.000000,Y=4.394531,Z=158.554688),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.141018),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.141018),InterpMode=CIM_CurveAutoClamped),(InVal=343.000000,OutVal=(X=0.000000,Y=1.933594,Z=191.074219),ArriveTangent=(X=0.000000,Y=-1.636499,Z=21.690538),LeaveTangent=(X=0.000000,Y=-1.636499,Z=21.690538),InterpMode=CIM_CurveAutoClamped),(InVal=346.000000,OutVal=(X=0.000000,Y=-10.195313,Z=353.671875),ArriveTangent=(X=0.000000,Y=0.000000,Z=54.878906),LeaveTangent=(X=0.000000,Y=0.000000,Z=54.878906),InterpMode=CIM_CurveAutoClamped),(InVal=348.000000,OutVal=(X=0.000000,Y=6.152344,Z=465.468750),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.019802),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.019802),InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,OutVal=(X=0.000000,Y=-7.031250,Z=471.445313),InterpMode=CIM_CurveAutoClamped),(InVal=352.000000,OutVal=(X=0.000000,Y=-0.527344,Z=462.304688),ArriveTangent=(X=0.000000,Y=0.765620,Z=-6.903505),LeaveTangent=(X=0.000000,Y=0.765620,Z=-6.903505),InterpMode=CIM_CurveAutoClamped),(InVal=358.000000,OutVal=(X=0.000000,Y=1.230469,Z=357.187500),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.328125),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.328125),InterpMode=CIM_CurveAutoClamped),(InVal=361.000000,OutVal=(X=0.000000,Y=-1.406250,Z=270.351563),InterpMode=CIM_CurveAutoClamped),(InVal=364.000000,OutVal=(X=0.000000,Y=11.074219,Z=270.527344),InterpMode=CIM_CurveAutoClamped),(InVal=367.000000,OutVal=(X=0.000000,Y=11.074219,Z=218.671875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-24.429914),LeaveTangent=(X=0.000000,Y=0.000000,Z=-24.429914),InterpMode=CIM_CurveAutoClamped),(InVal=371.000000,OutVal=(X=0.000000,Y=-0.878906,Z=92.285156),ArriveTangent=(X=0.000000,Y=-0.336656,Z=-4.490547),LeaveTangent=(X=0.000000,Y=-0.336656,Z=-4.490547),InterpMode=CIM_CurveAutoClamped),(InVal=373.000000,OutVal=(X=0.000000,Y=-1.230469,Z=87.539063),InterpMode=CIM_CurveAutoClamped),(InVal=376.000000,OutVal=(X=0.000000,Y=5.449219,Z=98.613281),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.127284),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.127284),InterpMode=CIM_CurveAutoClamped),(InVal=379.000000,OutVal=(X=0.000000,Y=-1.230469,Z=198.457031),ArriveTangent=(X=0.000000,Y=-0.834409,Z=26.425781),LeaveTangent=(X=0.000000,Y=-0.834409,Z=26.425781),InterpMode=CIM_CurveAutoClamped),(InVal=382.000000,OutVal=(X=0.000000,Y=-2.460938,Z=257.167969),ArriveTangent=(X=0.000000,Y=-0.810459,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.810459,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=385.000000,OutVal=(X=0.000000,Y=-8.261719,Z=249.609375),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.161050),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.161050),InterpMode=CIM_CurveAutoClamped),(InVal=388.000000,OutVal=(X=0.000000,Y=5.097656,Z=207.070313),InterpMode=CIM_CurveAutoClamped),(InVal=391.000000,OutVal=(X=0.000000,Y=1.757813,Z=276.855469),ArriveTangent=(X=0.000000,Y=-0.755495,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.755495,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=394.000000,OutVal=(X=0.000000,Y=0.351563,Z=270.703125),ArriveTangent=(X=0.000000,Y=-0.897914,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.897914,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=397.000000,OutVal=(X=0.000000,Y=-5.449219,Z=277.031250),ArriveTangent=(X=0.000000,Y=-0.897914,Z=1.582031),LeaveTangent=(X=0.000000,Y=-0.897914,Z=1.582031),InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=(X=0.000000,Y=-6.855469,Z=280.195313),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.515699),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.515699),InterpMode=CIM_CurveAutoClamped),(InVal=403.000000,OutVal=(X=0.000000,Y=5.800781,Z=358.769531),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.329078),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.329078),InterpMode=CIM_CurveAutoClamped),(InVal=406.000000,OutVal=(X=0.000000,Y=5.097656,Z=368.964844),ArriveTangent=(X=0.000000,Y=-0.489210,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.489210,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=409.000000,OutVal=(X=0.000000,Y=0.703125,Z=363.515625),InterpMode=CIM_CurveAutoClamped),(InVal=412.000000,OutVal=(X=0.000000,Y=4.218750,Z=366.152344),ArriveTangent=(X=0.000000,Y=1.848634,Z=2.101312),LeaveTangent=(X=0.000000,Y=1.848634,Z=2.101312),InterpMode=CIM_CurveAutoClamped),(InVal=415.000000,OutVal=(X=0.000000,Y=12.128906,Z=435.058594),InterpMode=CIM_CurveAutoClamped),(InVal=418.000000,OutVal=(X=0.000000,Y=3.164063,Z=368.085938),ArriveTangent=(X=0.000000,Y=-2.166385,Z=-24.580078),LeaveTangent=(X=0.000000,Y=-2.166385,Z=-24.580078),InterpMode=CIM_CurveAutoClamped),(InVal=421.000000,OutVal=(X=0.000000,Y=-1.054688,Z=287.578125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-19.270025),LeaveTangent=(X=0.000000,Y=0.000000,Z=-19.270025),InterpMode=CIM_CurveAutoClamped),(InVal=424.000000,OutVal=(X=0.000000,Y=-0.351563,Z=250.312500),ArriveTangent=(X=0.000000,Y=0.557266,Z=-23.675564),LeaveTangent=(X=0.000000,Y=0.557266,Z=-23.675564),InterpMode=CIM_CurveAutoClamped),(InVal=427.000000,OutVal=(X=0.000000,Y=15.996094,Z=99.667969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-41.513672),LeaveTangent=(X=0.000000,Y=0.000000,Z=-41.513672),InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=(X=0.000000,Y=2.988281,Z=1.230469),ArriveTangent=(X=0.000000,Y=-1.483609,Z=-37.160156),LeaveTangent=(X=0.000000,Y=-1.483609,Z=-37.160156),InterpMode=CIM_CurveAutoClamped),(InVal=432.000000,OutVal=(X=0.000000,Y=1.406250,Z=-86.132813),ArriveTangent=(X=0.000000,Y=-0.360536,Z=-5.482206),LeaveTangent=(X=0.000000,Y=-0.360536,Z=-5.482206),InterpMode=CIM_CurveAutoClamped),(InVal=435.000000,OutVal=(X=0.000000,Y=0.878906,Z=-92.460938),ArriveTangent=(X=0.000000,Y=-0.410391,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.410391,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=438.000000,OutVal=(X=0.000000,Y=-8.085938,Z=-42.363281),InterpMode=CIM_CurveAutoClamped),(InVal=441.000000,OutVal=(X=0.000000,Y=1.230469,Z=-172.617188),InterpMode=CIM_CurveAutoClamped),(InVal=443.000000,OutVal=(X=0.000000,Y=-4.570313,Z=-140.800781),InterpMode=CIM_CurveAutoClamped),(InVal=446.000000,OutVal=(X=0.000000,Y=-2.109375,Z=-201.269531),ArriveTangent=(X=0.000000,Y=0.773438,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.773438,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=448.000000,OutVal=(X=0.000000,Y=-0.703125,Z=-90.878906),InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=(X=0.000000,Y=-5.097656,Z=-178.242188),ArriveTangent=(X=0.000000,Y=-1.012645,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.012645,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=452.000000,OutVal=(X=0.000000,Y=-6.152344,Z=-175.253906),InterpMode=CIM_CurveAutoClamped),(InVal=455.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-186.503906),InterpMode=CIM_CurveAutoClamped),(InVal=458.000000,OutVal=(X=0.000000,Y=-10.195313,Z=-96.328125),ArriveTangent=(X=0.000000,Y=0.000000,Z=35.472656),LeaveTangent=(X=0.000000,Y=0.000000,Z=35.472656),InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,OutVal=(X=0.000000,Y=-0.703125,Z=-9.140625),ArriveTangent=(X=0.000000,Y=1.007834,Z=37.652344),LeaveTangent=(X=0.000000,Y=1.007834,Z=37.652344),InterpMode=CIM_CurveAutoClamped),(InVal=463.000000,OutVal=(X=0.000000,Y=0.527344,Z=91.933594),ArriveTangent=(X=0.000000,Y=0.887907,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.887907,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=(X=0.000000,Y=5.097656,Z=-3.164063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.301781),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.301781),InterpMode=CIM_CurveAutoClamped),(InVal=467.000000,OutVal=(X=0.000000,Y=-11.250000,Z=-4.218750),InterpMode=CIM_CurveAutoClamped),(InVal=469.000000,OutVal=(X=0.000000,Y=-3.691406,Z=-1.230469),InterpMode=CIM_CurveAutoClamped),(InVal=471.000000,OutVal=(X=0.000000,Y=-8.261719,Z=-28.300781),InterpMode=CIM_CurveAutoClamped),(InVal=473.000000,OutVal=(X=0.000000,Y=-5.273438,Z=3.867188),ArriveTangent=(X=0.000000,Y=0.000000,Z=26.444801),LeaveTangent=(X=0.000000,Y=0.000000,Z=26.444801),InterpMode=CIM_CurveAutoClamped),(InVal=475.000000,OutVal=(X=0.000000,Y=-7.207031,Z=84.375000),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.831071),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.831071),InterpMode=CIM_CurveAutoClamped),(InVal=477.000000,OutVal=(X=0.000000,Y=-2.636719,Z=92.285156),InterpMode=CIM_CurveAutoClamped),(InVal=479.000000,OutVal=(X=0.000000,Y=-2.636719,Z=87.011719),InterpMode=CIM_CurveAutoClamped),(InVal=481.000000,OutVal=(X=0.000000,Y=18.281250,Z=91.230469),InterpMode=CIM_CurveAutoClamped),(InVal=483.500000,OutVal=(X=0.000000,Y=-14.414063,Z=85.078125),InterpMode=CIM_CurveAutoClamped),(InVal=485.500000,OutVal=(X=0.000000,Y=3.867188,Z=253.300781),ArriveTangent=(X=0.000000,Y=0.000000,Z=76.741074),LeaveTangent=(X=0.000000,Y=0.000000,Z=76.741074),InterpMode=CIM_CurveAutoClamped),(InVal=487.000000,OutVal=(X=0.000000,Y=-5.976563,Z=353.671875),ArriveTangent=(X=0.000000,Y=0.000000,Z=72.672989),LeaveTangent=(X=0.000000,Y=0.000000,Z=72.672989),InterpMode=CIM_CurveAutoClamped),(InVal=489.000000,OutVal=(X=0.000000,Y=-2.636719,Z=507.656250),ArriveTangent=(X=0.000000,Y=2.109375,Z=0.000000),LeaveTangent=(X=0.000000,Y=2.109375,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=491.000000,OutVal=(X=0.000000,Y=2.460938,Z=459.843750),InterpMode=CIM_CurveAutoClamped),(InVal=492.500000,OutVal=(X=0.000000,Y=1.054688,Z=547.382813),InterpMode=CIM_CurveAutoClamped),(InVal=496.000000,OutVal=(X=0.000000,Y=1.406250,Z=444.375000),ArriveTangent=(X=0.000000,Y=0.212595,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.212595,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=499.000000,OutVal=(X=0.000000,Y=3.164063,Z=449.824219),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.614224),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.614224),InterpMode=CIM_CurveAutoClamped),(InVal=501.000000,OutVal=(X=0.000000,Y=0.878906,Z=506.953125),ArriveTangent=(X=0.000000,Y=0.000000,Z=50.619576),LeaveTangent=(X=0.000000,Y=0.000000,Z=50.619576),InterpMode=CIM_CurveAutoClamped),(InVal=502.500000,OutVal=(X=0.000000,Y=7.031250,Z=631.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=66.049805),LeaveTangent=(X=0.000000,Y=0.000000,Z=66.049805),InterpMode=CIM_CurveAutoClamped),(InVal=505.000000,OutVal=(X=0.000000,Y=-12.128906,Z=771.152344),ArriveTangent=(X=0.000000,Y=0.000000,Z=56.651787),LeaveTangent=(X=0.000000,Y=0.000000,Z=56.651787),InterpMode=CIM_CurveAutoClamped),(InVal=506.000000,OutVal=(X=0.000000,Y=-4.570313,Z=829.863281),ArriveTangent=(X=0.000000,Y=2.373047,Z=0.000000),LeaveTangent=(X=0.000000,Y=2.373047,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=511.000000,OutVal=(X=0.000000,Y=2.109375,Z=751.113281),InterpMode=CIM_CurveAutoClamped),(InVal=514.000000,OutVal=(X=0.000000,Y=2.109375,Z=835.839844),InterpMode=CIM_CurveAutoClamped),(InVal=516.000000,OutVal=(X=0.000000,Y=-2.988281,Z=737.050781),ArriveTangent=(X=0.000000,Y=-0.211061,Z=-31.188745),LeaveTangent=(X=0.000000,Y=-0.211061,Z=-31.188745),InterpMode=CIM_CurveAutoClamped),(InVal=518.000000,OutVal=(X=0.000000,Y=-3.164063,Z=699.960938),ArriveTangent=(X=0.000000,Y=-0.218306,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.218306,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,OutVal=(X=0.000000,Y=-32.871094,Z=815.625000),InterpMode=CIM_CurveAutoClamped),(InVal=522.000000,OutVal=(X=0.000000,Y=-15.644531,Z=709.980469),ArriveTangent=(X=0.000000,Y=5.264061,Z=-41.572266),LeaveTangent=(X=0.000000,Y=5.264061,Z=-41.572266),InterpMode=CIM_CurveAutoClamped),(InVal=524.000000,OutVal=(X=0.000000,Y=-9.492188,Z=649.335938),ArriveTangent=(X=0.000000,Y=3.295898,Z=0.000000),LeaveTangent=(X=0.000000,Y=3.295898,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=526.000000,OutVal=(X=0.000000,Y=-2.460938,Z=664.804688),ArriveTangent=(X=0.000000,Y=2.399394,Z=16.622324),LeaveTangent=(X=0.000000,Y=2.399394,Z=16.622324),InterpMode=CIM_CurveAutoClamped),(InVal=528.000000,OutVal=(X=0.000000,Y=0.527344,Z=781.171875),InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,OutVal=(X=0.000000,Y=-1.582031,Z=771.855469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.771984),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.771984),InterpMode=CIM_CurveAutoClamped),(InVal=532.000000,OutVal=(X=0.000000,Y=1.054688,Z=633.164063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-78.662109),LeaveTangent=(X=0.000000,Y=0.000000,Z=-78.662109),InterpMode=CIM_CurveAutoClamped),(InVal=534.000000,OutVal=(X=0.000000,Y=0.878906,Z=457.207031),ArriveTangent=(X=0.000000,Y=-0.216790,Z=-7.987808),LeaveTangent=(X=0.000000,Y=-0.216790,Z=-7.987808),InterpMode=CIM_CurveAutoClamped),(InVal=536.000000,OutVal=(X=0.000000,Y=-14.062500,Z=450.527344),InterpMode=CIM_CurveAutoClamped),(InVal=538.000000,OutVal=(X=0.000000,Y=-2.285156,Z=548.437500),ArriveTangent=(X=0.000000,Y=0.000000,Z=45.966797),LeaveTangent=(X=0.000000,Y=0.000000,Z=45.966797),InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=(X=0.000000,Y=-5.976563,Z=634.394531),InterpMode=CIM_CurveAutoClamped),(InVal=542.500000,OutVal=(X=0.000000,Y=1.230469,Z=505.019531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-41.899857),LeaveTangent=(X=0.000000,Y=0.000000,Z=-41.899857),InterpMode=CIM_CurveAutoClamped),(InVal=545.500000,OutVal=(X=0.000000,Y=-2.636719,Z=403.945313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-26.576614),LeaveTangent=(X=0.000000,Y=0.000000,Z=-26.576614),InterpMode=CIM_CurveAutoClamped),(InVal=547.000000,OutVal=(X=0.000000,Y=-0.878906,Z=373.359375),ArriveTangent=(X=0.000000,Y=1.915048,Z=-37.557953),LeaveTangent=(X=0.000000,Y=1.915048,Z=-37.557953),InterpMode=CIM_CurveAutoClamped),(InVal=549.000000,OutVal=(X=0.000000,Y=5.449219,Z=197.578125),InterpMode=CIM_CurveAutoClamped),(InVal=551.000000,OutVal=(X=0.000000,Y=1.933594,Z=273.164063),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.297359),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.297359),InterpMode=CIM_CurveAutoClamped),(InVal=553.000000,OutVal=(X=0.000000,Y=16.347656,Z=274.218750),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.300949),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.300949),InterpMode=CIM_CurveAutoClamped),(InVal=555.000000,OutVal=(X=0.000000,Y=2.812500,Z=364.921875),ArriveTangent=(X=0.000000,Y=0.000000,Z=49.118305),LeaveTangent=(X=0.000000,Y=0.000000,Z=49.118305),InterpMode=CIM_CurveAutoClamped),(InVal=556.500000,OutVal=(X=0.000000,Y=10.019531,Z=446.132813),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.035288),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.035288),InterpMode=CIM_CurveAutoClamped),(InVal=559.000000,OutVal=(X=0.000000,Y=-16.171875,Z=451.757813),InterpMode=CIM_CurveAutoClamped),(InVal=560.500000,OutVal=(X=0.000000,Y=3.339844,Z=386.015625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-38.370537),LeaveTangent=(X=0.000000,Y=0.000000,Z=-38.370537),InterpMode=CIM_CurveAutoClamped),(InVal=562.500000,OutVal=(X=0.000000,Y=2.109375,Z=317.460938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.267107),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.267107),InterpMode=CIM_CurveAutoClamped),(InVal=564.000000,OutVal=(X=0.000000,Y=3.515625,Z=317.285156),InterpMode=CIM_CurveAutoClamped),(InVal=566.000000,OutVal=(X=0.000000,Y=2.460938,Z=333.632813),ArriveTangent=(X=0.000000,Y=-1.069107,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.069107,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=568.000000,OutVal=(X=0.000000,Y=-3.164063,Z=331.171875),ArriveTangent=(X=0.000000,Y=-0.350394,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.350394,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=570.500000,OutVal=(X=0.000000,Y=-3.515625,Z=355.429688),ArriveTangent=(X=0.000000,Y=-0.400138,Z=1.838980),LeaveTangent=(X=0.000000,Y=-0.400138,Z=1.838980),InterpMode=CIM_CurveAutoClamped),(InVal=572.000000,OutVal=(X=0.000000,Y=-36.738281,Z=356.835938),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.279686),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.279686),InterpMode=CIM_CurveAutoClamped),(InVal=573.500000,OutVal=(X=0.000000,Y=1.054688,Z=415.898438),ArriveTangent=(X=0.000000,Y=5.292764,Z=0.000000),LeaveTangent=(X=0.000000,Y=5.292764,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=576.000000,OutVal=(X=0.000000,Y=6.328125,Z=369.316406),ArriveTangent=(X=0.000000,Y=0.535478,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.535478,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=579.000000,OutVal=(X=0.000000,Y=7.031250,Z=412.382813),InterpMode=CIM_CurveAutoClamped),(InVal=581.000000,OutVal=(X=0.000000,Y=-0.703125,Z=269.648438),ArriveTangent=(X=0.000000,Y=-1.959610,Z=-26.226637),LeaveTangent=(X=0.000000,Y=-1.959610,Z=-26.226637),InterpMode=CIM_CurveAutoClamped),(InVal=583.000000,OutVal=(X=0.000000,Y=-2.812500,Z=243.984375),ArriveTangent=(X=0.000000,Y=-1.318359,Z=-2.397754),LeaveTangent=(X=0.000000,Y=-1.318359,Z=-2.397754),InterpMode=CIM_CurveAutoClamped),(InVal=585.000000,OutVal=(X=0.000000,Y=-5.976563,Z=241.875000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.747229),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.747229),InterpMode=CIM_CurveAutoClamped),(InVal=586.500000,OutVal=(X=0.000000,Y=0.878906,Z=187.031250),ArriveTangent=(X=0.000000,Y=3.867188,Z=0.000000),LeaveTangent=(X=0.000000,Y=3.867188,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=588.500000,OutVal=(X=0.000000,Y=7.558594,Z=306.035156),ArriveTangent=(X=0.000000,Y=1.320118,Z=46.120071),LeaveTangent=(X=0.000000,Y=1.320118,Z=46.120071),InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=(X=0.000000,Y=8.613281,Z=355.078125),InterpMode=CIM_CurveAutoClamped),(InVal=591.500000,OutVal=(X=0.000000,Y=-1.230469,Z=343.828125),ArriveTangent=(X=0.000000,Y=-7.804688,Z=0.000000),LeaveTangent=(X=0.000000,Y=-7.804688,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=592.500000,OutVal=(X=0.000000,Y=-10.898438,Z=392.695313),ArriveTangent=(X=0.000000,Y=0.000000,Z=35.929688),LeaveTangent=(X=0.000000,Y=0.000000,Z=35.929688),InterpMode=CIM_CurveAutoClamped),(InVal=594.000000,OutVal=(X=0.000000,Y=-4.746094,Z=433.652344),ArriveTangent=(X=0.000000,Y=0.000000,Z=10.815657),LeaveTangent=(X=0.000000,Y=0.000000,Z=10.815657),InterpMode=CIM_CurveAutoClamped),(InVal=595.500000,OutVal=(X=0.000000,Y=-7.382813,Z=441.738281),InterpMode=CIM_CurveAutoClamped),(InVal=596.500000,OutVal=(X=0.000000,Y=-3.339844,Z=407.285156),ArriveTangent=(X=0.000000,Y=5.185547,Z=-47.460938),LeaveTangent=(X=0.000000,Y=5.185547,Z=-47.460938),InterpMode=CIM_CurveAutoClamped),(InVal=597.500000,OutVal=(X=0.000000,Y=2.988281,Z=346.816406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-53.613281),LeaveTangent=(X=0.000000,Y=0.000000,Z=-53.613281),InterpMode=CIM_CurveAutoClamped),(InVal=598.500000,OutVal=(X=0.000000,Y=0.878906,Z=300.058594),InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,OutVal=(X=0.000000,Y=1.054688,Z=376.171875),ArriveTangent=(X=0.000000,Y=0.315768,Z=58.007813),LeaveTangent=(X=0.000000,Y=0.315768,Z=58.007813),InterpMode=CIM_CurveAutoClamped),(InVal=601.000000,OutVal=(X=0.000000,Y=5.800781,Z=445.078125),ArriveTangent=(X=0.000000,Y=3.691406,Z=0.000000),LeaveTangent=(X=0.000000,Y=3.691406,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=602.000000,OutVal=(X=0.000000,Y=8.437500,Z=358.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=-50.326817),LeaveTangent=(X=0.000000,Y=0.000000,Z=-50.326817),InterpMode=CIM_CurveAutoClamped),(InVal=603.000000,OutVal=(X=0.000000,Y=1.230469,Z=329.589844),InterpMode=CIM_CurveAutoClamped),(InVal=604.500000,OutVal=(X=0.000000,Y=1.757813,Z=367.734375),InterpMode=CIM_CurveAutoClamped),(InVal=606.000000,OutVal=(X=0.000000,Y=1.406250,Z=298.125000),ArriveTangent=(X=0.000000,Y=-0.560696,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.560696,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=607.500000,OutVal=(X=0.000000,Y=-7.910156,Z=400.429688),ArriveTangent=(X=0.000000,Y=0.000000,Z=87.363281),LeaveTangent=(X=0.000000,Y=0.000000,Z=87.363281),InterpMode=CIM_CurveAutoClamped),(InVal=609.000000,OutVal=(X=0.000000,Y=2.109375,Z=560.214844),InterpMode=CIM_CurveAutoClamped),(InVal=610.500000,OutVal=(X=0.000000,Y=-0.703125,Z=509.414063),InterpMode=CIM_CurveAutoClamped),(InVal=612.000000,OutVal=(X=0.000000,Y=-0.527344,Z=546.855469),InterpMode=CIM_CurveAutoClamped),(InVal=612.500000,OutVal=(X=0.000000,Y=-16.171875,Z=542.636719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.451013),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.451013),InterpMode=CIM_CurveAutoClamped),(InVal=613.500000,OutVal=(X=0.000000,Y=-3.164063,Z=502.910156),ArriveTangent=(X=0.000000,Y=12.216797,Z=-42.978516),LeaveTangent=(X=0.000000,Y=12.216797,Z=-42.978516),InterpMode=CIM_CurveAutoClamped),(InVal=614.500000,OutVal=(X=0.000000,Y=8.261719,Z=456.679688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.541781),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.541781),InterpMode=CIM_CurveAutoClamped),(InVal=615.500000,OutVal=(X=0.000000,Y=0.878906,Z=450.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.339331),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.339331),InterpMode=CIM_CurveAutoClamped),(InVal=617.500000,OutVal=(X=0.000000,Y=2.109375,Z=365.800781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-52.081474),LeaveTangent=(X=0.000000,Y=0.000000,Z=-52.081474),InterpMode=CIM_CurveAutoClamped),(InVal=619.000000,OutVal=(X=0.000000,Y=-2.285156,Z=268.066406),InterpMode=CIM_CurveAutoClamped),(InVal=620.500000,OutVal=(X=0.000000,Y=-1.757813,Z=279.667969),InterpMode=CIM_CurveAutoClamped),(InVal=621.500000,OutVal=(X=0.000000,Y=-11.953125,Z=275.273438),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.074482),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.074482),InterpMode=CIM_CurveAutoClamped),(InVal=623.000000,OutVal=(X=0.000000,Y=-2.460938,Z=182.812500),ArriveTangent=(X=0.000000,Y=4.082628,Z=0.000000),LeaveTangent=(X=0.000000,Y=4.082628,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=624.000000,OutVal=(X=0.000000,Y=0.175781,Z=214.101563),InterpMode=CIM_CurveAutoClamped),(InVal=625.000000,OutVal=(X=0.000000,Y=-0.527344,Z=134.121094),ArriveTangent=(X=0.000000,Y=-1.586502,Z=-63.457031),LeaveTangent=(X=0.000000,Y=-1.586502,Z=-63.457031),InterpMode=CIM_CurveAutoClamped),(InVal=626.000000,OutVal=(X=0.000000,Y=-8.437500,Z=87.187500),InterpMode=CIM_CurveAutoClamped),(InVal=626.500000,OutVal=(X=0.000000,Y=4.218750,Z=90.703125),InterpMode=CIM_CurveAutoClamped),(InVal=628.500000,OutVal=(X=0.000000,Y=0.527344,Z=6.328125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-51.780132),LeaveTangent=(X=0.000000,Y=0.000000,Z=-51.780132),InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=(X=0.000000,Y=2.460938,Z=-90.527344),ArriveTangent=(X=0.000000,Y=3.172712,Z=0.000000),LeaveTangent=(X=0.000000,Y=3.172712,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=631.000000,OutVal=(X=0.000000,Y=17.578125,Z=-88.242188),InterpMode=CIM_CurveAutoClamped),(InVal=632.500000,OutVal=(X=0.000000,Y=0.175781,Z=-161.015625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-63.843750),LeaveTangent=(X=0.000000,Y=0.000000,Z=-63.843750),InterpMode=CIM_CurveAutoClamped),(InVal=633.500000,OutVal=(X=0.000000,Y=2.109375,Z=-247.851563),InterpMode=CIM_CurveAutoClamped),(InVal=635.000000,OutVal=(X=0.000000,Y=1.054688,Z=-167.695313),ArriveTangent=(X=0.000000,Y=0.000000,Z=39.396721),LeaveTangent=(X=0.000000,Y=0.000000,Z=39.396721),InterpMode=CIM_CurveAutoClamped),(InVal=636.500000,OutVal=(X=0.000000,Y=2.988281,Z=-128.847656),ArriveTangent=(X=0.000000,Y=2.589045,Z=23.320313),LeaveTangent=(X=0.000000,Y=2.589045,Z=23.320313),InterpMode=CIM_CurveAutoClamped),(InVal=638.000000,OutVal=(X=0.000000,Y=12.832031,Z=-97.734375),InterpMode=CIM_CurveAutoClamped),(InVal=639.500000,OutVal=(X=0.000000,Y=0.878906,Z=-116.542969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-22.990042),LeaveTangent=(X=0.000000,Y=0.000000,Z=-22.990042),InterpMode=CIM_CurveAutoClamped),(InVal=641.000000,OutVal=(X=0.000000,Y=2.460938,Z=-182.285156),ArriveTangent=(X=0.000000,Y=0.000000,Z=-45.878906),LeaveTangent=(X=0.000000,Y=0.000000,Z=-45.878906),InterpMode=CIM_CurveAutoClamped),(InVal=642.500000,OutVal=(X=0.000000,Y=0.878906,Z=-254.179688),InterpMode=CIM_CurveAutoClamped),(InVal=644.000000,OutVal=(X=0.000000,Y=7.382813,Z=-113.027344),ArriveTangent=(X=0.000000,Y=3.519889,Z=44.159355),LeaveTangent=(X=0.000000,Y=3.519889,Z=44.159355),InterpMode=CIM_CurveAutoClamped),(InVal=645.000000,OutVal=(X=0.000000,Y=10.019531,Z=-87.714844),InterpMode=CIM_CurveAutoClamped),(InVal=647.000000,OutVal=(X=0.000000,Y=1.230469,Z=-182.636719),InterpMode=CIM_CurveAutoClamped),(InVal=648.500000,OutVal=(X=0.000000,Y=2.636719,Z=-182.109375),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.873955),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.873955),InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=(X=0.000000,Y=-3.164063,Z=-81.035156),ArriveTangent=(X=0.000000,Y=-2.804582,Z=0.000000),LeaveTangent=(X=0.000000,Y=-2.804582,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=651.000000,OutVal=(X=0.000000,Y=-5.097656,Z=-87.714844),InterpMode=CIM_CurveAutoClamped),(InVal=652.500000,OutVal=(X=0.000000,Y=-4.042969,Z=87.714844),InterpMode=CIM_CurveAutoClamped),(InVal=654.000000,OutVal=(X=0.000000,Y=-11.074219,Z=85.078125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.258501),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.258501),InterpMode=CIM_CurveAutoClamped),(InVal=655.500000,OutVal=(X=0.000000,Y=1.054688,Z=-12.656250),ArriveTangent=(X=0.000000,Y=3.630432,Z=-57.539063),LeaveTangent=(X=0.000000,Y=3.630432,Z=-57.539063),InterpMode=CIM_CurveAutoClamped),(InVal=657.000000,OutVal=(X=0.000000,Y=3.867188,Z=-87.539063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.547279),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.547279),InterpMode=CIM_CurveAutoClamped),(InVal=658.500000,OutVal=(X=0.000000,Y=-4.394531,Z=-91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,OutVal=(X=0.000000,Y=3.339844,Z=-86.484375),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.553118),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.553118),InterpMode=CIM_CurveAutoClamped),(InVal=661.500000,OutVal=(X=0.000000,Y=-0.878906,Z=-70.839844),ArriveTangent=(X=0.000000,Y=0.000000,Z=21.085365),LeaveTangent=(X=0.000000,Y=0.000000,Z=21.085365),InterpMode=CIM_CurveAutoClamped),(InVal=663.000000,OutVal=(X=0.000000,Y=4.570313,Z=11.425781),InterpMode=CIM_CurveAutoClamped),(InVal=664.500000,OutVal=(X=0.000000,Y=-1.054688,Z=2.812500),InterpMode=CIM_CurveAutoClamped),(InVal=666.500000,OutVal=(X=0.000000,Y=2.109375,Z=83.496094),ArriveTangent=(X=0.000000,Y=1.669922,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.669922,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=668.000000,OutVal=(X=0.000000,Y=4.790039,Z=-9.580078),ArriveTangent=(X=0.000000,Y=0.957047,Z=-59.715401),LeaveTangent=(X=0.000000,Y=0.957047,Z=-59.715401),InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=(X=0.000000,Y=5.800781,Z=-125.507813),InterpMode=CIM_CurveAutoClamped),(InVal=671.000000,OutVal=(X=0.000000,Y=0.175781,Z=7.031250),InterpMode=CIM_CurveAutoClamped),(InVal=673.000000,OutVal=(X=0.000000,Y=0.373535,Z=1.472168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.017704),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.017704),InterpMode=CIM_CurveAutoClamped),(InVal=674.500000,OutVal=(X=0.000000,Y=-3.515625,Z=-80.266113),InterpMode=CIM_CurveAutoClamped),(InVal=676.000000,OutVal=(X=0.000000,Y=-3.098145,Z=-67.631836),ArriveTangent=(X=0.000000,Y=0.646124,Z=12.414551),LeaveTangent=(X=0.000000,Y=0.646124,Z=12.414551),InterpMode=CIM_CurveAutoClamped),(InVal=677.500000,OutVal=(X=0.000000,Y=3.449707,Z=-43.022461),ArriveTangent=(X=0.000000,Y=1.450728,Z=19.579433),LeaveTangent=(X=0.000000,Y=1.450728,Z=19.579433),InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=(X=0.000000,Y=5.031738,Z=11.601563),ArriveTangent=(X=0.000000,Y=1.337724,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.337724,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=682.000000,OutVal=(X=0.000000,Y=12.019043,Z=-4.702148),InterpMode=CIM_CurveAutoClamped),(InVal=683.500000,OutVal=(X=0.000000,Y=0.417480,Z=4.262695),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.932570),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.932570),InterpMode=CIM_CurveAutoClamped),(InVal=685.000000,OutVal=(X=0.000000,Y=2.109375,Z=75.036621),ArriveTangent=(X=0.000000,Y=0.000000,Z=92.681274),LeaveTangent=(X=0.000000,Y=0.000000,Z=92.681274),InterpMode=CIM_CurveAutoClamped),(InVal=686.500000,OutVal=(X=0.000000,Y=1.054688,Z=399.902344),ArriveTangent=(X=0.000000,Y=0.000000,Z=20.690132),LeaveTangent=(X=0.000000,Y=0.000000,Z=20.690132),InterpMode=CIM_CurveAutoClamped),(InVal=688.000000,OutVal=(X=0.000000,Y=4.746094,Z=412.910156),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.492353),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.492353),InterpMode=CIM_CurveAutoClamped),(InVal=689.500000,OutVal=(X=0.000000,Y=4.218750,Z=441.210938),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.880699),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.880699),InterpMode=CIM_CurveAutoClamped),(InVal=691.000000,OutVal=(X=0.000000,Y=6.152344,Z=447.187500),InterpMode=CIM_CurveAutoClamped),(InVal=692.500000,OutVal=(X=0.000000,Y=-0.703125,Z=410.273438),InterpMode=CIM_CurveAutoClamped),(InVal=694.000000,OutVal=(X=0.000000,Y=0.527344,Z=534.375000),ArriveTangent=(X=0.000000,Y=0.562711,Z=63.339844),LeaveTangent=(X=0.000000,Y=0.562711,Z=63.339844),InterpMode=CIM_CurveAutoClamped),(InVal=695.500000,OutVal=(X=0.000000,Y=1.054688,Z=600.292969),ArriveTangent=(X=0.000000,Y=0.468750,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.468750,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=697.000000,OutVal=(X=0.000000,Y=1.933594,Z=548.261719),InterpMode=CIM_CurveAutoClamped),(InVal=698.500000,OutVal=(X=0.000000,Y=0.878906,Z=561.445313),ArriveTangent=(X=0.000000,Y=-0.996094,Z=8.320313),LeaveTangent=(X=0.000000,Y=-0.996094,Z=8.320313),InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,OutVal=(X=0.000000,Y=-1.054688,Z=573.222656),InterpMode=CIM_CurveAutoClamped),(InVal=701.500000,OutVal=(X=0.000000,Y=-0.175781,Z=540.527344),ArriveTangent=(X=0.000000,Y=1.046778,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.046778,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=703.000000,OutVal=(X=0.000000,Y=2.636719,Z=668.496094),ArriveTangent=(X=0.000000,Y=2.460938,Z=0.000000),LeaveTangent=(X=0.000000,Y=2.460938,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=704.500000,OutVal=(X=0.000000,Y=7.207031,Z=546.328125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-28.563944),LeaveTangent=(X=0.000000,Y=0.000000,Z=-28.563944),InterpMode=CIM_CurveAutoClamped),(InVal=706.000000,OutVal=(X=0.000000,Y=-0.351563,Z=525.585938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-20.449219),LeaveTangent=(X=0.000000,Y=0.000000,Z=-20.449219),InterpMode=CIM_CurveAutoClamped),(InVal=707.500000,OutVal=(X=0.000000,Y=2.109375,Z=484.980469),ArriveTangent=(X=0.000000,Y=0.498311,Z=-42.027637),LeaveTangent=(X=0.000000,Y=0.498311,Z=-42.027637),InterpMode=CIM_CurveAutoClamped),(InVal=709.000000,OutVal=(X=0.000000,Y=2.460938,Z=397.089844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.954760),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.954760),InterpMode=CIM_CurveAutoClamped),(InVal=710.500000,OutVal=(X=0.000000,Y=0.175781,Z=391.289063),InterpMode=CIM_CurveAutoClamped),(InVal=712.000000,OutVal=(X=0.000000,Y=3.867188,Z=463.535156),ArriveTangent=(X=0.000000,Y=2.226563,Z=0.000000),LeaveTangent=(X=0.000000,Y=2.226563,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=713.500000,OutVal=(X=0.000000,Y=6.855469,Z=356.132813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-65.039063),LeaveTangent=(X=0.000000,Y=0.000000,Z=-65.039063),InterpMode=CIM_CurveAutoClamped),(InVal=715.000000,OutVal=(X=0.000000,Y=0.175781,Z=268.417969),ArriveTangent=(X=0.000000,Y=-2.361009,Z=0.000000),LeaveTangent=(X=0.000000,Y=-2.361009,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=716.000000,OutVal=(X=0.000000,Y=-1.230469,Z=362.285156),ArriveTangent=(X=0.000000,Y=0.000000,Z=93.955078),LeaveTangent=(X=0.000000,Y=0.000000,Z=93.955078),InterpMode=CIM_CurveAutoClamped),(InVal=717.000000,OutVal=(X=0.000000,Y=-0.527344,Z=456.328125),ArriveTangent=(X=0.000000,Y=0.000000,Z=89.648438),LeaveTangent=(X=0.000000,Y=0.000000,Z=89.648438),InterpMode=CIM_CurveAutoClamped),(InVal=718.000000,OutVal=(X=0.000000,Y=-1.054688,Z=541.582031),ArriveTangent=(X=0.000000,Y=-0.439453,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.439453,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=719.000000,OutVal=(X=0.000000,Y=-1.406250,Z=447.187500),InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=(X=0.000000,Y=-0.175781,Z=449.296875),ArriveTangent=(X=0.000000,Y=0.966797,Z=5.124271),LeaveTangent=(X=0.000000,Y=0.966797,Z=5.124271),InterpMode=CIM_CurveAutoClamped),(InVal=721.000000,OutVal=(X=0.000000,Y=0.527344,Z=534.902344),ArriveTangent=(X=0.000000,Y=1.195805,Z=113.818359),LeaveTangent=(X=0.000000,Y=1.195805,Z=113.818359),InterpMode=CIM_CurveAutoClamped),(InVal=722.000000,OutVal=(X=0.000000,Y=2.460938,Z=676.933594),ArriveTangent=(X=0.000000,Y=0.000000,Z=95.300476),LeaveTangent=(X=0.000000,Y=0.000000,Z=95.300476),InterpMode=CIM_CurveAutoClamped),(InVal=723.000000,OutVal=(X=0.000000,Y=-2.285156,Z=735.644531),InterpMode=CIM_CurveAutoClamped),(InVal=724.000000,OutVal=(X=0.000000,Y=0.878906,Z=713.144531),ArriveTangent=(X=0.000000,Y=2.109375,Z=0.000000),LeaveTangent=(X=0.000000,Y=2.109375,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=725.500000,OutVal=(X=0.000000,Y=2.988281,Z=815.097656),ArriveTangent=(X=0.000000,Y=1.113281,Z=60.761719),LeaveTangent=(X=0.000000,Y=1.113281,Z=60.761719),InterpMode=CIM_CurveAutoClamped),(InVal=727.000000,OutVal=(X=0.000000,Y=4.218750,Z=895.429688),ArriveTangent=(X=0.000000,Y=1.513144,Z=38.186203),LeaveTangent=(X=0.000000,Y=1.513144,Z=38.186203),InterpMode=CIM_CurveAutoClamped),(InVal=728.500000,OutVal=(X=0.000000,Y=8.613281,Z=932.167969),InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=(X=0.000000,Y=-0.878906,Z=841.640625),InterpMode=CIM_CurveAutoClamped),(InVal=731.500000,OutVal=(X=0.000000,Y=0.527344,Z=926.367188),ArriveTangent=(X=0.000000,Y=0.445524,Z=23.084812),LeaveTangent=(X=0.000000,Y=0.445524,Z=23.084812),InterpMode=CIM_CurveAutoClamped),(InVal=733.000000,OutVal=(X=0.000000,Y=0.878906,Z=943.769531),ArriveTangent=(X=0.000000,Y=0.385195,Z=18.663630),LeaveTangent=(X=0.000000,Y=0.385195,Z=18.663630),InterpMode=CIM_CurveAutoClamped),(InVal=734.500000,OutVal=(X=0.000000,Y=1.757813,Z=984.902344),ArriveTangent=(X=0.000000,Y=0.000000,Z=52.904144),LeaveTangent=(X=0.000000,Y=0.000000,Z=52.904144),InterpMode=CIM_CurveAutoClamped),(InVal=736.000000,OutVal=(X=0.000000,Y=-1.757813,Z=1159.628906),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.650826),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.650826),InterpMode=CIM_CurveAutoClamped),(InVal=737.500000,OutVal=(X=0.000000,Y=2.285156,Z=1171.757813),InterpMode=CIM_CurveAutoClamped),(InVal=739.000000,OutVal=(X=0.000000,Y=-1.757813,Z=1169.824219),InterpMode=CIM_CurveAutoClamped),(InVal=740.500000,OutVal=(X=0.000000,Y=1.406250,Z=1172.636719),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.000000),(Time=6.000000),(Time=9.000000),(Time=12.000000),(Time=15.000000),(Time=18.000000),(Time=21.000000),(Time=24.000000),(Time=28.000000),(Time=33.000000),(Time=37.000000),(Time=42.000000),(Time=45.000000),(Time=48.000000),(Time=51.000000),(Time=54.000000),(Time=57.000000),(Time=60.000000),(Time=63.000000),(Time=66.000000),(Time=69.000000),(Time=72.000000),(Time=75.000000),(Time=78.000000),(Time=81.000000),(Time=84.000000),(Time=87.000000),(Time=90.000000),(Time=93.000000),(Time=96.000000),(Time=99.000000),(Time=102.000000),(Time=105.000000),(Time=108.000000),(Time=111.000000),(Time=114.000000),(Time=117.000000),(Time=120.000000),(Time=123.000000),(Time=126.000000),(Time=129.000000),(Time=132.000000),(Time=135.000000),(Time=138.000000),(Time=141.000000),(Time=144.000000),(Time=147.000000),(Time=150.000000),(Time=153.000000),(Time=156.000000),(Time=159.000000),(Time=162.000000),(Time=165.000000),(Time=168.000000),(Time=171.000000),(Time=174.000000),(Time=177.000000),(Time=180.000000),(Time=183.000000),(Time=186.000000),(Time=189.000000),(Time=192.000000),(Time=195.000000),(Time=198.000000),(Time=201.000000),(Time=204.000000),(Time=207.000000),(Time=213.000000),(Time=215.000000),(Time=218.000000),(Time=221.500000),(Time=224.000000),(Time=225.500000),(Time=228.000000),(Time=231.000000),(Time=234.000000),(Time=237.000000),(Time=240.000000),(Time=243.500000),(Time=247.000000),(Time=248.500000),(Time=250.500000),(Time=254.000000),(Time=256.000000),(Time=259.000000),(Time=261.000000),(Time=265.500000),(Time=267.000000),(Time=272.000000),(Time=275.000000),(Time=277.000000),(Time=280.000000),(Time=283.000000),(Time=286.000000),(Time=289.000000),(Time=292.000000),(Time=295.000000),(Time=298.000000),(Time=302.000000),(Time=306.000000),(Time=309.000000),(Time=311.000000),(Time=314.000000),(Time=318.000000),(Time=322.000000),(Time=324.000000),(Time=326.000000),(Time=328.000000),(Time=332.500000),(Time=334.000000),(Time=337.000000),(Time=340.000000),(Time=343.000000),(Time=346.000000),(Time=348.000000),(Time=350.000000),(Time=352.000000),(Time=358.000000),(Time=361.000000),(Time=364.000000),(Time=367.000000),(Time=371.000000),(Time=373.000000),(Time=376.000000),(Time=379.000000),(Time=382.000000),(Time=385.000000),(Time=388.000000),(Time=391.000000),(Time=394.000000),(Time=397.000000),(Time=400.000000),(Time=403.000000),(Time=406.000000),(Time=409.000000),(Time=412.000000),(Time=415.000000),(Time=418.000000),(Time=421.000000),(Time=424.000000),(Time=427.000000),(Time=430.000000),(Time=432.000000),(Time=435.000000),(Time=438.000000),(Time=441.000000),(Time=443.000000),(Time=446.000000),(Time=448.000000),(Time=450.000000),(Time=452.000000),(Time=455.000000),(Time=458.000000),(Time=460.000000),(Time=463.000000),(Time=465.000000),(Time=467.000000),(Time=469.000000),(Time=471.000000),(Time=473.000000),(Time=475.000000),(Time=477.000000),(Time=479.000000),(Time=481.000000),(Time=483.500000),(Time=485.500000),(Time=487.000000),(Time=489.000000),(Time=491.000000),(Time=492.500000),(Time=496.000000),(Time=499.000000),(Time=501.000000),(Time=502.500000),(Time=505.000000),(Time=506.000000),(Time=511.000000),(Time=514.000000),(Time=516.000000),(Time=518.000000),(Time=520.000000),(Time=522.000000),(Time=524.000000),(Time=526.000000),(Time=528.000000),(Time=530.000000),(Time=532.000000),(Time=534.000000),(Time=536.000000),(Time=538.000000),(Time=540.000000),(Time=542.500000),(Time=545.500000),(Time=547.000000),(Time=549.000000),(Time=551.000000),(Time=553.000000),(Time=555.000000),(Time=556.500000),(Time=559.000000),(Time=560.500000),(Time=562.500000),(Time=564.000000),(Time=566.000000),(Time=568.000000),(Time=570.500000),(Time=572.000000),(Time=573.500000),(Time=576.000000),(Time=579.000000),(Time=581.000000),(Time=583.000000),(Time=585.000000),(Time=586.500000),(Time=588.500000),(Time=590.000000),(Time=591.500000),(Time=592.500000),(Time=594.000000),(Time=595.500000),(Time=596.500000),(Time=597.500000),(Time=598.500000),(Time=600.000000),(Time=601.000000),(Time=602.000000),(Time=603.000000),(Time=604.500000),(Time=606.000000),(Time=607.500000),(Time=609.000000),(Time=610.500000),(Time=612.000000),(Time=612.500000),(Time=613.500000),(Time=614.500000),(Time=615.500000),(Time=617.500000),(Time=619.000000),(Time=620.500000),(Time=621.500000),(Time=623.000000),(Time=624.000000),(Time=625.000000),(Time=626.000000),(Time=626.500000),(Time=628.500000),(Time=630.000000),(Time=631.000000),(Time=632.500000),(Time=633.500000),(Time=635.000000),(Time=636.500000),(Time=638.000000),(Time=639.500000),(Time=641.000000),(Time=642.500000),(Time=644.000000),(Time=645.000000),(Time=647.000000),(Time=648.500000),(Time=650.000000),(Time=651.000000),(Time=652.500000),(Time=654.000000),(Time=655.500000),(Time=657.000000),(Time=658.500000),(Time=660.000000),(Time=661.500000),(Time=663.000000),(Time=664.500000),(Time=666.500000),(Time=668.000000),(Time=670.000000),(Time=671.000000),(Time=673.000000),(Time=674.500000),(Time=676.000000),(Time=677.500000),(Time=680.000000),(Time=682.000000),(Time=683.500000),(Time=685.000000),(Time=686.500000),(Time=688.000000),(Time=689.500000),(Time=691.000000),(Time=692.500000),(Time=694.000000),(Time=695.500000),(Time=697.000000),(Time=698.500000),(Time=700.000000),(Time=701.500000),(Time=703.000000),(Time=704.500000),(Time=706.000000),(Time=707.500000),(Time=709.000000),(Time=710.500000),(Time=712.000000),(Time=713.500000),(Time=715.000000),(Time=716.000000),(Time=717.000000),(Time=718.000000),(Time=719.000000),(Time=720.000000),(Time=721.000000),(Time=722.000000),(Time=723.000000),(Time=724.000000),(Time=725.500000),(Time=727.000000),(Time=728.500000),(Time=730.000000),(Time=731.500000),(Time=733.000000),(Time=734.500000),(Time=736.000000),(Time=737.500000),(Time=739.000000),(Time=740.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      GroupName="Camera"
      GroupColor=(B=0,G=191,R=145,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1099.500000
   InterpGroups(0)=InterpGroup'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1099.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=2016
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=1798,OverrideDelta=15)
   InputLinks(1)=(DrawY=1820,OverrideDelta=37)
   InputLinks(2)=(DrawY=1842,OverrideDelta=59)
   InputLinks(3)=(DrawY=1864,OverrideDelta=81)
   InputLinks(4)=(DrawY=1886,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2')),DrawY=1814,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1870,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-8676,OverrideDelta=29)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),LinkDesc="Camera",MinVars=0,DrawX=-8620,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=1760
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_143'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=944
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_154'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1048
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1144
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_146'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1248
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_147'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1344
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_148'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1448
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_156'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1544
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_158'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1648
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_252
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_160'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_252"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_253
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_162'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1848
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_253"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_254
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1944
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_254"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_255
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_166'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2048
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_255"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_256
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_168'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_256"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_257
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_170'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2248
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_257"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_258
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_172'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2344
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_258"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_259
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_174'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_259"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_260
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_176'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_260"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_261
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_178'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_261"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_262
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_180'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2744
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_262"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_263
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_182'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_263"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_264
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_184'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_264"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_265
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_186'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3048
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_265"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_266
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_188'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3144
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_266"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_267
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_190'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_267"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_268
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_301'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3344
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_268"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_269
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_303'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3448
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_269"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_270
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_305'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3544
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_270"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_271
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_307'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3648
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_271"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_272
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_309'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3744
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_272"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_273
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_311'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3848
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_273"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_274
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_313'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3944
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_274"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_276
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4144
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_276"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4248
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_278
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4344
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_278"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_279
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4448
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_279"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_280
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4544
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_280"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_281
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4648
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_281"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_282
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4744
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_282"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_283
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4848
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_283"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_285
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5048
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_285"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_86'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5144
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5248
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5344
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5448
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5544
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5648
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_292
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5744
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_292"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_293
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5848
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_293"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_294
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5944
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_294"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_295
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6048
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_295"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_296
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6144
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_296"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_297
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6248
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_297"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_298
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_110'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6344
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_298"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_299
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_112'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6448
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_299"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_300
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6544
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_300"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_301
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6648
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_301"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_302
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6744
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_302"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_303
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6848
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_303"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_304
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6944
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_304"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_305
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_124'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7048
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_305"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_306
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_126'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7144
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_306"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_307
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7248
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_307"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_308
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_130'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7344
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_308"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_309
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_132'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7448
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_309"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_310
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_134'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7544
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_310"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_311
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_136'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7648
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_311"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_312
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_138'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7744
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_312"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_140'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7848
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_144'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7944
   ObjPosY=-8944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_315
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_155'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_315"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_321
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_157'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_321"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_323
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_161'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1736
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_323"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_324
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_163'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_324"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_326
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_167'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_326"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_327
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_169'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2136
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_327"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_330
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_175'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_330"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_331
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_331"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_332
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_332"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_333
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_181'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2736
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_333"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_334
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_183'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2840
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_334"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_335
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_185'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2936
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_335"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_336
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_187'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_336"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_337
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_189'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3136
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_337"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_338
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_300'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_338"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_340
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_304'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3440
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_340"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_341
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_306'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3536
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_341"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_342
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_308'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3640
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_342"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_347
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4136
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_347"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_349
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_71'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_349"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_350
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4440
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_350"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_351
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_75'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_351"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_352
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_352"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_353
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4736
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_353"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_354
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4840
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_354"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_356
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_85'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5040
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_356"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_357
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_87'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5136
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_357"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_358
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5240
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_358"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_359
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5336
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_359"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_360
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5440
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_360"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_361
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5536
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_361"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_362
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5640
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_362"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_363
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_321'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5736
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_363"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_364
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5840
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_364"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_365
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5936
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_365"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_366
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6040
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_366"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_367
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_325'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6136
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_367"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_368
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_328'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6240
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_368"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_369
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6336
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_369"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_370
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6440
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_370"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_371
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_115'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6536
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_371"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_372
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6640
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_372"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_374
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6840
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_374"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_375
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6936
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_375"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_376
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_125'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7040
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_376"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_377
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_127'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7136
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_377"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_378
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_129'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7240
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_378"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_379
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_131'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7336
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_379"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_380
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7440
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_380"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_381
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_135'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7536
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_381"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_382
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_137'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7640
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_382"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_383
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_139'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7736
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_383"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_384
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_141'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7840
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_384"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_385
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_149'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7936
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_385"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=7253
   SizeY=178
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=176
   ObjPosY=-8520
   ObjComment="FRF_Spotlights_A"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_404
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_404"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_405
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_405"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_406
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=416
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_406"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_407
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=512
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_407"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_408
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_408"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_409
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=712
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_409"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_410
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_410"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_411
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_411"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_412
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_412"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_413
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1112
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_413"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_414
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_414"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_415
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_415"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_416
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1416
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_416"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_417
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_417"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_418
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1616
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_418"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_419
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_419"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_420
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1816
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_420"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_421
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_421"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_422
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2016
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_422"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_423
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_423"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_424
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_424"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_425
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_425"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_426
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2416
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_426"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_427
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2512
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_427"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_428
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_428"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_429
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2712
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_429"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_430
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_430"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_431
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_431"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_432
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_432"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_433
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3112
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_433"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_434
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_434"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_435
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_435"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_436
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3416
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_436"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_437
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3512
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_437"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_438
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3616
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_438"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_439
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_439"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_440
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3816
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_440"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_441
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3912
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_441"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_442
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4016
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_442"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_443
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_443"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_444
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_444"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_445
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_445"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_446
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4416
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_446"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_447
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4512
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_447"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_448
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_448"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_449
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4712
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_449"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_450
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4816
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_450"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_451
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4912
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_451"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_452
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5016
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_452"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_453
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5112
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_453"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_454
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_454"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_455
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_455"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_456
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5416
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_456"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_457
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5512
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_457"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_458
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5616
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_458"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_459
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5712
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_459"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_460
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5816
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_460"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_461
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5912
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_461"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_462
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6016
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_462"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_463
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6112
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_463"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_464
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_464"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_465
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_465"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_466
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6416
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_466"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_467
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6512
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_467"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_468
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6616
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_468"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_469
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6712
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_469"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_470
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6816
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_470"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_471
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6912
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_471"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_472
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7016
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_472"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_473
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7112
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_473"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_474
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7216
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_474"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_475
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7312
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_475"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_21
   Duration=2.000000
   InputLinks(0)=(DrawY=-9459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9417,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_72',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=-9454,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9422,OverrideDelta=51)
   VariableLinks(0)=(DrawX=580,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=-9496
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_21"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_22
   Duration=0.000000
   InputLinks(0)=(DrawY=-9019,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8998,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8977,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1)),DrawY=-9014,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8982,OverrideDelta=51)
   VariableLinks(0)=(DrawX=524,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=472
   ObjPosY=-9056
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_22"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_23
   Duration=3.000000
   InputLinks(0)=(DrawY=-9171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9129,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_72'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-9166,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9134,OverrideDelta=51)
   VariableLinks(0)=(DrawX=516,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=-9208
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_23"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_20
   Duration=4.000000
   InputLinks(0)=(DrawY=-9307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9265,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-9302,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9270,OverrideDelta=51)
   VariableLinks(0)=(DrawX=524,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=472
   ObjPosY=-9344
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_20"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=2186,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2186,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-8856,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=2152
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=6088
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=136
   ObjPosY=-7760
   ObjComment="HQ_Fluorescents"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-8267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8225,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_830',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_831',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_841',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_842',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_843',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_844',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_845',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_846',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_847',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_848',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_849',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_850',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_851',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_852',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_853',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_854',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_855',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_857',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_858',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_859',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_860',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_861',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_862',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_863',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_864',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_865',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_866',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_867',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_868',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_869',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_870',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_871',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1054',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1056',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1057',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1060',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1078',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1080',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1082',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1085',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1087',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1088',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_386',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_387',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_388',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_389',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_390',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_391',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_392',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_393',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_394',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_395',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_396',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_403',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_476',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_477',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_478',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_479',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_480',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_481',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_482',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_483'),DrawX=3078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3129,OverrideDelta=76)
   EventLinks(0)=(DrawX=3178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=-8304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_830
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_830"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_831
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=432
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_831"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_841
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_841"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_842
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_842"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_843
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1632
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_843"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_844
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1728
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_844"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_845
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_845"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_846
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_846"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_847
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_847"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_848
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2128
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_848"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_849
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_849"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_850
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2328
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_850"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_851
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2432
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_851"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_852
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_852"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_853
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_853"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_854
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2728
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_854"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_855
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2832
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_855"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_857
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_857"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_858
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_858"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_859
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3232
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_859"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_860
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3328
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_860"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_861
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_861"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_862
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_862"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_863
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3632
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_863"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_864
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3728
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_864"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_865
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3832
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_865"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_866
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3928
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_866"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_867
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4032
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_867"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_868
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4128
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_868"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_869
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4232
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_869"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_870
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4328
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_870"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_871
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_871"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=6480
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=112
   ObjPosY=-7312
   ObjComment="WRF_Fluorescents"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1054
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_193'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1054"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1056
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1056"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1057
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1057"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1060
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1000
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1060"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1078
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_217'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2808
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1078"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1080
   ObjValue=PointLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.PointLightToggleable_219'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3008
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1080"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1082
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3208
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1082"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1085
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3512
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1085"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1087
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1087"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1088
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3808
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1088"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_386
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2352
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_386"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_387
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_387"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_388
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_388"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_389
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_75'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2656
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_389"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_390
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2752
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_390"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_391
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_77'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2856
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_391"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_392
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_392"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_393
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3056
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_393"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_394
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3152
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_394"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_395
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3256
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_395"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_396
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3352
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_396"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_403
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_83'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3456
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_403"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_476
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3552
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_476"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_477
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_85'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3656
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_477"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_478
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_86'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3752
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_478"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=1584
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=-7064
   ObjComment="WRF_CeilingLights_Outside"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_479
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_87'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=-6720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_479"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_480
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=-6720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_480"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_481
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=-6720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_481"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_482
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3112
   ObjPosY=-6720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_482"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_483
   ObjValue=SpotLightToggleable'KF-MOONBASE.TheWorld:PersistentLevel.SpotLightToggleable_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=-6720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_483"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_8
   SizeX=584
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2752
   ObjPosY=-6776
   ObjComment="WRF_CeilingLights_Inside"
   Name="SequenceFrameWrapped_8"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-1264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=-9280
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8440
   ObjPosY=-7880
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-8011,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7990,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7969,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7990,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=-8402,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8351,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8302,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8440
   ObjPosY=-8048
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-7651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7609,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7630,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-8378,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8327,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8278,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8416
   ObjPosY=-7688
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8424
   ObjPosY=-7520
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8416
   ObjPosY=-7120
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-7251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7209,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),DrawX=-8370,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8319,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8270,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8408
   ObjPosY=-7288
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-6875,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6854,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6833,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6854,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),DrawX=-8354,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8303,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8254,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8392
   ObjPosY=-6912
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8400
   ObjPosY=-6744
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8432
   ObjPosY=-6312
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-6443,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6422,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6401,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6422,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-8386,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8335,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8286,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8424
   ObjPosY=-6480
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-6051,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6030,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6009,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6030,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=-8386,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8335,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8286,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8424
   ObjPosY=-6088
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8432
   ObjPosY=-5920
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8440
   ObjPosY=-5552
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-5683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5641,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5662,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-8394,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8343,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8294,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8432
   ObjPosY=-5720
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-MOONBASE.TheWorld:PersistentLevel.KFSpawner_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=-5208
   ObjComment="PARENT - wall spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-5331,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5310,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5289,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5310,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=-8346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8295,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-5368
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_492
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2088
   ObjPosY=2552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_492"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=2445,OverrideDelta=14)
   InputLinks(1)=(DrawY=2466,OverrideDelta=35)
   InputLinks(2)=(DrawY=2487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_492',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_290'),DrawX=-2066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2104
   ObjPosY=2408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_314
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2120
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_314"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=2805,OverrideDelta=14)
   InputLinks(1)=(DrawY=2826,OverrideDelta=35)
   InputLinks(2)=(DrawY=2847,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2826,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_314',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_291'),DrawX=-2114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=2768
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_2
   InputLinks(0)=(DrawY=2789,OverrideDelta=14)
   InputLinks(1)=(DrawY=2810,OverrideDelta=35)
   InputLinks(2)=(DrawY=2831,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2810,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_493',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_313'),DrawX=-1714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1752
   ObjPosY=2752
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_2"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_493
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_493"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_26
   bStartWillRestart=True
   Duration=50.000000
   InputLinks(0)=(DrawY=3004,OverrideDelta=14)
   InputLinks(1)=(DrawY=3025,OverrideDelta=35)
   InputLinks(2)=(DrawY=3046,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31',InputLinkIdx=1)),DrawY=3009,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3041,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2485,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2537
   ObjPosY=2967
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_26"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_291
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2008
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_291"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_290
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_260'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2000
   ObjPosY=2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_290"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_313
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1632
   ObjPosY=2888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_313"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_503
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=1472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_503"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_504
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_252'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1624
   ObjPosY=1648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_504"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_505
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1512
   ObjPosY=1304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_505"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_506
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1632
   ObjPosY=1304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_506"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=1181,OverrideDelta=14)
   InputLinks(1)=(DrawY=1202,OverrideDelta=35)
   InputLinks(2)=(DrawY=1223,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1202,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_506',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_505'),DrawX=-1546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=1144
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_507
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_247'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=1656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_507"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
   InputLinks(0)=(DrawY=1533,OverrideDelta=14)
   InputLinks(1)=(DrawY=1554,OverrideDelta=35)
   InputLinks(2)=(DrawY=1575,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_507',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_504'),DrawX=-1642,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1591,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1542,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=1496
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_44"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_4
   InputLinks(0)=(DrawY=1357,OverrideDelta=14)
   InputLinks(1)=(DrawY=1378,OverrideDelta=35)
   InputLinks(2)=(DrawY=1399,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_508',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_503'),DrawX=-1250,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1199,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1150,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1288
   ObjPosY=1320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_4"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_508
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1304
   ObjPosY=1472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_508"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_29
   Duration=50.000000
   InputLinks(0)=(DrawY=1389,OverrideDelta=14)
   InputLinks(1)=(DrawY=1410,OverrideDelta=35)
   InputLinks(2)=(DrawY=1431,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_4')),DrawY=1394,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1426,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1876,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1928
   ObjPosY=1352
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_29"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_30
   Duration=50.000000
   InputLinks(0)=(DrawY=5,OverrideDelta=14)
   InputLinks(1)=(DrawY=26,OverrideDelta=35)
   InputLinks(2)=(DrawY=47,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_81'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_82',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_5')),DrawY=10,OverrideDelta=19)
   OutputLinks(1)=(DrawY=42,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1924,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1976
   ObjPosY=-32
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_30"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_509
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1352
   ObjPosY=80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_509"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_5
   InputLinks(0)=(DrawY=-27,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6,OverrideDelta=35)
   InputLinks(2)=(DrawY=15,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_509',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_514'),DrawX=-1298,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1247,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1198,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1336
   ObjPosY=-64
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_5"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
   InputLinks(0)=(DrawY=141,OverrideDelta=14)
   InputLinks(1)=(DrawY=162,OverrideDelta=35)
   InputLinks(2)=(DrawY=183,OverrideDelta=56)
   OutputLinks(0)=(DrawY=162,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_510',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_513'),DrawX=-1690,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1639,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1590,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_81"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_510
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_510"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_82
   InputLinks(0)=(DrawY=-202,OverrideDelta=14)
   InputLinks(1)=(DrawY=-181,OverrideDelta=35)
   InputLinks(2)=(DrawY=-160,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-181,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_511',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_512'),DrawX=-1594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1632
   ObjPosY=-239
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_82"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_511
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_511"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_512
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_290'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_512"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_513
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1672
   ObjPosY=256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_513"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_514
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1256
   ObjPosY=80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_514"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_515
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1240
   ObjPosY=-1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_515"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_516
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1656
   ObjPosY=-1264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_516"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_517
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1544
   ObjPosY=-1600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_517"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_518
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1664
   ObjPosY=-1600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_518"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_83
   InputLinks(0)=(DrawY=-1723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_518',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_517'),DrawX=-1578,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1527,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1478,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1616
   ObjPosY=-1760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_83"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_519
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1768
   ObjPosY=-1256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_519"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_85
   InputLinks(0)=(DrawY=-1379,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1358,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1337,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1358,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_519',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_516'),DrawX=-1674,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1623,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1574,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1712
   ObjPosY=-1416
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_85"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_6
   InputLinks(0)=(DrawY=-1547,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1526,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1505,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1526,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_520',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_515'),DrawX=-1282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1320
   ObjPosY=-1584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_6"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_520
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1336
   ObjPosY=-1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_520"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_31
   Duration=50.000000
   InputLinks(0)=(DrawY=-1515,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1494,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1473,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_85'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_83',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_6')),DrawY=-1510,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1478,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1908,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1960
   ObjPosY=-1552
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_31"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_32
   Duration=50.000000
   InputLinks(0)=(DrawY=-2971,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2950,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2929,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_87'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_86',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_7')),DrawY=-2966,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2934,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1844,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1896
   ObjPosY=-3008
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_32"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_526
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1272
   ObjPosY=-2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_526"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_7
   InputLinks(0)=(DrawY=-3003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2961,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2982,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_526',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_521'),DrawX=-1218,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1167,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1118,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1256
   ObjPosY=-3040
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_7"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_87
   InputLinks(0)=(DrawY=-2835,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2814,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2793,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2814,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_525',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_522'),DrawX=-1610,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1559,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1510,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1648
   ObjPosY=-2872
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_87"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_525
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1704
   ObjPosY=-2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_525"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_86
   InputLinks(0)=(DrawY=-3179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3137,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3158,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_524',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_523'),DrawX=-1514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1552
   ObjPosY=-3216
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_86"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_524
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1600
   ObjPosY=-3056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_524"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_523
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1480
   ObjPosY=-3056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_523"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_522
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1592
   ObjPosY=-2720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_522"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_521
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=-2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_521"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_33
   Duration=50.000000
   InputLinks(0)=(DrawY=-4355,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4334,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4313,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_90'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_88',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_8')),DrawY=-4350,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4318,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1900,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1952
   ObjPosY=-4392
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_33"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_532
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1328
   ObjPosY=-4280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_532"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_8
   InputLinks(0)=(DrawY=-4387,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4366,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4345,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4366,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_532',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_527'),DrawX=-1274,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1223,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1174,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=-4424
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_8"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_90
   InputLinks(0)=(DrawY=-4219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4177,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4198,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_531',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_528'),DrawX=-1666,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1615,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1566,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1704
   ObjPosY=-4256
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_90"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_531
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1760
   ObjPosY=-4096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_531"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_88
   InputLinks(0)=(DrawY=-4563,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4542,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4521,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4542,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_530',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_529'),DrawX=-1570,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1519,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1470,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1608
   ObjPosY=-4600
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_88"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_530
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1656
   ObjPosY=-4440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_530"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_529
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1536
   ObjPosY=-4440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_529"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_528
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1648
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_528"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_527
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1232
   ObjPosY=-4280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_527"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_34
   Duration=50.000000
   InputLinks(0)=(DrawY=-5707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5665,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_93'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_92',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_9')),DrawY=-5702,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5670,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1836,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1888
   ObjPosY=-5744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_34"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_538
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1264
   ObjPosY=-5632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_538"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_9
   InputLinks(0)=(DrawY=-5739,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5718,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5697,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5718,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_538',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_533'),DrawX=-1210,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1159,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1110,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1248
   ObjPosY=-5776
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_9"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_93
   InputLinks(0)=(DrawY=-5571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_537',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_534'),DrawX=-1602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1640
   ObjPosY=-5608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_93"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_537
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1696
   ObjPosY=-5448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_537"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_92
   InputLinks(0)=(DrawY=-5915,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5873,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5894,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_536',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_535'),DrawX=-1506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1544
   ObjPosY=-5952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_92"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_536
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1592
   ObjPosY=-5792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_536"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_535
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1472
   ObjPosY=-5792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_535"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_534
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=-5456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_534"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_533
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=-5632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_533"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_35
   Duration=50.000000
   InputLinks(0)=(DrawY=-7083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7041,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_95'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_94',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_10')),DrawY=-7078,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7046,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1780,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1832
   ObjPosY=-7120
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_35"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_544
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_544"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_10
   InputLinks(0)=(DrawY=-7115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_544',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_539'),DrawX=-1154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=-7152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_10"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_95
   InputLinks(0)=(DrawY=-6947,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6926,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6905,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6926,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_543',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_540'),DrawX=-1546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=-6984
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_95"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_543
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1640
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_543"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_94
   InputLinks(0)=(DrawY=-7291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7249,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7270,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_542',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_541'),DrawX=-1450,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1399,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1350,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1488
   ObjPosY=-7328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_94"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_542
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1536
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_542"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_541
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1416
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_541"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_540
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1528
   ObjPosY=-6832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_540"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_539
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1112
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_539"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
   Duration=50.000000
   InputLinks(0)=(DrawY=-8819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8777,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1')),DrawY=-8814,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8782,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1992
   ObjPosY=-8856
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_7"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_496
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1448
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_496"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_1
   InputLinks(0)=(DrawY=-8811,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8790,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8769,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8790,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_496',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_288'),DrawX=-1394,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1343,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1294,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1432
   ObjPosY=-8848
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_1"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-8739,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8718,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8697,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8718,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_495',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_289'),DrawX=-1714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1752
   ObjPosY=-8776
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_495
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=-8616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_495"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
   InputLinks(0)=(DrawY=-9027,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9006,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8985,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9006,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_494',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_287'),DrawX=-1610,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1559,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1510,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1648
   ObjPosY=-9064
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_76"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_494
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1696
   ObjPosY=-8904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_494"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_287
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=-8904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_287"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_289
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1696
   ObjPosY=-8624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_289"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_288
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1352
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_288"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=5944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_277
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1728
   ObjPosY=6120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_277"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_286
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1616
   ObjPosY=5776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_286"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_545
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=5776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_545"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_98
   InputLinks(0)=(DrawY=5653,OverrideDelta=14)
   InputLinks(1)=(DrawY=5674,OverrideDelta=35)
   InputLinks(2)=(DrawY=5695,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_545',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_286'),DrawX=-1650,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1599,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1550,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1688
   ObjPosY=5616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_98"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_546
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1840
   ObjPosY=6128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_546"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_99
   InputLinks(0)=(DrawY=6005,OverrideDelta=14)
   InputLinks(1)=(DrawY=6026,OverrideDelta=35)
   InputLinks(2)=(DrawY=6047,OverrideDelta=56)
   OutputLinks(0)=(DrawY=6026,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_546',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_277'),DrawX=-1746,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1695,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1646,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=5968
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_99"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_11
   InputLinks(0)=(DrawY=5829,OverrideDelta=14)
   InputLinks(1)=(DrawY=5850,OverrideDelta=35)
   InputLinks(2)=(DrawY=5871,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5850,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_547',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226'),DrawX=-1354,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1303,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1254,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1392
   ObjPosY=5792
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_11"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_547
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1408
   ObjPosY=5944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_547"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_37
   Duration=50.000000
   InputLinks(0)=(DrawY=5885,OverrideDelta=14)
   InputLinks(1)=(DrawY=5906,OverrideDelta=35)
   InputLinks(2)=(DrawY=5927,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_99'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_98',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_11')),DrawY=5890,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5922,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1892,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1944
   ObjPosY=5848
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_37"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_548
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=6104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_548"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_44
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=5498,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5498,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_549'),DrawX=-1248,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1296
   ObjPosY=5464
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_44"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_45
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=5322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5322,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_549'),DrawX=-1120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=5288
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_45"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_549
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=5520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_549"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_44
   EventName="Electric On3"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_45')),DrawY=5346,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1462,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=5280
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_44"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_45
   EventName="Electric1Off3"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_44')),DrawY=5530,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1459,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1560
   ObjPosY=5464
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_45"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_22
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_11'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_46'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_24')),DrawY=5285,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5307,OverrideDelta=36)
   OutputLinks(2)=(DrawY=5329,OverrideDelta=58)
   OutputLinks(3)=(DrawY=5351,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3755,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3676,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=5216
   ObjName="KFTrigger_MinigameButton_11 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_22"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_100
   InputLinks(0)=(DrawY=5781,OverrideDelta=14)
   InputLinks(1)=(DrawY=5802,OverrideDelta=35)
   InputLinks(2)=(DrawY=5823,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5802,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_553',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_554',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_555',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_556'),DrawX=-2458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2496
   ObjPosY=5744
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_100"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_550
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=5656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_550"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_46
   EventName="Electric On3"
   MaxWidth=197
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_100'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_46'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_38'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_44'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_99',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_98'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_11',InputLinkIdx=1)),DrawY=5578,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2718,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=5512
   ObjComment="Electric On"
   DrawWidth=118
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_46"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_24
   EventName="Electric On3"
   InputLinks(0)=(DrawY=5538,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5538,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3151,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=5504
   ObjComment="Electric On"
   DrawWidth=258
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_24"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_47
   EventName="Electric1Off3"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_100',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_45'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_37')),DrawY=5810,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2731,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=5744
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_47"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_44
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=5602,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5602,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_550'),DrawX=-2430,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=5568
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_44"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_25
   EventName="Electric1Off3"
   InputLinks(0)=(DrawY=5466,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5466,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2045,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2176
   ObjPosY=5432
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_25"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_45
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=5994,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5994,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_551'),DrawX=-2454,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=5960
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_45"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_551
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=6048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_551"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_38
   Duration=17.000000
   InputLinks(0)=(DrawY=5461,OverrideDelta=14)
   InputLinks(1)=(DrawY=5482,OverrideDelta=35)
   InputLinks(2)=(DrawY=5503,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_25')),DrawY=5466,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5498,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2332,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=5424
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_38"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_70
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3981
   ObjPosY=4936
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_70"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_46
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=5322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5322,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_552'),DrawX=-3184,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3232
   ObjPosY=5288
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_46"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_552
   ObjValue=Note'KF-MOONBASE.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3216
   ObjPosY=5368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_552"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_553
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=5864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_553"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_554
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=5880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_554"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_555
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2368
   ObjPosY=5880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_555"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_556
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2272
   ObjPosY=5856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_556"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_23
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_19'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_47'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_24')),DrawY=5813,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5835,OverrideDelta=36)
   OutputLinks(2)=(DrawY=5857,OverrideDelta=58)
   OutputLinks(3)=(DrawY=5879,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3779,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3700,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=5744
   ObjName="KFTrigger_MinigameButton_19 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_23"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_47
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=6042,OverrideDelta=11)
   OutputLinks(0)=(DrawY=6042,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_548'),DrawX=-3240,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=6008
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_47"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_46
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=5274,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_39')),DrawY=5274,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_557',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_558'),DrawX=-2478,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=5240
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_46"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_557
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=5328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_557"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_558
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=5328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_558"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_47
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=5274,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5274,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_559',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_560'),DrawX=-2070,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=5240
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_47"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_559
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=5336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_559"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_560
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2048
   ObjPosY=5336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_560"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_39
   Duration=15.000000
   InputLinks(0)=(DrawY=5269,OverrideDelta=14)
   InputLinks(1)=(DrawY=5290,OverrideDelta=35)
   InputLinks(2)=(DrawY=5311,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_47')),DrawY=5274,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5306,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2268,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=5232
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_39"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_13
   SizeX=688
   SizeY=440
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4952
   ObjPosY=-9552
   ObjComment="LQ_PlayerSpawns"
   Name="SequenceFrameWrapped_13"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_14
   SizeX=680
   SizeY=408
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4952
   ObjPosY=-9056
   ObjComment="FRF_PlayerSpawns"
   Name="SequenceFrameWrapped_14"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_15
   SizeX=680
   SizeY=408
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4952
   ObjPosY=-8600
   ObjComment="HQ_PlayerSpawns"
   Name="SequenceFrameWrapped_15"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_14
   Duration=15.000000
   InputLinks(0)=(DrawY=3718,OverrideDelta=14)
   InputLinks(1)=(DrawY=3739,OverrideDelta=35)
   InputLinks(2)=(DrawY=3760,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_28')),DrawY=3723,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3755,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-2301,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2353
   ObjPosY=3681
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_14"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2081
   ObjPosY=3785
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2177
   ObjPosY=3785
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_28
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=3723,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3723,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=-2103,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2161
   ObjPosY=3689
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_28"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2489
   ObjPosY=3777
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2585
   ObjPosY=3777
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_26
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=3723,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_14')),DrawY=3723,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150'),DrawX=-2511,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2569
   ObjPosY=3689
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_26"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_11
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_18'
   ReTriggerDelay=60.000000
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),DrawY=4262,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4284,OverrideDelta=36)
   OutputLinks(2)=(DrawY=4306,OverrideDelta=58)
   OutputLinks(3)=(DrawY=4328,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3812,OverrideDelta=101)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3733,OverrideDelta=181)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3945
   ObjPosY=4193
   ObjName="KFTrigger_MinigameButton_18 Minigame Activation"
   DrawWidth=242
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_11"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2305
   ObjPosY=4305
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2401
   ObjPosY=4329
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2489
   ObjPosY=4329
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KF-MOONBASE.TheWorld:PersistentLevel.Emitter_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2585
   ObjPosY=4313
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=3123
   SizeY=1267
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4014
   ObjPosY=3385
   ObjComment="Shock Trap"
   DrawWidth=3123
   DrawHeight=1267
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_9
   Duration=17.000000
   InputLinks(0)=(DrawY=3910,OverrideDelta=14)
   InputLinks(1)=(DrawY=3931,OverrideDelta=35)
   InputLinks(2)=(DrawY=3952,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=3915,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3947,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-2365,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2417
   ObjPosY=3873
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_9"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2513
   ObjPosY=4497
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_19
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=4443,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4443,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101'),DrawX=-2487,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2545
   ObjPosY=4409
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_19"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="Electric1Off42"
   InputLinks(0)=(DrawY=3915,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3915,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2074,OverrideDelta=103)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2209
   ObjPosY=3881
   DrawWidth=271
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_18
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=4051,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4051,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100'),DrawX=-2463,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2521
   ObjPosY=4017
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_18"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_16
   EventName="Electric1Off42"
   MaxWidth=210
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_71',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_19'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28')),DrawY=4259,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2760,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2865
   ObjPosY=4193
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_16"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_17
   EventName="Electric On42"
   InputLinks(0)=(DrawY=3987,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3987,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3180,OverrideDelta=101)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3313
   ObjPosY=3953
   ObjComment="Electric On"
   DrawWidth=266
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_17"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_12
   EventName="Electric On42"
   MaxWidth=205
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_71'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_26'),(LinkedOp=SeqAct_Delay'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_9'),(LinkedOp=SeqAct_ChangeCollision'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_18'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34'),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3',InputLinkIdx=1)),DrawY=4027,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2747,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2849
   ObjPosY=3961
   ObjComment="Electric On"
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_12"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=KFPhysicsDamageByPawnVolume'KF-MOONBASE.TheWorld:PersistentLevel.KFPhysicsDamageByPawnVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2489
   ObjPosY=4105
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_71
   InputLinks(0)=(DrawY=4230,OverrideDelta=14)
   InputLinks(1)=(DrawY=4251,OverrideDelta=35)
   InputLinks(2)=(DrawY=4272,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4251,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-2491,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2440,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2391,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2529
   ObjPosY=4193
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_71"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_10
   Originator=KFTrigger_MinigameButton'KF-MOONBASE.TheWorld:PersistentLevel.KFTrigger_MinigameButton_9'
   ReTriggerDelay=60.000000
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),DrawY=3734,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3756,OverrideDelta=36)
   OutputLinks(2)=(DrawY=3778,OverrideDelta=58)
   OutputLinks(3)=(DrawY=3800,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-3792,OverrideDelta=97)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),LinkDesc="ReTriggerDelay",PropertyName="ReTriggerDelay",MinVars=0,DrawX=-3713,OverrideDelta=177)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3921
   ObjPosY=3665
   ObjName="KFTrigger_MinigameButton_9 Minigame Activation"
   DrawWidth=238
   DrawHeight=216
   Name="KFSeqEvent_MinigameActivated_10"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_22
   EventName="Electric1Off42"
   MaxWidth=210
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),DrawY=3979,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1488,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1593
   ObjPosY=3913
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_22"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_21
   EventName="Electric On42"
   MaxWidth=205
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21')),DrawY=3795,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1491,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1593
   ObjPosY=3729
   ObjComment="Electric On"
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_21"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=TargetPoint'KF-MOONBASE.TheWorld:PersistentLevel.TargetPoint_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1185
   ObjPosY=3969
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=3771,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3771,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-1153,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1201
   ObjPosY=3737
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=3947,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3947,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-1281,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1329
   ObjPosY=3913
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_28
   Duration=50.000000
   InputLinks(0)=(DrawY=4334,OverrideDelta=14)
   InputLinks(1)=(DrawY=4355,OverrideDelta=35)
   InputLinks(2)=(DrawY=4376,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33'),(LinkedOp=SeqAct_Toggle'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3')),DrawY=4339,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4371,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1925,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1977
   ObjPosY=4297
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_28"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_497
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1441
   ObjPosY=4393
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_497"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_3
   InputLinks(0)=(DrawY=4278,OverrideDelta=14)
   InputLinks(1)=(DrawY=4299,OverrideDelta=35)
   InputLinks(2)=(DrawY=4320,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4299,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_497',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_502'),DrawX=-1387,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1336,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1287,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1425
   ObjPosY=4241
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_3"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=4454,OverrideDelta=14)
   InputLinks(1)=(DrawY=4475,OverrideDelta=35)
   InputLinks(2)=(DrawY=4496,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4475,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_498',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_501'),DrawX=-1779,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1728,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1679,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1817
   ObjPosY=4417
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_498
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1873
   ObjPosY=4577
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_498"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=4102,OverrideDelta=14)
   InputLinks(1)=(DrawY=4123,OverrideDelta=35)
   InputLinks(2)=(DrawY=4144,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4123,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_499',SeqVar_Object'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_500'),DrawX=-1683,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1632,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1583,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1721
   ObjPosY=4065
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_499
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1769
   ObjPosY=4225
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_499"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_500
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1649
   ObjPosY=4225
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_500"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_501
   ObjValue=PointLight'KF-MOONBASE.TheWorld:PersistentLevel.PointLight_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1761
   ObjPosY=4569
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_501"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_502
   ObjValue=InterpActor'KF-MOONBASE.TheWorld:PersistentLevel.InterpActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MOONBASE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1345
   ObjPosY=4393
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_502"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
