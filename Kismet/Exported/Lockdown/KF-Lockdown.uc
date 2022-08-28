Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-9747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9705,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-9618,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9567,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9518,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9656
   ObjPosY=-9784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_10
   SizeX=1974
   SizeY=1932
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9928
   ObjPosY=-9920
   ObjComment="Zed Spawners"
   Name="SequenceFrameWrapped_10"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_11
   SizeX=439
   SizeY=301
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9896
   ObjPosY=-9848
   ObjComment="MedLab"
   Name="SequenceFrameWrapped_11"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_12
   SizeX=441
   SizeY=557
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9896
   ObjPosY=-9520
   ObjComment="Server Room"
   Name="SequenceFrameWrapped_12"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-9411,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9390,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9369,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9390,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-9634,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9583,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9534,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9672
   ObjPosY=-9448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9640
   ObjPosY=-9304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-9147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=-9634,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9583,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9534,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9672
   ObjPosY=-9184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_34'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-9115,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9794,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9880
   ObjPosY=-9184
   ObjName="TriggerVolume_34 Touch"
   ObjComment="Lower Section"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_15
   SizeX=482
   SizeY=549
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-9848
   ObjComment="Lower Engineering"
   Name="SequenceFrameWrapped_15"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-9747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9705,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-9122,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9071,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9022,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-9784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-9632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-9499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=-9114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-9536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_16
   SizeX=480
   SizeY=817
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-9256
   ObjComment="Upper Engineering"
   Name="SequenceFrameWrapped_16"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-8651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8609,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8630,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-9114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-8688
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-8619,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8598,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8577,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9302,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-8688
   ObjName="TriggerVolume_7 Touch"
   ObjComment="Window"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-9139,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9118,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9097,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9118,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=-9114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-9176
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-8275,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8254,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8233,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8254,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),DrawX=-8154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-8312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_17
   SizeX=460
   SizeY=1006
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8904
   ObjPosY=-9848
   ObjComment="Cryolabs"
   Name="SequenceFrameWrapped_17"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-9747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9705,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47'),DrawX=-8610,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8559,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8510,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8648
   ObjPosY=-9784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_36'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=-9715,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9694,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9673,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8794,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-9784
   ObjName="TriggerVolume_36 Touch"
   ObjComment="Upper Entrance"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-9632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-9507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48'),DrawX=-8626,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8575,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8526,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8664
   ObjPosY=-9544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-9392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-8544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-9384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_36
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-9467,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9446,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9425,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9302,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-9536
   ObjName="TriggerVolume_2 Touch"
   ObjComment="Windows"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_36"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_37
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_37'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-9707,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9686,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9665,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9290,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9376
   ObjPosY=-9776
   ObjName="TriggerVolume_37 Touch"
   ObjComment="Turbines"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_37"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_39
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_39'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-9371,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9350,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9329,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9778,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9864
   ObjPosY=-9440
   ObjName="TriggerVolume_39 Touch"
   ObjComment="Upper Section"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_39"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_41
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_41'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-9723,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9702,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9681,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9786,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9872
   ObjPosY=-9792
   ObjName="TriggerVolume_41 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_41"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-8331,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8310,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8289,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8310,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-9122,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9071,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9022,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-8368
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-9027,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9006,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8985,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9006,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-8618,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8567,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8518,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8656
   ObjPosY=-9064
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_28'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=-8995,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8974,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8953,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8794,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-9064
   ObjName="TriggerVolume_28 Touch"
   ObjComment="Lower Entrance"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_27'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),DrawY=-9099,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9078,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9057,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9306,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=-9168
   ObjName="TriggerVolume_27 Touch"
   ObjComment="Core"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9656
   ObjPosY=-9040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-9640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_33'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23')),DrawY=-9715,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9694,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9673,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8306,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8392
   ObjPosY=-9784
   ObjName="TriggerVolume_33 Touch"
   ObjComment="Aquarium"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-9747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9705,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52'),DrawX=-8162,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8111,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8062,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-9784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9656
   ObjPosY=-9632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_13
   SizeX=414
   SizeY=288
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8416
   ObjPosY=-9848
   ObjComment="Aquarium"
   Name="SequenceFrameWrapped_13"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_14
   SizeX=426
   SizeY=534
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8416
   ObjPosY=-9520
   ObjComment="Cargo Transport"
   Name="SequenceFrameWrapped_14"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-9419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9377,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9398,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),DrawX=-8154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-9456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-9179,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9158,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9137,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9158,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),DrawX=-8154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-9216
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-9320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8176
   ObjPosY=-9064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_40'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-9147,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9126,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9105,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8298,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-9216
   ObjName="TriggerVolume_40 Touch"
   ObjComment="Main Corridor"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_35
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_42'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=-9395,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9374,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9353,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8298,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-9464
   ObjName="TriggerVolume_42 Touch"
   ObjComment="Consoles"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_35"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-8224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8648
   ObjPosY=-8920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_19
   SizeX=426
   SizeY=565
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8416
   ObjPosY=-8952
   ObjComment="Middle Corridor"
   Name="SequenceFrameWrapped_19"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=-8811,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8790,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8769,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8302,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-8880
   ObjName="TriggerVolume_1 Touch"
   ObjComment="MedLab Entrance"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-8811,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8790,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8769,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8790,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=-8170,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8119,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8070,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-8848
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-9475,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9454,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9433,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8798,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-9544
   ObjName="TriggerVolume_5 Touch"
   ObjComment="Aft Engines"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_20"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-9040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-8299,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8278,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8257,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9298,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-8368
   ObjName="TriggerVolume_14 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-9267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9225,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),DrawX=-8602,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8551,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8502,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8640
   ObjPosY=-9304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_40
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-9235,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9214,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9193,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8798,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-9304
   ObjName="TriggerVolume_4 Touch"
   ObjComment="Sleep Pods"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_40"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-9144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_42
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_43'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-8243,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8222,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8201,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8306,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8392
   ObjPosY=-8312
   ObjName="TriggerVolume_43 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_42"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=426
   SizeY=277
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8416
   ObjPosY=-8360
   ObjComment="Lower Corridor"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-8168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=-8547,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8526,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8505,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8302,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-8616
   ObjName="TriggerVolume_0 Touch"
   ObjComment="Checkpoint"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8176
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-8579,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8558,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8537,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8558,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=-8146,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8095,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8046,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-8616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-8907,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8886,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8865,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8886,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-9106,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9055,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9006,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-8944
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-LOCKDOWN.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-8875,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8854,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8833,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9302,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-8944
   ObjName="TriggerVolume_8 Touch"
   ObjComment="Monitor"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFSpawner'KF-LOCKDOWN.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-8776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-9376
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-9472
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-9664
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-9664
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6968
   ObjPosY=-9568
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-9376
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6968
   ObjPosY=-9472
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6968
   ObjPosY=-9664
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-9568
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-9472
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-9568
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_252
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6968
   ObjPosY=-9376
   ObjComment="Elevator Shaft"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_252"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_253
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-9112
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_253"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_254
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=-8840
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_254"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_255
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-9112
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_255"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_256
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-8928
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_256"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_257
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=-9112
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_257"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_258
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-8840
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_258"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_259
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-9016
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_259"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_260
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=-8928
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_260"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_261
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-9016
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_261"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_262
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-8928
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_262"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_263
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=-9016
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_263"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_264
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-8840
   ObjComment="Aquarium"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_264"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_265
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6960
   ObjPosY=-8480
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_265"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_266
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-8480
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_266"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_267
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-8480
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_267"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_268
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6960
   ObjPosY=-8384
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_268"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_269
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-8384
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_269"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_270
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-8384
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_270"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_271
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6960
   ObjPosY=-8288
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_271"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_272
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-8288
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_272"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_273
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-8288
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_273"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_274
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6960
   ObjPosY=-8192
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_274"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_275
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-8192
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_275"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_276
   ObjValue=KFPlayerStart'KF-LOCKDOWN.TheWorld:PersistentLevel.KFPlayerStart_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-8192
   ObjComment="Engineering"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_276"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-9395,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9374,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26',InputLinkIdx=1)),DrawY=-9353,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-9464
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=3
   IncrementAmount=0
   InputLinks(0)=(DrawY=-9398,OverrideDelta=19)
   InputLinks(1)=(DrawY=-9366,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=-9403,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),LinkDesc="Link 2",DrawY=-9382,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),LinkDesc="Link 3",DrawY=-9361,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7364,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7408
   ObjPosY=-9440
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-9211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9169,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-9190,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_266',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_267',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_268',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_269',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_270',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_271',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_272',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_273',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_274',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_275',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_276',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_257',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_255',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_253',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_259',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_256',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_254',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_258',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_252',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244'),DrawX=-7594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-9248
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-9795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_252',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246'),DrawX=-6874,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6823,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6774,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-9832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-9243,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9222,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9201,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9222,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_257',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_255',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_253',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_259',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_256',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_254',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_258',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264'),DrawX=-6874,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6823,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6774,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-9280
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-8611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8569,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_266',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_267',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_268',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_269',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_270',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_271',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_272',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_273',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_274',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_275',SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_276'),DrawX=-6882,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6831,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6782,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=-8648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_26
   SizeX=483
   SizeY=283
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-8416
   ObjComment="Engineering Access Point"
   Name="SequenceFrameWrapped_26"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=1229
   SizeY=1823
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7880
   ObjPosY=-9904
   ObjComment="Player Spawns"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5696
   ObjPosY=-9680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-9766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6457,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6552
   ObjPosY=-9832
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6224
   ObjPosY=-9680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-5664,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5728
   ObjPosY=-9784
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9766,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-9766,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-6200,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-9800
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=CameraActor'KF-LOCKDOWN.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-9552
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
      InterpTracks(0)=InterpTrackDirector'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.012680,OutVal=(X=1114.507813,Y=-19.335938,Z=194.278564),ArriveTangent=(X=164.863327,Y=-9.413940,Z=7.564977),LeaveTangent=(X=164.863327,Y=-9.413940,Z=7.564977),InterpMode=CIM_CurveAutoClamped),(InVal=10.044697,OutVal=(X=1662.073242,Y=-998.988281,Z=211.082825),ArriveTangent=(X=0.000000,Y=-31.773636,Z=7.188248),LeaveTangent=(X=0.000000,Y=-31.773636,Z=7.188248),InterpMode=CIM_CurveAutoClamped),(InVal=14.982365,OutVal=(X=425.866211,Y=-1067.465332,Z=333.219910),ArriveTangent=(X=0.000000,Y=-31.401680,Z=3.349357),LeaveTangent=(X=0.000000,Y=-31.401680,Z=3.349357),InterpMode=CIM_CurveAutoClamped),(InVal=20.077282,OutVal=(X=661.785156,Y=-1961.304688,Z=340.459961),ArriveTangent=(X=98.550766,Y=0.000000,Z=3.013544),LeaveTangent=(X=98.550766,Y=0.000000,Z=3.013544),InterpMode=CIM_CurveAutoClamped),(InVal=24.969234,OutVal=(X=2180.754883,Y=-1844.334961,Z=386.075287),InterpMode=CIM_CurveAutoClamped),(InVal=30.028898,OutVal=(X=1334.468750,Y=-2000.316895,Z=367.106720),ArriveTangent=(X=0.000000,Y=-58.162514,Z=0.000000),LeaveTangent=(X=0.000000,Y=-58.162514,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=34.882885,OutVal=(X=1348.407227,Y=-2569.427246,Z=367.534393),ArriveTangent=(X=6.992584,Y=0.000000,Z=0.214553),LeaveTangent=(X=6.992584,Y=0.000000,Z=0.214553),InterpMode=CIM_CurveAutoClamped),(InVal=39.983685,OutVal=(X=2770.367188,Y=-2496.073242,Z=411.173096),ArriveTangent=(X=18.101479,Y=0.000000,Z=0.000000),LeaveTangent=(X=18.101479,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=44.961079,OutVal=(X=2807.813477,Y=-4212.114258,Z=397.315155),ArriveTangent=(X=0.000000,Y=-211.845947,Z=0.000000),LeaveTangent=(X=0.000000,Y=-211.845947,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=49.979607,OutVal=(X=2473.333984,Y=-4834.377441,Z=400.056274),ArriveTangent=(X=-119.190567,Y=-63.081367,Z=0.000000),LeaveTangent=(X=-119.190567,Y=-63.081367,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=54.998135,OutVal=(X=1399.387695,Y=-5005.017090,Z=382.104767),ArriveTangent=(X=-245.851471,Y=0.000000,Z=-7.104105),LeaveTangent=(X=-245.851471,Y=0.000000,Z=-7.104105),InterpMode=CIM_CurveAutoClamped),(InVal=59.934391,OutVal=(X=25.935547,Y=-4815.010254,Z=297.934784),InterpMode=CIM_CurveAutoClamped),(InVal=65.158600,OutVal=(X=1058.524414,Y=-4937.086426,Z=335.626770),ArriveTangent=(X=0.000000,Y=-50.955902,Z=0.000000),LeaveTangent=(X=0.000000,Y=-50.955902,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=70.012497,OutVal=(X=623.904297,Y=-5789.913574,Z=322.288513),ArriveTangent=(X=-170.499146,Y=-37.810936,Z=-5.525262),LeaveTangent=(X=-170.499146,Y=-37.810936,Z=-5.525262),InterpMode=CIM_CurveAutoClamped),(InVal=75.031006,OutVal=(X=-1222.006836,Y=-5873.984863,Z=249.631378),ArriveTangent=(X=-265.534485,Y=0.000000,Z=0.000000),LeaveTangent=(X=-265.534485,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=79.802711,OutVal=(X=-2046.775391,Y=-5701.272949,Z=255.334412),ArriveTangent=(X=-5.504478,Y=77.856239,Z=2.546324),LeaveTangent=(X=-5.504478,Y=77.856239,Z=2.546324),InterpMode=CIM_CurveAutoClamped),(InVal=84.944626,OutVal=(X=-2058.019531,Y=-4112.301270,Z=304.012268),ArriveTangent=(X=0.000000,Y=67.762131,Z=0.000000),LeaveTangent=(X=0.000000,Y=67.762131,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.045410,OutVal=(X=-831.686523,Y=-3957.194824,Z=125.545532),ArriveTangent=(X=0.000000,Y=48.029537,Z=-13.889702),LeaveTangent=(X=0.000000,Y=48.029537,Z=-13.889702),InterpMode=CIM_CurveAutoClamped),(InVal=94.981659,OutVal=(X=-1138.672852,Y=-3620.255859,Z=91.112549),ArriveTangent=(X=0.000000,Y=139.203369,Z=-1.794002),LeaveTangent=(X=0.000000,Y=139.203369,Z=-1.794002),InterpMode=CIM_CurveAutoClamped),(InVal=100.000168,OutVal=(X=-1076.773438,Y=-1707.316895,Z=87.009277),ArriveTangent=(X=0.000000,Y=245.428879,Z=0.000000),LeaveTangent=(X=0.000000,Y=245.428879,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=104.977554,OutVal=(X=-1124.708008,Y=-972.132813,Z=305.641693),ArriveTangent=(X=0.000000,Y=7.879036,Z=14.612817),LeaveTangent=(X=0.000000,Y=7.879036,Z=14.612817),InterpMode=CIM_CurveAutoClamped),(InVal=110.069832,OutVal=(X=30.048828,Y=-955.778320,Z=341.080170),ArriveTangent=(X=154.550125,Y=0.000000,Z=1.205242),LeaveTangent=(X=154.550125,Y=0.000000,Z=1.205242),InterpMode=CIM_CurveAutoClamped),(InVal=115.006073,OutVal=(X=506.596680,Y=-1888.647461,Z=343.699341),ArriveTangent=(X=170.553223,Y=-19.802567,Z=1.225351),LeaveTangent=(X=170.553223,Y=-19.802567,Z=1.225351),InterpMode=CIM_CurveAutoClamped),(InVal=119.981552,OutVal=(X=1993.355469,Y=-1930.048340,Z=383.323792),ArriveTangent=(X=97.238556,Y=0.000000,Z=0.000000),LeaveTangent=(X=97.238556,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=124.966454,OutVal=(X=2224.261719,Y=-959.342285,Z=195.318176),ArriveTangent=(X=76.295792,Y=0.000000,Z=0.000000),LeaveTangent=(X=76.295792,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=129.779465,OutVal=(X=2780.664063,Y=-991.778320,Z=222.398254),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.215456),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.215456),InterpMode=CIM_CurveAutoClamped),(InVal=135.101669,OutVal=(X=2675.621094,Y=238.313965,Z=383.251678),ArriveTangent=(X=-4.339172,Y=225.564529,Z=0.000000),LeaveTangent=(X=-4.339172,Y=225.564529,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=139.930176,OutVal=(X=2665.994141,Y=1297.862061,Z=373.951904),ArriveTangent=(X=0.000000,Y=109.623589,Z=0.000000),LeaveTangent=(X=0.000000,Y=109.623589,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=145.022049,OutVal=(X=3643.362305,Y=1593.895020,Z=425.956757),ArriveTangent=(X=0.000000,Y=116.706772,Z=0.000000),LeaveTangent=(X=0.000000,Y=116.706772,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=149.850540,OutVal=(X=3569.637695,Y=2962.734863,Z=254.614594),ArriveTangent=(X=-33.752460,Y=0.000000,Z=-8.746101),LeaveTangent=(X=-33.752460,Y=0.000000,Z=-8.746101),InterpMode=CIM_CurveAutoClamped),(InVal=155.030212,OutVal=(X=2714.081055,Y=2587.623047,Z=234.361053),ArriveTangent=(X=-140.262573,Y=-71.435974,Z=-4.402798),LeaveTangent=(X=-140.262573,Y=-71.435974,Z=-4.402798),InterpMode=CIM_CurveAutoClamped),(InVal=160.034286,OutVal=(X=2141.239258,Y=2235.249023,Z=209.777618),ArriveTangent=(X=-209.303741,Y=-34.000183,Z=-5.742026),LeaveTangent=(X=-209.303741,Y=-34.000183,Z=-5.742026),InterpMode=CIM_CurveAutoClamped),(InVal=165.126160,OutVal=(X=107.907227,Y=2143.973633,Z=176.389862),ArriveTangent=(X=0.000000,Y=-42.279793,Z=-13.790603),LeaveTangent=(X=0.000000,Y=-42.279793,Z=-13.790603),InterpMode=CIM_CurveAutoClamped),(InVal=170.042450,OutVal=(X=153.221680,Y=615.565186,Z=-26.315674),ArriveTangent=(X=0.000000,Y=-25.703918,Z=-12.681919),LeaveTangent=(X=0.000000,Y=-25.703918,Z=-12.681919),InterpMode=CIM_CurveAutoClamped),(InVal=175.309906,OutVal=(X=-1215.473633,Y=560.266602,Z=-57.314697),ArriveTangent=(X=0.000000,Y=-24.985603,Z=0.000000),LeaveTangent=(X=0.000000,Y=-24.985603,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=180.050613,OutVal=(X=-1130.924805,Y=-212.553223,Z=108.356689),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.201449),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.201449),InterpMode=CIM_CurveAutoClamped),(InVal=185.142487,OutVal=(X=-1833.957031,Y=-41.970215,Z=110.792419),ArriveTangent=(X=0.000000,Y=77.410553,Z=1.078800),LeaveTangent=(X=0.000000,Y=77.410553,Z=1.078800),InterpMode=CIM_CurveAutoClamped),(InVal=190.058777,OutVal=(X=-1756.267578,Y=2146.446289,Z=135.186890),ArriveTangent=(X=0.000000,Y=17.674255,Z=8.150953),LeaveTangent=(X=0.000000,Y=17.674255,Z=8.150953),InterpMode=CIM_CurveAutoClamped),(InVal=195.015381,OutVal=(X=-2750.908203,Y=2182.064453,Z=196.705414),ArriveTangent=(X=-177.556015,Y=0.000000,Z=1.669234),LeaveTangent=(X=-177.556015,Y=0.000000,Z=1.669234),InterpMode=CIM_CurveAutoClamped),(InVal=200.136505,OutVal=(X=-3545.628906,Y=2147.476074,Z=200.329193),ArriveTangent=(X=0.000000,Y=-16.237743,Z=0.731433),LeaveTangent=(X=0.000000,Y=-16.237743,Z=0.731433),InterpMode=CIM_CurveAutoClamped),(InVal=204.891846,OutVal=(X=-3460.914063,Y=1503.025635,Z=203.929382),ArriveTangent=(X=33.647552,Y=-140.319717,Z=0.832469),LeaveTangent=(X=33.647552,Y=-140.319717,Z=0.832469),InterpMode=CIM_CurveAutoClamped),(InVal=210.086121,OutVal=(X=-3080.128906,Y=751.348877,Z=208.611938),ArriveTangent=(X=0.000000,Y=-157.658859,Z=0.000000),LeaveTangent=(X=0.000000,Y=-157.658859,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=214.841461,OutVal=(X=-3581.277344,Y=-65.619385,Z=173.222656),ArriveTangent=(X=-178.589066,Y=-10.758484,Z=-7.541368),LeaveTangent=(X=-178.589066,Y=-10.758484,Z=-7.541368),InterpMode=CIM_CurveAutoClamped),(InVal=219.962585,OutVal=(X=-5083.308594,Y=-87.857422,Z=134.129883),ArriveTangent=(X=0.000000,Y=-10.780296,Z=0.000000),LeaveTangent=(X=0.000000,Y=-10.780296,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=224.864227,OutVal=(X=-5019.441406,Y=-1354.232422,Z=149.095886),ArriveTangent=(X=30.524910,Y=0.000000,Z=0.000000),LeaveTangent=(X=30.524910,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=229.985352,OutVal=(X=-3560.091797,Y=-1316.013672,Z=17.799133),ArriveTangent=(X=251.384506,Y=0.000000,Z=0.000000),LeaveTangent=(X=251.384506,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=234.960159,OutVal=(X=-2481.480469,Y=-1508.468262,Z=61.905884),ArriveTangent=(X=168.306503,Y=-60.501945,Z=5.395771),LeaveTangent=(X=168.306503,Y=-60.501945,Z=5.395771),InterpMode=CIM_CurveAutoClamped),(InVal=240.081284,OutVal=(X=-1860.880859,Y=-1947.084961,Z=77.950134),ArriveTangent=(X=135.432358,Y=-16.552622,Z=5.825644),LeaveTangent=(X=135.432358,Y=-16.552622,Z=5.825644),InterpMode=CIM_CurveAutoClamped),(InVal=244.836609,OutVal=(X=-1143.889648,Y=-1982.518555,Z=130.968567),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.012680,OutVal=(X=-1.604004,Y=-1.911621,Z=-65.676270),InterpMode=CIM_CurveAutoClamped),(InVal=10.044697,OutVal=(X=0.153809,Y=-1.235962,Z=4.916382),ArriveTangent=(X=0.002757,Y=0.000000,Z=0.398520),LeaveTangent=(X=0.002757,Y=0.000000,Z=0.398520),InterpMode=CIM_CurveAutoClamped),(InVal=14.982365,OutVal=(X=0.159302,Y=-11.129150,Z=5.718384),ArriveTangent=(X=0.002744,Y=0.000000,Z=0.398878),LeaveTangent=(X=0.002744,Y=0.000000,Z=0.398878),InterpMode=CIM_CurveAutoClamped),(InVal=20.077282,OutVal=(X=1.593018,Y=-3.422241,Z=113.378906),InterpMode=CIM_CurveAutoClamped),(InVal=24.969234,OutVal=(X=1.560059,Y=-5.383301,Z=112.796631),ArriveTangent=(X=-0.016483,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.016483,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=30.028898,OutVal=(X=-1.741333,Y=-4.861450,Z=288.121948),InterpMode=CIM_CurveAutoClamped),(InVal=34.882885,OutVal=(X=-0.192261,Y=-7.207031,Z=182.647705),InterpMode=CIM_CurveAutoClamped),(InVal=39.983685,OutVal=(X=-1.911621,Y=-2.905884,Z=272.680664),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.779675),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.779675),InterpMode=CIM_CurveAutoClamped),(InVal=44.961079,OutVal=(X=-0.093384,Y=-10.063477,Z=361.834717),ArriveTangent=(X=0.000000,Y=0.000000,Z=26.794659),LeaveTangent=(X=0.000000,Y=0.000000,Z=26.794659),InterpMode=CIM_CurveAutoClamped),(InVal=49.979607,OutVal=(X=-0.214233,Y=-9.360352,Z=540.571289),ArriveTangent=(X=0.000000,Y=0.305745,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.305745,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=54.998135,OutVal=(X=1.516113,Y=-3.449707,Z=452.048950),ArriveTangent=(X=0.000000,Y=0.777358,Z=-18.668333),LeaveTangent=(X=0.000000,Y=0.777358,Z=-18.668333),InterpMode=CIM_CurveAutoClamped),(InVal=59.934391,OutVal=(X=-0.401001,Y=-1.104126,Z=354.732056),ArriveTangent=(X=-0.323844,Y=0.000000,Z=-21.066076),LeaveTangent=(X=-0.323844,Y=0.000000,Z=-21.066076),InterpMode=CIM_CurveAutoClamped),(InVal=65.158600,OutVal=(X=-1.774292,Y=-2.252197,Z=238.007813),ArriveTangent=(X=0.000000,Y=-0.200037,Z=-17.398834),LeaveTangent=(X=0.000000,Y=-0.200037,Z=-17.398834),InterpMode=CIM_CurveAutoClamped),(InVal=70.012497,OutVal=(X=-0.291138,Y=-3.120117,Z=179.384766),ArriveTangent=(X=0.000000,Y=-0.364185,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.364185,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=75.031006,OutVal=(X=-2.125854,Y=-8.179321,Z=271.395264),InterpMode=CIM_CurveAutoClamped),(InVal=79.802711,OutVal=(X=-0.516357,Y=-2.455444,Z=185.322876),InterpMode=CIM_CurveAutoClamped),(InVal=84.944626,OutVal=(X=-0.631714,Y=-11.804810,Z=187.602539),ArriveTangent=(X=-0.051692,Y=0.000000,Z=1.078244),LeaveTangent=(X=-0.051692,Y=0.000000,Z=1.078244),InterpMode=CIM_CurveAutoClamped),(InVal=90.045410,OutVal=(X=-2.219238,Y=10.469971,Z=276.009521),ArriveTangent=(X=0.000000,Y=0.000000,Z=26.223930),LeaveTangent=(X=0.000000,Y=0.000000,Z=26.223930),InterpMode=CIM_CurveAutoClamped),(InVal=94.981659,OutVal=(X=1.274414,Y=-0.686646,Z=450.812988),InterpMode=CIM_CurveAutoClamped),(InVal=100.000168,OutVal=(X=-2.235718,Y=0.631714,Z=273.455200),InterpMode=CIM_CurveAutoClamped),(InVal=104.977554,OutVal=(X=-0.351563,Y=-3.043213,Z=365.701904),ArriveTangent=(X=0.000000,Y=-0.016129,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.016129,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=110.069832,OutVal=(X=-0.598755,Y=-3.076172,Z=357.588501),InterpMode=CIM_CurveAutoClamped),(InVal=115.006073,OutVal=(X=-0.186768,Y=-1.362305,Z=372.639771),ArriveTangent=(X=0.149171,Y=0.000000,Z=6.145184),LeaveTangent=(X=0.149171,Y=0.000000,Z=6.145184),InterpMode=CIM_CurveAutoClamped),(InVal=119.981552,OutVal=(X=1.148071,Y=-5.592041,Z=451.719360),InterpMode=CIM_CurveAutoClamped),(InVal=124.966454,OutVal=(X=-0.686646,Y=1.098633,Z=359.033203),ArriveTangent=(X=0.000000,Y=1.068592,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.068592,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=129.779465,OutVal=(X=1.043701,Y=4.877930,Z=458.679199),InterpMode=CIM_CurveAutoClamped),(InVal=135.101669,OutVal=(X=1.032715,Y=-9.162598,Z=452.070923),ArriveTangent=(X=-0.005276,Y=0.000000,Z=-2.946000),LeaveTangent=(X=-0.005276,Y=0.000000,Z=-2.946000),InterpMode=CIM_CurveAutoClamped),(InVal=139.930176,OutVal=(X=-0.736084,Y=-0.659180,Z=360.373535),ArriveTangent=(X=-0.319499,Y=0.000000,Z=-14.306598),LeaveTangent=(X=-0.319499,Y=0.000000,Z=-14.306598),InterpMode=CIM_CurveAutoClamped),(InVal=145.022049,OutVal=(X=-2.136841,Y=-1.285400,Z=310.144043),ArriveTangent=(X=0.000000,Y=-0.278703,Z=-15.103985),LeaveTangent=(X=0.000000,Y=-0.278703,Z=-15.103985),InterpMode=CIM_CurveAutoClamped),(InVal=149.850540,OutVal=(X=-1.730347,Y=-7.492676,Z=210.536499),InterpMode=CIM_CurveAutoClamped),(InVal=155.030212,OutVal=(X=-2.021484,Y=-3.625488,Z=220.468140),ArriveTangent=(X=0.000000,Y=0.856575,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.856575,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=160.034286,OutVal=(X=-0.955811,Y=1.230469,Z=182.565308),InterpMode=CIM_CurveAutoClamped),(InVal=165.126160,OutVal=(X=-2.658691,Y=-3.411255,Z=279.316406),InterpMode=CIM_CurveAutoClamped),(InVal=170.042450,OutVal=(X=-0.867920,Y=-0.021973,Z=178.132324),ArriveTangent=(X=0.347916,Y=1.370929,Z=-18.162846),LeaveTangent=(X=0.347916,Y=1.370929,Z=-18.162846),InterpMode=CIM_CurveAutoClamped),(InVal=175.309906,OutVal=(X=0.884399,Y=18.660278,Z=94.350586),InterpMode=CIM_CurveAutoClamped),(InVal=180.050613,OutVal=(X=0.802002,Y=-17.600098,Z=99.893188),ArriveTangent=(X=-0.040315,Y=0.000000,Z=2.633855),LeaveTangent=(X=-0.040315,Y=0.000000,Z=2.633855),InterpMode=CIM_CurveAutoClamped),(InVal=185.142487,OutVal=(X=-1.043701,Y=-9.558105,Z=179.670410),ArriveTangent=(X=0.000000,Y=0.973347,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.973347,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=190.058777,OutVal=(X=-0.917358,Y=-6.734619,Z=174.204712),ArriveTangent=(X=0.000000,Y=1.191707,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.191707,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=195.015381,OutVal=(X=-1.197510,Y=10.612793,Z=183.120117),ArriveTangent=(X=-0.031045,Y=0.000000,Z=0.585068),LeaveTangent=(X=-0.031045,Y=0.000000,Z=0.585068),InterpMode=CIM_CurveAutoClamped),(InVal=200.136505,OutVal=(X=-1.285400,Y=3.587036,Z=184.537354),ArriveTangent=(X=0.000000,Y=-1.517835,Z=0.701157),LeaveTangent=(X=0.000000,Y=-1.517835,Z=0.701157),InterpMode=CIM_CurveAutoClamped),(InVal=204.891846,OutVal=(X=-1.060181,Y=-4.378052,Z=364.141846),ArriveTangent=(X=0.000000,Y=-1.186834,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.186834,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=210.086121,OutVal=(X=-3.004761,Y=-8.278198,Z=270.324097),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.026556),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.026556),InterpMode=CIM_CurveAutoClamped),(InVal=214.841461,OutVal=(X=-1.373291,Y=-8.146362,Z=184.784546),ArriveTangent=(X=0.002732,Y=0.066741,Z=-0.888312),LeaveTangent=(X=0.002732,Y=0.066741,Z=-0.888312),InterpMode=CIM_CurveAutoClamped),(InVal=219.962585,OutVal=(X=-1.367798,Y=1.999512,Z=182.960815),ArriveTangent=(X=0.002640,Y=0.000000,Z=-0.891661),LeaveTangent=(X=0.002640,Y=0.000000,Z=-0.891661),InterpMode=CIM_CurveAutoClamped),(InVal=224.864227,OutVal=(X=-1.148071,Y=-4.339600,Z=5.542603),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.370603),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.370603),InterpMode=CIM_CurveAutoClamped),(InVal=229.985352,OutVal=(X=-1.345825,Y=-0.505371,Z=0.593262),ArriveTangent=(X=-0.082420,Y=0.000000,Z=-2.161556),LeaveTangent=(X=-0.082420,Y=0.000000,Z=-2.161556),InterpMode=CIM_CurveAutoClamped),(InVal=234.960159,OutVal=(X=-2.675171,Y=-1.049194,Z=-46.301880),InterpMode=CIM_CurveAutoClamped),(InVal=240.081284,OutVal=(X=-1.422729,Y=-0.549316,Z=-0.505371),InterpMode=CIM_CurveAutoClamped),(InVal=244.836609,OutVal=(X=-1.505127,Y=-11.096191,Z=-178.209229),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.012680),(Time=10.044697),(Time=14.982365),(Time=20.077282),(Time=24.969234),(Time=30.028898),(Time=34.882885),(Time=39.983685),(Time=44.961079),(Time=49.979607),(Time=54.998135),(Time=59.934391),(Time=65.158600),(Time=70.012497),(Time=75.031006),(Time=79.802711),(Time=84.944626),(Time=90.045410),(Time=94.981659),(Time=100.000168),(Time=104.977554),(Time=110.069832),(Time=115.006073),(Time=119.981552),(Time=124.966454),(Time=129.779465),(Time=135.101669),(Time=139.930176),(Time=145.022049),(Time=149.850540),(Time=155.030212),(Time=160.034286),(Time=165.126160),(Time=170.042450),(Time=175.309906),(Time=180.050613),(Time=185.142487),(Time=190.058777),(Time=195.015381),(Time=200.136505),(Time=204.891846),(Time=210.086121),(Time=214.841461),(Time=219.962585),(Time=224.864227),(Time=229.985352),(Time=234.960159),(Time=240.081284),(Time=244.836609)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      GroupName="Camera"
      GroupColor=(B=0,G=191,R=145,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=244.960266
   InterpGroups(0)=InterpGroup'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=244.960266
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-9770,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9748,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9726,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9704,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9682,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-9754,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9698,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-5980,OverrideDelta=29)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),LinkDesc="Camera",MinVars=0,DrawX=-5924,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=-9808
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_27
   SizeX=1058
   SizeY=476
   BorderWidth=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-LOCKDOWN.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-9904
   ObjComment="Benchmark"
   Name="SequenceFrameWrapped_27"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object
