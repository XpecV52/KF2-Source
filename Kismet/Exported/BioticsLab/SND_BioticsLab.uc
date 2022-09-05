Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=-9771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9729,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=-9840
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_BioticsLab.WwiseDefaultBank_WW_ENV_BioticsLab'
   InputLinks(0)=(DrawY=-9702,OverrideDelta=11)
   InputLinks(1)=(DrawY=272,bHidden=True,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=-9702,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-9736
   DrawWidth=98
   DrawHeight=45
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=-9758,OverrideDelta=11)
   InputLinks(1)=(DrawY=211,bHidden=True,OverrideDelta=36)
   InputLinks(2)=(DrawY=233,bHidden=True,OverrideDelta=58)
   InputLinks(3)=(DrawY=255,bHidden=True,OverrideDelta=80)
   OutputLinks(0)=(DrawY=222,bHidden=True,OverrideDelta=47)
   VariableLinks(0)=(bHidden=True,DrawX=789,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-9792
   DrawWidth=154
   DrawHeight=45
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Security_Metal_Detector_Alarm'
   InputLinks(0)=(DrawY=-9750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-6720,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-9784
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="MetalDetectorRightActivated"
   bClientSideOnly=True
   MaxWidth=419
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=-9750,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6935,OverrideDelta=177)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-9816
   DrawWidth=229
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=Note'SND_BioticsLab.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-9704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=532
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-9840
   ObjComment="Metal Detector Alarm - Right"
   DrawWidth=532
   DrawHeight=236
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Security_Metal_Detector_Alarm'
   InputLinks(0)=(DrawY=-9454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9454,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-6712,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=-9488
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="MetalDetectorLeftActivated"
   bClientSideOnly=True
   MaxWidth=412
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-9470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6930,OverrideDelta=174)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-9536
   DrawWidth=226
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=Note'SND_BioticsLab.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-9407
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=532
   SizeY=253
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7160
   ObjPosY=-9560
   ObjComment="Metal Detector Alarm - Left"
   DrawWidth=532
   DrawHeight=253
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=1214
   SizeY=674
   bDrawBox=True
   BorderColor=(B=255,G=94,R=0,A=255)
   FillColor=(B=255,G=173,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6976
   ObjPosY=-8976
   ObjComment="Obj 4 - Operate and Control (Freezing Gas)"
   DrawWidth=1214
   DrawHeight=674
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_132
   Duration=3.000000
   InputLinks(0)=(DrawY=-8763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8721,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_112')),DrawY=-8758,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8726,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6084,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6136
   ObjPosY=-8800
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_132"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_20
   EventName="LeverPulled1"
   MaxWidth=199
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5'),(LinkedOp=SeqAct_Delay'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=-8774,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6845,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=-8840
   ObjComment="LeverPulled1"
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_20"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_112
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_BioticsLab.Play_ENV_Biotics_OBJ_FreezeGas_End'
   InputLinks(0)=(DrawY=-8782,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8782,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_742'),DrawX=-5888,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5936
   ObjPosY=-8816
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_112"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_BioticsLab.Play_ENV_Biotics_OBJ_FreezeGas_Begin'
   InputLinks(0)=(DrawY=-8846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_742'),DrawX=-6600,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-8880
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_742
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6400
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_742"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=0.500000
   InputLinks(0)=(DrawY=-8771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8729,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_132')),DrawY=-8766,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8734,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6412,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6464
   ObjPosY=-8808
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-8654,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8654,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192'),DrawX=-3520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-8688
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3544
   ObjPosY=-8760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_192"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_33
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-8806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8806,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192'),DrawX=-3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-8840
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_33"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=762
   SizeY=2831
   bDrawBox=True
   BorderColor=(B=255,G=94,R=0,A=255)
   FillColor=(B=255,G=173,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=-8960
   ObjComment="Obj 6 - Weld and Repair (Damaged Consoles)"
   DrawWidth=762
   DrawHeight=2831
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_36
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-8510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8510,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147'),DrawX=-3520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-8544
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_36"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_35
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-8358,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8358,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147'),DrawX=-3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-8392
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_35"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_38
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-8046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_309'),DrawX=-3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-8080
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_38"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_37
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-8198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_309'),DrawX=-3520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-8232
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_37"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_309
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-8152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_309"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_40
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-7902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7902,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_323'),DrawX=-3520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-7936
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_40"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_39
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-7750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_323'),DrawX=-3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-7784
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_39"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_323
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3544
   ObjPosY=-7856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_323"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_42
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-7430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7430,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_324'),DrawX=-3504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-7464
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_42"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_41
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-7606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_324'),DrawX=-3504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-7640
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_41"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_324
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3544
   ObjPosY=-7544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_324"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_27
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-7310,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7310,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148'),DrawX=-3504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-7344
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_27"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-7158,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7158,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148'),DrawX=-3496,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3544
   ObjPosY=-7192
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3528
   ObjPosY=-7256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3536
   ObjPosY=-6944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_28
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-6846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),DrawX=-3504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-6880
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_28"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_29
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-6998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6998,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),DrawX=-3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-7032
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_29"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3536
   ObjPosY=-6648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_30
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-3504,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-6584
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_30"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_43
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-6702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-6736
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_43"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_325
   ObjValue=TargetPoint'SND_BioticsLab.TheWorld:PersistentLevel.TargetPoint_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3544
   ObjPosY=-6328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_325"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_32
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Stop_ObjectiveMode_Repairables_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-6230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6230,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_325'),DrawX=-3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-6264
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_32"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Repairable_Broken_Electronics_LP'
   InputLinks(0)=(DrawY=-6382,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6382,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_325'),DrawX=-3520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-6416
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Repair5_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33')),DrawY=-8806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3860,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-8872
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="Repair5_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=-8654,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3858,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-8720
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_22
   EventName="Repair2_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_35')),DrawY=-8350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3858,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-8416
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_22"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_25
   EventName="Repair2_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=-8502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3860,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-8568
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_25"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="Repair9_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_37')),DrawY=-8198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3860,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-8264
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="Repair9_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_38')),DrawY=-8046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3858,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-8112
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_11
   EventName="Repair3_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_39')),DrawY=-7742,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3850,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3952
   ObjPosY=-7808
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_11"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_12
   EventName="Repair3_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_40')),DrawY=-7894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3852,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3952
   ObjPosY=-7960
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_12"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_13
   EventName="Repair4_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_41')),DrawY=-7590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3844,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-7656
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_13"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_14
   EventName="Repair4_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_42')),DrawY=-7438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3842,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-7504
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_14"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_15
   EventName="Repair6_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=-7142,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3842,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-7208
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_15"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_16
   EventName="Repair6_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_27')),DrawY=-7294,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3844,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-7360
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_16"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_17
   EventName="Repair0_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_29')),DrawY=-6990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3836,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-7056
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_17"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_18
   EventName="Repair0_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_28')),DrawY=-6838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3834,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-6904
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_18"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_19
   EventName="Repair8_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_30')),DrawY=-6534,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3834,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-6600
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_19"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_21
   EventName="Repair8_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_43')),DrawY=-6686,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3836,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-6752
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_21"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Repair7_Play"
   MaxWidth=200
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-6374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3844,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-6440
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Repair7_Stop"
   MaxWidth=204
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_32')),DrawY=-6222,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3842,OverrideDelta=70)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-6288
   DrawWidth=122
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
   EventName="PlayHold_1_VO_Complete"
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),DrawY=-8462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8594,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8736
   ObjPosY=-8528
   DrawWidth=162
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_31"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_32
   EventName="PlayHold_1_VO_75"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-8638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8625,OverrideDelta=87)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=-8704
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_32"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_33
   EventName="PlayHold_1_VO_50"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=-8814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8641,OverrideDelta=87)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8760
   ObjPosY=-8880
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_33"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_34
   EventName="PlayHold_1_VO_25"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),DrawY=-8998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8609,OverrideDelta=87)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-9064
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_34"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold1_25done'
   InputLinks(0)=(DrawY=-9022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8328,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=-9056
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold1_50done'
   InputLinks(0)=(DrawY=-8814,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8320,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8368
   ObjPosY=-8848
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold1_Completed'
   InputLinks(0)=(DrawY=-8462,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8272,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=-8496
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold1_80done'
   InputLinks(0)=(DrawY=-8646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8288,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-8680
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=768
   SizeY=795
   bDrawBox=True
   BorderColor=(B=255,G=94,R=0,A=255)
   FillColor=(B=255,G=173,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=-9112
   ObjComment="Obj 1 - Hold"
   DrawWidth=768
   DrawHeight=795
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=824
   SizeY=616
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9736
   ObjPosY=-9864
   ObjComment="Inital Audio Setup"
   DrawWidth=824
   DrawHeight=616
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_7
   EventName="PlayIntroVO"
   MaxWidth=195
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-9430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9495,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9592
   ObjPosY=-9496
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_7"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Opening_Intro'
   InputLinks(0)=(DrawY=-9430,ActivateDelay=2.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9264,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=-9464
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=768
   SizeY=795
   bDrawBox=True
   BorderColor=(B=255,G=94,R=0,A=255)
   FillColor=(B=255,G=173,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7888
   ObjPosY=-9096
   ObjComment="Obj 3 - Exterminate"
   DrawWidth=768
   DrawHeight=795
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_27
   EventName="PlayExterminateVO_25"
   MaxWidth=265
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-8974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7612,OverrideDelta=100)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7744
   ObjPosY=-9040
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_27"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate1_25ZedDead'
   InputLinks(0)=(DrawY=-8974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7408
   ObjPosY=-9008
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate1_50ZedDead'
   InputLinks(0)=(DrawY=-8806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7352,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-8840
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_28
   EventName="PlayExterminateVO_50"
   MaxWidth=265
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13')),DrawY=-8806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7604,OverrideDelta=100)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7736
   ObjPosY=-8872
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_28"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate1_80ZedDead'
   InputLinks(0)=(DrawY=-8638,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7352,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-8672
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_29
   EventName="PlayExterminateVO_75"
   MaxWidth=265
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14')),DrawY=-8638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7604,OverrideDelta=100)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7736
   ObjPosY=-8704
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_29"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate1_Completed'
   InputLinks(0)=(DrawY=-8478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7352,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-8512
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_23
   EventName="PlayExterminateVO_Complete"
   MaxWidth=310
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=-8478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7605,OverrideDelta=123)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=-8544
   DrawWidth=175
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_23"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object
