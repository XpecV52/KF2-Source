Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=1590
   SizeY=1480
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9864
   ObjPosY=-9568
   ObjComment="Lightning"
   DrawWidth=1590
   DrawHeight=1480
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-8976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_9'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-9083,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9062,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9041,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6533,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-9152
   ObjName="Trigger_9 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-9083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9041,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9062,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=-6394,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6343,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6294,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-9120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_4'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=-9307,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9286,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9265,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6141,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6200
   ObjPosY=-9376
   ObjName="Trigger_4 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6064
   ObjPosY=-9208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-9315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9273,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9294,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=-6010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6048
   ObjPosY=-9352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6064
   ObjPosY=-8976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_10'
   MaxTriggerCount=0
   MaxWidth=126
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-9067,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9046,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9025,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6153,OverrideDelta=31)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=-9136
   ObjName="Trigger_10 Touch"
   DrawWidth=108
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-9091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=-6018,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5967,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5918,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=-9128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_7'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-8851,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8830,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8809,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6549,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6608
   ObjPosY=-8920
   ObjName="Trigger_7 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-8867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8825,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-6402,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6351,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6302,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-8904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-8768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-8760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_1'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=-8859,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8838,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8817,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6157,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=-8928
   ObjName="Trigger_1 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-8851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-6010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6048
   ObjPosY=-8888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_5'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=-9307,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9286,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9265,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5797,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-9376
   ObjName="Trigger_5 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5704
   ObjPosY=-9216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-9323,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9302,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9281,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9302,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-5666,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5615,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5566,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5704
   ObjPosY=-9360
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_2'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-9067,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9046,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9025,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5797,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-9136
   ObjName="Trigger_2 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5712
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-9091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-5674,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5623,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5574,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5712
   ObjPosY=-9128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_6'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-8835,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8814,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8793,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5797,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5856
   ObjPosY=-8904
   ObjName="Trigger_6 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5696
   ObjPosY=-8760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-8867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8825,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-5674,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5623,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5574,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5712
   ObjPosY=-8904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_11'
   MaxTriggerCount=0
   MaxWidth=126
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-9307,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9286,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9265,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5409,OverrideDelta=31)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-9376
   ObjName="Trigger_11 Touch"
   DrawWidth=108
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-9323,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9302,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9281,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9302,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-5282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5320
   ObjPosY=-9360
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5320
   ObjPosY=-9224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_12'
   MaxTriggerCount=0
   MaxWidth=126
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=-9075,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9054,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9033,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5409,OverrideDelta=31)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-9144
   ObjName="Trigger_12 Touch"
   DrawWidth=108
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5312
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-9083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9041,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9062,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=-5266,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5215,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5166,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5304
   ObjPosY=-9120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_13'
   MaxTriggerCount=0
   MaxWidth=126
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-8843,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8822,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8801,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5409,OverrideDelta=31)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-8912
   ObjName="Trigger_13 Touch"
   DrawWidth=108
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5304
   ObjPosY=-8768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-8867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8825,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=-5258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5296
   ObjPosY=-8904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_14'
   MaxTriggerCount=0
   MaxWidth=126
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-9323,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9302,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9281,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5025,OverrideDelta=31)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5088
   ObjPosY=-9392
   ObjName="Trigger_14 Touch"
   DrawWidth=108
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4944
   ObjPosY=-9216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-9315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9273,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9294,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=-4898,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4847,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4798,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4936
   ObjPosY=-9352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=Trigger'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Trigger_3'
   MaxTriggerCount=0
   MaxWidth=118
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-9075,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9054,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9033,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5021,OverrideDelta=27)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5080
   ObjPosY=-9144
   ObjName="Trigger_3 Touch"
   DrawWidth=104
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-9099,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9078,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9057,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9078,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=-4890,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4839,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4790,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4928
   ObjPosY=-9136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFSpawner'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4936
   ObjPosY=-9000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_1
   InputLinks(0)=(DrawY=-7819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7797,OverrideDelta=36)
   InputLinks(2)=(DrawY=-7775,OverrideDelta=58)
   InputLinks(3)=(DrawY=-7753,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-7786,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-9067,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-7856
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_1"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_1
   Bank=AkBank'WW_ENV_Manor.WwiseDefaultBank_WW_ENV_Manor'
   InputLinks(0)=(DrawY=-7836,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7816,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_1')),DrawY=-7826,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-7872
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_1"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_1')),DrawY=-7843,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7822,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7801,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9528
   ObjPosY=-7912
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6168
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5768
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6168
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5768
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFPlayerStart'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-8355,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8334,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8313,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-8334,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-5954,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5903,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5854,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-8392
   ObjComment="Disable Edge Spawns"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-8067,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8046,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8025,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8046,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=-5954,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5903,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5854,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-8104
   ObjComment="Enable Central Spawns"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=725
   SizeY=572
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8096
   ObjPosY=-9536
   ObjComment="Benchmark"
   DrawWidth=725
   DrawHeight=572
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1'),(LinkedOp=SeqAct_Interp'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=-9446,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7969,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-9512
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7768
   ObjPosY=-9064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9478,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-7464,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7528
   ObjPosY=-9512
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9206,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-7968,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8032
   ObjPosY=-9240
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   InputLinks(0)=(DrawY=-9458,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9436,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9414,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9392,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9370,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-9442,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9386,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=-7737,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=-7667,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7768
   ObjPosY=-9496
   DrawWidth=156
   DrawHeight=173
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.496507,OutVal=(X=800.000305,Y=320.000000,Z=-0.000046),ArriveTangent=(X=259.588989,Y=141.593918,Z=-0.000011),LeaveTangent=(X=259.588989,Y=141.593918,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=6.779952,OutVal=(X=1760.000854,Y=960.000000,Z=-0.000076),ArriveTangent=(X=281.174377,Y=104.158905,Z=-0.000015),LeaveTangent=(X=281.174377,Y=104.158905,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=9.471455,OutVal=(X=2480.002441,Y=1120.000488,Z=-0.000137),ArriveTangent=(X=250.899368,Y=0.000000,Z=-0.000018),LeaveTangent=(X=250.899368,Y=0.000000,Z=-0.000018),InterpMode=CIM_CurveAutoClamped),(InVal=13.475878,OutVal=(X=3440.004395,Y=960.001465,Z=-0.000198),ArriveTangent=(X=326.622498,Y=0.000000,Z=-0.000010),LeaveTangent=(X=326.622498,Y=0.000000,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=18.990175,OutVal=(X=5680.005859,Y=960.001953,Z=-0.000229),ArriveTangent=(X=106.100418,Y=0.000000,Z=-0.000007),LeaveTangent=(X=106.100418,Y=0.000000,Z=-0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=21.681665,OutVal=(X=5840.007813,Y=320.001953,Z=-0.000259),ArriveTangent=(X=0.000000,Y=-216.648804,Z=-0.000010),LeaveTangent=(X=0.000000,Y=-216.648804,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=24.898354,OutVal=(X=5600.009277,Y=-319.997803,Z=-0.000290),ArriveTangent=(X=0.000000,Y=-243.729614,Z=-0.000010),LeaveTangent=(X=0.000000,Y=-243.729614,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=27.918081,OutVal=(X=5600.010254,Y=-1199.997314,Z=-0.000320),ArriveTangent=(X=0.000702,Y=-196.223328,Z=-0.000008),LeaveTangent=(X=0.000702,Y=-196.223328,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=32.644627,OutVal=(X=6800.010742,Y=-1839.997314,Z=-0.000351),ArriveTangent=(X=106.355209,Y=-186.640549,Z=-0.000008),LeaveTangent=(X=106.355209,Y=-186.640549,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=35.204815,OutVal=(X=6960.010742,Y=-2559.997314,Z=-0.000381),ArriveTangent=(X=0.000000,Y=-315.415436,Z=-0.000011),LeaveTangent=(X=0.000000,Y=-315.415436,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=38.224571,OutVal=(X=6960.010742,Y=-3599.998047,Z=-0.000412),ArriveTangent=(X=0.000000,Y=-246.885849,Z=-0.000010),LeaveTangent=(X=0.000000,Y=-246.885849,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=41.244286,OutVal=(X=6240.012695,Y=-4079.999023,Z=-0.000443),ArriveTangent=(X=-232.123795,Y=-103.120995,Z=-0.000011),LeaveTangent=(X=-232.123795,Y=-103.120995,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=43.738853,OutVal=(X=5680.014648,Y=-4240.000000,Z=-0.000473),ArriveTangent=(X=-196.104004,Y=0.000000,Z=-0.000011),LeaveTangent=(X=-196.104004,Y=0.000000,Z=-0.000011),InterpMode=CIM_CurveAutoClamped),(InVal=46.955521,OutVal=(X=5120.016602,Y=-3440.000732,Z=-0.000504),ArriveTangent=(X=0.000000,Y=280.289398,Z=-0.000012),LeaveTangent=(X=0.000000,Y=280.289398,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=50.303493,OutVal=(X=5120.019043,Y=-2400.000977,Z=-0.000549),ArriveTangent=(X=0.000000,Y=259.732697,Z=-0.000009),LeaveTangent=(X=0.000000,Y=259.732697,Z=-0.000009),InterpMode=CIM_CurveAutoClamped),(InVal=52.732399,OutVal=(X=4480.019531,Y=-1920.000977,Z=-0.000565),ArriveTangent=(X=-329.485260,Y=90.901695,Z=-0.000008),LeaveTangent=(X=-329.485260,Y=90.901695,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=56.324574,OutVal=(X=3120.019531,Y=-1760.000732,Z=-0.000595),ArriveTangent=(X=-226.485382,Y=91.187653,Z=-0.000009),LeaveTangent=(X=-226.485382,Y=91.187653,Z=-0.000009),InterpMode=CIM_CurveAutoClamped),(InVal=59.278652,OutVal=(X=2720.020508,Y=-1120.000488,Z=-0.000626),ArriveTangent=(X=-226.634735,Y=0.000351,Z=-0.000009),LeaveTangent=(X=-226.634735,Y=0.000351,Z=-0.000009),InterpMode=CIM_CurveAutoClamped),(InVal=63.151806,OutVal=(X=1200.020996,Y=-1120.000000,Z=-0.000656),ArriveTangent=(X=0.000000,Y=0.000366,Z=-0.000010),LeaveTangent=(X=0.000000,Y=0.000366,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=65.515068,OutVal=(X=1200.021484,Y=-400.000000,Z=-0.000687),ArriveTangent=(X=0.000549,Y=0.000000,Z=-0.000014),LeaveTangent=(X=0.000549,Y=0.000000,Z=-0.000014),InterpMode=CIM_CurveAutoClamped),(InVal=67.550110,OutVal=(X=1840.021973,Y=-400.000000,Z=-0.000717),ArriveTangent=(X=335.571655,Y=0.000000,Z=-0.000031),LeaveTangent=(X=335.571655,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=70.044655,OutVal=(X=2720.022461,Y=-319.999512,Z=-480.000732),ArriveTangent=(X=274.198120,Y=61.764633,Z=-0.000237),LeaveTangent=(X=274.198120,Y=61.764633,Z=-0.000237),InterpMode=CIM_CurveAutoClamped),(InVal=72.801796,OutVal=(X=3280.024414,Y=80.001953,Z=-480.000977),ArriveTangent=(X=283.095276,Y=0.001198,Z=-0.000072),LeaveTangent=(X=283.095276,Y=0.001198,Z=-0.000072),InterpMode=CIM_CurveAutoClamped),(InVal=75.979065,OutVal=(X=4400.025879,Y=80.003418,Z=-480.001160),ArriveTangent=(X=304.663239,Y=0.000000,Z=-0.000053),LeaveTangent=(X=304.663239,Y=0.000000,Z=-0.000053),InterpMode=CIM_CurveAutoClamped),(InVal=78.578674,OutVal=(X=5040.026855,Y=-399.995850,Z=-480.001282),ArriveTangent=(X=167.266907,Y=-224.815018,Z=-0.000046),LeaveTangent=(X=167.266907,Y=-224.815018,Z=-0.000046),InterpMode=CIM_CurveAutoClamped),(InVal=82.674965,OutVal=(X=5520.028320,Y=-1439.995605,Z=-480.001465),ArriveTangent=(X=0.000931,Y=-257.098724,Z=-0.000049),LeaveTangent=(X=0.000931,Y=-257.098724,Z=-0.000049),InterpMode=CIM_CurveAutoClamped),(InVal=84.801964,OutVal=(X=5520.029297,Y=-1999.995605,Z=-480.001587),ArriveTangent=(X=0.001053,Y=-153.608276,Z=-0.000061),LeaveTangent=(X=0.001053,Y=-153.608276,Z=-0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=87.637871,OutVal=(X=6320.030273,Y=-2239.995850,Z=-480.001770),ArriveTangent=(X=0.000000,Y=-158.965240,Z=0.000000),LeaveTangent=(X=0.000000,Y=-158.965240,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.710114,OutVal=(X=6320.030273,Y=-3279.996338,Z=-0.001877),ArriveTangent=(X=0.000000,Y=-0.000427,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000427,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=93.546028,OutVal=(X=5600.032227,Y=-3279.996826,Z=-0.001907),InterpMode=CIM_CurveAutoClamped),(InVal=97.090919,OutVal=(X=5600.034180,Y=-2239.997070,Z=479.998108),ArriveTangent=(X=0.001404,Y=166.339890,Z=0.000084),LeaveTangent=(X=0.001404,Y=166.339890,Z=0.000084),InterpMode=CIM_CurveAutoClamped),(InVal=100.478279,OutVal=(X=6640.035156,Y=-1919.997314,Z=479.998230),ArriveTangent=(X=182.928253,Y=0.000000,Z=0.000034),LeaveTangent=(X=182.928253,Y=0.000000,Z=0.000034),InterpMode=CIM_CurveAutoClamped),(InVal=104.338272,OutVal=(X=7040.035156,Y=-3519.997559,Z=479.998352),ArriveTangent=(X=0.000000,Y=-306.172729,Z=0.000035),LeaveTangent=(X=0.000000,Y=-306.172729,Z=0.000035),InterpMode=CIM_CurveAutoClamped),(InVal=107.423691,OutVal=(X=6000.037109,Y=-4159.997559,Z=479.998474),ArriveTangent=(X=-293.059937,Y=0.000000,Z=0.000047),LeaveTangent=(X=-293.059937,Y=0.000000,Z=0.000047),InterpMode=CIM_CurveAutoClamped),(InVal=110.889816,OutVal=(X=5120.040039,Y=-3519.998535,Z=479.998657),ArriveTangent=(X=-127.905235,Y=302.113800,Z=0.000044),LeaveTangent=(X=-127.905235,Y=302.113800,Z=0.000044),InterpMode=CIM_CurveAutoClamped),(InVal=114.389832,OutVal=(X=4880.041992,Y=-1919.998779,Z=479.998779),ArriveTangent=(X=-134.311920,Y=172.347260,Z=0.000040),LeaveTangent=(X=-134.311920,Y=172.347260,Z=0.000040),InterpMode=CIM_CurveAutoClamped),(InVal=117.038185,OutVal=(X=4160.042969,Y=-1679.999023,Z=479.998901),ArriveTangent=(X=-277.826202,Y=0.000000,Z=0.000039),LeaveTangent=(X=-277.826202,Y=0.000000,Z=0.000039),InterpMode=CIM_CurveAutoClamped),(InVal=120.724724,OutVal=(X=3120.042969,Y=-1919.998779,Z=479.999023),ArriveTangent=(X=-226.237411,Y=0.000000,Z=0.000035),LeaveTangent=(X=-226.237411,Y=0.000000,Z=0.000035),InterpMode=CIM_CurveAutoClamped),(InVal=124.110397,OutVal=(X=2560.043945,Y=-959.998535,Z=479.999146),ArriveTangent=(X=-240.191299,Y=0.000336,Z=0.000034),LeaveTangent=(X=-240.191299,Y=0.000336,Z=0.000034),InterpMode=CIM_CurveAutoClamped),(InVal=127.947472,OutVal=(X=1360.044312,Y=-959.998047,Z=479.999268),ArriveTangent=(X=-265.829651,Y=0.000336,Z=0.000035),LeaveTangent=(X=-265.829651,Y=0.000336,Z=0.000035),InterpMode=CIM_CurveAutoClamped),(InVal=131.032120,OutVal=(X=720.044800,Y=0.001953,Z=479.999390),ArriveTangent=(X=0.000000,Y=174.357468,Z=0.000038),LeaveTangent=(X=0.000000,Y=174.357468,Z=0.000038),InterpMode=CIM_CurveAutoClamped),(InVal=134.342606,OutVal=(X=1360.045166,Y=320.001953,Z=479.999512),ArriveTangent=(X=192.163422,Y=153.730606,Z=0.000039),LeaveTangent=(X=192.163422,Y=153.730606,Z=0.000039),InterpMode=CIM_CurveAutoClamped),(InVal=137.276810,OutVal=(X=1920.045776,Y=960.001953,Z=479.999634),ArriveTangent=(X=258.644714,Y=0.000000,Z=0.000055),LeaveTangent=(X=258.644714,Y=0.000000,Z=0.000055),InterpMode=CIM_CurveAutoClamped),(InVal=139.910095,OutVal=(X=2800.046875,Y=960.001953,Z=479.999817),ArriveTangent=(X=302.657379,Y=0.000000,Z=0.000069),LeaveTangent=(X=302.657379,Y=0.000000,Z=0.000069),InterpMode=CIM_CurveAutoClamped),(InVal=142.563324,OutVal=(X=3520.048340,Y=960.002930,Z=480.000000),ArriveTangent=(X=181.732651,Y=0.000000,Z=0.000065),LeaveTangent=(X=181.732651,Y=0.000000,Z=0.000065),InterpMode=CIM_CurveAutoClamped),(InVal=144.628082,OutVal=(X=3760.049316,Y=720.003906,Z=480.000122),ArriveTangent=(X=178.030624,Y=0.000000,Z=0.000045),LeaveTangent=(X=178.030624,Y=0.000000,Z=0.000045),InterpMode=CIM_CurveAutoClamped),(InVal=148.039703,OutVal=(X=4720.050293,Y=1120.004395,Z=480.000244),ArriveTangent=(X=0.000931,Y=125.312584,Z=0.000042),LeaveTangent=(X=0.000931,Y=125.312584,Z=0.000042),InterpMode=CIM_CurveAutoClamped),(InVal=150.373718,OutVal=(X=4720.051270,Y=1440.004395,Z=480.000366),ArriveTangent=(X=0.000992,Y=125.070938,Z=0.000060),LeaveTangent=(X=0.000992,Y=125.070938,Z=0.000060),InterpMode=CIM_CurveAutoClamped),(InVal=153.156799,OutVal=(X=4960.053711,Y=1760.004395,Z=480.000549),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.496507,InterpMode=CIM_CurveAutoClamped),(InVal=6.779952,InterpMode=CIM_CurveAutoClamped),(InVal=9.471455,InterpMode=CIM_CurveAutoClamped),(InVal=13.475878,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=18.990175,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.681665,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.898354,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=27.918081,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=32.644627,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=35.204815,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=38.224571,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=41.244286,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=43.738853,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=46.955521,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=50.303493,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=52.732399,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=56.324574,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=59.278652,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=63.151806,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=65.515068,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=67.550110,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=70.044655,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=72.801796,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=75.979065,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=78.578674,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=82.674965,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=84.801964,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=87.637871,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.710114,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=93.546028,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=97.090919,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=100.478279,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=104.338272,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=107.423691,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=110.889816,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=114.389832,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=117.038185,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=120.724724,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=124.110397,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=127.947472,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=131.032120,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=134.342606,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=137.276810,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=139.910095,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=142.563324,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=144.628082,OutVal=(X=0.000000,Y=0.000000,Z=-360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=148.039703,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=150.373718,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=153.156799,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.496507),(Time=6.779952),(Time=9.471455),(Time=13.475878),(Time=18.990175),(Time=21.681665),(Time=24.898354),(Time=27.918081),(Time=32.644627),(Time=35.204815),(Time=38.224571),(Time=41.244286),(Time=43.738853),(Time=46.955521),(Time=50.303493),(Time=52.732399),(Time=56.324574),(Time=59.278652),(Time=63.151806),(Time=65.515068),(Time=67.550110),(Time=70.044655),(Time=72.801796),(Time=75.979065),(Time=78.578674),(Time=82.674965),(Time=84.801964),(Time=87.637871),(Time=90.710114),(Time=93.546028),(Time=97.090919),(Time=100.478279),(Time=104.338272),(Time=107.423691),(Time=110.889816),(Time=114.389832),(Time=117.038185),(Time=120.724724),(Time=124.110397),(Time=127.947472),(Time=131.032120),(Time=134.342606),(Time=137.276810),(Time=139.910095),(Time=142.563324),(Time=144.628082),(Time=148.039703),(Time=150.373718),(Time=153.156799)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="NewCameraGroup"
      GroupColor=(B=0,G=172,R=167,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroupDirector_1.InterpTrackDirector_1'
      GroupColor=(B=199,G=133,R=0,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=153.695328
   InterpGroups(0)=InterpGroup'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1'
   InterpGroups(1)=InterpGroupDirector'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroupDirector_1'
   CurveEdSetup=InterpCurveEdSetup'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7784
   ObjPosY=-9272
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=CameraActor'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7672
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=-8396,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8376,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-6589,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6528,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-6447,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6632
   ObjPosY=-8464
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_0"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=20.000000
   InputLinks(0)=(DrawY=-8347,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8326,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8305,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=1)),DrawY=-8342,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8310,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6236,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6288
   ObjPosY=-8384
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=-8091,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8070,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8049,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-8160
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_28
   InputLinks(0)=(DrawY=-9027,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9006,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8985,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_35')),DrawY=-9022,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8990,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_0'),DrawX=-9340,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=-9064
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_28"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="Lightning_sound"
   InputLinks(0)=(DrawY=-8966,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8966,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9050,OverrideDelta=110)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=-9000
   ObjComment="Lightning_Sound"
   DrawWidth=284
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Lightning_1"
   MaxWidth=192
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),DrawY=-8606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9712,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9808
   ObjPosY=-8672
   ObjComment="Lightning_1"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_91
   Duration=1.500000
   InputLinks(0)=(DrawY=-8723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8681,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=1)),DrawY=-8718,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8686,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9300,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9352
   ObjPosY=-8760
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_91"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-8555,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8534,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8513,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_91')),DrawY=-8534,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),DrawX=-9354,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9303,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9254,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=-8592
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_40
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ShoppingSpree.Play_ENV_ShoppingSpree_Thunder'
   InputLinks(0)=(DrawY=-9046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-8488,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-9080
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_40"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=TargetPoint'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-8976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28'),(LinkedOp=SeqAct_Toggle'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1)),DrawY=-9035,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9014,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8993,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9808
   ObjPosY=-9104
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_0
   Min=23.000000
   Max=40.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9376
   ObjPosY=-8896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_0"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-9491,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9470,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9449,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9470,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50',SeqVar_Object'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=-9506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-9528
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=DominantDirectionalLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.DominantDirectionalLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9536
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_513'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9336
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_483'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_489'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_559'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
   EventName="Lightning_sound"
   MaxWidth=223
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_40')),DrawY=-9046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8665,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-9112
   ObjComment="Lightning_sound"
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_31"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_35
   EventName="Lightning_1"
   InputLinks(0)=(DrawY=-9078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9066,OverrideDelta=94)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=-9112
   ObjComment="Lightning_1"
   DrawWidth=253
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_35"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=DominantDirectionalLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.DominantDirectionalLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_513'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_483'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_489'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8888
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_559'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=-8464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_24
   EventName="Lightning_1"
   MaxWidth=192
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_28')),DrawY=-8854,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9736,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9832
   ObjPosY=-8920
   ObjComment="Lightning_1"
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_24"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=412
   SizeY=280
   BorderWidth=4
   BorderColor=(B=255,G=137,R=0,A=255)
   FillColor=(B=255,G=131,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8816
   ObjPosY=-9160
   ObjComment="Audio"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=1972
   SizeY=760
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6664
   ObjPosY=-9408
   ObjComment="Spawns"
   DrawWidth=1972
   DrawHeight=760
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=679
   SizeY=370
   BorderWidth=4
   BorderColor=(B=255,G=137,R=0,A=255)
   FillColor=(B=255,G=131,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9568
   ObjPosY=-7968
   ObjComment="Audio"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=1168
   SizeY=686
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6680
   ObjPosY=-8520
   ObjComment="Player_Start"
   DrawWidth=1168
   DrawHeight=686
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-8344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-9312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-9312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-8336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-8336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-8336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9344
   ObjPosY=-9304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-9304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_486'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-9304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_486'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-8336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=-8336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-9304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=-9304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8784
   ObjPosY=-8328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-9232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-9232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=PointLight'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.PointLight_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SHOPPINGSPREE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
