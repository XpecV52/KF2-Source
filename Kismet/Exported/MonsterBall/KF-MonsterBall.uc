Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=3735
   SizeY=7912
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9936
   ObjPosY=-9784
   ObjComment="Start Events"
   DrawWidth=3735
   DrawHeight=7912
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=2478
   SizeY=1635
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9864
   ObjPosY=-9640
   ObjComment="Determine game length and apply dynamic weather"
   DrawWidth=2478
   DrawHeight=1635
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=2437
   SizeY=3176
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9856
   ObjPosY=1032
   ObjComment="Lightning"
   DrawWidth=2437
   DrawHeight=3176
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=3491
   SizeY=1885
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-7688
   ObjComment="Torch Lights and Particles Change"
   DrawWidth=3491
   DrawHeight=1885
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=1287
   SizeY=809
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-2992
   ObjComment="Front_Door"
   DrawWidth=1287
   DrawHeight=809
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_10
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_11'
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),DrawY=-9331,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9309,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-9287,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-9265,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2524,OverrideDelta=140)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2696
   ObjPosY=-9400
   ObjName="KFTrigger_MinigameButton_11 Minigame Activation"
   DrawWidth=242
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_10"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-8883,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8862,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8841,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8862,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),DrawX=-1266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1304
   ObjPosY=-8920
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=PhysicsVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.PhysicsVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1264
   ObjPosY=-9008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_12
   EventName="Electric On"
   MaxWidth=189
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_26'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_9'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_18')),DrawY=-9086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1530,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1624
   ObjPosY=-9152
   ObjComment="Electric On"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_12"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_17
   EventName="Electric On"
   InputLinks(0)=(DrawY=-9078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1955,OverrideDelta=93)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-9112
   ObjComment="Electric On"
   DrawWidth=250
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_17"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_16
   EventName="Electric1Off"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_19')),DrawY=-8854,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1535,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1632
   ObjPosY=-8920
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_16"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_18
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-9062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100'),DrawX=-1238,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1296
   ObjPosY=-9096
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_18"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_12
   EventName="Electric1Off"
   InputLinks(0)=(DrawY=-9198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-857,OverrideDelta=95)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-984
   ObjPosY=-9232
   DrawWidth=255
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_12"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_19
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-8670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101'),DrawX=-1254,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=-8704
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_19"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=PhysicsVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.PhysicsVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1280
   ObjPosY=-8616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_9
   Duration=17.000000
   InputLinks(0)=(DrawY=-9203,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9182,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9161,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_12')),DrawY=-9198,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9166,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1140,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=-9240
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_9"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=3114
   SizeY=1211
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2784
   ObjPosY=-9656
   ObjComment="Shock Trap"
   DrawWidth=3114
   DrawHeight=1211
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-9294,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9294,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102'),DrawX=-1984,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2032
   ObjPosY=-9328
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2016
   ObjPosY=-9248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_35
   EventName="On Fire Trap"
   MaxWidth=199
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_38'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_41'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14',InputLinkIdx=1)),DrawY=-7846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1317,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1416
   ObjPosY=-7912
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_35"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_36
   EventName="Off Fire Trap"
   MaxWidth=201
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_39'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=-7422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1316,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1416
   ObjPosY=-7488
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_36"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_15
   EventName="On Fire Trap"
   InputLinks(0)=(DrawY=-7958,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7958,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1878,OverrideDelta=98)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2008
   ObjPosY=-7992
   DrawWidth=260
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_15"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_38
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-7886,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_45')),DrawY=-7886,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),DrawX=-950,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=-7920
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_38"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
   EventName="Off Fire Trap"
   InputLinks(0)=(DrawY=-7886,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-549,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-680
   ObjPosY=-7920
   DrawWidth=262
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_13"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_45
   Duration=7.000000
   InputLinks(0)=(DrawY=-7891,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7870,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7849,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_13')),DrawY=-7886,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7854,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-796,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-848
   ObjPosY=-7928
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_45"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-7491,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7470,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7449,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7470,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_191'),DrawX=-858,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-807,OverrideDelta=76)
   EventLinks(0)=(DrawX=-758,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-896
   ObjPosY=-7528
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_190
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-920
   ObjPosY=-7608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_190"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_191
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_150'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-888
   ObjPosY=-7400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_191"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-7691,ActivateDelay=0.250000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_190'),DrawX=-882,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-831,OverrideDelta=76)
   EventLinks(0)=(DrawX=-782,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-920
   ObjPosY=-7728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_39
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-7254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_202',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207'),DrawX=-854,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=-7288
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_39"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_6
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_2'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14')),DrawY=-8075,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8053,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-8031,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-8009,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2480,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2648
   ObjPosY=-8144
   ObjName="KFTrigger_MinigameButton_2 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_6"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-8118,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8118,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203'),DrawX=-1888,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1936
   ObjPosY=-8152
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1936
   ObjPosY=-8064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_40
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-8110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_193',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_194'),DrawX=-646,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-704
   ObjPosY=-8144
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_40"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_193
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-600
   ObjPosY=-8048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_193"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=3096
   SizeY=1323
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2728
   ObjPosY=-8192
   ObjComment="Fireplace_Trap"
   DrawWidth=3096
   DrawHeight=1323
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=550
   SizeY=2474
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6112
   ObjPosY=-9712
   ObjComment="Portal Spawns"
   DrawWidth=550
   DrawHeight=2474
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bLooping=True
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-6082,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6060,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6038,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6016,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5994,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6066,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6010,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=-1001,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),LinkDesc="Bell_Trap",MinVars=0,DrawX=-954,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),LinkDesc="NewGroup",MinVars=0,DrawX=-890,OverrideDelta=109)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),LinkDesc="Gear1",MinVars=0,DrawX=-822,OverrideDelta=191)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),LinkDesc="Gear2",MinVars=0,DrawX=-768,OverrideDelta=245)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-6120
   DrawWidth=299
   DrawHeight=173
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackMove_2',CurveColor=(B=0,G=199,R=133,A=255),CurveName="Gieatine_Trap_Movement")),ViewStartInput=-0.053412,ViewEndInput=1.946588,ViewStartOutput=-0.991453,ViewEndOutput=1.008547)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=2.976855,Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_BellToll')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.000122,Y=0.000977,Z=0.000000),ArriveTangent=(X=-0.000081,Y=0.000651,Z=0.000000),LeaveTangent=(X=-0.000081,Y=0.000651,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.000244,Y=0.001953,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-180.000000,Y=-11.250000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=3.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackAkEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackAkEvent_1'
      GroupName="Bell_Trap"
      GroupColor=(B=0,G=199,R=133,A=255)
      bCollapsed=True
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.000244,Y=0.000000,Z=0.000977),ArriveTangent=(X=-0.000163,Y=0.000000,Z=0.000651),LeaveTangent=(X=-0.000163,Y=0.000000,Z=0.000651),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.000488,Y=0.000000,Z=0.001953),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=0.000000,Z=-168.750000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=3.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackMove_0'
      GroupName="Gear1"
      GroupColor=(B=211,G=0,R=112,A=255)
      bCollapsed=True
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=1.503320,Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_BellToll')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.000122,Y=-0.000977,Z=0.000000),ArriveTangent=(X=-0.000081,Y=-0.000651,Z=0.000000),LeaveTangent=(X=-0.000081,Y=-0.000651,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.000244,Y=-0.001953,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=180.000000,Y=-11.250000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=3.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackAkEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackAkEvent_0'
      GroupName="NewGroup"
      GroupColor=(B=204,G=0,R=126,A=255)
      bCollapsed=True
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.000977,Y=0.000000,Z=-0.000244),ArriveTangent=(X=-0.000651,Y=0.000000,Z=-0.000163),LeaveTangent=(X=-0.000651,Y=0.000000,Z=-0.000163),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.001953,Y=0.000000,Z=-0.000488),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=0.000000,Z=-168.750000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000),(Time=3.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_3.InterpTrackMove_1'
      GroupName="Gear2"
      GroupColor=(B=213,G=105,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=3.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=3.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-5920
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-952
   ObjPosY=-5840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-6270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=-2112,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-6304
   ObjComment="Lever sound"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-6224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_7
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_6'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_21'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),DrawY=-6475,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6453,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-6431,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-6409,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2544,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2712
   ObjPosY=-6544
   ObjName="KFTrigger_MinigameButton_6 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_7"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Bells"
   MaxWidth=146
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_32'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_33')),DrawY=-6078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1719,OverrideDelta=41)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=-6144
   ObjComment="Bells"
   DrawWidth=93
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="Bells"
   InputLinks(0)=(DrawY=-6094,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2041,OverrideDelta=71)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2144
   ObjPosY=-6128
   ObjComment="Bells"
   DrawWidth=207
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=25.000000
   InputLinks(0)=(DrawY=-6339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6297,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_10')),DrawY=-6334,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6302,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1156,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=-6376
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=2668
   SizeY=1262
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2720
   ObjPosY=-6616
   ObjComment="Bells Trap"
   DrawWidth=2668
   DrawHeight=1262
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=9.000000
   InputLinks(0)=(DrawY=-5915,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5873,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_2')),DrawY=-5910,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5878,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1468,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1520
   ObjPosY=-5952
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_32
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-6142,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=-6142,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=-1254,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=-6176
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_32"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_2
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-5918,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2)),DrawY=-5918,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-1238,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1296
   ObjPosY=-5952
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_2"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_8
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_7'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-7955,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7933,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-7911,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-7889,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5944,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6112
   ObjPosY=-8024
   ObjName="KFTrigger_MinigameButton_7 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_8"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-7808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-7854,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7854,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=-5560,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=-7888
   ObjComment="Button Press Sound"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=2888
   SizeY=1376
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6136
   ObjPosY=-8192
   ObjComment="Cage Trap"
   DrawWidth=2888
   DrawHeight=1376
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_4
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_1'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-7659,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7637,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-7615,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-7593,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2464,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2632
   ObjPosY=-7728
   ObjName="KFTrigger_MinigameButton_1 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_4"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1976
   ObjPosY=-7416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-7470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-1928,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1976
   ObjPosY=-7504
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_194
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-720
   ObjPosY=-8048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_194"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-864
   ObjPosY=-5840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_5
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_4'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),DrawY=-5923,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5901,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-5879,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-5857,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2512,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2680
   ObjPosY=-5992
   ObjName="KFTrigger_MinigameButton_4 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_5"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2112
   ObjPosY=-5576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-5622,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5622,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=-2080,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2128
   ObjPosY=-5656
   ObjComment="Lever sound"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_0
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_10'
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-7515,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7493,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-7471,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-7449,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5868,OverrideDelta=140)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6040
   ObjPosY=-7584
   ObjName="KFTrigger_MinigameButton_10 Minigame Activation"
   DrawWidth=242
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_0"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-7414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=-5576,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5624
   ObjPosY=-7448
   ObjComment="Button Press Sound"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=-7360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1352
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1248
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1048
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-952
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-848
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-752
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-648
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-552
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_11
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_9'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),DrawY=-8803,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8781,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-8759,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-8737,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-2552,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2720
   ObjPosY=-8872
   ObjName="KFTrigger_MinigameButton_9 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_11"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-8574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=-2048,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2096
   ObjPosY=-8608
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=KFPathnode'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPathnode_217'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4552
   ObjPosY=-7640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_17
   InputLinks(0)=(DrawY=-7691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7649,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetPathnodeExtraCost'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetPathnodeExtraCost_1')),DrawY=-7686,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7654,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4724,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-7728
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_17"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=KFPathnode'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPathnode_217'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4096
   ObjPosY=-7496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_18
   Duration=10.000000
   InputLinks(0)=(DrawY=-7683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7641,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetPathnodeExtraCost'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetPathnodeExtraCost_0')),DrawY=-7678,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7646,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4336
   ObjPosY=-7720
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_18"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=InterpData Name=InterpData_14
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1960
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-7850,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7828,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7806,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7784,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7762,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7834,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7778,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=-1910,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),LinkDesc="Lever",MinVars=0,DrawX=-1860,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1960
   ObjPosY=-7888
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1856
   ObjPosY=-7680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1016
   ObjPosY=-8032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_195"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_41
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-8110,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_46')),DrawY=-8110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_196',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_195'),DrawX=-1062,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1120
   ObjPosY=-8144
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_41"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_196
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1096
   ObjPosY=-8032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_196"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="On Fire Trap"
   InputLinks(0)=(DrawY=-7302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7302,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1878,OverrideDelta=98)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2008
   ObjPosY=-7336
   DrawWidth=260
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-9579,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9558,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9537,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6228,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6146
   ObjPosY=-9648
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-9611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9569,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=6430,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6481,OverrideDelta=76)
   EventLinks(0)=(DrawX=6530,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6392
   ObjPosY=-9648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6408
   ObjPosY=-9528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-9315,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9294,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9273,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6228,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6146
   ObjPosY=-9384
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-9291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9249,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9270,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=6478,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6529,OverrideDelta=76)
   EventLinks(0)=(DrawX=6578,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6440
   ObjPosY=-9328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6448
   ObjPosY=-9200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-9035,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9014,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8993,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6244,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6162
   ObjPosY=-9104
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-9043,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9022,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9001,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9022,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=6470,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6521,OverrideDelta=76)
   EventLinks(0)=(DrawX=6570,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=-9080
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6440
   ObjPosY=-8952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-8763,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8742,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8721,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6268,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6186
   ObjPosY=-8832
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-8779,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8758,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8737,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8758,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=6454,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6505,OverrideDelta=76)
   EventLinks(0)=(DrawX=6554,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6416
   ObjPosY=-8816
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6424
   ObjPosY=-8688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-8499,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8478,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8457,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6268,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6186
   ObjPosY=-8568
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-8539,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8518,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8497,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8518,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=6454,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6505,OverrideDelta=76)
   EventLinks(0)=(DrawX=6554,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6416
   ObjPosY=-8576
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6424
   ObjPosY=-8440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=3235
   SizeY=1242
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6224
   ObjPosY=-9664
   ObjComment="Trap Floor"
   DrawWidth=3235
   DrawHeight=1242
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_22
   EventName="Trap_Floor_On"
   InputLinks(0)=(DrawY=-8998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5375,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5512
   ObjPosY=-9032
   ObjComment="Trap_Floor_On"
   DrawWidth=274
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_22"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-9542,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9542,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-5584,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-9576
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_13
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_17'
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_22')),DrawY=-9251,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9229,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-9207,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-9185,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5972,OverrideDelta=140)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6144
   ObjPosY=-9320
   ObjName="KFTrigger_MinigameButton_17 Minigame Activation"
   DrawWidth=242
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_13"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_11
   EventName="Trap_Floor_On"
   MaxWidth=213
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_11'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_33'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=-9230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4894,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5000
   ObjPosY=-9296
   ObjComment="Trap_Floor_On"
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_11"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_19
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_8
      Name="InterpCurveEdSetup_8"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpCurveEdSetup_8'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5480
   ObjPosY=-9224
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_19"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_19
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-9386,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9364,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9342,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9320,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9298,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9370,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9314,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_19'),DrawX=-5430,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),LinkDesc="Lever",MinVars=0,DrawX=-5380,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5480
   ObjPosY=-9424
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_19"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5408
   ObjPosY=-9248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_5
      Name="InterpCurveEdSetup_5"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpCurveEdSetup_5'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2072
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-9578,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9556,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9534,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9512,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9490,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9562,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9506,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=-2022,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48'),LinkDesc="Lever",MinVars=0,DrawX=-1972,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2072
   ObjPosY=-9616
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_13
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_6
      Name="InterpCurveEdSetup_6"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpCurveEdSetup_6'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2048
   ObjPosY=-8696
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_13"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_13
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-8858,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8836,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8814,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8792,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8770,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8842,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8786,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_13'),DrawX=-1998,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),LinkDesc="Lever",MinVars=0,DrawX=-1948,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2048
   ObjPosY=-8896
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_13"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1976
   ObjPosY=-8720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1960
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_17
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-7194,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7172,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7150,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7128,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7106,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7178,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7122,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_17'),DrawX=-1942,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98'),LinkDesc="Lever",MinVars=0,DrawX=-1892,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1992
   ObjPosY=-7232
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_17"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_17
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_4
      Name="InterpCurveEdSetup_4"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpCurveEdSetup_4'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1992
   ObjPosY=-7032
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_17"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1920
   ObjPosY=-7056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_16
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-7080
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_16"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_16
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-7242,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7220,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7198,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7176,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7154,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7226,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7170,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_16'),DrawX=-5582,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),LinkDesc="Lever",MinVars=0,DrawX=-5532,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-7280
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_16"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-7104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-8122,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8100,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8078,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8056,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8034,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8106,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8050,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=-5582,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),LinkDesc="Lever",MinVars=0,DrawX=-5532,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-8160
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5680
   ObjPosY=-7984
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5568
   ObjPosY=-7984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_26
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-9390,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_14')),DrawY=-9390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150'),DrawX=-1286,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1344
   ObjPosY=-9424
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_26"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1360
   ObjPosY=-9336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1264
   ObjPosY=-9336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_28
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-9390,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=-878,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-936
   ObjPosY=-9424
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_28"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-952
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-856
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_3
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_8'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_22')),DrawY=-8827,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8805,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-8783,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-8761,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5976,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6144
   ObjPosY=-8896
   ObjName="KFTrigger_MinigameButton_8 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_3"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_11
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-9606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-3998,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-9640
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_11"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-9544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3968
   ObjPosY=-9544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4304
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_25
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-8846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158'),DrawX=-4366,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-8880
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_25"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-8826,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8804,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8782,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8760,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8738,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8810,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8754,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=-5446,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52'),LinkDesc="Lever",MinVars=0,DrawX=-5396,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5496
   ObjPosY=-8864
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_7
      Name="InterpCurveEdSetup_7"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_7'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5496
   ObjPosY=-8664
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_33
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-6342,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=-6342,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_167',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168'),DrawX=-1366,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=-6376
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_33"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1440
   ObjPosY=-6280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1352
   ObjPosY=-6280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_21
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-6538,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6516,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6494,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6472,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6450,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6522,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6466,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_21'),DrawX=-2110,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165'),LinkDesc="Lever",MinVars=0,DrawX=-2060,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-6576
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_21"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_21
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=-6392
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_21"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_18
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.800000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.800000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=13.800000),(Time=14.000000),(Time=14.300000),(Time=14.500000),(Time=14.800000),(Time=15.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=15.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=-5776
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_18"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_18
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5938,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5916,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5894,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5872,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5850,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5922,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5866,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_18'),DrawX=-2102,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166'),LinkDesc="Lever",MinVars=0,DrawX=-2052,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=-5976
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_18"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2088
   ObjPosY=-6400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-5800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_10
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-6334,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6334,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164'),DrawX=-934,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-6368
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_10"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-8235,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8214,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8193,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6242,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6160
   ObjPosY=-8304
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-8267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8225,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=6422,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6473,OverrideDelta=76)
   EventLinks(0)=(DrawX=6522,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6384
   ObjPosY=-8304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6392
   ObjPosY=-8176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-8630,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8630,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264'),DrawX=-5624,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-8664
   ObjComment="Lever Used"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5616
   ObjPosY=-9496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=20.000000
   InputLinks(0)=(DrawY=-8859,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8838,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8817,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_25')),DrawY=-8854,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8822,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4556,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4608
   ObjPosY=-8896
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="Cage_Trap"
   InputLinks(0)=(DrawY=-7590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5396,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5520
   ObjPosY=-7624
   ObjComment="Cage_Trap"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="Cage_Trap"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_17'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_4'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_41'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-7590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5082,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-7656
   ObjComment="Cage_Trap"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_4
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-7878,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_11')),DrawY=-7878,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_276',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=-4654,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4712
   ObjPosY=-7912
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_4"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_276
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4744
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_276"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4648
   ObjPosY=-7816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_11
   Duration=15.000000
   InputLinks(0)=(DrawY=-7899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7857,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_12')),DrawY=-7894,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7862,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4452,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4504
   ObjPosY=-7936
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_11"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_12
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-7894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7894,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-4246,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4304
   ObjPosY=-7928
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_12"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4216
   ObjPosY=-7824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4312
   ObjPosY=-7824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_46
   Duration=15.000000
   InputLinks(0)=(DrawY=-8123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8081,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_40')),DrawY=-8118,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8086,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-844,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-896
   ObjPosY=-8160
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_46"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_14
   Duration=15.000000
   InputLinks(0)=(DrawY=-9395,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9374,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9353,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_28')),DrawY=-9390,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9358,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1076,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1128
   ObjPosY=-9432
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_14"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=-7971,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7950,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7929,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6238,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6152
   ObjPosY=-8040
   ObjName="TriggerVolume_13 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-7995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=6462,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6513,OverrideDelta=76)
   EventLinks(0)=(DrawX=6562,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6424
   ObjPosY=-8032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=-7904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-7587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7545,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_55'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_24')),DrawY=-7566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_278',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_279',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_280',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_282',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_283',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_284',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_285',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_286',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_254',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_255',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_256',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_257'),DrawX=-9354,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9303,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9254,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=-7624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_167'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_278
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_171'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9352
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_278"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_279
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_172'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_279"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_280
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_170'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_280"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_281
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9048
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_281"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_282
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_282"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_283
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8848
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_283"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_284
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_284"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_285
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_176'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8648
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_285"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_286
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_286"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_15
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=8.700000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=9.200000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=9.700000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=8.700000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.200000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.700000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=8.500000),(Time=8.700000),(Time=9.000000),(Time=9.200000),(Time=9.500000),(Time=9.700000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=10.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=10.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5448
   ObjPosY=-5648
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_15"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_15
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5810,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5788,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5766,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5744,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5722,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5794,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5738,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_15'),DrawX=-5398,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_184'),LinkDesc="Lever",MinVars=0,DrawX=-5348,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5448
   ObjPosY=-5848
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_15"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_20
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-6370,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6348,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6326,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6304,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6282,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6354,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6298,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_20'),DrawX=-5374,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_183'),LinkDesc="Lever",MinVars=0,DrawX=-5324,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5424
   ObjPosY=-6408
   ObjComment="Lever"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_20"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_20
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000076),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=8.700000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000107),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=9.200000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000153),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000091),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000168),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000090),InterpMode=CIM_CurveAutoClamped),(InVal=9.700000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000198),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=8.500000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=8.700000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.200000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.500000,OutVal=(X=-11.250000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.700000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=8.500000),(Time=8.700000),(Time=9.000000),(Time=9.200000),(Time=9.500000),(Time=9.700000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lever"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=10.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=10.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5432
   ObjPosY=-6232
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_20"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_16
   EventName="Off_Bridge_Fire"
   InputLinks(0)=(DrawY=-6094,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3925,OverrideDelta=107)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4064
   ObjPosY=-6128
   ObjComment="Off_Bridge_Fire"
   DrawWidth=278
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_16"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-5510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5510,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_185'),DrawX=-5384,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5432
   ObjPosY=-5544
   ObjComment="Lever Sound"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_8
   EventName="On_Bridge_Fire"
   InputLinks(0)=(DrawY=-5934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5934,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5334,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-5968
   ObjComment="On_Bridge_Fire"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_8"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Lever'
   InputLinks(0)=(DrawY=-6110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_186'),DrawX=-5360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5408
   ObjPosY=-6144
   ObjComment="Lever Sound"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=3186
   SizeY=1332
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6152
   ObjPosY=-6552
   ObjComment="Bridge Fire"
   DrawWidth=3186
   DrawHeight=1332
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_17
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_16'
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_20'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_8')),DrawY=-6075,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6053,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-6031,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-6009,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5860,OverrideDelta=140)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=-6144
   ObjName="KFTrigger_MinigameButton_16 Minigame Activation"
   DrawWidth=242
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_17"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_18
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_13'
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_8')),DrawY=-5667,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5645,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-5623,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-5601,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5852,OverrideDelta=140)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=-5736
   ObjName="KFTrigger_MinigameButton_13 Minigame Activation"
   DrawWidth=242
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_18"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5360
   ObjPosY=-6232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_184
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5344
   ObjPosY=-5656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_184"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_185
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5416
   ObjPosY=-5464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_185"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_186
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5392
   ObjPosY=-6064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_186"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_12
   Duration=15.000000
   InputLinks(0)=(DrawY=-6339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6297,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_0')),DrawY=-6334,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6302,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4244,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4296
   ObjPosY=-6376
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_12"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_6
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-6326,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_12')),DrawY=-6326,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_198',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199'),DrawX=-4462,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4520
   ObjPosY=-6360
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_6"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_0
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-6326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6326,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_200',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201'),DrawX=-4046,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4104
   ObjPosY=-6360
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_0"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_1
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-5470,ActivateDelay=2.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_272',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_273'),DrawX=-4302,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4360
   ObjPosY=-5504
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_1"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=7.000000
   InputLinks(0)=(DrawY=-6107,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6086,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6065,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),DrawY=-6102,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6070,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4196,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4248
   ObjPosY=-6144
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_9
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-6102,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=-6102,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_274',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_275'),DrawX=-4350,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-6136
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_9"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="Off_Bridge_Fire"
   MaxWidth=217
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_1'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=1)),DrawY=-5518,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4852,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4960
   ObjPosY=-5584
   ObjComment="Off_Bridge_Fire"
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_30
   EventName="On_Bridge_Fire"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_9'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_6'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),DrawY=-6046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4709,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4816
   ObjPosY=-6112
   ObjComment="On_Bridge_Fire"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_30"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-6280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4392
   ObjPosY=-6280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=-6280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-6280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_205
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_202'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4464
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_205"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_206
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4368
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_206"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_208
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4168
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_208"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-5715,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5694,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5673,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5694,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_205',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_206',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=-4362,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4311,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4262,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-5752
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1)),DrawY=-6419,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6398,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6377,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6080
   ObjPosY=-6488
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-6443,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6422,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6401,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6422,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209'),DrawX=-5794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5832
   ObjPosY=-6480
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5808
   ObjPosY=-6320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=-5584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1344
   ObjPosY=-6088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1328
   ObjPosY=-5864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1256
   ObjPosY=-6080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1240
   ObjPosY=-5856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-800
   ObjPosY=-5848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-704
   ObjPosY=-5840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_29')),DrawY=-3507,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3486,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3465,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9768
   ObjPosY=-3576
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_29
   bLooping=True
   InputLinks(0)=(DrawY=-3506,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3484,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3462,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3440,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3418,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3490,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3434,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_29'),DrawX=-9553,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),LinkDesc="Hand_Left",MinVars=0,DrawX=-9501,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),LinkDesc="Hand_Right",MinVars=0,DrawX=-9444,OverrideDelta=120)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9584
   ObjPosY=-3544
   DrawWidth=177
   DrawHeight=173
   Name="SeqAct_Interp_29"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_29
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-0.000488,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.600000,OutVal=(X=-0.001953,Y=-9.999390,Z=0.000000),ArriveTangent=(X=-0.002713,Y=-0.001629,Z=0.000000),LeaveTangent=(X=-0.002713,Y=-0.001629,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.900000,OutVal=(X=-0.002930,Y=-9.999634,Z=-2.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.100000,OutVal=(X=-0.002930,Y=-9.999634,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.400000,OutVal=(X=-0.003906,Y=-19.998779,Z=0.000000),ArriveTangent=(X=-0.002930,Y=-0.004028,Z=0.000000),LeaveTangent=(X=-0.002930,Y=-0.004028,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.600000,OutVal=(X=-0.004395,Y=-19.999146,Z=-2.000000),ArriveTangent=(X=0.000000,Y=-0.001709,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.001709,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=-0.004395,Y=-19.999634,Z=0.000000),ArriveTangent=(X=0.000000,Y=-0.001628,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.001628,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.200000,OutVal=(X=-0.004395,Y=-20.000122,Z=-2.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-0.004395,Y=-20.000122,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.800000,OutVal=(X=-0.003906,Y=-10.001099,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.003906,Y=-10.001099,Z=-2.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.200000,OutVal=(X=-0.003906,Y=-10.001465,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.600000,OutVal=(X=-0.002441,Y=9.996216,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.800000,OutVal=(X=-0.002441,Y=9.996216,Z=-2.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.002441,Y=9.996216,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.003906,Y=-0.003052,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.600000,InterpMode=CIM_CurveAutoClamped),(InVal=0.900000,InterpMode=CIM_CurveAutoClamped),(InVal=1.100000,InterpMode=CIM_CurveAutoClamped),(InVal=1.400000,InterpMode=CIM_CurveAutoClamped),(InVal=1.600000,InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,InterpMode=CIM_CurveAutoClamped),(InVal=2.200000,InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.800000,InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped),(InVal=3.200000,InterpMode=CIM_CurveAutoClamped),(InVal=3.600000,InterpMode=CIM_CurveAutoClamped),(InVal=3.800000,InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.600000),(Time=0.900000),(Time=1.100000),(Time=1.400000),(Time=1.600000),(Time=1.900000),(Time=2.200000),(Time=2.500000),(Time=2.800000),(Time=3.000000),(Time=3.200000),(Time=3.600000),(Time=3.800000),(Time=4.000000),(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_0.InterpTrackMove_0'
      GroupName="Hand_Left"
      GroupColor=(B=161,G=178,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_1.InterpTrackMove_1'
      GroupName="Hand_Right"
      GroupColor=(B=0,G=165,R=174,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_29.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9584
   ObjPosY=-3344
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_29"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9496
   ObjPosY=-3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=-3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_3
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),DrawY=-2652,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-2632,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9669,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9608,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9527,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=-2720
   ObjComment="Open when wave starts"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_3"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   Duration=8.000000
   InputLinks(0)=(DrawY=-2731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2689,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4',InputLinkIdx=1)),DrawY=-2726,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2694,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9292,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9344
   ObjPosY=-2768
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.200000,OutVal=(X=0.000000,Y=0.000031,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.200000,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2.InterpTrackMove_0'
      GroupName="Left"
      GroupColor=(B=220,G=0,R=92,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.200000,OutVal=(X=0.000000,Y=0.000031,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.200000,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackMove_1'
      GroupName="Right"
      GroupColor=(B=162,G=0,R=178,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=5.200000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8976
   ObjPosY=-2736
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2898,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2876,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2854,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2832,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2810,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2882,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2826,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=-8945,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),LinkDesc="Left",MinVars=0,DrawX=-8900,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),LinkDesc="Right",MinVars=0,DrawX=-8855,OverrideDelta=105)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8976
   ObjPosY=-2936
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_8
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2899,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2878,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2857,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9656
   ObjPosY=-2968
   ObjComment="Close at start"
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_8"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=KFSeqAct_SetPathnodeExtraCost Name=KFSeqAct_SetPathnodeExtraCost_1
   ExtraCost=10000
   InputLinks(0)=(DrawY=-7694,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_18')),DrawY=-7694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78'),DrawX=-4514,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4632
   ObjPosY=-7728
   DrawWidth=236
   DrawHeight=61
   Name="KFSeqAct_SetPathnodeExtraCost_1"
   ObjectArchetype=KFSeqAct_SetPathnodeExtraCost'KFGame.Default__KFSeqAct_SetPathnodeExtraCost'
End Object

Begin Object Class=KFSeqAct_SetPathnodeExtraCost Name=KFSeqAct_SetPathnodeExtraCost_0
   InputLinks(0)=(DrawY=-7614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64'),DrawX=-4018,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4136
   ObjPosY=-7648
   DrawWidth=236
   DrawHeight=61
   Name="KFSeqAct_SetPathnodeExtraCost_0"
   ObjectArchetype=KFSeqAct_SetPathnodeExtraCost'KFGame.Default__KFSeqAct_SetPathnodeExtraCost'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-9506,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9484,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9462,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9440,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9418,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-9490,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9434,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=7596,OverrideDelta=29)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),LinkDesc="Camera",MinVars=0,DrawX=7652,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7552
   ObjPosY=-9544
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-518.472046,Y=374.133789,Z=0.000000),ArriveTangent=(X=-138.502502,Y=0.000000,Z=0.000000),LeaveTangent=(X=-138.502502,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=-1246.522461,Y=270.846191,Z=0.000000),ArriveTangent=(X=-213.705887,Y=-11.927362,Z=0.000000),LeaveTangent=(X=-213.705887,Y=-11.927362,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,OutVal=(X=-2228.119141,Y=245.982910,Z=0.000000),ArriveTangent=(X=-234.069611,Y=-15.099586,Z=0.000000),LeaveTangent=(X=-234.069611,Y=-15.099586,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=17.000000,OutVal=(X=-3119.079346,Y=-762.088867,Z=0.000000),ArriveTangent=(X=-239.775513,Y=0.000000,Z=0.000000),LeaveTangent=(X=-239.775513,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=-4146.323242,Y=-721.372559,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=-4080.243896,Y=-1593.545410,Z=279.000000),ArriveTangent=(X=0.000000,Y=-0.927925,Z=5.417231),LeaveTangent=(X=0.000000,Y=-0.927925,Z=5.417231),InterpMode=CIM_CurveAutoClamped),(InVal=29.000000,OutVal=(X=-5151.518066,Y=-1595.032227,Z=288.000000),ArriveTangent=(X=-296.893585,Y=0.000000,Z=0.000000),LeaveTangent=(X=-296.893585,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=31.000000,OutVal=(X=-5861.605469,Y=-1505.482422,Z=288.000000),ArriveTangent=(X=-271.133423,Y=0.000000,Z=0.000000),LeaveTangent=(X=-271.133423,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=-6236.051758,Y=-1520.733887,Z=-45.000031),ArriveTangent=(X=-274.394348,Y=-14.688801,Z=0.000000),LeaveTangent=(X=-274.394348,Y=-14.688801,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=-7390.238281,Y=-1672.037109,Z=-33.000061),ArriveTangent=(X=-413.445648,Y=0.000000,Z=0.000000),LeaveTangent=(X=-413.445648,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=-8716.725586,Y=-1498.193359,Z=-39.000061),ArriveTangent=(X=-146.619690,Y=12.863607,Z=0.000000),LeaveTangent=(X=-146.619690,Y=12.863607,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=41.000000,OutVal=(X=-8872.194336,Y=-1485.289063,Z=-24.000061),ArriveTangent=(X=-7.983480,Y=14.005951,Z=0.000000),LeaveTangent=(X=-7.983480,Y=14.005951,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=44.000000,OutVal=(X=-8881.280273,Y=-225.998535,Z=-33.000061),ArriveTangent=(X=-5.370903,Y=420.445679,Z=0.000000),LeaveTangent=(X=-5.370903,Y=420.445679,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=47.000000,OutVal=(X=-8909.666992,Y=1037.385010,Z=-33.000061),ArriveTangent=(X=0.000000,Y=318.043335,Z=0.000000),LeaveTangent=(X=0.000000,Y=318.043335,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=-8353.181641,Y=1682.261475,Z=-27.000061),ArriveTangent=(X=243.121750,Y=11.078217,Z=2.500000),LeaveTangent=(X=243.121750,Y=11.078217,Z=2.500000),InterpMode=CIM_CurveAutoClamped),(InVal=53.000000,OutVal=(X=-7450.936523,Y=1695.885742,Z=-18.000061),InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=(X=-7451.080078,Y=604.280273,Z=-90.000092),ArriveTangent=(X=0.000000,Y=-286.716888,Z=-0.000051),LeaveTangent=(X=0.000000,Y=-286.716888,Z=-0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=59.000000,OutVal=(X=-7065.551758,Y=-24.415527,Z=-90.000153),ArriveTangent=(X=0.000000,Y=-233.122269,Z=0.000000),LeaveTangent=(X=0.000000,Y=-233.122269,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=61.000000,OutVal=(X=-7945.383789,Y=-561.331055,Z=152.999817),ArriveTangent=(X=-58.210037,Y=-194.543289,Z=0.000000),LeaveTangent=(X=-58.210037,Y=-194.543289,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=62.000000,OutVal=(X=-7976.021484,Y=-702.865234,Z=134.999817),InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=(X=-7067.159180,Y=-691.147461,Z=293.999817),ArriveTangent=(X=428.774078,Y=8.863863,Z=11.213112),LeaveTangent=(X=428.774078,Y=8.863863,Z=11.213112),InterpMode=CIM_CurveAutoClamped),(InVal=68.000000,OutVal=(X=-5403.376953,Y=-551.297363,Z=308.999817),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.500000),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.500000),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=-6398.597656,Y=-579.238770,Z=326.999817),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.691044),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.691044),InterpMode=CIM_CurveAutoClamped),(InVal=73.000000,OutVal=(X=-6357.646484,Y=-22.408203,Z=461.999878),ArriveTangent=(X=0.000000,Y=301.783936,Z=0.000153),LeaveTangent=(X=0.000000,Y=301.783936,Z=0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=-6385.654297,Y=627.896973,Z=462.000000),ArriveTangent=(X=0.000000,Y=281.072021,Z=0.000000),LeaveTangent=(X=0.000000,Y=281.072021,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=77.000000,OutVal=(X=-6335.611328,Y=1101.879883,Z=306.000061),ArriveTangent=(X=58.076248,Y=5.440041,Z=0.000000),LeaveTangent=(X=58.076248,Y=5.440041,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=79.000000,OutVal=(X=-5552.834961,Y=1106.277832,Z=306.000061),ArriveTangent=(X=17.709167,Y=4.787872,Z=0.000000),LeaveTangent=(X=17.709167,Y=4.787872,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=82.000000,OutVal=(X=-5533.366699,Y=1654.890625,Z=297.000061),ArriveTangent=(X=15.828384,Y=0.000000,Z=-1.750751),LeaveTangent=(X=15.828384,Y=0.000000,Z=-1.750751),InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=(X=-4615.875977,Y=1519.169678,Z=294.000061),ArriveTangent=(X=285.943512,Y=-34.787476,Z=-2.472630),LeaveTangent=(X=285.943512,Y=-34.787476,Z=-2.472630),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=-3817.705566,Y=1446.165771,Z=-14.999939),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=-3817.707031,Y=1446.165771,Z=-14.999939),InterpMode=CIM_CurveAutoClamped),(InVal=94.000000,OutVal=(X=-3115.050293,Y=1880.711914,Z=21.000061),ArriveTangent=(X=37.321106,Y=231.495514,Z=23.565054),LeaveTangent=(X=37.321106,Y=231.495514,Z=23.565054),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=-3078.701416,Y=2603.643311,Z=114.000061),ArriveTangent=(X=2.704372,Y=265.438904,Z=10.064390),LeaveTangent=(X=2.704372,Y=265.438904,Z=10.064390),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=-3076.370605,Y=2951.578125,Z=123.000061),ArriveTangent=(X=0.000000,Y=232.996109,Z=0.000000),LeaveTangent=(X=0.000000,Y=232.996109,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=-3124.854492,Y=3815.916992,Z=-26.999939),ArriveTangent=(X=0.000000,Y=146.520065,Z=-6.994562),LeaveTangent=(X=0.000000,Y=146.520065,Z=-6.994562),InterpMode=CIM_CurveAutoClamped),(InVal=104.000000,OutVal=(X=-2573.666992,Y=4052.812744,Z=-35.999939),ArriveTangent=(X=0.000000,Y=0.000412,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.000412,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=107.000000,OutVal=(X=-2573.667969,Y=4052.813232,Z=-35.999939),ArriveTangent=(X=-0.000916,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000916,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=-2964.598633,Y=3769.426270,Z=12.000061),ArriveTangent=(X=-203.152832,Y=-89.903175,Z=0.000000),LeaveTangent=(X=-203.152832,Y=-89.903175,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=112.000000,OutVal=(X=-3589.432129,Y=3603.297363,Z=-20.999939),ArriveTangent=(X=-295.251953,Y=-4.907122,Z=0.000000),LeaveTangent=(X=-295.251953,Y=-4.907122,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=(X=-4736.110352,Y=3597.148926,Z=-8.999939),ArriveTangent=(X=-139.198898,Y=0.000000,Z=0.000000),LeaveTangent=(X=-139.198898,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=118.000000,OutVal=(X=-4940.000000,Y=3979.365234,Z=-17.999939),ArriveTangent=(X=-20.223122,Y=210.470581,Z=0.000000),LeaveTangent=(X=-20.223122,Y=210.470581,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=121.000000,OutVal=(X=-4968.429688,Y=4948.250488,Z=-5.999939),ArriveTangent=(X=-22.406815,Y=0.000000,Z=0.000000),LeaveTangent=(X=-22.406815,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=124.000000,OutVal=(X=-5562.916504,Y=4427.942383,Z=-5.999939),ArriveTangent=(X=-143.854004,Y=-173.744537,Z=0.000000),LeaveTangent=(X=-143.854004,Y=-173.744537,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=126.000000,OutVal=(X=-5761.398438,Y=4079.527832,Z=30.000061),ArriveTangent=(X=-168.182678,Y=-1.863449,Z=33.444016),LeaveTangent=(X=-168.182678,Y=-1.863449,Z=33.444016),InterpMode=CIM_CurveAutoClamped),(InVal=128.000000,OutVal=(X=-6301.678711,Y=4078.030273,Z=162.000061),ArriveTangent=(X=0.000000,Y=-1.867859,Z=67.500000),LeaveTangent=(X=0.000000,Y=-1.867859,Z=67.500000),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=-6290.319336,Y=3433.500488,Z=300.000061),ArriveTangent=(X=13.876968,Y=0.000000,Z=0.000000),LeaveTangent=(X=13.876968,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=132.000000,OutVal=(X=-5715.956055,Y=3447.330078,Z=300.000061),ArriveTangent=(X=49.849251,Y=0.000000,Z=0.000000),LeaveTangent=(X=49.849251,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=(X=-5656.626953,Y=2840.559570,Z=273.000061),ArriveTangent=(X=0.000000,Y=-277.199982,Z=0.000000),LeaveTangent=(X=0.000000,Y=-277.199982,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=-6263.948242,Y=1784.130127,Z=312.000061),ArriveTangent=(X=-228.106445,Y=-146.122406,Z=0.000000),LeaveTangent=(X=-228.106445,Y=-146.122406,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=141.000000,OutVal=(X=-7025.265625,Y=1562.903564,Z=282.000061),ArriveTangent=(X=-254.767578,Y=0.000000,Z=-22.234455),LeaveTangent=(X=-254.767578,Y=0.000000,Z=-22.234455),InterpMode=CIM_CurveAutoClamped),(InVal=144.000000,OutVal=(X=-7792.553711,Y=1695.427002,Z=-11.999939),ArriveTangent=(X=-287.860687,Y=63.069256,Z=-9.534946),LeaveTangent=(X=-287.860687,Y=63.069256,Z=-9.534946),InterpMode=CIM_CurveAutoClamped),(InVal=147.000000,OutVal=(X=-8752.429688,Y=1941.319092,Z=-23.999939),ArriveTangent=(X=0.000000,Y=140.798248,Z=0.000000),LeaveTangent=(X=0.000000,Y=140.798248,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=149.000000,OutVal=(X=-8734.074219,Y=2399.418213,Z=-20.999939),ArriveTangent=(X=0.000000,Y=268.029297,Z=0.000000),LeaveTangent=(X=0.000000,Y=268.029297,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=151.000000,OutVal=(X=-8742.978516,Y=3013.436279,Z=-20.999939),ArriveTangent=(X=-9.605247,Y=9.804756,Z=0.000000),LeaveTangent=(X=-9.605247,Y=9.804756,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=154.000000,OutVal=(X=-9345.116211,Y=3024.130859,Z=-20.999939),ArriveTangent=(X=-21.604614,Y=8.803055,Z=0.000000),LeaveTangent=(X=-21.604614,Y=8.803055,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=157.000000,OutVal=(X=-9372.451172,Y=4013.754395,Z=-8.999939),ArriveTangent=(X=0.000000,Y=348.181732,Z=5.000000),LeaveTangent=(X=0.000000,Y=348.181732,Z=5.000000),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=-9323.772461,Y=5113.221191,Z=9.000061),ArriveTangent=(X=33.372505,Y=296.556244,Z=2.072501),LeaveTangent=(X=33.372505,Y=296.556244,Z=2.072501),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=-9043.804688,Y=5793.091797,Z=12.000061),ArriveTangent=(X=119.990562,Y=0.000000,Z=0.000000),LeaveTangent=(X=119.990562,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=166.000000,OutVal=(X=-8603.829102,Y=5721.545410,Z=12.000061),InterpMode=CIM_CurveAutoClamped),(InVal=169.000000,OutVal=(X=-8864.079102,Y=6894.550781,Z=-23.999939),ArriveTangent=(X=-96.155602,Y=149.760315,Z=0.000000),LeaveTangent=(X=-96.155602,Y=149.760315,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=172.000000,OutVal=(X=-9180.762695,Y=7116.575684,Z=-5.999939),ArriveTangent=(X=-86.148766,Y=126.953163,Z=0.000000),LeaveTangent=(X=-86.148766,Y=126.953163,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=(X=-9380.971680,Y=7742.703125,Z=-77.999969),ArriveTangent=(X=-99.821449,Y=267.994537,Z=-2.381427),LeaveTangent=(X=-99.821449,Y=267.994537,Z=-2.381427),InterpMode=CIM_CurveAutoClamped),(InVal=178.000000,OutVal=(X=-9779.691406,Y=8724.542969,Z=-81.000031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.528848),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.528848),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=-9354.250977,Y=8446.738281,Z=-111.000092),ArriveTangent=(X=254.867188,Y=0.000000,Z=-26.088057),LeaveTangent=(X=254.867188,Y=0.000000,Z=-26.088057),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=-8505.355469,Y=8489.309570,Z=-276.000183),ArriveTangent=(X=0.000000,Y=0.000000,Z=-62.400043),LeaveTangent=(X=0.000000,Y=0.000000,Z=-62.400043),InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,OutVal=(X=-8623.037109,Y=7712.570801,Z=-423.000305),ArriveTangent=(X=-1.569904,Y=-77.836868,Z=-13.649288),LeaveTangent=(X=-1.569904,Y=-77.836868,Z=-13.649288),InterpMode=CIM_CurveAutoClamped),(InVal=187.000000,OutVal=(X=-8624.308594,Y=7643.583008,Z=-435.000427),ArriveTangent=(X=0.000000,Y=-60.043411,Z=-3.600049),LeaveTangent=(X=0.000000,Y=-60.043411,Z=-3.600049),InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,OutVal=(X=-7586.806641,Y=7262.693359,Z=-441.000549),ArriveTangent=(X=0.000000,Y=-262.664307,Z=-4.852941),LeaveTangent=(X=0.000000,Y=-262.664307,Z=-4.852941),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=-7852.443359,Y=6083.085938,Z=-483.000671),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000093),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000093),InterpMode=CIM_CurveAutoClamped),(InVal=196.000000,OutVal=(X=-7310.684570,Y=7520.594238,Z=-483.000793),ArriveTangent=(X=209.278290,Y=40.728699,Z=0.000000),LeaveTangent=(X=209.278290,Y=40.728699,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=(X=-6151.239258,Y=7589.505371,Z=-456.000916),ArriveTangent=(X=101.978844,Y=0.000000,Z=0.000000),LeaveTangent=(X=101.978844,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=203.000000,OutVal=(X=-5992.310547,Y=6468.235840,Z=-516.001038),ArriveTangent=(X=47.778809,Y=-314.233978,Z=0.000000),LeaveTangent=(X=47.778809,Y=-314.233978,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=206.000000,OutVal=(X=-5864.566406,Y=5704.101563,Z=-510.001160),ArriveTangent=(X=84.945457,Y=-146.927979,Z=0.000000),LeaveTangent=(X=84.945457,Y=-146.927979,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=209.000000,OutVal=(X=-5235.081055,Y=5453.702148,Z=-510.001282),ArriveTangent=(X=279.723938,Y=0.000000,Z=0.000000),LeaveTangent=(X=279.723938,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=211.000000,OutVal=(X=-4465.946777,Y=5523.631836,Z=-288.001404),ArriveTangent=(X=154.494843,Y=67.098381,Z=43.257244),LeaveTangent=(X=154.494843,Y=67.098381,Z=43.257244),InterpMode=CIM_CurveAutoClamped),(InVal=214.000000,OutVal=(X=-4249.628906,Y=6197.912109,Z=-228.001495),InterpMode=CIM_CurveAutoClamped),(InVal=217.000000,OutVal=(X=-4300.368164,Y=6190.649902,Z=-228.001556),ArriveTangent=(X=-39.958008,Y=-4.266315,Z=0.000000),LeaveTangent=(X=-39.958008,Y=-4.266315,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=(X=-5346.201172,Y=6168.405273,Z=-51.001617),ArriveTangent=(X=-270.772308,Y=0.000000,Z=15.280991),LeaveTangent=(X=-270.772308,Y=0.000000,Z=15.280991),InterpMode=CIM_CurveAutoClamped),(InVal=223.000000,OutVal=(X=-5925.001953,Y=6213.631836,Z=-30.001648),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.999995),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.999995),InterpMode=CIM_CurveAutoClamped),(InVal=226.000000,OutVal=(X=-5879.934570,Y=6173.865234,Z=-15.001648),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.213108),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.213108),InterpMode=CIM_CurveAutoClamped),(InVal=229.000000,OutVal=(X=-5993.777344,Y=6977.264648,Z=143.998352),ArriveTangent=(X=0.000000,Y=273.667145,Z=0.000000),LeaveTangent=(X=0.000000,Y=273.667145,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=232.000000,OutVal=(X=-5509.102539,Y=7815.868164,Z=143.998352),ArriveTangent=(X=0.000000,Y=217.100754,Z=0.000000),LeaveTangent=(X=0.000000,Y=217.100754,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,OutVal=(X=-5805.686523,Y=8279.869141,Z=146.998352),ArriveTangent=(X=-136.700684,Y=0.000000,Z=0.000000),LeaveTangent=(X=-136.700684,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=238.000000,OutVal=(X=-6329.306641,Y=8158.466797,Z=137.998352),ArriveTangent=(X=-77.016167,Y=-89.536018,Z=0.000000),LeaveTangent=(X=-77.016167,Y=-89.536018,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=241.000000,OutVal=(X=-6448.001953,Y=7018.189941,Z=137.998352),ArriveTangent=(X=-82.074997,Y=0.000000,Z=0.000000),LeaveTangent=(X=-82.074997,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=(X=-8006.113281,Y=7042.808594,Z=137.998352),ArriveTangent=(X=-359.578827,Y=5.904785,Z=0.000000),LeaveTangent=(X=-359.578827,Y=5.904785,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=248.000000,OutVal=(X=-8965.053711,Y=7059.523438,Z=14.998352),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.000000,Z=80.332031),ArriveTangent=(X=0.000000,Y=0.000000,Z=20.097656),LeaveTangent=(X=0.000000,Y=0.000000,Z=20.097656),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000000,Z=180.878906),InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,OutVal=(X=0.000000,Y=0.000000,Z=180.878906),InterpMode=CIM_CurveAutoClamped),(InVal=17.000000,OutVal=(X=0.000000,Y=-3.164063,Z=89.648438),ArriveTangent=(X=0.000000,Y=-0.615234,Z=-1.283363),LeaveTangent=(X=0.000000,Y=-0.615234,Z=-1.283363),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=0.000000,Y=-4.921875,Z=87.539063),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=0.000000,Y=-4.921875,Z=88.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.435544),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.435544),InterpMode=CIM_CurveAutoClamped),(InVal=29.000000,OutVal=(X=0.000000,Y=-1.757813,Z=176.484375),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.315135),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.315135),InterpMode=CIM_CurveAutoClamped),(InVal=31.000000,OutVal=(X=0.000000,Y=-1.757813,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=0.000000,Y=-1.757813,Z=177.011719),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=0.000000,Y=-1.757813,Z=178.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.634102),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.634102),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=0.000000,Y=-1.757813,Z=180.878906),InterpMode=CIM_CurveAutoClamped),(InVal=41.000000,OutVal=(X=0.000000,Y=-1.582031,Z=86.484375),ArriveTangent=(X=0.000000,Y=0.167071,Z=-36.351563),LeaveTangent=(X=0.000000,Y=0.167071,Z=-36.351563),InterpMode=CIM_CurveAutoClamped),(InVal=44.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.878906),InterpMode=CIM_CurveAutoClamped),(InVal=47.000000,OutVal=(X=0.000000,Y=-4.570313,Z=87.363281),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=0.000000,Y=-4.570313,Z=0.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-28.828125),LeaveTangent=(X=0.000000,Y=0.000000,Z=-28.828125),InterpMode=CIM_CurveAutoClamped),(InVal=53.000000,OutVal=(X=0.000000,Y=-4.570313,Z=-85.605469),InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=(X=0.000000,Y=-4.570313,Z=-73.652344),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.358963),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.358963),InterpMode=CIM_CurveAutoClamped),(InVal=59.000000,OutVal=(X=0.000000,Y=-4.570313,Z=3.339844),InterpMode=CIM_CurveAutoClamped),(InVal=61.000000,OutVal=(X=0.000000,Y=-4.570313,Z=0.703125),InterpMode=CIM_CurveAutoClamped),(InVal=62.000000,OutVal=(X=0.000000,Y=-4.570313,Z=41.484375),ArriveTangent=(X=0.000000,Y=0.000000,Z=22.631836),LeaveTangent=(X=0.000000,Y=0.000000,Z=22.631836),InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=(X=0.000000,Y=-4.570313,Z=91.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.984375),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.984375),InterpMode=CIM_CurveAutoClamped),(InVal=68.000000,OutVal=(X=0.000000,Y=2.109375,Z=155.390625),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=0.000000,Y=-7.382813,Z=92.636719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.041331),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.041331),InterpMode=CIM_CurveAutoClamped),(InVal=73.000000,OutVal=(X=0.000000,Y=-7.382813,Z=90.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.479143),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.479143),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=0.000000,Y=-7.382813,Z=86.660156),InterpMode=CIM_CurveAutoClamped),(InVal=77.000000,OutVal=(X=0.000000,Y=-7.382813,Z=90.527344),InterpMode=CIM_CurveAutoClamped),(InVal=79.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-1.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.651329),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.651329),InterpMode=CIM_CurveAutoClamped),(InVal=82.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-2.109375),InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-1.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.263672),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.263672),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-0.527344),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=0.000000,Y=5.097656,Z=-66.093750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.342924),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.342924),InterpMode=CIM_CurveAutoClamped),(InVal=94.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-89.472656),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.562929),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.562929),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.219727),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.219727),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-90.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.236109),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.236109),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-91.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.532910),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.532910),InterpMode=CIM_CurveAutoClamped),(InVal=104.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-94.218750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.392216),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.392216),InterpMode=CIM_CurveAutoClamped),(InVal=107.000000,OutVal=(X=0.000000,Y=5.625000,Z=-181.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-30.128906),LeaveTangent=(X=0.000000,Y=0.000000,Z=-30.128906),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=0.000000,Y=-1.054688,Z=-244.863281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-32.625000),LeaveTangent=(X=0.000000,Y=0.000000,Z=-32.625000),InterpMode=CIM_CurveAutoClamped),(InVal=112.000000,OutVal=(X=0.000000,Y=-1.054688,Z=-344.179688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.318381),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.318381),InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=(X=0.000000,Y=-1.054688,Z=-360.527344),InterpMode=CIM_CurveAutoClamped),(InVal=118.000000,OutVal=(X=0.000000,Y=1.406250,Z=-256.992188),ArriveTangent=(X=0.000000,Y=0.000000,Z=33.662109),LeaveTangent=(X=0.000000,Y=0.000000,Z=33.662109),InterpMode=CIM_CurveAutoClamped),(InVal=121.000000,OutVal=(X=0.000000,Y=1.406250,Z=-158.554688),ArriveTangent=(X=0.000000,Y=0.000000,Z=16.648598),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.648598),InterpMode=CIM_CurveAutoClamped),(InVal=124.000000,OutVal=(X=0.000000,Y=1.406250,Z=-131.660156),InterpMode=CIM_CurveAutoClamped),(InVal=126.000000,OutVal=(X=0.000000,Y=1.406250,Z=-179.472656),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.305595),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.305595),InterpMode=CIM_CurveAutoClamped),(InVal=128.000000,OutVal=(X=0.000000,Y=1.406250,Z=-181.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.054688),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.054688),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=0.000000,Y=1.406250,Z=-183.691406),InterpMode=CIM_CurveAutoClamped),(InVal=132.000000,OutVal=(X=0.000000,Y=1.406250,Z=-181.582031),InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=(X=0.000000,Y=1.406250,Z=-268.066406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.632346),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.632346),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=0.000000,Y=1.406250,Z=-277.031250),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.400860),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.400860),InterpMode=CIM_CurveAutoClamped),(InVal=141.000000,OutVal=(X=0.000000,Y=0.527344,Z=-342.949219),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.545620),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.545620),InterpMode=CIM_CurveAutoClamped),(InVal=144.000000,OutVal=(X=0.000000,Y=0.527344,Z=-359.648438),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.156250),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.156250),InterpMode=CIM_CurveAutoClamped),(InVal=147.000000,OutVal=(X=0.000000,Y=0.527344,Z=-373.886719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.073231),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.073231),InterpMode=CIM_CurveAutoClamped),(InVal=149.000000,OutVal=(X=0.000000,Y=0.527344,Z=-450.878906),InterpMode=CIM_CurveAutoClamped),(InVal=151.000000,OutVal=(X=0.000000,Y=0.527344,Z=-450.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.954781),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.954781),InterpMode=CIM_CurveAutoClamped),(InVal=154.000000,OutVal=(X=0.000000,Y=1.757813,Z=-358.417969),InterpMode=CIM_CurveAutoClamped),(InVal=157.000000,OutVal=(X=0.000000,Y=1.757813,Z=-358.417969),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=0.000000,Y=4.746094,Z=-441.386719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.981050),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.981050),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=0.000000,Y=4.746094,Z=-443.847656),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.010159),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.010159),InterpMode=CIM_CurveAutoClamped),(InVal=166.000000,OutVal=(X=0.000000,Y=4.746094,Z=-586.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-25.449427),LeaveTangent=(X=0.000000,Y=0.000000,Z=-25.449427),InterpMode=CIM_CurveAutoClamped),(InVal=169.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-628.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=-22.028397),LeaveTangent=(X=0.000000,Y=0.000000,Z=-22.028397),InterpMode=CIM_CurveAutoClamped),(InVal=172.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-722.109375),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.146243),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.146243),InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-722.285156),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.146269),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.146269),InterpMode=CIM_CurveAutoClamped),(InVal=178.000000,OutVal=(X=0.000000,Y=30.585938,Z=-824.062500),ArriveTangent=(X=0.000000,Y=0.000000,Z=-35.121094),LeaveTangent=(X=0.000000,Y=0.000000,Z=-35.121094),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=0.000000,Y=8.261719,Z=-897.890625),ArriveTangent=(X=0.000000,Y=-4.511029,Z=-26.929688),LeaveTangent=(X=0.000000,Y=-4.511029,Z=-26.929688),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=0.000000,Y=1.933594,Z=-958.710938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.562500),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.562500),InterpMode=CIM_CurveAutoClamped),(InVal=185.000000,OutVal=(X=0.000000,Y=1.933594,Z=-990.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-27.453032),LeaveTangent=(X=0.000000,Y=0.000000,Z=-27.453032),InterpMode=CIM_CurveAutoClamped),(InVal=187.000000,OutVal=(X=0.000000,Y=2.988281,Z=-1081.054688),ArriveTangent=(X=0.000000,Y=0.457031,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.457031,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,OutVal=(X=0.000000,Y=4.218750,Z=-991.933594),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-991.933594),InterpMode=CIM_CurveAutoClamped),(InVal=196.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-826.875000),InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-901.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-23.604910),LeaveTangent=(X=0.000000,Y=0.000000,Z=-23.604910),InterpMode=CIM_CurveAutoClamped),(InVal=203.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-992.109375),InterpMode=CIM_CurveAutoClamped),(InVal=206.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-903.339844),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.797385),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.797385),InterpMode=CIM_CurveAutoClamped),(InVal=209.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-899.824219),InterpMode=CIM_CurveAutoClamped),(InVal=211.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-901.933594),InterpMode=CIM_CurveAutoClamped),(InVal=214.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-836.015625),ArriveTangent=(X=0.000000,Y=0.000000,Z=32.080078),LeaveTangent=(X=0.000000,Y=0.000000,Z=32.080078),InterpMode=CIM_CurveAutoClamped),(InVal=217.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-709.453125),InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-720.175781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.821705),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.821705),InterpMode=CIM_CurveAutoClamped),(InVal=223.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-812.285156),ArriveTangent=(X=0.000000,Y=0.000000,Z=-31.611328),LeaveTangent=(X=0.000000,Y=0.000000,Z=-31.611328),InterpMode=CIM_CurveAutoClamped),(InVal=226.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-909.843750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-29.677734),LeaveTangent=(X=0.000000,Y=0.000000,Z=-29.677734),InterpMode=CIM_CurveAutoClamped),(InVal=229.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-990.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-20.830078),LeaveTangent=(X=0.000000,Y=0.000000,Z=-20.830078),InterpMode=CIM_CurveAutoClamped),(InVal=232.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-1034.824219),InterpMode=CIM_CurveAutoClamped),(InVal=235.000000,OutVal=(X=0.000000,Y=0.351563,Z=-899.121094),ArriveTangent=(X=0.000000,Y=1.230469,Z=36.591797),LeaveTangent=(X=0.000000,Y=1.230469,Z=36.591797),InterpMode=CIM_CurveAutoClamped),(InVal=238.000000,OutVal=(X=0.000000,Y=4.921875,Z=-815.273438),ArriveTangent=(X=0.000000,Y=0.000000,Z=10.196566),LeaveTangent=(X=0.000000,Y=0.000000,Z=10.196566),InterpMode=CIM_CurveAutoClamped),(InVal=241.000000,OutVal=(X=0.000000,Y=4.921875,Z=-800.332031),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.083096),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.083096),InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=(X=0.000000,Y=4.921875,Z=-718.417969),InterpMode=CIM_CurveAutoClamped),(InVal=248.000000,OutVal=(X=0.000000,Y=4.921875,Z=-720.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000),(Time=9.000000),(Time=13.000000),(Time=17.000000),(Time=21.000000),(Time=25.000000),(Time=29.000000),(Time=31.000000),(Time=33.000000),(Time=36.000000),(Time=39.000000),(Time=41.000000),(Time=44.000000),(Time=47.000000),(Time=50.000000),(Time=53.000000),(Time=56.000000),(Time=59.000000),(Time=61.000000),(Time=62.000000),(Time=65.000000),(Time=68.000000),(Time=71.000000),(Time=73.000000),(Time=75.000000),(Time=77.000000),(Time=79.000000),(Time=82.000000),(Time=85.000000),(Time=88.000000),(Time=91.000000),(Time=94.000000),(Time=96.000000),(Time=98.000000),(Time=101.000000),(Time=104.000000),(Time=107.000000),(Time=109.000000),(Time=112.000000),(Time=115.000000),(Time=118.000000),(Time=121.000000),(Time=124.000000),(Time=126.000000),(Time=128.000000),(Time=130.000000),(Time=132.000000),(Time=135.000000),(Time=138.000000),(Time=141.000000),(Time=144.000000),(Time=147.000000),(Time=149.000000),(Time=151.000000),(Time=154.000000),(Time=157.000000),(Time=160.000000),(Time=163.000000),(Time=166.000000),(Time=169.000000),(Time=172.000000),(Time=175.000000),(Time=178.000000),(Time=180.000000),(Time=183.000000),(Time=185.000000),(Time=187.000000),(Time=190.000000),(Time=192.000000),(Time=196.000000),(Time=200.000000),(Time=203.000000),(Time=206.000000),(Time=209.000000),(Time=211.000000),(Time=214.000000),(Time=217.000000),(Time=220.000000),(Time=223.000000),(Time=226.000000),(Time=229.000000),(Time=232.000000),(Time=235.000000),(Time=238.000000),(Time=241.000000),(Time=245.000000),(Time=248.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      GroupName="Camera"
      GroupColor=(B=0,G=191,R=145,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=249.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=249.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7520
   ObjPosY=-9288
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=CameraActor'KF-MONSTERBALL.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7656
   ObjPosY=-9288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9502,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-9502,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=7376,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7312
   ObjPosY=-9536
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9486,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9486,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=7912,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7848
   ObjPosY=-9520
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7352
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_14')),DrawY=-9502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7119,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7024
   ObjPosY=-9568
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7880
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8896
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-2736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_28'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_30')),DrawY=-955,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-934,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-913,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-1024
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_28
   PlayRate=2.000000
   bLooping=True
   InputLinks(0)=(DrawY=-986,OverrideDelta=15)
   InputLinks(1)=(DrawY=-964,OverrideDelta=37)
   InputLinks(2)=(DrawY=-942,OverrideDelta=59)
   InputLinks(3)=(DrawY=-920,OverrideDelta=81)
   InputLinks(4)=(DrawY=-898,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-970,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-914,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_28'),DrawX=-9389,OverrideDelta=28)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_277',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),LinkDesc="Lazers_Down",MinVars=0,DrawX=-9332,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-1024
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_28"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_28
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-0.000244,Y=-0.000183,Z=-0.000977),ArriveTangent=(X=0.000000,Y=-0.000366,Z=-0.001953),LeaveTangent=(X=0.000000,Y=-0.000366,Z=-0.001953),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-0.000244,Y=-0.000366,Z=-0.001953),ArriveTangent=(X=0.000000,Y=-0.000427,Z=-0.001465),LeaveTangent=(X=0.000000,Y=-0.000427,Z=-0.001465),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.000244,Y=-0.000610,Z=-0.002441),ArriveTangent=(X=0.000000,Y=-0.000488,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000488,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=-0.000854,Z=-0.002441),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=11.178589,Y=0.060425,Z=-0.049438),ArriveTangent=(X=0.000000,Y=0.044813,Z=-0.142822),LeaveTangent=(X=0.000000,Y=0.044813,Z=-0.142822),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-0.159302,Y=0.071411,Z=-0.142822),ArriveTangent=(X=-22.697754,Y=0.044813,Z=-0.164795),LeaveTangent=(X=-22.697754,Y=0.044813,Z=-0.164795),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-11.519165,Y=0.131836,Z=-0.214233),ArriveTangent=(X=0.000000,Y=0.093384,Z=-0.142822),LeaveTangent=(X=0.000000,Y=0.093384,Z=-0.142822),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.340576,Y=0.164795,Z=-0.285645),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.500000),(Time=2.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_28.InterpGroup_0.InterpTrackMove_0'
      GroupName="Lazers_Down"
      GroupColor=(B=123,G=204,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=2.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_28.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_28.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-824
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_28"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_30
   bLooping=True
   InputLinks(0)=(DrawY=-690,OverrideDelta=15)
   InputLinks(1)=(DrawY=-668,OverrideDelta=37)
   InputLinks(2)=(DrawY=-646,OverrideDelta=59)
   InputLinks(3)=(DrawY=-624,OverrideDelta=81)
   InputLinks(4)=(DrawY=-602,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-674,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-618,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_30'),DrawX=-9589,OverrideDelta=28)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_217',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_219',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_225'),LinkDesc="Lazers_Up",MinVars=0,DrawX=-9532,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9632
   ObjPosY=-728
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_30"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_30
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-0.000488,Y=-0.000061,Z=-0.000977),ArriveTangent=(X=-0.000977,Y=-0.000122,Z=-0.001953),LeaveTangent=(X=-0.000977,Y=-0.000122,Z=-0.001953),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-0.000977,Y=-0.000122,Z=-0.001953),ArriveTangent=(X=-0.000732,Y=-0.000122,Z=-0.001953),LeaveTangent=(X=-0.000732,Y=-0.000122,Z=-0.001953),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.001221,Y=-0.000183,Z=-0.002930),ArriveTangent=(X=-0.000488,Y=-0.000232,Z=0.000000),LeaveTangent=(X=-0.000488,Y=-0.000232,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.001465,Y=-0.000427,Z=-0.002930),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-11.321411,Y=0.060425,Z=-0.054932),ArriveTangent=(X=0.000000,Y=0.044813,Z=-0.120850),LeaveTangent=(X=0.000000,Y=0.044813,Z=-0.120850),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-0.137329,Y=0.071411,Z=-0.120850),ArriveTangent=(X=22.362671,Y=0.027466,Z=-0.109863),LeaveTangent=(X=22.362671,Y=0.027466,Z=-0.109863),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=11.041260,Y=0.087891,Z=-0.164795),ArriveTangent=(X=0.000000,Y=0.032959,Z=-0.093384),LeaveTangent=(X=0.000000,Y=0.032959,Z=-0.093384),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.274658,Y=0.104370,Z=-0.214233),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.500000),(Time=2.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_30.InterpGroup_1.InterpTrackMove_1'
      GroupName="Lazers_Up"
      GroupColor=(B=146,G=0,R=191,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=2.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_30.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_30.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9632
   ObjPosY=-528
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_30"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_277
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9328
   ObjPosY=-824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_277"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9480
   ObjPosY=-520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_217
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_217"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_225
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_225"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_1
   InputLinks(0)=(DrawY=-1379,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1358,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1337,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7')),DrawY=-1358,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_287',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_187',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_188',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213'),DrawX=-9418,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9367,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9318,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-1416
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_1"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8912
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_188
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9016
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_188"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_187
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_187"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_287
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9512
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_287"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9616
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9704
   ObjPosY=-1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9800
   ObjPosY=-1144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
   Duration=0.200000
   InputLinks(0)=(DrawY=-1363,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1342,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1321,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2',InputLinkIdx=1)),DrawY=-1358,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1326,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9116,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-1400
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_7"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_2
   InputLinks(0)=(DrawY=-1379,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1358,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1337,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_47')),DrawY=-1358,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_287',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_187',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_188',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213'),DrawX=-8818,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8767,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8718,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-1416
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_2"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_47
   Duration=0.300000
   InputLinks(0)=(DrawY=-1523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1481,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1')),DrawY=-1518,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1486,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8580,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-1560
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_47"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_5
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_31'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_32')),DrawY=-4315,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4294,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4273,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=-4384
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_5"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_31
   InputLinks(0)=(DrawY=-4378,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4356,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4334,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4312,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4290,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4362,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4306,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_31'),DrawX=-9225,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),LinkDesc="Clock_Minute_Hand",MinVars=0,DrawX=-9151,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9256
   ObjPosY=-4416
   ObjComment="Minute_Hand"
   DrawWidth=164
   DrawHeight=173
   Name="SeqAct_Interp_31"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_31
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-0.000488,Y=0.000122,Z=-0.000488),InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=(X=-0.000977,Y=0.000244,Z=-0.000977),ArriveTangent=(X=-0.000001,Y=0.000000,Z=-0.000001),LeaveTangent=(X=-0.000001,Y=0.000000,Z=-0.000001),InterpMode=CIM_CurveAutoClamped),(InVal=1800.000000,OutVal=(X=-0.001953,Y=0.000488,Z=-0.001953),ArriveTangent=(X=-0.000001,Y=0.000000,Z=-0.000001),LeaveTangent=(X=-0.000001,Y=0.000000,Z=-0.000001),InterpMode=CIM_CurveAutoClamped),(InVal=2700.000000,OutVal=(X=-0.002930,Y=0.000732,Z=-0.002930),ArriveTangent=(X=-0.000001,Y=0.000000,Z=-0.000001),LeaveTangent=(X=-0.000001,Y=0.000000,Z=-0.000001),InterpMode=CIM_CurveAutoClamped),(InVal=3600.000000,OutVal=(X=-0.003906,Y=0.000977,Z=-0.003906),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=-360.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=(X=-720.000000,Y=-90.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1800.000000,OutVal=(X=-540.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.100000,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.100000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2700.000000,OutVal=(X=-720.000000,Y=90.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3600.000000,OutVal=(X=-720.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=900.000000),(Time=1800.000000),(Time=2700.000000),(Time=3600.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpGroup_0.InterpTrackMove_0'
      GroupName="Clock_Minute_Hand"
      GroupColor=(B=0,G=202,R=128,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=3600.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_31.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=3600.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9256
   ObjPosY=-4216
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_31"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9072
   ObjPosY=-4224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_32
   PlayRate=0.500000
   InputLinks(0)=(DrawY=-4066,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4044,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4022,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4000,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3978,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4050,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3994,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_32'),DrawX=-9207,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_227',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="Clock_Hour_Hand",MinVars=0,DrawX=-9140,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-4104
   ObjComment="Hour_Hand"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_32"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_32
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5400.000000,OutVal=(X=-0.001465,Y=0.000366,Z=-0.001465),ArriveTangent=(X=-0.000000,Y=0.000000,Z=-0.000000),LeaveTangent=(X=-0.000000,Y=0.000000,Z=-0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10800.000000,OutVal=(X=-0.002441,Y=0.000610,Z=-0.002441),ArriveTangent=(X=-0.000000,Y=0.000000,Z=-0.000000),LeaveTangent=(X=-0.000000,Y=0.000000,Z=-0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=16200.500000,OutVal=(X=-0.003418,Y=0.000854,Z=-0.003418),ArriveTangent=(X=-0.000000,Y=0.000000,Z=-0.000000),LeaveTangent=(X=-0.000000,Y=0.000000,Z=-0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21600.000000,OutVal=(X=-0.004395,Y=0.001099,Z=-0.004395),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5400.000000,OutVal=(X=0.000000,Y=-90.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10800.000000,OutVal=(X=180.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.016666,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.016666,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=16200.500000,OutVal=(X=0.000000,Y=90.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21600.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5400.000000),(Time=10800.000000),(Time=16200.500000),(Time=21600.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_32.InterpGroup_1.InterpTrackMove_1'
      GroupName="Clock_Hour_Hand"
      GroupColor=(B=158,G=0,R=181,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=21600.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_32.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_32.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=21600.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-3904
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_32"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_227
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-3888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_227"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_33
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-9170,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9148,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9126,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9104,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9082,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9154,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9098,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_33'),DrawX=-4201,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_229',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_230',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_231',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233'),LinkDesc="Plank_1",MinVars=0,DrawX=-4144,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_234',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_236',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_237',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238'),LinkDesc="Plank_2",MinVars=0,DrawX=-4078,OverrideDelta=129)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4232
   ObjPosY=-9208
   DrawWidth=195
   DrawHeight=157
   Name="SeqAct_Interp_33"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_33
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-607.999878,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000012),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=0.000000,Y=-607.999878,Z=-0.000076),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000046),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=4.500000),(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpGroup_0.InterpTrackMove_0'
      GroupName="Plank_1"
      GroupColor=(B=0,G=226,R=64,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-608.000000,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000012),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,OutVal=(X=0.000000,Y=-608.000000,Z=-0.000076),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000046),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=4.500000,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=4.500000),(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpGroup_1.InterpTrackMove_1'
      GroupName="Plank_2"
      GroupColor=(B=198,G=0,R=136,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_33.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4600
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_33"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-8976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4376
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_229"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_230
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_77'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_230"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_231
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_75'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4176
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_231"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_232"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_233"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_234
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3864
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_234"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3776
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_235"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_236
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_236"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3576
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_237"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_71'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3472
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_2
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_12'
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_34'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_35'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_48')),DrawY=-9779,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9757,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-9735,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-9713,OverrideDelta=80)
   VariableLinks(0)=(DrawX=9284,OverrideDelta=140)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9112
   ObjPosY=-9848
   ObjName="KFTrigger_MinigameButton_12 Minigame Activation"
   DrawWidth=242
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_2"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_34
   InputLinks(0)=(DrawY=-9818,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9796,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9774,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9752,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9730,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9802,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9746,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_34'),DrawX=9605,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240'),LinkDesc="brick_1",MinVars=0,DrawX=9660,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9560
   ObjPosY=-9856
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_34"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_34
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=20.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_34.InterpGroup_0.InterpTrackMove_0'
      GroupName="brick_1"
      GroupColor=(B=147,G=189,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=3.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_34.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_34.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=3.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9560
   ObjPosY=-9656
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_34"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9664
   ObjPosY=-9696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_35
   InputLinks(0)=(DrawY=-9506,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9484,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9462,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9440,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9418,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9490,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9434,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_35'),DrawX=9583,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241'),LinkDesc="panel_1",MinVars=0,DrawX=9640,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242'),LinkDesc="panel_2",MinVars=0,DrawX=9707,OverrideDelta=130)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9552
   ObjPosY=-9544
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_35"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_35
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.000008,Y=-0.000488,Z=-72.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpGroup_0.InterpTrackMove_0'
      GroupName="panel_1"
      GroupColor=(B=0,G=0,R=233,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.000000,Y=-0.000488,Z=-64.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpGroup_1.InterpTrackMove_1'
      GroupName="panel_2"
      GroupColor=(B=165,G=174,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=3.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_35.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=3.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9552
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_35"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9656
   ObjPosY=-9384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9704
   ObjPosY=-9384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_166'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9344
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_173'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_158'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_165'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8944
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_254
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8640
   ObjPosY=-7400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_254"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_255
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_174'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=-7400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_255"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_256
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8848
   ObjPosY=-7400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_256"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_257
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=-7400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_257"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_6
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_5')),DrawY=-9347,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9326,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9305,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8712
   ObjPosY=-9416
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_6"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_5
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-9366,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9366,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_259',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261'),DrawX=9050,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8992
   ObjPosY=-9400
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_5"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_259
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8984
   ObjPosY=-9312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_259"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_258
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9592
   ObjPosY=-9064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_258"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_7
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-9126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_258'),DrawX=9626,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9568
   ObjPosY=-9160
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_7"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_9
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_18'
   MaxWidth=345
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_36'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6')),DrawY=-8915,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8893,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-8871,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-8849,OverrideDelta=80)
   VariableLinks(0)=(DrawX=9324,OverrideDelta=140)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9152
   ObjPosY=-8984
   ObjName="KFTrigger_MinigameButton_18 Minigame Activation"
   DrawWidth=242
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_9"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_36
   InputLinks(0)=(DrawY=-8850,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8828,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8806,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8784,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8762,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8834,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8778,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_36'),DrawX=9714,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260'),LinkDesc="Lever",MinVars=0,DrawX=9764,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9664
   ObjPosY=-8888
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_36"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_36
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-3.999512,Y=0.000000,Z=5.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=45.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_36.InterpGroup_0.InterpTrackMove_0'
      GroupName="Lever"
      GroupColor=(B=0,G=126,R=203,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_36.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_36.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9664
   ObjPosY=-8688
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_36"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_48
   Duration=3.000000
   InputLinks(0)=(DrawY=-9251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9209,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_7')),DrawY=-9246,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9214,OverrideDelta=51)
   VariableLinks(0)=(DrawX=9452,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9400
   ObjPosY=-9288
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_48"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_260
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9768
   ObjPosY=-8728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_260"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_261
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9064
   ObjPosY=-9312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_261"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_6
   Duration=3.000000
   InputLinks(0)=(DrawY=-8643,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8622,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8601,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_3')),DrawY=-8638,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8606,OverrideDelta=51)
   VariableLinks(0)=(DrawX=9588,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9536
   ObjPosY=-8680
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_6"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_3
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-8518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8518,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262'),DrawX=9762,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9704
   ObjPosY=-8552
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_3"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_262
   ObjValue=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9720
   ObjPosY=-8448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_262"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_19
   Originator=KFTrigger_MinigameButton'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
   MaxWidth=337
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_37'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_52')),DrawY=-8579,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8557,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-8535,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-8513,OverrideDelta=80)
   VariableLinks(0)=(DrawX=8888,OverrideDelta=136)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8720
   ObjPosY=-8648
   ObjName="KFTrigger_MinigameButton_0 Minigame Activation"
   DrawWidth=238
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_19"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_37
   InputLinks(0)=(DrawY=-8282,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8260,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8238,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8216,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8194,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8266,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8210,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_37'),DrawX=9701,OverrideDelta=38)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263'),LinkDesc="Book",MinVars=0,DrawX=9748,OverrideDelta=85)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9648
   ObjPosY=-8320
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_37"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_37
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-15.000488,Y=0.000244,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_37.InterpGroup_0.InterpTrackMove_0'
      GroupName="Book"
      GroupColor=(B=0,G=224,R=74,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.500000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_37.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_37.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9648
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_37"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_263
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9752
   ObjPosY=-8160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_263"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_264
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5656
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_264"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8888
   ObjPosY=-4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8784
   ObjPosY=-4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_69'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9056
   ObjPosY=-3888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-3888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-3888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_8
   Duration=20.000000
   InputLinks(0)=(DrawY=-4779,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4758,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4737,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-4774,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4742,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7956,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8008
   ObjPosY=-4816
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_8"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-4779,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4758,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4737,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_27'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_10')),DrawY=-4758,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_156',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251'),DrawX=-7818,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7767,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7718,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7856
   ObjPosY=-4816
   ObjComment="Blood Water"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_10
   Duration=0.100000
   InputLinks(0)=(DrawY=-4931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4889,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_40'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_42'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_43'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_44'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_22'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_27'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_50'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=-4926,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4894,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7244,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=-4968
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_10"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-4627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4585,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4606,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_269'),DrawX=-7378,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7327,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7278,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7416
   ObjPosY=-4664
   ObjComment="Standard Water"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_7
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-1171,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1150,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1129,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-1240
   ObjComment="DJ"
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_7"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_11
   MaxTriggerCount=2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_25'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24'),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_8')),DrawY=-4243,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_25'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_8')),DrawY=-4222,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4201,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5848
   ObjPosY=-4312
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_11"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-3627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3585,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3606,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_172',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_173',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_174',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_307'),DrawX=-4370,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4319,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4270,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-3664
   ObjComment="Spawns that start OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4536
   ObjPosY=-3512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_12
   Originator=KFTrigger_DoshActivated'KF-MONSTERBALL.TheWorld:PersistentLevel.KFTrigger_DoshActivated_2'
   MaxWidth=329
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3'),(LinkedOp=KFSeqAct_SetPathnodeExtraCost'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetPathnodeExtraCost_3'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_25',InputLinkIdx=1),(LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_15'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23',InputLinkIdx=1),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_28'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_26'),(LinkedOp=KFSeqAct_UnlockAchievement'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_UnlockAchievement_0')),DrawY=-4699,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4677,OverrideDelta=36)
   OutputLinks(2)=(DrawY=-4655,OverrideDelta=58)
   OutputLinks(3)=(DrawY=-4633,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-5740,OverrideDelta=132)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5904
   ObjPosY=-4768
   ObjName="KFTrigger_DoshActivated_2 Minigame Activation"
   DrawWidth=234
   DrawHeight=200
   Name="KFSeqEvent_MinigameActivated_12"
   ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_25
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-4234,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4212,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4190,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4168,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4146,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4218,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4162,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_25'),DrawX=-4465,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265'),LinkDesc="door",MinVars=0,DrawX=-4419,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_266'),LinkDesc="Door_two",MinVars=0,DrawX=-4357,OverrideDelta=108)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-4272
   DrawWidth=187
   DrawHeight=157
   Name="SeqAct_Interp_25"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_25
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=4.000000,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_0.InterpTrackMove_0'
      GroupName="door"
      GroupColor=(B=64,G=226,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-4.000244,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_4.InterpTrackMove_2'
      GroupName="Door_two"
      GroupColor=(B=197,G=136,R=0,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=2.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_25.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-4072
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_25"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_265
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_265"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_266
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_83'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4368
   ObjPosY=-4064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_266"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetPathnodeExtraCost Name=KFSeqAct_SetPathnodeExtraCost_3
   InputLinks(0)=(DrawY=-4662,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4662,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_177'),DrawX=-4394,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4512
   ObjPosY=-4696
   DrawWidth=236
   DrawHeight=61
   Name="KFSeqAct_SetPathnodeExtraCost_3"
   ObjectArchetype=KFSeqAct_SetPathnodeExtraCost'KFGame.Default__KFSeqAct_SetPathnodeExtraCost'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=KFPathnode'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPathnode_589'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-4616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_172
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_77'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4336
   ObjPosY=-3440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_172"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_173
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4256
   ObjPosY=-3440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_173"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4544
   ObjPosY=-3432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_15
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-4870,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4870,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_175',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_182',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210'),DrawX=-4406,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4464
   ObjPosY=-4904
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_15"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=KFPawnBlockingVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPawnBlockingVolume_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4520
   ObjPosY=-4776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=KFPawnBlockingVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPawnBlockingVolume_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4416
   ObjPosY=-4776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=KFPathnode'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPathnode_603'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4296
   ObjPosY=-4608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_24
   InputLinks(0)=(DrawY=-4506,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4484,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4462,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4440,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4418,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4490,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4434,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_24'),DrawX=-4465,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_178'),LinkDesc="door",MinVars=0,DrawX=-4419,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_180'),LinkDesc="door_2",MinVars=0,DrawX=-4366,OverrideDelta=108)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-4544
   DrawWidth=169
   DrawHeight=157
   Name="SeqAct_Interp_24"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_24
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=4.000000,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_5.InterpTrackMove_3'
      GroupName="door"
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_8.InterpTrackMove_4'
      GroupName="door_2"
      GroupColor=(B=231,G=0,R=42,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=2.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_5'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_24.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-4344
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_24"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_178
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-4392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_178"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4352
   ObjPosY=-4392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_182
   ObjValue=BlockingVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.BlockingVolume_140'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4328
   ObjPosY=-4776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_182"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjValue=BlockingVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.BlockingVolume_124'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4208
   ObjPosY=-4768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-3456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_23
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=4.000000,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0.InterpTrackMove_0'
      GroupName="door"
      GroupColor=(B=64,G=226,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-4.000244,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_4.InterpTrackMove_2'
      GroupName="Door_two"
      GroupColor=(B=197,G=136,R=0,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=2.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4480
   ObjPosY=-3784
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_23"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_23
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3946,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3924,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3902,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3880,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3858,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3930,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3874,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_23'),DrawX=-4449,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_267'),LinkDesc="door",MinVars=0,DrawX=-4403,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_268'),LinkDesc="Door_two",MinVars=0,DrawX=-4341,OverrideDelta=108)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4480
   ObjPosY=-3984
   DrawWidth=187
   DrawHeight=157
   Name="SeqAct_Interp_23"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_267
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4440
   ObjPosY=-3800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_267"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_268
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4376
   ObjPosY=-3800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_268"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=-7699,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7678,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7657,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6254,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6168
   ObjPosY=-7768
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-7755,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7734,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7713,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7734,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_270'),DrawX=6438,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6489,OverrideDelta=76)
   EventLinks(0)=(DrawX=6538,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6400
   ObjPosY=-7792
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_270
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6408
   ObjPosY=-7616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_270"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=-7435,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7414,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7393,OverrideDelta=56)
   VariableLinks(0)=(DrawX=6230,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6144
   ObjPosY=-7504
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-7435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_271'),DrawX=6462,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6513,OverrideDelta=76)
   EventLinks(0)=(DrawX=6562,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6424
   ObjPosY=-7472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_271
   ObjValue=KFSpawner'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=-7344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_271"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4352
   ObjPosY=-3360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4248
   ObjPosY=-3360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_272
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4384
   ObjPosY=-5432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_272"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_273
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-5432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_273"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_274
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4432
   ObjPosY=-6040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_274"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_275
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4328
   ObjPosY=-6040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_275"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1)),DrawY=-8611,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8590,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8569,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7072
   ObjPosY=-8680
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-8827,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8806,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8785,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8806,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_290',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_291',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_292',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_293',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_294',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_295'),DrawX=7910,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7961,OverrideDelta=76)
   EventLinks(0)=(DrawX=8010,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7872
   ObjPosY=-8864
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-8483,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8462,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8441,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8462,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_296',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_297',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_298',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_299',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_300',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_301'),DrawX=7902,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7953,OverrideDelta=76)
   EventLinks(0)=(DrawX=8002,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7864
   ObjPosY=-8520
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_290
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7664
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_290"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_291
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7760
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_291"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_292
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7864
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_292"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_293
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7960
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_293"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_294
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8064
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_294"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_295
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8160
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_295"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_296
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7872
   ObjPosY=-8392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_296"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_297
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7968
   ObjPosY=-8392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_297"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_298
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8072
   ObjPosY=-8392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_298"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_299
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8168
   ObjPosY=-8392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_299"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_300
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8272
   ObjPosY=-8392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_300"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_301
   ObjValue=KFPlayerStart'KF-MONSTERBALL.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8368
   ObjPosY=-8392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_301"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_2
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_23')),DrawY=-8396,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8376,OverrideDelta=33)
   VariableLinks(0)=(DrawX=7075,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7136,OverrideDelta=86)
   VariableLinks(2)=(DrawX=7217,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7032
   ObjPosY=-8464
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_2"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_13
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-2755,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2734,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2713,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-2824
   ObjComment="Spotlights"
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_13"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_38
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2938,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2916,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2894,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2872,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2850,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-2922,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2866,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38'),DrawX=-7425,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),LinkDesc="L1",MinVars=0,DrawX=-7386,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),LinkDesc="r1",MinVars=0,DrawX=-7356,OverrideDelta=94)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117'),LinkDesc="C1",MinVars=0,DrawX=-7325,OverrideDelta=123)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),LinkDesc="C_2",MinVars=0,DrawX=-7288,OverrideDelta=156)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-2976
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_38"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_38
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.000488,Y=0.000488,Z=-0.000061),ArriveTangent=(X=-0.000244,Y=0.000183,Z=-0.000058),LeaveTangent=(X=-0.000244,Y=0.000183,Z=-0.000058),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.000977,Y=0.000732,Z=-0.000305),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=67.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000),(Time=4.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_0.InterpTrackMove_0'
      GroupName="L1"
      GroupColor=(B=0,G=206,R=120,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.000488,Y=0.000488,Z=0.000977),ArriveTangent=(X=-0.000244,Y=0.000244,Z=0.000488),LeaveTangent=(X=-0.000244,Y=0.000244,Z=0.000488),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.000977,Y=0.000977,Z=0.001953),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-67.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000),(Time=4.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_1.InterpTrackMove_1'
      GroupName="r1"
      GroupColor=(B=0,G=123,R=204,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_9
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=-0.000488,Y=0.000488,Z=-0.000244),ArriveTangent=(X=-0.000488,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000488,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.000977,Y=0.000488,Z=-0.000244),ArriveTangent=(X=-0.004883,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.004883,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.100000,OutVal=(X=-0.001465,Y=0.000488,Z=-0.000244),ArriveTangent=(X=-0.000488,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000488,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.001953,Y=0.000488,Z=-0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=-67.175903,Y=4.356079,Z=-169.568481),ArriveTangent=(X=-10.356043,Y=0.000000,Z=-81.073822),LeaveTangent=(X=-10.356043,Y=0.000000,Z=-81.073822),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-68.109741,Y=-3.526611,Z=-177.555542),ArriveTangent=(X=0.000000,Y=-79.128960,Z=-79.925468),LeaveTangent=(X=0.000000,Y=-79.128960,Z=-79.925468),InterpMode=CIM_CurveAutoClamped),(InVal=2.100000,OutVal=(X=-67.933960,Y=-11.469727,Z=-185.553589),ArriveTangent=(X=2.008005,Y=0.000000,Z=-81.591484),LeaveTangent=(X=2.008005,Y=0.000000,Z=-81.591484),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.576782,Y=-3.570557,Z=-362.301636),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.900000),(Time=2.000000),(Time=2.100000),(Time=4.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_9"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_2.InterpTrackMove_9'
      GroupName="C1"
      GroupColor=(B=0,G=220,R=88,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_10
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=0.000488,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.000488,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000488,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000977,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.004883,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.004883,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.100000,OutVal=(X=0.001465,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.000488,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000488,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=0.001953,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.900000,OutVal=(X=-67.153931,Y=4.345093,Z=-169.584961),ArriveTangent=(X=-10.355919,Y=0.000000,Z=-80.928757),LeaveTangent=(X=-10.355919,Y=0.000000,Z=-80.928757),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-68.087769,Y=-3.554077,Z=-177.555542),ArriveTangent=(X=0.000000,Y=-79.238823,Z=-79.843071),LeaveTangent=(X=0.000000,Y=-79.238823,Z=-79.843071),InterpMode=CIM_CurveAutoClamped),(InVal=2.100000,OutVal=(X=-67.911987,Y=-11.502686,Z=-185.553589),ArriveTangent=(X=2.008005,Y=0.000000,Z=-81.592407),LeaveTangent=(X=2.008005,Y=0.000000,Z=-81.592407),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.549316,Y=-3.619995,Z=-362.318115),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.900000),(Time=2.000000),(Time=2.100000),(Time=4.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_10"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_6.InterpTrackMove_10'
      GroupName="C_2"
      GroupColor=(B=105,G=213,R=0,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=4.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_38.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=4.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7552
   ObjPosY=-2792
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_38"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7432
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7328
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7248
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7304
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7352
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7408
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_39
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.000488,Y=0.000488,Z=-0.000061),ArriveTangent=(X=-0.000244,Y=0.000183,Z=-0.000058),LeaveTangent=(X=-0.000244,Y=0.000183,Z=-0.000058),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.000977,Y=0.000732,Z=-0.000305),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000),(Time=4.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_0.InterpTrackMove_0'
      GroupName="L1"
      GroupColor=(B=0,G=206,R=120,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.000488,Y=0.000488,Z=0.000977),ArriveTangent=(X=-0.000244,Y=0.000244,Z=0.000488),LeaveTangent=(X=-0.000244,Y=0.000244,Z=0.000488),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.000977,Y=0.000977,Z=0.001953),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000),(Time=4.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_1.InterpTrackMove_1'
      GroupName="r1"
      GroupColor=(B=0,G=123,R=204,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_9
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.000488,Y=0.000488,Z=-0.000244),ArriveTangent=(X=-0.000244,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000244,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-0.000977,Y=0.000488,Z=-0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000),(Time=4.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_9"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_2.InterpTrackMove_9'
      GroupName="C1"
      GroupColor=(B=0,G=220,R=88,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_10
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000488,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.000244,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000244,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=0.000977,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000),(Time=4.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_10"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_6.InterpTrackMove_10'
      GroupName="C_2"
      GroupColor=(B=105,G=213,R=0,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=4.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=4.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7496
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_39"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_39
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2650,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2628,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2606,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2584,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2562,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-2634,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2578,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_39'),DrawX=-7433,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),LinkDesc="L1",MinVars=0,DrawX=-7394,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),LinkDesc="r1",MinVars=0,DrawX=-7364,OverrideDelta=94)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),LinkDesc="C1",MinVars=0,DrawX=-7333,OverrideDelta=123)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),LinkDesc="C_2",MinVars=0,DrawX=-7296,OverrideDelta=156)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7464
   ObjPosY=-2688
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_39"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=3
   IncrementAmount=0
   InputLinks(0)=(DrawY=-2774,OverrideDelta=19)
   InputLinks(1)=(DrawY=-2742,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_38')),DrawY=-2779,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_39')),LinkDesc="Link 2",DrawY=-2758,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_26')),LinkDesc="Link 3",DrawY=-2737,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7852,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7896
   ObjPosY=-2816
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_26
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2370,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2348,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2326,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2304,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2282,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-2354,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2298,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7425,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),LinkDesc="L1",MinVars=0,DrawX=-7386,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="r1",MinVars=0,DrawX=-7356,OverrideDelta=94)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="C1",MinVars=0,DrawX=-7325,OverrideDelta=123)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),LinkDesc="C_2",MinVars=0,DrawX=-7288,OverrideDelta=156)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-2408
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_26"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-0.000732,Y=0.000732,Z=-0.000183),ArriveTangent=(X=-0.000610,Y=0.000000,Z=-0.000153),LeaveTangent=(X=-0.000610,Y=0.000000,Z=-0.000153),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.001221,Y=0.000732,Z=-0.000305),ArriveTangent=(X=-0.000610,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000610,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.001953,Y=0.000732,Z=-0.000305),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=22.500000,Y=0.000000,Z=0.000000),ArriveTangent=(X=22.500000,Y=0.000000,Z=0.000000),LeaveTangent=(X=22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=2.000000),(Time=3.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackMove_0'
      GroupName="L1"
      GroupColor=(B=0,G=206,R=120,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-0.000732,Y=0.001465,Z=0.001465),ArriveTangent=(X=-0.000610,Y=0.001221,Z=0.000855),LeaveTangent=(X=-0.000610,Y=0.001221,Z=0.000855),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.001221,Y=0.002441,Z=0.001953),ArriveTangent=(X=-0.000488,Y=0.000977,Z=0.000488),LeaveTangent=(X=-0.000488,Y=0.000977,Z=0.000488),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.001709,Y=0.003418,Z=0.002441),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-22.500000,Y=0.000000,Z=0.000000),LeaveTangent=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=2.000000),(Time=3.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_1'
      GroupName="r1"
      GroupColor=(B=0,G=123,R=204,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_9
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-0.000488,Y=0.000488,Z=-0.000244),ArriveTangent=(X=-0.000651,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000651,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-0.000977,Y=0.000488,Z=-0.000244),ArriveTangent=(X=-0.000977,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000977,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-0.001465,Y=0.000488,Z=-0.000244),ArriveTangent=(X=-0.000651,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000651,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-0.001953,Y=0.000488,Z=-0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=33.750000,Y=0.000000,Z=0.000000),ArriveTangent=(X=28.130630,Y=0.000000,Z=0.000000),LeaveTangent=(X=28.130630,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=33.750000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-28.130630,Y=0.000000,Z=0.000000),LeaveTangent=(X=-28.130630,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=1.500000),(Time=2.000000),(Time=3.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_9"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_2.InterpTrackMove_9'
      GroupName="C1"
      GroupColor=(B=0,G=220,R=88,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_10
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000488,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.000651,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000651,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000977,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.000977,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000977,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.001465,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.000651,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000651,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.001953,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=33.750000,Y=0.000000,Z=0.000000),ArriveTangent=(X=28.130630,Y=0.000000,Z=0.000000),LeaveTangent=(X=28.130630,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=45.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=33.750000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-28.130630,Y=0.000000,Z=0.000000),LeaveTangent=(X=-28.130630,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=1.500000),(Time=2.000000),(Time=3.000000)))
         bUseQuatInterpolation=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_10"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_6.InterpTrackMove_10'
      GroupName="C_2"
      GroupColor=(B=105,G=213,R=0,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=3.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=3.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7488
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7344
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7224
   ObjPosY=-2216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5392
   ObjPosY=-8672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4272
   ObjPosY=-5576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-5816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-5923,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5902,ActivateDelay=5.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5881,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5902,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),DrawX=-4386,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4335,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4286,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-5960
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-5816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4320
   ObjPosY=-5816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_270'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4232
   ObjPosY=-5808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_26
   EventName="Dynamic_Change"
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_22'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_20')),DrawY=-7310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9638,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-7376
   ObjComment="Dynamic_Change"
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_26"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-7219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7177,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_18')),DrawY=-7198,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_310',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_311',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_312',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_313',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_314',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_315',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_330',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_331',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_332',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_333',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_334',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_335'),DrawX=-9098,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9047,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8998,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-7256
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_22
   Duration=10.000000
   InputLinks(0)=(DrawY=-7219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7177,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_43'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_44')),DrawY=-7214,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7182,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9396,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-7256
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_22"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_310
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_310"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_311
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_311"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_312
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8928
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_312"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_313
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_313"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_314
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_314"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_315
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8624
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_315"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_330
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_129'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_330"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_331
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_192'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_331"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_332
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8928
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_332"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_333
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_137'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_333"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_334
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_157'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_334"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_335
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_161'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_335"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_43
   Duration=5.000000
   InputLinks(0)=(DrawY=-6619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6598,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6577,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29')),DrawY=-6614,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6582,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9276,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9328
   ObjPosY=-6656
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_43"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=-6619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6598,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6577,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_20')),DrawY=-6598,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_421',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_422',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_423',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_424',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_425',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_426',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_429',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_430',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_431',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_432',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_433',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_434',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_458',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_459',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_460',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_461',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_462',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_463',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_465',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_466',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_467',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_468',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_469',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_470'),DrawX=-9090,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9039,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8990,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-6656
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_421
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_421"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_422
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_422"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_423
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_189'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9000
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_423"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_424
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_158'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8896
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_424"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_425
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8800
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_425"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_426
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_262'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_426"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_429
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_77'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_429"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_430
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_258'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_430"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_431
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_208'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9000
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_431"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_432
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_170'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8896
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_432"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_433
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8800
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_433"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_434
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_159'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_434"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_458
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_239'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=-6256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_458"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_459
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-6256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_459"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_460
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_261'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-6256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_460"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_461
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_204'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8896
   ObjPosY=-6256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_461"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_462
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_205'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=-6256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_462"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_463
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_240'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-6256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_463"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_465
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_264'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_465"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_466
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_209'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_466"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_467
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_210'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9000
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_467"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_468
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_211'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8896
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_468"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_469
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_212'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8800
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_469"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_470
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_265'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_470"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_44
   InputLinks(0)=(DrawY=-6987,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6966,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6945,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30',InputLinkIdx=1)),DrawY=-6982,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6950,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9260,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=-7024
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_44"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-6931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6889,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_49')),DrawY=-6910,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_495',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_496',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_497',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_498',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_499',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_500',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_515',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_516',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_517',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_518',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_519',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_520'),DrawX=-9098,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9047,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8998,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-6968
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_495
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9176
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_495"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_496
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_496"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_497
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8976
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_497"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_498
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_498"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_499
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_499"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_500
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_500"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_501
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8464
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_501"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_502
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8368
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_502"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_503
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_503"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_504
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_504"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_505
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_83'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_505"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_506
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_506"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_507
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7792
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_507"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_508
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7696
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_508"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_509
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_509"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_510
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_110'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7496
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_510"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_511
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_125'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_511"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_512
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_140'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_512"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_513
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_146'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7192
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_513"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_514
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_160'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7288
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_514"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_515
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_257'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_515"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_516
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_268'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9072
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_516"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_517
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_275'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8968
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_517"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_518
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_276'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_518"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_519
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_278'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_519"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_520
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_292'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_520"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_521
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_294'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8456
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_521"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_522
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_305'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_522"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_523
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_306'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_523"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_524
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_167'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_524"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_525
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_181'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_525"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_526
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_184'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_526"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_527
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_229'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7792
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_527"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_528
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_230'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7696
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_528"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_529
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_231'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_529"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_530
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_233'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7496
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_530"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_531
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_242'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_531"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_51
   Duration=0.100000
   InputLinks(0)=(DrawY=-7251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7209,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33',InputLinkIdx=1)),DrawY=-7246,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7214,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8516,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8568
   ObjPosY=-7288
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_51"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=-7251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7209,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_19')),DrawY=-7230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_545',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_546',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_547',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_548',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_549',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_550',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_551',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_552',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_553',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_554',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_555',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_556'),DrawX=-8250,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8199,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8150,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8288
   ObjPosY=-7288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=-7251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7209,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),DrawY=-7230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_532',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_533',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_534',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_535',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_536',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_537',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_538',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_539',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_540',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_541',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_542',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_543',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_544'),DrawX=-7490,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7439,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7390,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7528
   ObjPosY=-7288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_52
   Duration=0.100000
   InputLinks(0)=(DrawY=-7235,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7214,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7193,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34',InputLinkIdx=1)),DrawY=-7230,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7198,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7740,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7792
   ObjPosY=-7272
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_52"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_50
   Duration=0.100000
   InputLinks(0)=(DrawY=-6931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6889,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31',InputLinkIdx=1)),DrawY=-6926,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6894,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7900,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7952
   ObjPosY=-6968
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_50"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=-6939,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6918,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6897,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6918,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_507',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_508',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_527',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_528',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_509',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_529',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_510',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_530',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_511',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_512',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_513',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_531',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_514'),DrawX=-7690,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7639,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7590,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7728
   ObjPosY=-6976
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=-6931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6889,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_50')),DrawY=-6910,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_501',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_502',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_503',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_504',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_505',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_506',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_521',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_522',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_523',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_524',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_525',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_526'),DrawX=-8250,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8199,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8150,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8288
   ObjPosY=-6968
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_49
   Duration=0.100000
   InputLinks(0)=(DrawY=-6931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6889,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32',InputLinkIdx=1)),DrawY=-6926,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6894,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8508,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8560
   ObjPosY=-6968
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_49"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_532
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_136'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_532"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_533
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7488
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_533"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_534
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_534"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_535
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7288
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_535"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_536
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7184
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_536"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_537
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_537"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_538
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_132'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6984
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_538"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_539
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-7072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_539"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_540
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_159'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7480
   ObjPosY=-7072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_540"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_541
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-7072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_541"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_542
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_163'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7280
   ObjPosY=-7072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_542"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_543
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7184
   ObjPosY=-7072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_543"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_544
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-7072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_544"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_545
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_160'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_545"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_546
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_177'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8368
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_546"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_547
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_126'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8272
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_547"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_548
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_197'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_548"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_549
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_549"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_550
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_143'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-7128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_550"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_551
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_162'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8464
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_551"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_552
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_135'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_552"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_553
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_131'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_553"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_554
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_554"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_555
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_555"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_556
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_164'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_556"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_53
   Duration=0.100000
   InputLinks(0)=(DrawY=-6619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6598,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6577,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=-6614,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6582,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8516,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8568
   ObjPosY=-6656
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_53"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=-6603,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6582,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6561,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_32')),DrawY=-6582,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_583',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_584',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_585',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_586',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_587',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_588',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_589',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_590',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_591',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_592',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_593',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_594',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_595',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_596',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_597',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_598',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_599',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_600',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_601',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_602',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_603',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_604',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_605',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_606'),DrawX=-8242,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8191,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8142,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-6640
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_54
   Duration=0.100000
   InputLinks(0)=(DrawY=-6539,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6518,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6497,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36')),DrawY=-6534,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6502,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7644,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7696
   ObjPosY=-6576
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_54"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=-6595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6553,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=-6574,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_557',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_558',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_559',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_560',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_561',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_562',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_563',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_564',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_565',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_566',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_567',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_568',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_569',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_570',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_571',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_572',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_573',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_574',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_575',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_576',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_577',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_578',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_579',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_580',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_581',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_582'),DrawX=-7458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7496
   ObjPosY=-6632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_557
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_557"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_558
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_179'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7528
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_558"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_559
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_559"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_560
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_178'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7336
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_560"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_561
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_296'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7240
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_561"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_562
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_130'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_562"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_563
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_154'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7040
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_563"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_564
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_166'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6936
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_564"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_565
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_565"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_566
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_165'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_566"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_567
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_131'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6640
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_567"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_568
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_164'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_568"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_569
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_161'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_569"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_570
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_221'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_570"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_571
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_222'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_571"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_572
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_223'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7432
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_572"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_573
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_224'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7336
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_573"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_574
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_225'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_574"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_575
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_226'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_575"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_576
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_220'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7032
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_576"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_577
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_234'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6936
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_577"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_578
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_235'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6832
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_578"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_579
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_236'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_579"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_580
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_237'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6632
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_580"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_581
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_238'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_581"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_582
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_227'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-6360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_582"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_583
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8520
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_583"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_584
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_156'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8424
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_584"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_585
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_585"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_586
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_133'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8224
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_586"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_587
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_162'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8120
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_587"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_588
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8024
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_588"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_589
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_139'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_589"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_590
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_177'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7824
   ObjPosY=-6488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_590"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_591
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_210'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8512
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_591"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_592
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8416
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_592"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_593
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_132'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8312
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_593"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_594
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_594"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_595
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_266'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8112
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_595"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_596
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_267'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8016
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_596"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_597
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_268'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_597"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_598
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_217'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7816
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_598"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_599
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_218'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8504
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_599"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_600
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_219'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8408
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_600"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_601
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_263'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8304
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_601"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_602
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_228'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_602"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_603
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_229'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8104
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_603"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_604
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_230'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8008
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_604"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_605
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_231'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_605"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_606
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_232'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7808
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_606"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_55
   InputLinks(0)=(DrawY=-7579,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7558,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7537,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=-7574,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7542,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8716,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=-7616
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_55"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=-7587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_607',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_608',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_609',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_610',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_611',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_612',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_613',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_614',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_615',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_616',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_617',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_618',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_619',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_620',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_621',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_622',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_623',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_624',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_625',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_626',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_627',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_628',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_629',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_189',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_302',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_303'),DrawX=-8418,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8367,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8318,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8456
   ObjPosY=-7624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_607
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8400
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_607"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_608
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8296
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_608"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_609
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_609"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_610
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8096
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_610"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_611
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_86'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8000
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_611"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_612
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7896
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_612"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_613
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7800
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_613"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_614
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_140'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7696
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_614"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_615
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_615"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_616
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8400
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_616"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_617
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8304
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_617"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_618
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_87'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_618"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_619
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8104
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_619"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_620
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8000
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_620"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_621
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_621"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_622
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_169'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7800
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_622"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_623
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7704
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_623"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_624
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_168'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_624"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_625
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_191'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_625"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_626
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_190'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_626"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_627
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_189'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7496
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_627"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_628
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_188'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_628"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_629
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_127'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=-7488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_629"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_9
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1')),DrawY=-1387,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1366,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1345,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9728
   ObjPosY=-1456
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_9"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_32
   EventName="Dynamic_Change"
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_40'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_35')),DrawY=1938,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9710,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=1872
   ObjComment="Dynamic_Change"
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_32"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_3
   LinkCount=5
   bLooping=True
   InputLinks(0)=(DrawY=2374,OverrideDelta=31)
   InputLinks(1)=(DrawY=2430,OverrideDelta=87)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_39'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_34')),DrawY=2358,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_40'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_35')),LinkDesc="Link 2",DrawY=2380,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_42'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_42'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_38')),LinkDesc="Link 3",DrawY=2402,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_41'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_41')),LinkDesc="Link 4",DrawY=2424,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_34'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_30')),LinkDesc="Link 5",DrawY=2446,OverrideDelta=103)
   VariableLinks(0)=(DrawX=-9324,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9368
   ObjPosY=2320
   DrawWidth=89
   DrawHeight=173
   Name="SeqAct_RandomSwitch_3"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
   EventName="Lightning"
   MaxWidth=176
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_3')),DrawY=2506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9560,OverrideDelta=56)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9648
   ObjPosY=2440
   ObjComment="Lightning"
   DrawWidth=108
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_31"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_24
   EventName="Lightning"
   InputLinks(0)=(DrawY=2322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2322,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7594,OverrideDelta=86)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7712
   ObjPosY=2288
   ObjComment="Lightning"
   DrawWidth=237
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_24"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_24
   InputLinks(0)=(DrawY=2301,OverrideDelta=14)
   InputLinks(1)=(DrawY=2322,OverrideDelta=35)
   InputLinks(2)=(DrawY=2343,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_24')),DrawY=2306,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2338,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_0'),DrawX=-7844,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7896
   ObjPosY=2264
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_24"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_0
   Min=23.000000
   Max=40.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7872
   ObjPosY=2424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_0"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Trap_Floor_Open'
   InputLinks(0)=(DrawY=-9446,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-3312,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3360
   ObjPosY=-9480
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3368
   ObjPosY=-9208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_35
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Trap_Cage_Raise'
   InputLinks(0)=(DrawY=-7822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-3544,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3592
   ObjPosY=-7856
   ObjComment="Up"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_35"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_23
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Trap_Cage_Drop'
   InputLinks(0)=(DrawY=-7974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7974,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-3488,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3536
   ObjPosY=-8008
   ObjComment="Down"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_23"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3464
   ObjPosY=-7808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_ShockTrap_LP'
   InputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-16,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-64
   ObjPosY=-9280
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_ShockTrap_Loop'
   InputLinks(0)=(DrawY=-9422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=112,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=64
   ObjPosY=-9456
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=-9224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_33
   EventName="Cage_Trap"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_23')),DrawY=-7982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3842,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-8048
   ObjComment="Cage_Trap"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_33"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_17
   EventName="Trap_Floor_On"
   MaxWidth=213
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),DrawY=-9422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3654,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3760
   ObjPosY=-9488
   ObjComment="Trap_Floor_On"
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_17"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_21
   EventName="Electric On"
   MaxWidth=189
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21')),DrawY=-9398,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-234,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-328
   ObjPosY=-9464
   ObjComment="Electric On"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_21"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Entrance_Door_Opening'
   InputLinks(0)=(DrawY=-8214,ActivateDelay=8.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8214,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),DrawX=-9136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-8248
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_25"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-8144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=780
   SizeY=521
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=-5952
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_9
   SizeX=481
   SizeY=382
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1072
   ObjPosY=-6144
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_9"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_17
   SizeX=589
   SizeY=450
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3952
   ObjPosY=-8144
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_17"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=748
   SizeY=463
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=-9568
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_22
   EventName="Electric1Off"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),DrawY=-9214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-231,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-328
   ObjPosY=-9280
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_22"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_41
   InputLinks(0)=(DrawY=-7490,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7468,ActivateDelay=9.000000,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7446,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7424,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7402,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7474,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7418,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_41'),DrawX=-4700,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),LinkDesc="Cage",MinVars=0,DrawX=-4652,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4752
   ObjPosY=-7528
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_41"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_41
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=0.010000,InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,OutVal=(X=-0.000977,Y=0.000000,Z=-0.000061),ArriveTangent=(X=-0.002483,Y=0.000000,Z=-0.000977),LeaveTangent=(X=-0.002483,Y=0.000000,Z=-0.000977),InterpMode=CIM_CurveAutoClamped),(InVal=0.600000,OutVal=(X=-0.001465,Y=0.000000,Z=-448.000153),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=0.010000,InterpMode=CIM_CurveAutoClamped),(InVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=0.600000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=0.010000),(Time=0.100000),(Time=0.600000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpGroup_0.InterpTrackMove_0'
      GroupName="Cage"
      GroupColor=(B=0,G=123,R=204,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=0.600000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_41.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.600000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4752
   ObjPosY=-7328
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_41"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFMGA_AnimatedTrap'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGA_AnimatedTrap_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4648
   ObjPosY=-7368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_28
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Door_Opening'
   InputLinks(0)=(DrawY=-3542,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3542,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142'),DrawX=-5040,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5088
   ObjPosY=-3576
   ObjComment="Wooden Doors"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_28"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5072
   ObjPosY=-3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-3280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=2198
   SizeY=1818
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6008
   ObjPosY=-4960
   ObjComment="Alchemy_Room"
   DrawWidth=2198
   DrawHeight=1818
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_29
   EventName="Cage_Up"
   MaxWidth=175
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_41',InputLinkIdx=1)),DrawY=-7166,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5113,OverrideDelta=55)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5200
   ObjPosY=-7232
   ObjComment="Cage_Up"
   DrawWidth=107
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_29"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="Cage_Up"
   InputLinks(0)=(DrawY=-8078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4706,OverrideDelta=86)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-8112
   ObjComment="Cage_Up"
   DrawWidth=236
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_34
   EventName="Cage_Up_Sound"
   MaxWidth=224
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_35')),DrawY=-7798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3816,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3928
   ObjPosY=-7864
   ObjComment="Cage_Up_Sound"
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_34"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="Cage_Up_Sound"
   InputLinks(0)=(DrawY=-7974,ActivateDelay=9.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4690,OverrideDelta=110)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-8008
   ObjComment="Cage_Up_Sound"
   DrawWidth=285
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_18
   EventName="Torch1_Off"
   InputLinks(0)=(DrawY=-7222,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_51')),DrawY=-7222,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8778,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8904
   ObjPosY=-7256
   ObjComment="Torch1_Off"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_18"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_23
   EventName="Torch1_Off"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetState'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_0')),DrawY=-6070,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9665,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9760
   ObjPosY=-6136
   ObjComment="Torch1_Off"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_23"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_27
   EventName="Torch1_On"
   MaxWidth=189
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetState'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_4')),DrawY=-5902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9666,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9760
   ObjPosY=-5968
   ObjComment="Torch1_On"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_27"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_20
   EventName="Torch1_On"
   InputLinks(0)=(DrawY=-6606,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_53')),DrawY=-6606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8755,OverrideDelta=93)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-6640
   ObjComment="Torch1_On"
   DrawWidth=250
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_20"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_0
   StateGroup="ENV_MonsterBall_Torches_1"
   State="Off"
   InputLinks(0)=(DrawY=-6054,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6054,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9528
   ObjPosY=-6088
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_0"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_4
   StateGroup="ENV_MonsterBall_Torches_1"
   State="Magic"
   InputLinks(0)=(DrawY=-5878,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5878,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9496
   ObjPosY=-5912
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_4"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_25
   EventName="Torch2_Off"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetState'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_3')),DrawY=-6070,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9265,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9360
   ObjPosY=-6136
   ObjComment="Torch2_Off"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_25"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_19
   EventName="Torch2_Off"
   InputLinks(0)=(DrawY=-7238,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_52')),DrawY=-7238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7954,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-7272
   ObjComment="Torch2_Off"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_19"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="Torch3_Off"
   InputLinks(0)=(DrawY=-7246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7178,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7304
   ObjPosY=-7280
   ObjComment="Torch3_Off"
   DrawWidth=252
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_20
   EventName="Torch3_Off"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetState'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_1')),DrawY=-6070,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8937,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-6136
   ObjComment="Torch3_Off"
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_20"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_32
   EventName="Torch2_On"
   InputLinks(0)=(DrawY=-6582,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_54')),DrawY=-6582,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7907,OverrideDelta=93)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8032
   ObjPosY=-6616
   ObjComment="Torch2_On"
   DrawWidth=250
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_32"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_28
   EventName="Torch2_On"
   MaxWidth=189
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetState'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_5')),DrawY=-5894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9266,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9360
   ObjPosY=-5960
   ObjComment="Torch2_On"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_28"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Torch3_On"
   MaxWidth=189
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetState'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetState_2')),DrawY=-5878,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8930,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-5944
   ObjComment="Torch3_On"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="Torch3_On"
   InputLinks(0)=(DrawY=-6574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6574,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7131,OverrideDelta=93)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7256
   ObjPosY=-6608
   ObjComment="Torch3_On"
   DrawWidth=250
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_3
   StateGroup="ENV_MonsterBall_Torches_2"
   State="Off"
   InputLinks(0)=(DrawY=-6062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6062,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-6096
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_3"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_1
   StateGroup="ENV_MonsterBall_Torches_3"
   State="Off"
   InputLinks(0)=(DrawY=-6070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6070,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8800
   ObjPosY=-6104
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_1"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_5
   StateGroup="ENV_MonsterBall_Torches_2"
   State="Magic"
   InputLinks(0)=(DrawY=-5894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5894,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-5928
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_5"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object

Begin Object Class=SeqAct_AkSetState Name=SeqAct_AkSetState_2
   StateGroup="ENV_MonsterBall_Torches_3"
   State="Magic"
   InputLinks(0)=(DrawY=-5878,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5878,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-5912
   DrawWidth=86
   DrawHeight=45
   Name="SeqAct_AkSetState_2"
   ObjectArchetype=SeqAct_AkSetState'AkAudio.Default__SeqAct_AkSetState'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_18
   SizeX=1215
   SizeY=351
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9840
   ObjPosY=-6200
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_18"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=Note'KF-MONSTERBALL.TheWorld:PersistentLevel.Note_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-8528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Trap_Floor_Close'
   InputLinks(0)=(DrawY=-9230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9230,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-3440,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3488
   ObjPosY=-9264
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=4.500000
   InputLinks(0)=(DrawY=-8659,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8638,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8617,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=-8654,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8622,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4548,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4600
   ObjPosY=-8696
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="Trap_Floor_Shut"
   InputLinks(0)=(DrawY=-8614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8614,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4273,OverrideDelta=111)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4416
   ObjPosY=-8648
   ObjComment="Trap_Floor_Shut"
   DrawWidth=287
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_19
   EventName="Trap_Floor_Shut"
   MaxWidth=226
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-9214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3655,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3768
   ObjPosY=-9280
   ObjComment="Trap_Floor_Shut"
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_19"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_1
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_16')),DrawY=-5324,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33'),(LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_16')),DrawY=-5304,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9705,OverrideDelta=20)
   VariableLinks(1)=(DrawX=-9644,OverrideDelta=90)
   VariableLinks(2)=(DrawX=-9563,OverrideDelta=143)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-5392
   ObjComment="Every wave start this occurs"
   DrawWidth=179
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_1"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_33
   Event=AkEvent'WW_ENV_MonsterBall.Stop_ENV_MonsterBall_Rave_Music'
   InputLinks(0)=(DrawY=-5350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-5384
   ObjComment="Stop Event either for all songs or multiple of this actor representing each song"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_33"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=4
   bLooping=True
   bAutoDisableLinks=True
   InputLinks(0)=(DrawY=-5024,OverrideDelta=25)
   InputLinks(1)=(DrawY=-4980,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_30')),DrawY=-5035,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_31')),LinkDesc="Link 2",DrawY=-5013,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_29')),LinkDesc="Link 3",DrawY=-4991,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_32')),LinkDesc="Link 4",DrawY=-4969,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-9204,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=-5072
   ObjComment="Rondomly picks a song, does not repeat songs back to back"
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_16
   Duration=0.100000
   InputLinks(0)=(DrawY=-5131,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5110,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5089,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-5126,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5094,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9380,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-5168
   ObjComment="We need delay to make sure we dont send a pulse to play a song that is also being told to stop at the same time"
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_16"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_30
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_RaveMusic'
   InputLinks(0)=(DrawY=-5006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5006,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8944,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-5040
   ObjComment="Song_1"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_30"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_31
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_RaveMusic'
   InputLinks(0)=(DrawY=-4918,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4918,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8944,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-4952
   ObjComment="Song_2"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_31"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_32
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_RaveMusic'
   InputLinks(0)=(DrawY=-4734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8944,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-4768
   ObjComment="Song_4"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_32"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_29
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_RaveMusic'
   InputLinks(0)=(DrawY=-4830,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8944,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-4864
   ObjComment="Song_3"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_29"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),DrawY=-4780,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4760,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9701,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9640,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9559,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9744
   ObjPosY=-4848
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_0"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Rave_TraderTime_Music'
   InputLinks(0)=(DrawY=-4814,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9376,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-4848
   ObjComment="Quiet Song"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_23
   Duration=20.000000
   InputLinks(0)=(DrawY=-8435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8393,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=-8430,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8398,OverrideDelta=51)
   VariableLinks(0)=(DrawX=7468,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7416
   ObjPosY=-8472
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_23"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=1615
   SizeY=651
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6992
   ObjPosY=-8912
   ObjComment="Player Spawns"
   DrawWidth=1615
   DrawHeight=651
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1615
   SizeY=651
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6992
   ObjPosY=-9624
   ObjComment="Benchmark"
   DrawWidth=1615
   DrawHeight=651
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_321
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=1760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_321"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_320
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=3376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_320"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_252
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=2400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_252"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=2872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_34
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Thunder'
   InputLinks(0)=(DrawY=3290,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3290,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_320'),DrawX=-8680,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=3256
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_34"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_42
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Thunder'
   InputLinks(0)=(DrawY=2314,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2314,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_252'),DrawX=-8656,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8704
   ObjPosY=2280
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_42"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_41
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Thunder'
   InputLinks(0)=(DrawY=2818,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2818,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146'),DrawX=-8656,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8704
   ObjPosY=2784
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_41"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_40
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Thunder'
   InputLinks(0)=(DrawY=1722,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1722,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_321'),DrawX=-8648,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=1688
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_40"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_39
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Thunder'
   InputLinks(0)=(DrawY=1138,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1138,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),DrawX=-8664,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=1104
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_39"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=1960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
   InputLinks(0)=(DrawY=1853,OverrideDelta=14)
   InputLinks(1)=(DrawY=1874,OverrideDelta=35)
   InputLinks(2)=(DrawY=1895,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=1874,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=-8498,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8447,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8398,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=1816
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=1285,OverrideDelta=14)
   InputLinks(1)=(DrawY=1306,OverrideDelta=35)
   InputLinks(2)=(DrawY=1327,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=1306,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=-8458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8496
   ObjPosY=1248
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_42
   InputLinks(0)=(DrawY=2453,OverrideDelta=14)
   InputLinks(1)=(DrawY=2474,OverrideDelta=35)
   InputLinks(2)=(DrawY=2495,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=2474,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-8474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8512
   ObjPosY=2416
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_42"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=3357,OverrideDelta=14)
   InputLinks(1)=(DrawY=3378,OverrideDelta=35)
   InputLinks(2)=(DrawY=3399,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=3378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-8434,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8383,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8334,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=3320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=2997,OverrideDelta=14)
   InputLinks(1)=(DrawY=3018,OverrideDelta=35)
   InputLinks(2)=(DrawY=3039,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=3018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129'),DrawX=-8450,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8399,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8350,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8488
   ObjPosY=2960
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8496
   ObjPosY=1368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_109'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=3448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_110'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8488
   ObjPosY=3088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8512
   ObjPosY=2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_26
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Metal_Door_Opening'
   InputLinks(0)=(DrawY=-3350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-5024,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5072
   ObjPosY=-3384
   ObjComment="Metal Doors"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_26"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_FireTrap_End'
   InputLinks(0)=(DrawY=-5662,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5662,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=-3384,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3432
   ObjPosY=-5696
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_FireTrap_Start'
   InputLinks(0)=(DrawY=-5822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=-3200,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3248
   ObjPosY=-5856
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_14
   EventName="Off_Bridge_Fire"
   MaxWidth=217
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),DrawY=-5574,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3644,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3752
   ObjPosY=-5640
   ObjComment="Off_Bridge_Fire"
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_14"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_8
   EventName="On_Bridge_Fire"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=-5830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3669,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3776
   ObjPosY=-5896
   ObjComment="On_Bridge_Fire"
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_8"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_10
   SizeX=589
   SizeY=450
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-320
   ObjPosY=-8008
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_10"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Trap_Fireplace_Start'
   InputLinks(0)=(DrawY=-7902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7902,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=136,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-7936
   ObjComment="Start"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Trap_Fireplace_Stop'
   InputLinks(0)=(DrawY=-7678,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7678,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=48,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-7712
   ObjComment="Stop"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_13
   EventName="Off Fire Trap"
   MaxWidth=201
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20')),DrawY=-7678,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-172,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-272
   ObjPosY=-7744
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_13"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="On Fire Trap"
   MaxWidth=199
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),DrawY=-7894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-189,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-288
   ObjPosY=-7960
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=168
   ObjPosY=-7648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3160
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=1232
   SizeY=1849
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8680
   ObjPosY=-9896
   ObjComment=
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=656
   SizeY=453
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-440
   ObjPosY=-9512
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_22
   SizeX=359
   SizeY=442
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-3632
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_22"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7768
   ObjPosY=-4536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7648
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_206'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7640
   ObjPosY=-4256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_207'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=-4256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_208'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=-4256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_213'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7336
   ObjPosY=-4256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_214'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7240
   ObjPosY=-4256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_215'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-4256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-4488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-4656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_156"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-4672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-4584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-4584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-4504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=7947
   SizeY=2534
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9888
   ObjPosY=-1720
   ObjComment="Rave"
   DrawWidth=7947
   DrawHeight=2534
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=1339
   SizeY=767
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-4472
   ObjComment="Clock_Tower_Hands"
   DrawWidth=1339
   DrawHeight=767
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=693
   SizeY=529
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-3608
   ObjComment="Piano"
   DrawWidth=693
   DrawHeight=529
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-7707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7665,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7686,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-632
   ObjPosY=-7744
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-7299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7257,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7278,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-632
   ObjPosY=-7336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-626
   ObjPosY=-7615
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-626
   ObjPosY=-7207
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=2773,OverrideDelta=14)
   InputLinks(1)=(DrawY=2794,OverrideDelta=35)
   InputLinks(2)=(DrawY=2815,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2794,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_413'),DrawX=-9362,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9311,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9262,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=2736
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_413
   ObjValue=DominantDirectionalLight'KF-MONSTERBALL.TheWorld:PersistentLevel.DominantDirectionalLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=2864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_413"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=3173,OverrideDelta=14)
   InputLinks(1)=(DrawY=3194,OverrideDelta=35)
   InputLinks(2)=(DrawY=3215,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_91')),DrawY=3194,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=-9370,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9319,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9270,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=3136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_91
   Duration=1.500000
   InputLinks(0)=(DrawY=2989,OverrideDelta=14)
   InputLinks(1)=(DrawY=3010,OverrideDelta=35)
   InputLinks(2)=(DrawY=3031,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=2994,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3026,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9324,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9376
   ObjPosY=2952
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_91"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_24
   EventName="Lightning_Light"
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=1)),DrawY=3090,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9612,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9720
   ObjPosY=3024
   ObjComment="Lightning_Light"
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_24"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_34
   EventName="Lightning_Light"
   InputLinks(0)=(DrawY=1506,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8422,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8560
   ObjPosY=1472
   ObjComment="Lightning_Light"
   DrawWidth=277
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_34"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_35
   EventName="Lightning_Light"
   InputLinks(0)=(DrawY=2074,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2074,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8470,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=2040
   ObjComment="Lightning_Light"
   DrawWidth=277
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_35"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_38
   EventName="Lightning_Light"
   InputLinks(0)=(DrawY=2666,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2666,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8406,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=2632
   ObjComment="Lightning_Light"
   DrawWidth=277
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_38"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_3
   InputLinks(0)=(DrawY=-267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-225,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_25')),DrawY=-246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_342',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_343',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_344',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_385',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_386',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_387',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_388',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_389',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_390',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_391',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_392',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_393',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_394'),DrawX=-9226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9175,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9126,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9264
   ObjPosY=-304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_3"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9648
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9552
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9352
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9048
   ObjPosY=-152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=1500
   SizeY=927
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-3024
   ObjComment="Spotlights"
   DrawWidth=1500
   DrawHeight=927
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_342
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_342"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_343
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8872
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_343"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_344
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=-160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_344"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_356
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5768
   ObjPosY=192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_356"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_366
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6160
   ObjPosY=480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_366"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_367
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6552
   ObjPosY=200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_367"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_45
   InputLinks(0)=(DrawY=101,OverrideDelta=14)
   InputLinks(1)=(DrawY=122,OverrideDelta=35)
   InputLinks(2)=(DrawY=143,OverrideDelta=56)
   OutputLinks(0)=(DrawY=122,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_367',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_382'),DrawX=-6386,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6335,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6286,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=64
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_45"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_81
   Duration=0.100000
   InputLinks(0)=(DrawY=117,OverrideDelta=14)
   InputLinks(1)=(DrawY=138,OverrideDelta=35)
   InputLinks(2)=(DrawY=159,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_45'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_48',InputLinkIdx=1)),DrawY=122,OverrideDelta=19)
   OutputLinks(1)=(DrawY=154,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6524,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=80
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_81"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_46
   InputLinks(0)=(DrawY=101,OverrideDelta=14)
   InputLinks(1)=(DrawY=122,OverrideDelta=35)
   InputLinks(2)=(DrawY=143,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_81')),DrawY=122,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_367',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_382'),DrawX=-6762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6800
   ObjPosY=64
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_46"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_47
   InputLinks(0)=(DrawY=373,OverrideDelta=14)
   InputLinks(1)=(DrawY=394,OverrideDelta=35)
   InputLinks(2)=(DrawY=415,OverrideDelta=56)
   OutputLinks(0)=(DrawY=394,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_366',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_383'),DrawX=-5994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_47"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_82
   Duration=0.100000
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_47'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_49',InputLinkIdx=1)),DrawY=394,OverrideDelta=19)
   OutputLinks(1)=(DrawY=426,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6132,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6184
   ObjPosY=352
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_82"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_48
   InputLinks(0)=(DrawY=373,OverrideDelta=14)
   InputLinks(1)=(DrawY=394,OverrideDelta=35)
   InputLinks(2)=(DrawY=415,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_82')),DrawY=394,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_366',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_383'),DrawX=-6370,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6319,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6270,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6408
   ObjPosY=336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_48"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_49
   InputLinks(0)=(DrawY=101,OverrideDelta=14)
   InputLinks(1)=(DrawY=122,OverrideDelta=35)
   InputLinks(2)=(DrawY=143,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_83')),DrawY=122,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_356',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_384'),DrawX=-5978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5927,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5878,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6016
   ObjPosY=64
   ObjComment="Halfway"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_49"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_83
   Duration=0.100000
   InputLinks(0)=(DrawY=93,OverrideDelta=14)
   InputLinks(1)=(DrawY=114,OverrideDelta=35)
   InputLinks(2)=(DrawY=135,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_50'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_5',InputLinkIdx=1)),DrawY=98,OverrideDelta=19)
   OutputLinks(1)=(DrawY=130,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5740,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5792
   ObjPosY=56
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_83"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_50
   InputLinks(0)=(DrawY=101,OverrideDelta=14)
   InputLinks(1)=(DrawY=122,OverrideDelta=35)
   InputLinks(2)=(DrawY=143,OverrideDelta=56)
   OutputLinks(0)=(DrawY=122,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_356',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_384'),DrawX=-5602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5640
   ObjPosY=64
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_50"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_370
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7744
   ObjPosY=480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_370"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_369
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7344
   ObjPosY=216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_369"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_368
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6928
   ObjPosY=456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_368"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_371
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_371"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_372
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_372"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_51
   InputLinks(0)=(DrawY=357,OverrideDelta=14)
   InputLinks(1)=(DrawY=378,OverrideDelta=35)
   InputLinks(2)=(DrawY=399,OverrideDelta=56)
   OutputLinks(0)=(DrawY=378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_368',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_381'),DrawX=-6754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_51"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_84
   Duration=0.100000
   InputLinks(0)=(DrawY=373,OverrideDelta=14)
   InputLinks(1)=(DrawY=394,OverrideDelta=35)
   InputLinks(2)=(DrawY=415,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_51'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_46',InputLinkIdx=1)),DrawY=378,OverrideDelta=19)
   OutputLinks(1)=(DrawY=410,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6908,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6960
   ObjPosY=336
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_84"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_16
   InputLinks(0)=(DrawY=381,OverrideDelta=14)
   InputLinks(1)=(DrawY=402,OverrideDelta=35)
   InputLinks(2)=(DrawY=423,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_84')),DrawY=402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_368',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_381'),DrawX=-7146,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7095,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7046,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7184
   ObjPosY=344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_16"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_53
   InputLinks(0)=(DrawY=381,OverrideDelta=14)
   InputLinks(1)=(DrawY=402,OverrideDelta=35)
   InputLinks(2)=(DrawY=423,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_85')),DrawY=402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_370',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_379'),DrawX=-7946,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7895,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7846,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7984
   ObjPosY=344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_53"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_85
   Duration=0.100000
   InputLinks(0)=(DrawY=397,OverrideDelta=14)
   InputLinks(1)=(DrawY=418,OverrideDelta=35)
   InputLinks(2)=(DrawY=439,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_54'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_55',InputLinkIdx=1)),DrawY=402,OverrideDelta=19)
   OutputLinks(1)=(DrawY=434,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7708,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=360
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_85"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_54
   InputLinks(0)=(DrawY=365,OverrideDelta=14)
   InputLinks(1)=(DrawY=386,OverrideDelta=35)
   InputLinks(2)=(DrawY=407,OverrideDelta=56)
   OutputLinks(0)=(DrawY=386,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_370',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_379'),DrawX=-7554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_54"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_55
   InputLinks(0)=(DrawY=109,OverrideDelta=14)
   InputLinks(1)=(DrawY=130,OverrideDelta=35)
   InputLinks(2)=(DrawY=151,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_86')),DrawY=130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_369',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_380'),DrawX=-7546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=72
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_55"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_86
   Duration=0.100000
   InputLinks(0)=(DrawY=125,OverrideDelta=14)
   InputLinks(1)=(DrawY=146,OverrideDelta=35)
   InputLinks(2)=(DrawY=167,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_56'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_16',InputLinkIdx=1)),DrawY=130,OverrideDelta=19)
   OutputLinks(1)=(DrawY=162,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7308,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7360
   ObjPosY=88
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_86"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_56
   InputLinks(0)=(DrawY=109,OverrideDelta=14)
   InputLinks(1)=(DrawY=130,OverrideDelta=35)
   InputLinks(2)=(DrawY=151,OverrideDelta=56)
   OutputLinks(0)=(DrawY=130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_369',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_380'),DrawX=-7170,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7119,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7070,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=72
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_56"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_57
   InputLinks(0)=(DrawY=109,OverrideDelta=14)
   InputLinks(1)=(DrawY=130,OverrideDelta=35)
   InputLinks(2)=(DrawY=151,OverrideDelta=56)
   OutputLinks(0)=(DrawY=130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_371',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_378'),DrawX=-7970,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7919,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7870,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8008
   ObjPosY=72
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_57"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_87
   Duration=0.100000
   InputLinks(0)=(DrawY=125,OverrideDelta=14)
   InputLinks(1)=(DrawY=146,OverrideDelta=35)
   InputLinks(2)=(DrawY=167,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_57'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_53',InputLinkIdx=1)),DrawY=130,OverrideDelta=19)
   OutputLinks(1)=(DrawY=162,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8108,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=88
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_87"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_58
   InputLinks(0)=(DrawY=109,OverrideDelta=14)
   InputLinks(1)=(DrawY=130,OverrideDelta=35)
   InputLinks(2)=(DrawY=151,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_87')),DrawY=130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_371',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_378'),DrawX=-8346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8295,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=72
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_58"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_59
   InputLinks(0)=(DrawY=357,OverrideDelta=14)
   InputLinks(1)=(DrawY=378,OverrideDelta=35)
   InputLinks(2)=(DrawY=399,OverrideDelta=56)
   OutputLinks(0)=(DrawY=378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_372',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_377'),DrawX=-8370,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8319,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8270,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8408
   ObjPosY=320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_59"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_88
   Duration=0.100000
   InputLinks(0)=(DrawY=381,OverrideDelta=14)
   InputLinks(1)=(DrawY=402,OverrideDelta=35)
   InputLinks(2)=(DrawY=423,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_59'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_58',InputLinkIdx=1)),DrawY=386,OverrideDelta=19)
   OutputLinks(1)=(DrawY=418,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8524,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=344
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_88"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_60
   InputLinks(0)=(DrawY=365,OverrideDelta=14)
   InputLinks(1)=(DrawY=386,OverrideDelta=35)
   InputLinks(2)=(DrawY=407,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_88')),DrawY=386,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_372',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_377'),DrawX=-8762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8800
   ObjPosY=328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_60"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_373
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_373"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_4
   InputLinks(0)=(DrawY=125,OverrideDelta=14)
   InputLinks(1)=(DrawY=146,OverrideDelta=35)
   InputLinks(2)=(DrawY=167,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_89')),DrawY=146,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_373',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_376'),DrawX=-9138,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9087,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9038,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9176
   ObjPosY=88
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_4"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_89
   Duration=0.100000
   InputLinks(0)=(DrawY=141,OverrideDelta=14)
   InputLinks(1)=(DrawY=162,OverrideDelta=35)
   InputLinks(2)=(DrawY=183,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_62'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_60',InputLinkIdx=1)),DrawY=146,OverrideDelta=19)
   OutputLinks(1)=(DrawY=178,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8900,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=104
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_89"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_62
   InputLinks(0)=(DrawY=125,OverrideDelta=14)
   InputLinks(1)=(DrawY=146,OverrideDelta=35)
   InputLinks(2)=(DrawY=167,OverrideDelta=56)
   OutputLinks(0)=(DrawY=146,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_373',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_376'),DrawX=-8762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8800
   ObjPosY=88
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_62"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_374
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_374"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_63
   InputLinks(0)=(DrawY=349,OverrideDelta=14)
   InputLinks(1)=(DrawY=370,OverrideDelta=35)
   InputLinks(2)=(DrawY=391,OverrideDelta=56)
   OutputLinks(0)=(DrawY=370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_374',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_375'),DrawX=-9146,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9095,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9046,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_63"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_90
   Duration=0.100000
   InputLinks(0)=(DrawY=365,OverrideDelta=14)
   InputLinks(1)=(DrawY=386,OverrideDelta=35)
   InputLinks(2)=(DrawY=407,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_63'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_4',InputLinkIdx=1)),DrawY=370,OverrideDelta=19)
   OutputLinks(1)=(DrawY=402,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9284,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9336
   ObjPosY=328
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_90"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_64
   InputLinks(0)=(DrawY=349,OverrideDelta=14)
   InputLinks(1)=(DrawY=370,OverrideDelta=35)
   InputLinks(2)=(DrawY=391,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_90')),DrawY=370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_374',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_375'),DrawX=-9514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9552
   ObjPosY=312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_64"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_15
   EventName="rave_1"
   MaxWidth=162
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_64',InputLinkIdx=1)),DrawY=226,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9759,OverrideDelta=49)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9840
   ObjPosY=160
   ObjComment="Rave_1"
   DrawWidth=101
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_15"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_12
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3')),DrawY=-243,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-222,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-201,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9840
   ObjPosY=-312
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_12"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_5
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_26')),DrawY=410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_357',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_396'),DrawX=-5594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_5"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_26
   Duration=0.100000
   InputLinks(0)=(DrawY=397,OverrideDelta=14)
   InputLinks(1)=(DrawY=418,OverrideDelta=35)
   InputLinks(2)=(DrawY=439,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_6'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_10',InputLinkIdx=1)),DrawY=402,OverrideDelta=19)
   OutputLinks(1)=(DrawY=434,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5364,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5416
   ObjPosY=360
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_26"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_6
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(DrawY=410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_357',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_396'),DrawX=-5226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5175,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5126,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5264
   ObjPosY=352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_6"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_9
   InputLinks(0)=(DrawY=109,OverrideDelta=14)
   InputLinks(1)=(DrawY=130,OverrideDelta=35)
   InputLinks(2)=(DrawY=151,OverrideDelta=56)
   OutputLinks(0)=(DrawY=130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_358',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_397'),DrawX=-4834,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4783,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4734,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=72
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_9"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_32
   Duration=0.100000
   InputLinks(0)=(DrawY=125,OverrideDelta=14)
   InputLinks(1)=(DrawY=146,OverrideDelta=35)
   InputLinks(2)=(DrawY=167,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_9'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_11',InputLinkIdx=1)),DrawY=130,OverrideDelta=19)
   OutputLinks(1)=(DrawY=162,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4972,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5024
   ObjPosY=88
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_32"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_10
   InputLinks(0)=(DrawY=109,OverrideDelta=14)
   InputLinks(1)=(DrawY=130,OverrideDelta=35)
   InputLinks(2)=(DrawY=151,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_32')),DrawY=130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_358',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_397'),DrawX=-5210,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5159,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5110,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5248
   ObjPosY=72
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_10"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_11
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_33')),DrawY=410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_361',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_398'),DrawX=-4826,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4775,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4726,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4864
   ObjPosY=352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_11"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_33
   Duration=0.100000
   InputLinks(0)=(DrawY=405,OverrideDelta=14)
   InputLinks(1)=(DrawY=426,OverrideDelta=35)
   InputLinks(2)=(DrawY=447,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_12'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_13',InputLinkIdx=1)),DrawY=410,OverrideDelta=19)
   OutputLinks(1)=(DrawY=442,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4588,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4640
   ObjPosY=368
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_33"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_12
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(DrawY=410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_361',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_398'),DrawX=-4474,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4423,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4374,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4512
   ObjPosY=352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_12"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_13
   InputLinks(0)=(DrawY=133,OverrideDelta=14)
   InputLinks(1)=(DrawY=154,OverrideDelta=35)
   InputLinks(2)=(DrawY=175,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_35')),DrawY=154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_360',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_399'),DrawX=-4458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=96
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_13"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_35
   Duration=0.100000
   InputLinks(0)=(DrawY=149,OverrideDelta=14)
   InputLinks(1)=(DrawY=170,OverrideDelta=35)
   InputLinks(2)=(DrawY=191,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_14'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_20',InputLinkIdx=1)),DrawY=154,OverrideDelta=19)
   OutputLinks(1)=(DrawY=186,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4244,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4296
   ObjPosY=112
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_35"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_14
   InputLinks(0)=(DrawY=133,OverrideDelta=14)
   InputLinks(1)=(DrawY=154,OverrideDelta=35)
   InputLinks(2)=(DrawY=175,OverrideDelta=56)
   OutputLinks(0)=(DrawY=154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_360',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_399'),DrawX=-4106,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4055,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4006,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4144
   ObjPosY=96
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_14"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_17
   InputLinks(0)=(DrawY=133,OverrideDelta=14)
   InputLinks(1)=(DrawY=154,OverrideDelta=35)
   InputLinks(2)=(DrawY=175,OverrideDelta=56)
   OutputLinks(0)=(DrawY=154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_362',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_401'),DrawX=-3338,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3287,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3238,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3376
   ObjPosY=96
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_17"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_41
   Duration=0.100000
   InputLinks(0)=(DrawY=149,OverrideDelta=14)
   InputLinks(1)=(DrawY=170,OverrideDelta=35)
   InputLinks(2)=(DrawY=191,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_17'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_21',InputLinkIdx=1)),DrawY=154,OverrideDelta=19)
   OutputLinks(1)=(DrawY=186,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3476,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3528
   ObjPosY=112
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_41"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_18
   InputLinks(0)=(DrawY=133,OverrideDelta=14)
   InputLinks(1)=(DrawY=154,OverrideDelta=35)
   InputLinks(2)=(DrawY=175,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_41')),DrawY=154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_362',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_401'),DrawX=-3714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3752
   ObjPosY=96
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_18"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_19
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(DrawY=410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_359',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_400'),DrawX=-3722,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3671,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3622,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3760
   ObjPosY=352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_19"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_42
   Duration=0.100000
   InputLinks(0)=(DrawY=405,OverrideDelta=14)
   InputLinks(1)=(DrawY=426,OverrideDelta=35)
   InputLinks(2)=(DrawY=447,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_19'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_18',InputLinkIdx=1)),DrawY=410,OverrideDelta=19)
   OutputLinks(1)=(DrawY=442,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3860,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=368
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_42"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_20
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_42')),DrawY=410,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_359',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_400'),DrawX=-4098,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4047,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3998,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4136
   ObjPosY=352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_20"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_21
   InputLinks(0)=(DrawY=397,OverrideDelta=14)
   InputLinks(1)=(DrawY=418,OverrideDelta=35)
   InputLinks(2)=(DrawY=439,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_56')),DrawY=418,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_363',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_402'),DrawX=-3354,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3303,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3254,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3392
   ObjPosY=360
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_21"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_56
   Duration=0.100000
   InputLinks(0)=(DrawY=389,OverrideDelta=14)
   InputLinks(1)=(DrawY=410,OverrideDelta=35)
   InputLinks(2)=(DrawY=431,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_22'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_8',InputLinkIdx=1)),DrawY=394,OverrideDelta=19)
   OutputLinks(1)=(DrawY=426,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3116,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=352
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_56"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_22
   InputLinks(0)=(DrawY=397,OverrideDelta=14)
   InputLinks(1)=(DrawY=418,OverrideDelta=35)
   InputLinks(2)=(DrawY=439,OverrideDelta=56)
   OutputLinks(0)=(DrawY=418,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_363',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_402'),DrawX=-2978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2927,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2878,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3016
   ObjPosY=360
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_22"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_8
   InputLinks(0)=(DrawY=141,OverrideDelta=14)
   InputLinks(1)=(DrawY=162,OverrideDelta=35)
   InputLinks(2)=(DrawY=183,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_29')),DrawY=162,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_364',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_403'),DrawX=-2962,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2911,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2862,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3000
   ObjPosY=104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_8"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_29
   Duration=0.100000
   InputLinks(0)=(DrawY=157,OverrideDelta=14)
   InputLinks(1)=(DrawY=178,OverrideDelta=35)
   InputLinks(2)=(DrawY=199,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_7'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_37')),DrawY=162,OverrideDelta=19)
   OutputLinks(1)=(DrawY=194,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2724,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2776
   ObjPosY=120
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_29"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_7
   InputLinks(0)=(DrawY=141,OverrideDelta=14)
   InputLinks(1)=(DrawY=162,OverrideDelta=35)
   InputLinks(2)=(DrawY=183,OverrideDelta=56)
   OutputLinks(0)=(DrawY=162,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_364',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_403'),DrawX=-2586,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2535,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2486,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2624
   ObjPosY=104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_7"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_357
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5400
   ObjPosY=480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_357"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_358
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5024
   ObjPosY=256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_358"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_361
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4648
   ObjPosY=520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_361"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_360
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_360"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_359
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_359"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_362
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3504
   ObjPosY=264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_362"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_363
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3144
   ObjPosY=480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_363"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_364
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2744
   ObjPosY=288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_364"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_385
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9648
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_385"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_386
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9552
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_386"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_387
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_387"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_388
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9352
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_388"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_389
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_389"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_390
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_390"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_391
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9048
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_391"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_392
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_392"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_393
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8848
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_393"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_394
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_394"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_375
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_375"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_376
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_376"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_377
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_377"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_378
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_378"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_379
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7736
   ObjPosY=560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_379"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_380
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7344
   ObjPosY=304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_380"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_381
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_381"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_382
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6544
   ObjPosY=288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_382"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_383
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6160
   ObjPosY=560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_383"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_384
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5776
   ObjPosY=264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_384"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_37
   EventName="rave_1"
   InputLinks(0)=(DrawY=354,OverrideDelta=11)
   OutputLinks(0)=(DrawY=354,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2329,OverrideDelta=79)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2440
   ObjPosY=320
   ObjComment="Rave_1"
   DrawWidth=223
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_37"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_403
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2744
   ObjPosY=368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_403"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_402
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3144
   ObjPosY=552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_402"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_401
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3512
   ObjPosY=344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_401"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_400
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_400"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_399
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4272
   ObjPosY=344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_399"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_398
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4640
   ObjPosY=600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_398"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_397
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5016
   ObjPosY=336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_397"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_396
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5400
   ObjPosY=560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_396"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_25
   EventName="rave_1"
   InputLinks(0)=(DrawY=-254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8833,OverrideDelta=79)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8944
   ObjPosY=-288
   ObjComment="Rave_1"
   DrawWidth=223
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_25"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Lightning_Light_2"
   MaxWidth=232
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=3586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9596,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=3520
   ObjComment="Lightning_Light_2"
   DrawWidth=136
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_38
   Duration=1.500000
   InputLinks(0)=(DrawY=3397,OverrideDelta=14)
   InputLinks(1)=(DrawY=3418,OverrideDelta=35)
   InputLinks(2)=(DrawY=3439,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25',InputLinkIdx=1)),DrawY=3402,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3434,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9316,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9368
   ObjPosY=3360
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_38"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=3581,OverrideDelta=14)
   InputLinks(1)=(DrawY=3602,OverrideDelta=35)
   InputLinks(2)=(DrawY=3623,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_38')),DrawY=3602,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148'),DrawX=-9362,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9311,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9262,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=3544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_41
   EventName="Lightning_Light_2"
   InputLinks(0)=(DrawY=3186,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3186,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8382,OverrideDelta=114)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8528
   ObjPosY=3152
   ObjComment="Lightning_Light_2"
   DrawWidth=293
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_41"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_30
   EventName="Lightning_Light_3"
   InputLinks(0)=(DrawY=3634,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3634,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8462,OverrideDelta=114)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=3600
   ObjComment="Lightning_Light_3"
   DrawWidth=293
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_30"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=541
   SizeY=508
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=1080
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=549
   SizeY=530
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=1648
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_12
   SizeX=525
   SizeY=500
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=2240
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_12"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_13
   SizeX=537
   SizeY=478
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=2752
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_13"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_11
   SizeX=539
   SizeY=470
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8736
   ObjPosY=3240
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_11"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_14
   SizeX=166
   SizeY=242
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-8288
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_14"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=DominantDirectionalLight'KF-MONSTERBALL.TheWorld:PersistentLevel.DominantDirectionalLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=3264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bLooping=True
   InputLinks(0)=(DrawY=-1178,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1156,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1134,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1112,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1090,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1162,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1106,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-6044,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),LinkDesc="Hans",MinVars=0,DrawX=-5996,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6096
   ObjPosY=-1216
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="DJ_Hans",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4.InterpTrackAnimControl_2'
      GroupName="Hans"
      GroupColor=(B=233,G=0,R=30,A=255)
      GroupAnimSets(0)=AnimSet'HALLOWEEN_ZED_Hans_ANIM.MMMAP_anim'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=26.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=26.000000
   BakeAndPruneStatus(0)=(AnimSetName="HALLOWEEN_ZED_Hans_ANIM.MMMAP_anim")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6096
   ObjPosY=-1016
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=SkeletalMeshActor'KF-MONSTERBALL.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-1032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_20
   Duration=10.000000
   InputLinks(0)=(DrawY=-7587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7545,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-7582,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7550,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9516,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9568
   ObjPosY=-7624
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_20"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=-4632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_269
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7048
   ObjPosY=-4256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_269"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Dynamic_Change"
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_8')),DrawY=-4766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8174,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8288
   ObjPosY=-4832
   ObjComment="Dynamic_Change"
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=2001
   SizeY=2280
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8352
   ObjPosY=-5488
   ObjComment="Fountain"
   DrawWidth=2001
   DrawHeight=2280
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   InputLinks(0)=(DrawY=-5402,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5380,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5358,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5336,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5314,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5386,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5330,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=-7045,OverrideDelta=36)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_406'),LinkDesc="Blood",MinVars=0,DrawX=-6996,OverrideDelta=83)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-5440
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_9
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.000000,Y=0.000000,Z=32.000015),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackMove_0'
      GroupName="Blood"
      GroupColor=(B=0,G=186,R=151,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=3.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_406
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_109'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7008
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_406"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_22
   InputLinks(0)=(DrawY=-4330,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4308,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4286,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4264,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4242,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4314,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4258,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_26'),DrawX=-6519,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_409'),LinkDesc="Lights",MinVars=0,DrawX=-6468,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-4368
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_22"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_26
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_26.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-4192
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_26"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_409
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-4192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_409"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_27
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_27.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_27.InterpGroup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-3928
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_27"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_27
   InputLinks(0)=(DrawY=-4066,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4044,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4022,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4000,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3978,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4050,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3994,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_27'),DrawX=-6519,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_417'),LinkDesc="Lights",MinVars=0,DrawX=-6468,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-4104
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_27"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_40
   InputLinks(0)=(DrawY=-5394,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5372,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5350,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5328,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5306,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5378,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5322,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_40'),DrawX=-6535,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_418'),LinkDesc="Lights",MinVars=0,DrawX=-6484,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-5432
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_40"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_40
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_40.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_40.InterpGroup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-5256
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_40"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_42
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_42.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_42.InterpGroup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-5000
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_42"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_42
   InputLinks(0)=(DrawY=-5138,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5116,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5094,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5072,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5050,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5122,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5066,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_42'),DrawX=-6527,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_419'),LinkDesc="Lights",MinVars=0,DrawX=-6476,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-5176
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_42"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_43
   InputLinks(0)=(DrawY=-4874,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4852,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4830,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4808,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4786,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4858,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4802,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_43'),DrawX=-6519,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_420'),LinkDesc="Lights",MinVars=0,DrawX=-6468,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-4912
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_43"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_43
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_43.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_43.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_43.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-4736
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_43"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_44
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_44.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_44.InterpGroup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-4472
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_44"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_44
   InputLinks(0)=(DrawY=-4610,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4588,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4566,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4544,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4522,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4594,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4538,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_44'),DrawX=-6511,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_427'),LinkDesc="Lights",MinVars=0,DrawX=-6460,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6560
   ObjPosY=-4648
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_44"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_50
   InputLinks(0)=(DrawY=-3754,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3732,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3710,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3688,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3666,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3738,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3682,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_50'),DrawX=-6535,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_428'),LinkDesc="Lights",MinVars=0,DrawX=-6484,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-3792
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_50"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_50
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_50.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_50.InterpGroup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-3616
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_50"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_10
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.645555,Y=1.000000,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1.000000,Y=0.030257,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Lights"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-3360
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   InputLinks(0)=(DrawY=-3498,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3476,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3454,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3432,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3410,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3482,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3426,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=-6527,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_435'),LinkDesc="Lights",MinVars=0,DrawX=-6476,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-3536
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_417
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6496
   ObjPosY=-3928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_417"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_418
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=-5256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_418"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_419
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-5000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_419"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_420
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6504
   ObjPosY=-4736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_420"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_427
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6496
   ObjPosY=-4472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_427"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_428
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_71'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=-3616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_428"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_435
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6472
   ObjPosY=-3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_435"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_27
   Duration=2.000000
   InputLinks(0)=(DrawY=-4699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4657,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1)),DrawY=-4694,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4662,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7564,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7616
   ObjPosY=-4736
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_27"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=1057
   SizeY=930
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-1304
   ObjComment="DJ"
   DrawWidth=1057
   DrawHeight=930
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_5
   MaxWidth=248
   OutputLinks(0)=(DrawY=-684,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41')),DrawY=-664,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-6405,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6344,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-6263,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6448
   ObjPosY=-752
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_5"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_61
   InputLinks(0)=(DrawY=-683,OverrideDelta=14)
   InputLinks(1)=(DrawY=-662,OverrideDelta=35)
   InputLinks(2)=(DrawY=-641,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2)),DrawY=-662,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_318'),DrawX=-5690,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5639,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5590,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5728
   ObjPosY=-720
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_61"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
   InputLinks(0)=(DrawY=-675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-633,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_25')),DrawY=-654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_289'),DrawX=-6130,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6079,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6030,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6168
   ObjPosY=-712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_41"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_289
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6184
   ObjPosY=-544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_289"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_25
   InputLinks(0)=(DrawY=-675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-633,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_61')),DrawY=-670,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-638,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5892,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-712
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_25"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_318
   ObjValue=SkeletalMeshActor'KF-MONSTERBALL.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_318"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_28
   Duration=30.000000
   InputLinks(0)=(DrawY=2229,OverrideDelta=14)
   InputLinks(1)=(DrawY=2250,OverrideDelta=35)
   InputLinks(2)=(DrawY=2271,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_3')),DrawY=2234,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2266,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9548,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9600
   ObjPosY=2192
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_28"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=PointLight'KF-MONSTERBALL.TheWorld:PersistentLevel.PointLight_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7920
   ObjPosY=-9256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=MaterialInstanceActor'KF-MONSTERBALL.TheWorld:PersistentLevel.MaterialInstanceActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7816
   ObjPosY=-9264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8032
   ObjPosY=-9256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=SkyLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SkyLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8120
   ObjPosY=-9248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=DominantDirectionalLight'KF-MONSTERBALL.TheWorld:PersistentLevel.DominantDirectionalLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-9248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-9248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=ExponentialHeightFog'KF-MONSTERBALL.TheWorld:PersistentLevel.ExponentialHeightFog_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=-9264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_12
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="HeightFogComponent0.OppositeLightColor"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=0.212044,Y=0.280124,Z=0.425905),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=0.409826,Y=0.054592,Z=0.019918),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="OppositeLightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_1
         PropertyName="HeightFogComponent0.LightInscatteringColor"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=0.147998,Y=0.238828,Z=0.425905),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=1.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightInscatteringColor"
         Name="InterpTrackColorProp_1"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_0.InterpTrackColorProp_0'
      InterpTracks(1)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_0.InterpTrackColorProp_1'
      GroupName="Fog"
      GroupColor=(B=105,G=213,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=0.394083,Y=0.592438,Z=0.796917),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=1.000000,Y=0.060032,Z=0.019918),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_1.InterpTrackColorProp_0'
      GroupName="Light"
      GroupColor=(B=231,G=30,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="DominantDirectionalLightComponent0.LightColor"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=0.297653,Y=0.547993,Z=0.796917),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=0.481952,Y=0.119264,Z=0.044553),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2.InterpTrackColorProp_0'
      GroupName="DominantDir"
      GroupColor=(B=159,G=179,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_1
         PropertyName="SkyLightComponent0.LightColor"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=0.197516,Y=0.493616,Z=0.796917),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=0.843370,Y=0.499505,Z=0.447871),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         bDisableTrack=True
         Name="InterpTrackColorProp_1"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_3.InterpTrackColorProp_1'
      GroupName="SkyLight"
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=0.453456,Y=0.708298,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=0.744530,Y=0.127530,Z=0.108711),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_4.InterpTrackColorProp_0'
      GroupName="Ball_Room_Light_Spotlight"
      GroupColor=(B=187,G=0,R=151,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_1
         PropertyName="PointLightComponent0.LightColor"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=0.453456,Y=0.708298,Z=1.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=0.618686,Y=0.044553,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_1"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_5.InterpTrackColorProp_1'
      GroupName="Ball_Room_PointLight"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackVectorMaterialParam Name=InterpTrackVectorMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_MonsterBall_THREE_MAT.dome.ENV_MonsterBall_Dome_Glass_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-MONSTERBALL.TheWorld:PersistentLevel.StaticMeshActor_1602.StaticMeshComponent_210')))
         ParamName="Scalar_Glow_color"
         VectorTrack=(Points=((InVal=5.000000,OutVal=(X=1.002211,Y=0.997249,Z=0.997250),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=9.967286,Y=0.500113,Z=0.500113),InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackVectorMaterialParam_0"
         ObjectArchetype=InterpTrackVectorMaterialParam'Engine.Default__InterpTrackVectorMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackVectorMaterialParam'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_8.InterpTrackVectorMaterialParam_0'
      GroupName="dome"
      GroupColor=(B=0,G=203,R=126,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1200.599976
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_3'
   InterpGroups(4)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_4'
   InterpGroups(5)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_5'
   InterpGroups(6)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1200.599976
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8456
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   InputLinks(0)=(DrawY=-9442,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9420,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9398,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9376,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9354,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9426,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9370,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=-8353,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204'),LinkDesc="Fog",MinVars=0,DrawX=-8309,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77'),LinkDesc="Light",MinVars=0,DrawX=-8265,OverrideDelta=103)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_169'),LinkDesc="DominantDir",MinVars=0,DrawX=-8203,OverrideDelta=151)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170'),LinkDesc="SkyLight",MinVars=0,DrawX=-8128,OverrideDelta=228)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47'),LinkDesc="Ball_Room_Light_Spotlight",MinVars=0,DrawX=-8013,OverrideDelta=300)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Ball_Room_PointLight",MinVars=0,DrawX=-7872,OverrideDelta=458)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),LinkDesc="dome",MinVars=0,DrawX=-7785,OverrideDelta=582)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-9480
   DrawWidth=633
   DrawHeight=173
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_34
   InputLinks(0)=(DrawY=-9531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9489,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_42'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=-9526,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9494,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8924,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8976
   ObjPosY=-9568
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_34"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_36
   InputLinks(0)=(DrawY=-9211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9169,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_42'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=-9206,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-9174,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8924,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8976
   ObjPosY=-9248
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_36"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_42
   EventName="Dynamic_Change"
   InputLinks(0)=(DrawY=-8782,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8782,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8119,OverrideDelta=113)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-8816
   ObjComment="Dynamic_Change"
   DrawWidth=290
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_42"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_0
   IntValue=11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-8848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_0"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_1
   ValueB=1
   InputLinks(0)=(DrawY=-8950,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-8994,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-8972,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_11')),DrawY=-8950,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-8928,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-8906,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_0'),DrawX=-9423,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_7'),DrawX=-9398,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-9032
   ObjComment="Long"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_1"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_3
   ValueB=1
   InputLinks(0)=(DrawY=-9230,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-9274,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9252,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_10')),DrawY=-9230,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-9208,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9186,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_4'),DrawX=-9423,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_7'),DrawX=-9398,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-9312
   ObjComment="Medium"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_3"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_4
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9472
   ObjPosY=-9128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_4"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_16
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-9424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_16"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_12
   ValueB=1
   InputLinks(0)=(DrawY=-9526,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-9570,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9548,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_9')),DrawY=-9526,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-9504,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9482,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_16'),DrawX=-9415,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_7'),DrawX=-9390,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9448
   ObjPosY=-9608
   ObjComment="Short"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_12"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_7
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_12'),(LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_3'),(LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_1'),(LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_5')),DrawY=-9396,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-9376,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-9773,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_7'),DrawX=-9712,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9631,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9816
   ObjPosY=-9464
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_7"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_6
   VarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9832
   ObjPosY=-9080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_6"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_7
   VarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9736
   ObjPosY=-9152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_7"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_37
   InputLinks(0)=(DrawY=-8923,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8902,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8881,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_42'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=-8918,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8886,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8932,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-8960
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_37"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_9
   ValueB=1
   InputLinks(0)=(DrawY=-9502,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-9546,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9524,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_34')),DrawY=-9502,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-9480,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9458,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_13'),DrawX=-9191,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-9166,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-9584
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_9"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_10
   ValueB=1
   InputLinks(0)=(DrawY=-9206,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-9250,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9228,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_36')),DrawY=-9206,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-9184,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9162,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_12'),DrawX=-9199,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-9174,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-9288
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_10"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_11
   ValueB=1
   InputLinks(0)=(DrawY=-8926,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-8970,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-8948,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_37')),DrawY=-8926,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-8904,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-8882,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_11'),DrawX=-9199,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-9174,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-9008
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_11"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_11
   IntValue=7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9264
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_11"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_12
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-9104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_12"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_13
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_13"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="Benchmark"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_42'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=-8734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8826,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-8800
   ObjComment="Benchmark"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_14
   EventName="Benchmark"
   InputLinks(0)=(DrawY=-9118,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7396,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7272
   ObjPosY=-9152
   ObjComment="Benchmark"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_14"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_345
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-9056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_345"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_36
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Wolf_Howl_Single'
   InputLinks(0)=(DrawY=-9054,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9054,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_345'),DrawX=-8256,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8304
   ObjPosY=-9088
   ObjComment="Down"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_36"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqAct_BloodRain Name=KFSeqAct_BloodRain_2
   InputLinks(0)=(DrawY=1700,OverrideDelta=13)
   InputLinks(1)=(DrawY=1720,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_346',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_347',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_348',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_349',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_350',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_351',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_352',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_353',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_354',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_355',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_365',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_395',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_404',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_405',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_407',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_408',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_410',SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_411'),DrawX=-4928,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5128
   ObjPosY=1664
   DrawWidth=400
   DrawHeight=101
   Name="KFSeqAct_BloodRain_2"
   ObjectArchetype=KFSeqAct_BloodRain'kfgamecontent.Default__KFSeqAct_BloodRain'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=1744
   SizeY=937
   bDrawBox=True
   bTileFill=True
   BorderColor=(B=0,G=0,R=204,A=255)
   FillColor=(B=135,G=135,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2848
   ObjPosY=-4864
   ObjComment="Pitfall"
   DrawWidth=1744
   DrawHeight=937
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_10
   MaxWidth=136
   OutputLinks(0)=(DrawY=-4683,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4662,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4641,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2704
   ObjPosY=-4752
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_10"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_13
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-4622,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4622,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-2246,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2304
   ObjPosY=-4656
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_13"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=BlockingVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.BlockingVolume_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2280
   ObjPosY=-4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_1
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_14')),DrawY=-4228,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4208,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2701,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2640,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-2559,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2744
   ObjPosY=-4296
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_1"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_4
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_13')),DrawY=-4476,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_13')),DrawY=-4456,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2709,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2648,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-2567,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=-4544
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_4"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_14
   CollisionType=COLLIDE_BlockAllButWeapons
   InputLinks(0)=(DrawY=-4238,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4238,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-2406,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2464
   ObjPosY=-4272
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_14"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_6
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-4732,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3'),(LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-4712,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2037,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1976,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-1895,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-4800
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_6"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   InputLinks(0)=(DrawY=-4770,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4748,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4726,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4704,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4682,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4754,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4698,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=-1641,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),LinkDesc="Platform",MinVars=0,DrawX=-1582,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),LinkDesc="P3",MinVars=0,DrawX=-1531,OverrideDelta=133)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83'),LinkDesc="P4",MinVars=0,DrawX=-1499,OverrideDelta=165)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1672
   ObjPosY=-4808
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=8.000000,Y=-0.000008,Z=-0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=84.375000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackMove_0'
      GroupName="Platform"
      GroupColor=(B=88,G=220,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=8.000000,Y=-0.000008,Z=-0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=84.375000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackMove_2'
      GroupName="P3"
      GroupColor=(B=105,G=213,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=8.000000,Y=-0.000008,Z=-0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.000000,Z=84.375000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_4.InterpTrackMove_3'
      GroupName="P4"
      GroupColor=(B=206,G=0,R=123,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=2.000000
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3'
   InterpGroups(2)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1672
   ObjPosY=-4608
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=-4584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   InputLinks(0)=(DrawY=-4338,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4316,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4294,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4272,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4250,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4322,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4266,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=-1606,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),LinkDesc="Name",MinVars=0,DrawX=-1556,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1656
   ObjPosY=-4376
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_1.InterpTrackMove_1'
      GroupName="Name"
      GroupColor=(B=0,G=218,R=92,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1656
   ObjPosY=-4176
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1556
   ObjPosY=-4219
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1528
   ObjPosY=-4584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_110'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1480
   ObjPosY=-4584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Play_ENV_MonsterBall_Metal_Door_Opening'
   InputLinks(0)=(DrawY=-4110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147'),DrawX=-1776,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1824
   ObjPosY=-4144
   ObjComment="Metal"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_2
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0'),(LinkedOp=SeqAct_Interp'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=1)),DrawY=-4428,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4408,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2077,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2016,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-1935,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2120
   ObjPosY=-4496
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_2"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=TargetPoint'KF-MONSTERBALL.TheWorld:PersistentLevel.TargetPoint_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=-4056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_16
   SizeX=206
   SizeY=243
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1896
   ObjPosY=-4184
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_16"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=-7840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-944
   ObjPosY=-7824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_202
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-960
   ObjPosY=-7192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_202"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_207
   ObjValue=KFMGVolume_SwingHit'KF-MONSTERBALL.TheWorld:PersistentLevel.KFMGVolume_SwingHit_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-864
   ObjPosY=-7192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_207"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7304
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_189
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_189"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_192"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_302
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7000
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_302"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_303
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6904
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_303"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_346
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_346"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_347
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5496
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_347"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_348
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5392
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_348"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_349
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5296
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_349"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_350
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_350"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_351
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5096
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_351"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_352
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4992
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_352"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_353
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4896
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_353"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_354
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_354"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_355
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_355"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_365
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_365"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_395
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4504
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_395"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_404
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_404"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_405
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4304
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_405"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_407
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4200
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_407"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_408
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4104
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_408"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_410
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4000
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_410"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_411
   ObjValue=KFBloodRainVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFBloodRainVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3904
   ObjPosY=1944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_411"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=207
   SizeY=85
   BorderWidth=4
   BorderColor=(B=255,G=86,R=0,A=255)
   FillColor=(B=255,G=104,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-7664
   ObjComment="AUDIO"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=KFSeqAct_UnlockAchievement Name=KFSeqAct_UnlockAchievement_0
   AchievementId=228
   InputLinks(0)=(DrawY=-4806,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5432
   ObjPosY=-4840
   DrawWidth=143
   DrawHeight=45
   Name="KFSeqAct_UnlockAchievement_0"
   ObjectArchetype=KFSeqAct_UnlockAchievement'KFGame.Default__KFSeqAct_UnlockAchievement'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_15
   InputLinks(0)=(DrawY=-403,OverrideDelta=14)
   InputLinks(1)=(DrawY=-382,OverrideDelta=35)
   InputLinks(2)=(DrawY=-361,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-382,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_304'),DrawX=-8154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_15"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_304
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_304"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_14
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49',InputLinkIdx=1)),DrawY=-235,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-214,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-193,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=-304
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_14"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
   InputLinks(0)=(DrawY=-163,OverrideDelta=14)
   InputLinks(1)=(DrawY=-142,OverrideDelta=35)
   InputLinks(2)=(DrawY=-121,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_30')),DrawY=-142,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_305'),DrawX=-8186,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8135,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8086,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8224
   ObjPosY=-200
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_49"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_305
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-64
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_305"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
   InputLinks(0)=(DrawY=-187,OverrideDelta=14)
   InputLinks(1)=(DrawY=-166,OverrideDelta=35)
   InputLinks(2)=(DrawY=-145,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_31')),DrawY=-166,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=-7706,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7655,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7606,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7744
   ObjPosY=-224
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_48"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_0
   InputLinks(0)=(DrawY=-411,OverrideDelta=14)
   InputLinks(1)=(DrawY=-390,OverrideDelta=35)
   InputLinks(2)=(DrawY=-369,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-390,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-7714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_0"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_30
   Duration=0.500000
   InputLinks(0)=(DrawY=-251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-209,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_48'),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0',InputLinkIdx=1)),DrawY=-246,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-214,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7916,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-288
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_30"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_31
   Duration=0.500000
   InputLinks(0)=(DrawY=-539,OverrideDelta=14)
   InputLinks(1)=(DrawY=-518,OverrideDelta=35)
   InputLinks(2)=(DrawY=-497,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_15')),DrawY=-534,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-502,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8400
   ObjPosY=-576
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_31"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_24
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_MonsterBall.Set_State_MonsterBall_Rain'
   InputLinks(0)=(DrawY=-7622,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9032,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-7656
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_24"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_52
   InputLinks(0)=(DrawY=-8355,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8334,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8313,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8334,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_306'),DrawX=9174,OverrideDelta=16)
   VariableLinks(1)=(DrawX=9225,OverrideDelta=76)
   EventLinks(0)=(DrawX=9274,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9136
   ObjPosY=-8392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_52"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_306
   ObjValue=InterpActor'KF-MONSTERBALL.TheWorld:PersistentLevel.InterpActor_112'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9144
   ObjPosY=-8264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_306"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_307
   ObjValue=KFSpawnVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.KFSpawnVolume_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-3384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_307"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_1
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6384
   ObjPosY=1584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_1"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_10
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_10"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_9
   IntValue=7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=2184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_9"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_0
   ValueB=1
   InputLinks(0)=(DrawY=2066,OverrideDelta=59)
   OutputLinks(0)=(DrawY=2022,OverrideDelta=15)
   OutputLinks(1)=(DrawY=2044,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_15')),DrawY=2066,OverrideDelta=59)
   OutputLinks(3)=(DrawY=2088,OverrideDelta=81)
   OutputLinks(4)=(DrawY=2110,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_9'),DrawX=-6279,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_14'),DrawX=-6254,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=1984
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_0"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_4
   ValueB=1
   InputLinks(0)=(DrawY=1786,OverrideDelta=59)
   OutputLinks(0)=(DrawY=1742,OverrideDelta=15)
   OutputLinks(1)=(DrawY=1764,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_19')),DrawY=1786,OverrideDelta=59)
   OutputLinks(3)=(DrawY=1808,OverrideDelta=81)
   OutputLinks(4)=(DrawY=1830,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_10'),DrawX=-6279,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_14'),DrawX=-6254,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=1704
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_4"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_2
   ValueB=1
   InputLinks(0)=(DrawY=1490,OverrideDelta=59)
   OutputLinks(0)=(DrawY=1446,OverrideDelta=15)
   OutputLinks(1)=(DrawY=1468,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_21')),DrawY=1490,OverrideDelta=59)
   OutputLinks(3)=(DrawY=1512,OverrideDelta=81)
   OutputLinks(4)=(DrawY=1534,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-6271,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_14'),DrawX=-6246,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6304
   ObjPosY=1408
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_2"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_15
   Duration=12.000000
   InputLinks(0)=(DrawY=2069,OverrideDelta=14)
   InputLinks(1)=(DrawY=2090,OverrideDelta=35)
   InputLinks(2)=(DrawY=2111,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_BloodRain'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_BloodRain_2')),DrawY=2074,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2106,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6012,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6064
   ObjPosY=2032
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_15"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_15
   VarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=1840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_15"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_14
   VarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=1912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_14"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_8'),(LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_7'),(LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_6')),DrawY=1596,OverrideDelta=13)
   OutputLinks(1)=(DrawY=1616,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_14'),DrawX=-6849,OverrideDelta=20)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_15'),DrawX=-6788,OverrideDelta=90)
   VariableLinks(2)=(DrawX=-6707,OverrideDelta=143)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=1528
   DrawWidth=179
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_0"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_8
   ValueB=1
   InputLinks(0)=(DrawY=1466,OverrideDelta=59)
   OutputLinks(0)=(DrawY=1422,OverrideDelta=15)
   OutputLinks(1)=(DrawY=1444,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_2')),DrawY=1466,OverrideDelta=59)
   OutputLinks(3)=(DrawY=1488,OverrideDelta=81)
   OutputLinks(4)=(DrawY=1510,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_2'),DrawX=-6495,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_15'),DrawX=-6470,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6528
   ObjPosY=1384
   ObjComment="Short"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_8"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_2
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=1568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_2"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_3
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6552
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_3"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_7
   ValueB=1
   InputLinks(0)=(DrawY=1762,OverrideDelta=59)
   OutputLinks(0)=(DrawY=1718,OverrideDelta=15)
   OutputLinks(1)=(DrawY=1740,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_4')),DrawY=1762,OverrideDelta=59)
   OutputLinks(3)=(DrawY=1784,OverrideDelta=81)
   OutputLinks(4)=(DrawY=1806,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_3'),DrawX=-6503,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_15'),DrawX=-6478,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=1680
   ObjComment="Medium"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_7"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_6
   ValueB=1
   InputLinks(0)=(DrawY=2042,OverrideDelta=59)
   OutputLinks(0)=(DrawY=1998,OverrideDelta=15)
   OutputLinks(1)=(DrawY=2020,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_0')),DrawY=2042,OverrideDelta=59)
   OutputLinks(3)=(DrawY=2064,OverrideDelta=81)
   OutputLinks(4)=(DrawY=2086,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_8'),DrawX=-6503,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_15'),DrawX=-6478,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=1960
   ObjComment="Long"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_6"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_8
   IntValue=11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=2144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_8"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_19
   Duration=12.000000
   InputLinks(0)=(DrawY=1781,OverrideDelta=14)
   InputLinks(1)=(DrawY=1802,OverrideDelta=35)
   InputLinks(2)=(DrawY=1823,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_BloodRain'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_BloodRain_2')),DrawY=1786,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1818,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6004,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=1744
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_19"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_21
   Duration=12.000000
   InputLinks(0)=(DrawY=1461,OverrideDelta=14)
   InputLinks(1)=(DrawY=1482,OverrideDelta=35)
   InputLinks(2)=(DrawY=1503,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_BloodRain'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_BloodRain_2')),DrawY=1466,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1498,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6004,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=1424
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_21"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=3204
   SizeY=1070
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6992
   ObjPosY=1296
   ObjComment="Persistant Blood"
   DrawWidth=3204
   DrawHeight=1070
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=1381
   SizeY=928
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=95,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-5520
   ObjComment="Music"
   DrawWidth=1381
   DrawHeight=928
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_5
   ValueB=1
   InputLinks(0)=(DrawY=-8430,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-8474,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-8452,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_25'),(LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=-8430,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-8408,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-8386,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_5'),DrawX=-9375,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-9350,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-8512
   ObjComment="Short"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_5"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_5
   IntValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-8304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_5"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=3981,OverrideDelta=14)
   InputLinks(1)=(DrawY=4002,OverrideDelta=35)
   InputLinks(2)=(DrawY=4023,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_13')),DrawY=4002,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179'),DrawX=-9362,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9311,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9262,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=3944
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_13
   Duration=1.500000
   InputLinks(0)=(DrawY=3797,OverrideDelta=14)
   InputLinks(1)=(DrawY=3818,OverrideDelta=35)
   InputLinks(2)=(DrawY=3839,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39',InputLinkIdx=1)),DrawY=3802,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3834,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9316,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9368
   ObjPosY=3760
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_13"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="Lightning_Light_3"
   MaxWidth=232
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39')),DrawY=4002,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9612,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9728
   ObjPosY=3936
   ObjComment="Lightning_Light_3"
   DrawWidth=136
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=3672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=SpotLight'KF-MONSTERBALL.TheWorld:PersistentLevel.SpotLight_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=Emitter'KF-MONSTERBALL.TheWorld:PersistentLevel.Emitter_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8904
   ObjPosY=-8288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-8427,ActivateDelay=9.250000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),DrawX=-8906,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8855,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8806,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8944
   ObjPosY=-8464
   ObjComment="Door Bats"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_8
   CollisionType=COLLIDE_BlockAllButWeapons
   InputLinks(0)=(DrawY=-3886,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3886,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),DrawX=-5518,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5576
   ObjPosY=-3920
   ObjComment="Pitfall Blocking Volume"
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_8"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=BlockingVolume'KF-MONSTERBALL.TheWorld:PersistentLevel.BlockingVolume_140'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-MONSTERBALL.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-3840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
