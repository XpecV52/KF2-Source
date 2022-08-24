Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawnVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawnVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4816
   ObjPosY=-1288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFSpawnVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawnVolume_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFSpawnVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawnVolume_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=-1288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=400
   SizeY=321
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4914
   ObjPosY=-1270
   ObjComment="Sub Basement Feeder Volumes"
   DrawWidth=400
   DrawHeight=321
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFSpawnVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawnVolume_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4656
   ObjPosY=-1160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFSpawnVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawnVolume_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4544
   ObjPosY=-1224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFSpawnVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawnVolume_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4688
   ObjPosY=-1056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-960
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-1019,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-998,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-977,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4114,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4200
   ObjPosY=-1088
   ObjName="TriggerVolume_12 Touch"
   ObjComment="VOL_HansWorkshop_Subbasement"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-1091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-3906,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3855,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3806,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-1128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-528
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=-611,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-590,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-569,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4134,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4216
   ObjPosY=-680
   ObjName="TriggerVolume_3 Touch"
   ObjComment="VOL_PowerRoom_Subbasement"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-633,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-3946,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3895,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3846,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_17'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=37,OverrideDelta=14)
   OutputLinks(1)=(DrawY=58,OverrideDelta=35)
   OutputLinks(2)=(DrawY=79,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4098,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4184
   ObjPosY=-32
   ObjName="TriggerVolume_17 Touch"
   ObjComment="VOL_CellarCorridor_Basement"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=176
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=200
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),DrawY=-307,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-286,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-265,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4094,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4176
   ObjPosY=-376
   ObjName="TriggerVolume_4 Touch"
   ObjComment="VOL_WineCellar_Basement"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(DrawY=58,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-3866,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3815,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3766,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=680
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4016
   ObjPosY=768
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=768
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3816
   ObjPosY=768
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=565,OverrideDelta=14)
   OutputLinks(1)=(DrawY=586,OverrideDelta=35)
   OutputLinks(2)=(DrawY=607,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4198,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=496
   ObjName="TriggerVolume_5 Touch"
   ObjComment="VOL_RightLanding_MainFloor"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=557,OverrideDelta=14)
   InputLinks(1)=(DrawY=578,OverrideDelta=35)
   InputLinks(2)=(DrawY=599,OverrideDelta=56)
   OutputLinks(0)=(DrawY=578,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-3962,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3911,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3862,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4000
   ObjPosY=520
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3920
   ObjPosY=1176
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=1109,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1130,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1151,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4110,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4192
   ObjPosY=1040
   ObjName="TriggerVolume_6 Touch"
   ObjComment="VOL_Foyer_MainFloor"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1061,OverrideDelta=14)
   InputLinks(1)=(DrawY=1082,OverrideDelta=35)
   InputLinks(2)=(DrawY=1103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-3882,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3831,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3782,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3920
   ObjPosY=1024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3792
   ObjPosY=1704
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=1621,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1642,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1663,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4038,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4120
   ObjPosY=1552
   ObjName="TriggerVolume_7 Touch"
   ObjComment="VOL_LibraryHallway_MainFloor"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=1565,OverrideDelta=14)
   InputLinks(1)=(DrawY=1586,OverrideDelta=35)
   InputLinks(2)=(DrawY=1607,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1586,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=-3770,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3719,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3670,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=1528
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3784
   ObjPosY=1976
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3816
   ObjPosY=2040
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3720
   ObjPosY=2040
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=1925,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1946,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1967,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3990,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4072
   ObjPosY=1856
   ObjName="TriggerVolume_8 Touch"
   ObjComment="VOL_Library_MainFloor"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=1861,OverrideDelta=14)
   InputLinks(1)=(DrawY=1882,OverrideDelta=35)
   InputLinks(2)=(DrawY=1903,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1882,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=-3794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3832
   ObjPosY=1824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3784
   ObjPosY=2352
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=2424
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3720
   ObjPosY=2424
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=2165,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2186,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2207,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3974,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=2096
   ObjName="TriggerVolume_9 Touch"
   ObjComment="VOL_Garden_MainFloor"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=2221,OverrideDelta=14)
   InputLinks(1)=(DrawY=2242,OverrideDelta=35)
   InputLinks(2)=(DrawY=2263,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2242,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=-3738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3776
   ObjPosY=2184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=3104
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=3061,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3082,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3103,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3762,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3848
   ObjPosY=2992
   ObjName="TriggerVolume_11 Touch"
   ObjComment="VOL_FountainCourtyard_MainFloor"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=3005,OverrideDelta=14)
   InputLinks(1)=(DrawY=3026,OverrideDelta=35)
   InputLinks(2)=(DrawY=3047,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3026,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-3546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3584
   ObjPosY=2968
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-168
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=-152
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=-243,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-222,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-201,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-2842,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=-312
   ObjName="TriggerVolume_14 Touch"
   ObjComment="VOL_MasterBedroom_PianoRoom"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-273,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-294,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-2482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2616
   ObjPosY=152
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=192
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=93,OverrideDelta=14)
   OutputLinks(1)=(DrawY=114,OverrideDelta=35)
   OutputLinks(2)=(DrawY=135,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-2818,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2904
   ObjPosY=24
   ObjName="TriggerVolume_13 Touch"
   ObjComment="VOL_MasterBedroom_MainChamber"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=45,OverrideDelta=14)
   InputLinks(1)=(DrawY=66,OverrideDelta=35)
   InputLinks(2)=(DrawY=87,OverrideDelta=56)
   OutputLinks(0)=(DrawY=66,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-2594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2632
   ObjPosY=8
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2888
   ObjPosY=776
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2856
   ObjPosY=864
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=864
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=709,OverrideDelta=14)
   OutputLinks(1)=(DrawY=730,OverrideDelta=35)
   OutputLinks(2)=(DrawY=751,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3094,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=640
   ObjName="TriggerVolume_2 Touch"
   ObjComment="VOL_MasterBedroom_Patio"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=653,OverrideDelta=14)
   InputLinks(1)=(DrawY=674,OverrideDelta=35)
   InputLinks(2)=(DrawY=695,OverrideDelta=56)
   OutputLinks(0)=(DrawY=674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=-2850,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2799,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2750,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2888
   ObjPosY=616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=1344
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2936
   ObjPosY=1280
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2872
   ObjPosY=1352
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),DrawY=1245,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1266,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1287,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3106,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3192
   ObjPosY=1176
   ObjName="TriggerVolume_15 Touch"
   ObjComment="VOL_Study_Mainfloor"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=1165,OverrideDelta=14)
   InputLinks(1)=(DrawY=1186,OverrideDelta=35)
   InputLinks(2)=(DrawY=1207,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1186,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),DrawX=-2906,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2855,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2806,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=1128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2592
   ObjPosY=248
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3624
   ObjPosY=3184
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3528
   ObjPosY=3184
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3424
   ObjPosY=3184
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3624
   ObjPosY=3256
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3624
   ObjPosY=3328
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3528
   ObjPosY=3328
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3424
   ObjPosY=3328
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3400
   ObjPosY=3088
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-1346,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1324,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1302,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1280,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1258,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-1330,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1274,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-2745,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=-2675,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2776
   ObjPosY=-1384
   DrawWidth=156
   DrawHeight=173
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=0,G=79,R=222,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=0.000488,Y=-0.000015,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=4.996428,OutVal=(X=1720.002930,Y=-0.000244,Z=-0.000183),ArriveTangent=(X=154.055115,Y=-0.000001,Z=-0.000011),LeaveTangent=(X=154.055115,Y=-0.000001,Z=-0.000011),InterpMode=CIM_CurveUser),(InVal=10.977220,OutVal=(X=2064.002441,Y=735.999695,Z=-0.000153),ArriveTangent=(X=100.601868,Y=0.000000,Z=0.000014),LeaveTangent=(X=100.601868,Y=0.000000,Z=0.000014),InterpMode=CIM_CurveAutoClamped),(InVal=14.936605,OutVal=(X=2720.003418,Y=607.999634,Z=127.999786),ArriveTangent=(X=129.870026,Y=-58.388039,Z=38.663509),LeaveTangent=(X=129.870026,Y=-58.388039,Z=38.663509),InterpMode=CIM_CurveAutoClamped),(InVal=19.046841,OutVal=(X=3112.004395,Y=159.999603,Z=311.999725),ArriveTangent=(X=46.064106,Y=-122.382286,Z=0.000000),LeaveTangent=(X=46.064106,Y=-122.382286,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.938053,OutVal=(X=3248.005859,Y=-616.000366,Z=311.999634),ArriveTangent=(X=45.169827,Y=-151.606537,Z=-0.000017),LeaveTangent=(X=45.169827,Y=-151.606537,Z=-0.000017),InterpMode=CIM_CurveAutoClamped),(InVal=29.969852,OutVal=(X=3728.007324,Y=-1496.000366,Z=311.999542),ArriveTangent=(X=121.820831,Y=0.000000,Z=-0.000041),LeaveTangent=(X=121.820831,Y=0.000000,Z=-0.000041),InterpMode=CIM_CurveAutoClamped),(InVal=36.915073,OutVal=(X=4712.009766,Y=-1344.000366,Z=167.999420),ArriveTangent=(X=165.447205,Y=36.846252,Z=-0.000017),LeaveTangent=(X=165.447205,Y=36.846252,Z=-0.000017),InterpMode=CIM_CurveAutoClamped),(InVal=41.042889,OutVal=(X=5560.010254,Y=-1088.000488,Z=167.999390),ArriveTangent=(X=197.373077,Y=40.246075,Z=-0.000013),LeaveTangent=(X=197.373077,Y=40.246075,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=45.345818,OutVal=(X=6376.011719,Y=-984.000549,Z=167.999298),ArriveTangent=(X=146.659424,Y=0.000000,Z=-0.000015),LeaveTangent=(X=146.659424,Y=0.000000,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=54.843594,OutVal=(X=7584.013672,Y=-1744.000610,Z=167.999176),ArriveTangent=(X=57.691963,Y=-118.316269,Z=-0.000013),LeaveTangent=(X=57.691963,Y=-118.316269,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=59.004128,OutVal=(X=7736.014648,Y=-2600.000732,Z=167.999115),ArriveTangent=(X=0.000000,Y=-233.554489,Z=-0.000020),LeaveTangent=(X=0.000000,Y=-233.554489,Z=-0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=62.310802,OutVal=(X=7128.015625,Y=-3488.000732,Z=167.999023),ArriveTangent=(X=-271.425262,Y=-97.877563,Z=-0.000027),LeaveTangent=(X=-271.425262,Y=-97.877563,Z=-0.000027),InterpMode=CIM_CurveAutoClamped),(InVal=65.884415,OutVal=(X=5848.017578,Y=-3656.000488,Z=167.998932),ArriveTangent=(X=-279.518738,Y=0.000000,Z=-0.000020),LeaveTangent=(X=-279.518738,Y=0.000000,Z=-0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=71.698349,OutVal=(X=4504.020508,Y=-3072.000488,Z=167.998840),ArriveTangent=(X=-210.696457,Y=26.432518,Z=-0.000018),LeaveTangent=(X=-210.696457,Y=26.432518,Z=-0.000018),InterpMode=CIM_CurveAutoClamped),(InVal=75.946259,OutVal=(X=3728.022705,Y=-3016.000244,Z=167.998749),ArriveTangent=(X=-141.462296,Y=0.000000,Z=-0.000052),LeaveTangent=(X=-141.462296,Y=0.000000,Z=-0.000052),InterpMode=CIM_CurveAutoClamped),(InVal=80.746674,OutVal=(X=3224.023682,Y=-3272.000244,Z=87.998688),ArriveTangent=(X=-73.099754,Y=-106.279312,Z=-10.842737),LeaveTangent=(X=-73.099754,Y=-106.279312,Z=-10.842737),InterpMode=CIM_CurveAutoClamped),(InVal=84.213730,OutVal=(X=3056.026123,Y=-4040.000244,Z=63.998535),ArriveTangent=(X=-112.205475,Y=0.000004,Z=-0.000013),LeaveTangent=(X=-112.205475,Y=0.000004,Z=-0.000013),InterpMode=CIM_CurveUser),(InVal=88.694130,OutVal=(X=2432.026855,Y=-4144.001465,Z=63.998474),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000033),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000033),InterpMode=CIM_CurveAutoClamped),(InVal=93.761345,OutVal=(X=2432.028809,Y=-3152.001221,Z=15.998352),ArriveTangent=(X=0.000000,Y=174.282852,Z=-3.535756),LeaveTangent=(X=0.000000,Y=174.282852,Z=-3.535756),InterpMode=CIM_CurveAutoClamped),(InVal=98.241829,OutVal=(X=1944.029297,Y=-2480.001221,Z=7.998322),ArriveTangent=(X=-149.087540,Y=63.836853,Z=-0.000034),LeaveTangent=(X=-149.087540,Y=63.836853,Z=-0.000034),InterpMode=CIM_CurveAutoClamped),(InVal=102.668854,OutVal=(X=1104.030273,Y=-2336.000977,Z=7.998260),ArriveTangent=(X=-95.708847,Y=64.588905,Z=-0.000015),LeaveTangent=(X=-95.708847,Y=64.588905,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=108.696098,OutVal=(X=808.031860,Y=-968.001038,Z=7.998169),ArriveTangent=(X=-18.739922,Y=247.548813,Z=-0.000017),LeaveTangent=(X=-18.739922,Y=247.548813,Z=-0.000017),InterpMode=CIM_CurveAutoClamped),(InVal=113.656586,OutVal=(X=760.033447,Y=383.998901,Z=7.998077),ArriveTangent=(X=0.000000,Y=233.915054,Z=-0.000015),LeaveTangent=(X=0.000000,Y=233.915054,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=118.990433,OutVal=(X=800.034546,Y=1439.998779,Z=7.998016),ArriveTangent=(X=0.000000,Y=122.256203,Z=-0.000013),LeaveTangent=(X=0.000000,Y=122.256203,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=123.022575,OutVal=(X=120.035645,Y=1743.998901,Z=7.997955),ArriveTangent=(X=-16.023254,Y=125.409210,Z=-0.000013),LeaveTangent=(X=-16.023254,Y=125.409210,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=128.089706,OutVal=(X=88.036621,Y=2807.998779,Z=7.997894),ArriveTangent=(X=0.000000,Y=97.613312,Z=-0.000013),LeaveTangent=(X=0.000000,Y=97.613312,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=132.516876,OutVal=(X=1080.037598,Y=3039.998779,Z=7.997833),ArriveTangent=(X=198.996277,Y=0.000000,Z=-0.000015),LeaveTangent=(X=198.996277,Y=0.000000,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=140.230652,OutVal=(X=2504.039551,Y=3039.998535,Z=7.997711),ArriveTangent=(X=26.717674,Y=0.000000,Z=-0.000012),LeaveTangent=(X=26.717674,Y=0.000000,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=147.870453,OutVal=(X=2592.040771,Y=4511.998047,Z=7.997650),ArriveTangent=(X=0.000000,Y=239.336136,Z=-0.000022),LeaveTangent=(X=0.000000,Y=239.336136,Z=-0.000022),InterpMode=CIM_CurveAutoClamped),(InVal=153.400406,OutVal=(X=1976.042236,Y=6191.996582,Z=-80.002441),ArriveTangent=(X=0.000000,Y=205.752396,Z=-14.516304),LeaveTangent=(X=0.000000,Y=205.752396,Z=-14.516304),InterpMode=CIM_CurveAutoClamped),(InVal=160.545868,OutVal=(X=2512.043945,Y=7119.995117,Z=-176.002533),ArriveTangent=(X=121.906517,Y=0.000000,Z=0.000000),LeaveTangent=(X=121.906517,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=167.070007,OutVal=(X=3680.045166,Y=6183.994141,Z=-80.002625),ArriveTangent=(X=199.971741,Y=-107.083389,Z=27.036667),LeaveTangent=(X=199.971741,Y=-107.083389,Z=27.036667),InterpMode=CIM_CurveAutoClamped),(InVal=173.347687,OutVal=(X=5072.045898,Y=5735.994141,Z=239.997314),ArriveTangent=(X=0.000000,Y=-139.238510,Z=0.000000),LeaveTangent=(X=0.000000,Y=-139.238510,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=177.013672,OutVal=(X=5016.046875,Y=4759.994141,Z=239.997253),ArriveTangent=(X=0.000000,Y=-220.992340,Z=-0.000018),LeaveTangent=(X=0.000000,Y=-220.992340,Z=-0.000018),InterpMode=CIM_CurveAutoClamped),(InVal=181.673767,OutVal=(X=5464.047852,Y=3895.994141,Z=239.997162),ArriveTangent=(X=144.167053,Y=-157.767593,Z=-0.000021),LeaveTangent=(X=144.167053,Y=-157.767593,Z=-0.000021),InterpMode=CIM_CurveAutoClamped),(InVal=185.836777,OutVal=(X=6288.047852,Y=3367.994141,Z=239.997070),ArriveTangent=(X=248.318924,Y=-45.650017,Z=-0.000047),LeaveTangent=(X=248.318924,Y=-45.650017,Z=-0.000047),InterpMode=CIM_CurveAutoClamped),(InVal=192.485138,OutVal=(X=8208.049805,Y=3231.993896,Z=215.996948),ArriveTangent=(X=60.544106,Y=-46.931244,Z=-0.000030),LeaveTangent=(X=60.544106,Y=-46.931244,Z=-0.000030),InterpMode=CIM_CurveAutoClamped),(InVal=197.021011,OutVal=(X=8344.050781,Y=2535.993896,Z=215.996887),ArriveTangent=(X=59.250370,Y=-94.249947,Z=-0.000012),LeaveTangent=(X=59.250370,Y=-94.249947,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=202.346497,OutVal=(X=9216.050781,Y=2247.993896,Z=215.996826),ArriveTangent=(X=147.908310,Y=-96.400513,Z=-0.000013),LeaveTangent=(X=147.908310,Y=-96.400513,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=206.215897,OutVal=(X=9704.050781,Y=1631.993774,Z=215.996765),ArriveTangent=(X=0.000000,Y=-161.117767,Z=-0.000018),LeaveTangent=(X=0.000000,Y=-161.117767,Z=-0.000018),InterpMode=CIM_CurveAutoClamped),(InVal=209.000015,OutVal=(X=9368.050781,Y=1175.993774,Z=215.996704),ArriveTangent=(X=-147.037460,Y=-196.520370,Z=-0.000041),LeaveTangent=(X=-147.037460,Y=-196.520370,Z=-0.000041),InterpMode=CIM_CurveAutoClamped),(InVal=215.842545,OutVal=(X=8152.051270,Y=-416.006104,Z=111.996643),ArriveTangent=(X=-207.054550,Y=0.000000,Z=-17.422092),LeaveTangent=(X=-207.054550,Y=0.000000,Z=-17.422092),InterpMode=CIM_CurveAutoClamped),(InVal=220.938889,OutVal=(X=6896.052734,Y=-192.006104,Z=7.996552),ArriveTangent=(X=-269.254852,Y=18.053047,Z=-25.314596),LeaveTangent=(X=-269.254852,Y=18.053047,Z=-25.314596),InterpMode=CIM_CurveAutoClamped),(InVal=226.271317,OutVal=(X=5344.053711,Y=-144.006012,Z=-152.003510),ArriveTangent=(X=-213.066589,Y=0.000000,Z=-0.000023),LeaveTangent=(X=-213.066589,Y=0.000000,Z=-0.000023),InterpMode=CIM_CurveAutoClamped),(InVal=233.066544,OutVal=(X=4312.054688,Y=-360.005981,Z=-152.003571),ArriveTangent=(X=-18.702324,Y=0.000000,Z=-0.000011),LeaveTangent=(X=-18.702324,Y=0.000000,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=237.502243,OutVal=(X=4272.055664,Y=695.993958,Z=-152.003632),ArriveTangent=(X=0.000000,Y=59.382782,Z=-0.000034),LeaveTangent=(X=0.000000,Y=59.382782,Z=-0.000034),InterpMode=CIM_CurveAutoClamped),(InVal=241.938049,OutVal=(X=5688.056641,Y=815.993835,Z=-312.003693),ArriveTangent=(X=156.045029,Y=54.557850,Z=-0.000028),LeaveTangent=(X=156.045029,Y=54.557850,Z=-0.000028),InterpMode=CIM_CurveAutoClamped),(InVal=247.553635,OutVal=(X=6136.057617,Y=1863.993774,Z=-312.003754),ArriveTangent=(X=0.000000,Y=179.246445,Z=-0.000031),LeaveTangent=(X=0.000000,Y=179.246445,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=250.998199,OutVal=(X=6032.059570,Y=2439.993652,Z=-336.003815),ArriveTangent=(X=-64.718864,Y=0.000000,Z=-15.419277),LeaveTangent=(X=-64.718864,Y=0.000000,Z=-15.419277),InterpMode=CIM_CurveAutoClamped),(InVal=254.773315,OutVal=(X=5056.061523,Y=2439.993652,Z=-640.003906),ArriveTangent=(X=-52.643532,Y=0.000000,Z=-49.371983),LeaveTangent=(X=-52.643532,Y=0.000000,Z=-49.371983),InterpMode=CIM_CurveAutoClamped),(InVal=259.932373,OutVal=(X=4944.063477,Y=1319.993652,Z=-784.003906),ArriveTangent=(X=-49.947239,Y=0.000000,Z=0.000000),LeaveTangent=(X=-49.947239,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=263.660278,OutVal=(X=4296.064941,Y=1319.993774,Z=-784.003906),ArriveTangent=(X=-99.817665,Y=0.000000,Z=0.000000),LeaveTangent=(X=-99.817665,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=270.030762,OutVal=(X=3936.065918,Y=-688.006165,Z=-720.003906),ArriveTangent=(X=0.000000,Y=-278.270447,Z=14.065982),LeaveTangent=(X=0.000000,Y=-278.270447,Z=14.065982),InterpMode=CIM_CurveAutoClamped),(InVal=274.466492,OutVal=(X=4376.066895,Y=-1688.006104,Z=-632.003906),ArriveTangent=(X=3.672981,Y=-293.544647,Z=0.000000),LeaveTangent=(X=3.672981,Y=-293.544647,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=280.223419,OutVal=(X=4384.068848,Y=-3680.006104,Z=-632.003906),ArriveTangent=(X=0.000000,Y=-221.894119,Z=0.000000),LeaveTangent=(X=0.000000,Y=-221.894119,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=284.093109,OutVal=(X=4232.069824,Y=-4232.005859,Z=-632.003906),ArriveTangent=(X=-74.627045,Y=-27.973625,Z=0.000000),LeaveTangent=(X=-74.627045,Y=-27.973625,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=288.859100,OutVal=(X=3360.070801,Y=-4288.005859,Z=-632.003906),ArriveTangent=(X=-71.847107,Y=0.000000,Z=0.000000),LeaveTangent=(X=-71.847107,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=294.960968,OutVal=(X=3152.072021,Y=-3024.005615,Z=-632.003906),ArriveTangent=(X=-77.472153,Y=95.439659,Z=0.000000),LeaveTangent=(X=-77.472153,Y=95.439659,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=300.482025,OutVal=(X=1304.073120,Y=-2744.005371,Z=-632.003906),ArriveTangent=(X=0.000000,Y=85.866745,Z=0.000000),LeaveTangent=(X=0.000000,Y=85.866745,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=305.625641,OutVal=(X=1304.074219,Y=-2048.005615,Z=-720.003906),ArriveTangent=(X=0.000557,Y=68.137848,Z=0.000000),LeaveTangent=(X=0.000557,Y=68.137848,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=310.093201,OutVal=(X=2144.075195,Y=-1880.006104,Z=-720.003906),ArriveTangent=(X=146.108032,Y=67.322449,Z=0.000000),LeaveTangent=(X=146.108032,Y=67.322449,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=314.331543,OutVal=(X=2576.076416,Y=-1376.006104,Z=-720.003906),ArriveTangent=(X=0.000439,Y=184.944977,Z=0.000000),LeaveTangent=(X=0.000439,Y=184.944977,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=320.553406,OutVal=(X=2576.077393,Y=407.993835,Z=-720.003906),ArriveTangent=(X=0.000000,Y=169.919052,Z=0.000000),LeaveTangent=(X=0.000000,Y=169.919052,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=325.017029,OutVal=(X=2000.079346,Y=871.993774,Z=-664.003906),ArriveTangent=(X=-139.988953,Y=0.000000,Z=9.680753),LeaveTangent=(X=-139.988953,Y=0.000000,Z=9.680753),InterpMode=CIM_CurveAutoClamped),(InVal=328.554016,OutVal=(X=1456.080322,Y=799.993835,Z=-640.003906),ArriveTangent=(X=-113.073776,Y=-43.760742,Z=0.000000),LeaveTangent=(X=-113.073776,Y=-43.760742,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=332.115875,OutVal=(X=1192.081177,Y=247.993820,Z=-640.003906),ArriveTangent=(X=0.000000,Y=-174.323395,Z=0.000000),LeaveTangent=(X=0.000000,Y=-174.323395,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=336.263824,OutVal=(X=1192.082153,Y=-544.006226,Z=-640.003906),InterpMode=CIM_CurveAutoClamped),(InVal=339.510040,OutVal=(X=704.083130,Y=-544.006165,Z=-640.003906),ArriveTangent=(X=-15.066967,Y=0.000046,Z=0.000000),LeaveTangent=(X=-15.066967,Y=0.000046,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=343.522827,OutVal=(X=680.084229,Y=431.993774,Z=-312.003937),ArriveTangent=(X=-9.566992,Y=237.686996,Z=0.000000),LeaveTangent=(X=-9.566992,Y=237.686996,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=349.203461,OutVal=(X=592.085449,Y=1759.993774,Z=-312.003998),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000011),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=354.208221,OutVal=(X=1968.086426,Y=1759.993652,Z=-312.004059),ArriveTangent=(X=213.147797,Y=-0.000028,Z=0.000000),LeaveTangent=(X=213.147797,Y=-0.000028,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=357.905518,OutVal=(X=2528.087402,Y=1759.993530,Z=-168.004120),ArriveTangent=(X=19.758724,Y=0.000000,Z=42.500633),LeaveTangent=(X=19.758724,Y=0.000000,Z=42.500633),InterpMode=CIM_CurveAutoClamped),(InVal=361.737518,OutVal=(X=2560.088379,Y=2719.993408,Z=7.995819),ArriveTangent=(X=0.000572,Y=222.763123,Z=0.000000),LeaveTangent=(X=0.000572,Y=222.763123,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=366.201324,OutVal=(X=2560.089355,Y=3607.993408,Z=7.995758),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=4.996428,InterpMode=CIM_CurveUser),(InVal=10.977220,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.936605,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),InterpMode=CIM_CurveAutoClamped),(InVal=19.046841,InterpMode=CIM_CurveAutoClamped),(InVal=24.938053,OutVal=(X=0.000000,Y=0.000000,Z=-22.500000),InterpMode=CIM_CurveAutoClamped),(InVal=29.969852,ArriveTangent=(X=0.000000,Y=0.000000,Z=7.427373),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.427373),InterpMode=CIM_CurveAutoClamped),(InVal=36.915073,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=41.042889,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=45.345818,OutVal=(X=0.000000,Y=0.000000,Z=135.000000),InterpMode=CIM_CurveAutoClamped),(InVal=54.843594,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.213859),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.213859),InterpMode=CIM_CurveAutoClamped),(InVal=59.004128,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-12.052696),LeaveTangent=(X=0.000000,Y=0.000000,Z=-12.052696),InterpMode=CIM_CurveAutoClamped),(InVal=62.310802,OutVal=(X=0.000000,Y=0.000000,Z=-135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.080850),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.080850),InterpMode=CIM_CurveAutoClamped),(InVal=65.884415,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.380754),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.380754),InterpMode=CIM_CurveAutoClamped),(InVal=71.698349,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=75.946259,OutVal=(X=0.000000,Y=0.000000,Z=-225.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.919889),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.919889),InterpMode=CIM_CurveAutoClamped),(InVal=80.746674,OutVal=(X=0.000000,Y=0.000000,Z=-135.000000),InterpMode=CIM_CurveAutoClamped),(InVal=84.213730,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-16.986567),LeaveTangent=(X=0.000000,Y=0.000000,Z=-16.986567),InterpMode=CIM_CurveUser),(InVal=88.694130,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=93.761345,OutVal=(X=0.000000,Y=0.000000,Z=-225.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.426355),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.426355),InterpMode=CIM_CurveAutoClamped),(InVal=98.241829,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=102.668854,OutVal=(X=0.000000,Y=0.000000,Z=-225.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.608923),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.608923),InterpMode=CIM_CurveAutoClamped),(InVal=108.696098,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=113.656586,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=118.990433,OutVal=(X=0.000000,Y=0.000000,Z=-225.000000),InterpMode=CIM_CurveAutoClamped),(InVal=123.022575,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.836349),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.836349),InterpMode=CIM_CurveAutoClamped),(InVal=128.089706,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=132.516876,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=140.230652,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=147.870453,OutVal=(X=0.000000,Y=0.000000,Z=-315.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.833841),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.833841),InterpMode=CIM_CurveAutoClamped),(InVal=153.400406,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.650538),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.650538),InterpMode=CIM_CurveAutoClamped),(InVal=160.545868,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.875928),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.875928),InterpMode=CIM_CurveAutoClamped),(InVal=167.070007,OutVal=(X=0.000000,Y=0.000000,Z=-495.000000),InterpMode=CIM_CurveAutoClamped),(InVal=173.347687,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=177.013672,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=181.673767,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=185.836777,OutVal=(X=0.000000,Y=0.000000,Z=-495.000000),InterpMode=CIM_CurveAutoClamped),(InVal=192.485138,OutVal=(X=0.000000,Y=0.000000,Z=-495.000000),InterpMode=CIM_CurveAutoClamped),(InVal=197.021011,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=202.346497,OutVal=(X=0.000000,Y=0.000000,Z=-495.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.788051),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.788051),InterpMode=CIM_CurveAutoClamped),(InVal=206.215897,OutVal=(X=0.000000,Y=0.000000,Z=-540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=209.000015,OutVal=(X=0.000000,Y=0.000000,Z=-540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=215.842545,OutVal=(X=0.000000,Y=0.000000,Z=-540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=220.938889,OutVal=(X=0.000000,Y=0.000000,Z=-540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=226.271317,OutVal=(X=0.000000,Y=0.000000,Z=-540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=233.066544,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=237.502243,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=241.938049,OutVal=(X=0.000000,Y=0.000000,Z=-315.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.430976),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.430976),InterpMode=CIM_CurveAutoClamped),(InVal=247.553635,OutVal=(X=0.000000,Y=0.000000,Z=-225.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=19.867220),LeaveTangent=(X=0.000000,Y=0.000000,Z=19.867220),InterpMode=CIM_CurveAutoClamped),(InVal=250.998199,OutVal=(X=0.000000,Y=0.000000,Z=-135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.698887),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.698887),InterpMode=CIM_CurveAutoClamped),(InVal=254.773315,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=259.932373,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=263.660278,OutVal=(X=0.000000,Y=0.000000,Z=-135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.912313),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.912313),InterpMode=CIM_CurveAutoClamped),(InVal=270.030762,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=274.466492,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=280.223419,OutVal=(X=0.000000,Y=0.000000,Z=-112.500000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.992977),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.992977),InterpMode=CIM_CurveAutoClamped),(InVal=284.093109,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.238283),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.238283),InterpMode=CIM_CurveAutoClamped),(InVal=288.859100,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=294.960968,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=300.482025,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=305.625641,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.046148),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.046148),InterpMode=CIM_CurveAutoClamped),(InVal=310.093201,OutVal=(X=0.000000,Y=0.000000,Z=-405.000000),InterpMode=CIM_CurveAutoClamped),(InVal=314.331543,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=320.553406,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=325.017029,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=16.873713),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.873713),InterpMode=CIM_CurveAutoClamped),(InVal=328.554016,OutVal=(X=0.000000,Y=0.000000,Z=-135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.678116),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.678116),InterpMode=CIM_CurveAutoClamped),(InVal=332.115875,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=336.263824,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-24.343519),LeaveTangent=(X=0.000000,Y=0.000000,Z=-24.343519),InterpMode=CIM_CurveAutoClamped),(InVal=339.510040,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=343.522827,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=349.203461,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=354.208221,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=357.905518,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=361.737518,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=366.201324,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=4.996428),(Time=10.977220),(Time=14.936605),(Time=19.046841),(Time=24.938053),(Time=29.969852),(Time=36.915073),(Time=41.042889),(Time=45.345818),(Time=54.843594),(Time=59.004128),(Time=62.310802),(Time=65.884415),(Time=71.698349),(Time=75.946259),(Time=80.746674),(Time=84.213730),(Time=88.694130),(Time=93.761345),(Time=98.241829),(Time=102.668854),(Time=108.696098),(Time=113.656586),(Time=118.990433),(Time=123.022575),(Time=128.089706),(Time=132.516876),(Time=140.230652),(Time=147.870453),(Time=153.400406),(Time=160.545868),(Time=167.070007),(Time=173.347687),(Time=177.013672),(Time=181.673767),(Time=185.836777),(Time=192.485138),(Time=197.021011),(Time=202.346497),(Time=206.215897),(Time=209.000015),(Time=215.842545),(Time=220.938889),(Time=226.271317),(Time=233.066544),(Time=237.502243),(Time=241.938049),(Time=247.553635),(Time=250.998199),(Time=254.773315),(Time=259.932373),(Time=263.660278),(Time=270.030762),(Time=274.466492),(Time=280.223419),(Time=284.093109),(Time=288.859100),(Time=294.960968),(Time=300.482025),(Time=305.625641),(Time=310.093201),(Time=314.331543),(Time=320.553406),(Time=325.017029),(Time=328.554016),(Time=332.115875),(Time=336.263824),(Time=339.510040),(Time=343.522827),(Time=349.203461),(Time=354.208221),(Time=357.905518),(Time=361.737518),(Time=366.201324)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="NewCameraGroup"
      GroupColor=(B=177,G=0,R=163,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=366.555389
   InterpGroups(0)=InterpGroup'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2776
   ObjPosY=-1184
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=CameraActor'KF-VOLTERMANOR.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2656
   ObjPosY=-1184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-1030,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-2928,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2992
   ObjPosY=-1064
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-1334,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1334,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-2472,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=-1368
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1'),(LinkedOp=SeqAct_Interp'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-1294,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2937,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3032
   ObjPosY=-1360
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2744
   ObjPosY=-904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=685
   SizeY=604
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3056
   ObjPosY=-1408
   ObjComment="Benchmark"
   DrawWidth=685
   DrawHeight=604
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=TWSeqEvent_LightFlicker Name=TWSeqEvent_LightFlicker_0
   Originator=DominantDirectionalLight'KF-VOLTERMANOR.TheWorld:PersistentLevel.DominantDirectionalLight_0'
   MaxWidth=383
   OutputLinks(0)=(DrawY=-1270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1673,OverrideDelta=159)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1864
   ObjPosY=-1336
   ObjName="DominantDirectionalLight_0 Light Flicker"
   bSuppressAutoComment=False
   DrawWidth=211
   DrawHeight=128
   Name="TWSeqEvent_LightFlicker_0"
   ObjectArchetype=TWSeqEvent_LightFlicker'Engine.Default__TWSeqEvent_LightFlicker'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-1875,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1854,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1833,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1854,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-4442,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4391,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4342,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4480
   ObjPosY=-1912
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-1787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1745,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4674,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4760
   ObjPosY=-1856
   ObjName="TriggerVolume_19 Touch"
   ObjComment="VOL_OutdoorBalcony1"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_17"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_21'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-1811,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1790,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1769,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4018,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4104
   ObjPosY=-1880
   ObjName="TriggerVolume_21 Touch"
   ObjComment="VOL_OutdoorBalcony2"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-1899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1857,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1878,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-3786,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3735,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3686,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=-1936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-1875,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1854,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1833,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1854,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=-3050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3088
   ObjPosY=-1912
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-VOLTERMANOR.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),DrawY=-1787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1745,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3282,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3368
   ObjPosY=-1856
   ObjName="TriggerVolume_20 Touch"
   ObjComment="VOL_OutdoorBalcony3"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-1696
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3768
   ObjPosY=-1736
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3032
   ObjPosY=-1712
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="Lightning_10"
   InputLinks(0)=(DrawY=-2278,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4702,OverrideDelta=98)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-2312
   ObjComment="Lightning_10"
   DrawWidth=261
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_8
   EventName="Lightning_8"
   InputLinks(0)=(DrawY=-2510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4698,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-2544
   ObjComment="Lightning_8"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_8"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="Lightning_9"
   InputLinks(0)=(DrawY=-2390,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2390,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4706,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-2424
   ObjComment="Lightning_9"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="Lightning_7"
   InputLinks(0)=(DrawY=-2614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2614,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4698,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-2648
   ObjComment="Lightning_7"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="Lightning_6"
   InputLinks(0)=(DrawY=-2710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2710,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4714,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=-2744
   ObjComment="Lightning_6"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="Lightning_5"
   InputLinks(0)=(DrawY=-2806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4730,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4856
   ObjPosY=-2840
   ObjComment="Lightning_5"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="Lightning_4"
   InputLinks(0)=(DrawY=-2918,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2918,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4746,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-2952
   ObjComment="Lightning_4"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="Lightning_3"
   InputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4762,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4888
   ObjPosY=-3056
   ObjComment="Lightning_3"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="Lightning_2"
   InputLinks(0)=(DrawY=-3126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4754,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4880
   ObjPosY=-3160
   ObjComment="Lightning_2"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="Lighting_1"
   InputLinks(0)=(DrawY=-3230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4750,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-3264
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=12
   IncrementAmount=0
   InputLinks(0)=(DrawY=-2848,OverrideDelta=73)
   InputLinks(1)=(DrawY=-2708,OverrideDelta=213)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-2904,OverrideDelta=17)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),LinkDesc="Link 2",DrawY=-2881,OverrideDelta=40)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),LinkDesc="Link 3",DrawY=-2858,OverrideDelta=63)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),LinkDesc="Link 4",DrawY=-2835,OverrideDelta=86)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 5",DrawY=-2812,OverrideDelta=109)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),LinkDesc="Link 6",DrawY=-2789,OverrideDelta=132)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),LinkDesc="Link 7",DrawY=-2766,OverrideDelta=155)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_8')),LinkDesc="Link 8",DrawY=-2743,OverrideDelta=178)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),LinkDesc="Link 9",DrawY=-2720,OverrideDelta=201)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),LinkDesc="Link 10",DrawY=-2697,OverrideDelta=224)
   OutputLinks(10)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),LinkDesc="Link 11",DrawY=-2674,OverrideDelta=247)
   OutputLinks(11)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),LinkDesc="Link 12",DrawY=-2651,OverrideDelta=270)
   VariableLinks(0)=(DrawX=-5152,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5200
   ObjPosY=-2944
   DrawWidth=97
   DrawHeight=341
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=TWSeqEvent_LightFlicker Name=TWSeqEvent_LightFlicker_1
   Originator=DominantDirectionalLight'KF-VOLTERMANOR.TheWorld:PersistentLevel.DominantDirectionalLight_0'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=383
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-2958,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5617,OverrideDelta=159)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5808
   ObjPosY=-3024
   ObjName="DominantDirectionalLight_0 Light Flicker"
   DrawWidth=211
   DrawHeight=128
   Name="TWSeqEvent_LightFlicker_1"
   ObjectArchetype=TWSeqEvent_LightFlicker'Engine.Default__TWSeqEvent_LightFlicker'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-371,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-350,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-329,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7112
   ObjPosY=-440
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-257,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-278,OverrideDelta=35)
   VariableLinks(0)=(DrawX=-6826,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6775,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_0'),DrawX=-6726,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=688
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-64
   ObjComment="Devil Courtyard Spawn"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_0
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_12')),DrawY=-62,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6856,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6786,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6904
   ObjPosY=-128
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_0"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-209,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76'),DrawX=-5970,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5919,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5870,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6008
   ObjPosY=-288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6184
   ObjPosY=8
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6088
   ObjPosY=8
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=8
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5888
   ObjPosY=8
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5784
   ObjPosY=8
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5688
   ObjPosY=8
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3816
   ObjPosY=-960
   ObjComment="child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3720
   ObjPosY=-960
   ObjComment="child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3616
   ObjPosY=-960
   ObjComment="child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3520
   ObjPosY=-960
   ObjComment="child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-257,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-278,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-3874,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3823,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3774,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3912
   ObjPosY=-336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3906
   ObjPosY=-207
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3792
   ObjPosY=-160
   ObjComment="child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFSpawner'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2656
   ObjPosY=864
   ObjComment="child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="Lightning_11"
   InputLinks(0)=(DrawY=-2166,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2166,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4702,OverrideDelta=98)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-2200
   ObjComment="Lightning_11"
   DrawWidth=261
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="Lightning_12"
   InputLinks(0)=(DrawY=-2054,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4702,OverrideDelta=98)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-2088
   ObjComment="Lightning_12"
   DrawWidth=261
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=269,OverrideDelta=14)
   InputLinks(1)=(DrawY=290,OverrideDelta=35)
   InputLinks(2)=(DrawY=311,OverrideDelta=56)
   OutputLinks(0)=(DrawY=290,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=-6098,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6047,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5998,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6136
   ObjPosY=232
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6176
   ObjPosY=472
   ObjComment="Spawn 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=472
   ObjComment="Spawn 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=472
   ObjComment="Spawn 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6120
   ObjPosY=552
   ObjComment="Spawn 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=552
   ObjComment="Spawn 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=552
   ObjComment="Spawn 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=861,OverrideDelta=14)
   OutputLinks(1)=(DrawY=882,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_13')),DrawY=903,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7128
   ObjPosY=792
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=912,OverrideDelta=25)
   InputLinks(1)=(DrawY=956,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=901,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),LinkDesc="Link 2",DrawY=923,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),LinkDesc="Link 3",DrawY=945,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23')),LinkDesc="Link 4",DrawY=967,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-6700,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=864
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=709,OverrideDelta=14)
   InputLinks(1)=(DrawY=730,OverrideDelta=35)
   InputLinks(2)=(DrawY=751,OverrideDelta=56)
   OutputLinks(0)=(DrawY=730,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100'),DrawX=-6066,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6015,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5966,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6104
   ObjPosY=672
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=1109,OverrideDelta=14)
   InputLinks(1)=(DrawY=1130,OverrideDelta=35)
   InputLinks(2)=(DrawY=1151,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=-6026,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5975,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5926,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6064
   ObjPosY=1072
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=1549,OverrideDelta=14)
   InputLinks(1)=(DrawY=1570,OverrideDelta=35)
   InputLinks(2)=(DrawY=1591,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1570,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-5978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5927,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5878,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6016
   ObjPosY=1512
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6016
   ObjPosY=1696
   ObjComment="Spawn 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=1696
   ObjComment="Spawn 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5952
   ObjPosY=1784
   ObjComment="Spawn 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=1784
   ObjComment="Spawn 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=1784
   ObjComment="Spawn 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5816
   ObjPosY=1696
   ObjComment="Spawn 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6112
   ObjPosY=856
   ObjComment="Spawn 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6008
   ObjPosY=856
   ObjComment="Spawn 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5912
   ObjPosY=856
   ObjComment="Spawn 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=936
   ObjComment="Spawn 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=936
   ObjComment="Spawn 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=936
   ObjComment="Spawn 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=1344
   ObjComment="Spawn 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5896
   ObjPosY=1344
   ObjComment="Spawn 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5792
   ObjPosY=1344
   ObjComment="Spawn 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6048
   ObjPosY=1240
   ObjComment="Spawn 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=1240
   ObjComment="Spawn 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=KFPlayerStart'KF-VOLTERMANOR.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5848
   ObjPosY=1240
   ObjComment="Spawn 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="SpawnOFF"
   MaxWidth=187
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=1)),DrawY=682,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6699,OverrideDelta=61)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=616
   ObjComment="SpawnOFF"
   DrawWidth=113
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
   EventName="SpawnOFF"
   InputLinks(0)=(DrawY=1042,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),ActivateDelay=1.000000,DrawY=1042,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7020,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=1008
   ObjComment="SpawnOFF"
   DrawWidth=248
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_13"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_12
   EventName="SpawnOFF"
   InputLinks(0)=(DrawY=-198,ActivateDelay=20.000000,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),ActivateDelay=1.000000,DrawY=-198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6396,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-VOLTERMANOR.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=-232
   ObjComment="SpawnOFF"
   DrawWidth=248
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_12"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object
