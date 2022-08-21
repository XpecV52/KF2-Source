Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=501
   SizeY=804
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=56
   ObjComment="Ground Level"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=545
   SizeY=1442
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=40
   ObjComment="Subway"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=624
   SizeY=1689
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1496
   ObjPosY=48
   ObjComment="Sewer"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=173,OverrideDelta=14)
   OutputLinks(1)=(DrawY=194,OverrideDelta=35)
   OutputLinks(2)=(DrawY=215,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1018,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=104
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=141,OverrideDelta=14)
   InputLinks(1)=(DrawY=162,OverrideDelta=35)
   InputLinks(2)=(DrawY=183,OverrideDelta=56)
   OutputLinks(0)=(DrawY=162,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=1158,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1209,OverrideDelta=76)
   EventLinks(0)=(DrawX=1258,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1112
   ObjPosY=240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=413,OverrideDelta=14)
   OutputLinks(1)=(DrawY=434,OverrideDelta=35)
   OutputLinks(2)=(DrawY=455,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1002,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=920
   ObjPosY=344
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=373,OverrideDelta=14)
   InputLinks(1)=(DrawY=394,OverrideDelta=35)
   InputLinks(2)=(DrawY=415,OverrideDelta=56)
   OutputLinks(0)=(DrawY=394,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=1158,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1209,OverrideDelta=76)
   EventLinks(0)=(DrawX=1258,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=661,OverrideDelta=14)
   OutputLinks(1)=(DrawY=682,OverrideDelta=35)
   OutputLinks(2)=(DrawY=703,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1018,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=592
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=621,OverrideDelta=14)
   InputLinks(1)=(DrawY=642,OverrideDelta=35)
   InputLinks(2)=(DrawY=663,OverrideDelta=56)
   OutputLinks(0)=(DrawY=642,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=1166,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1217,OverrideDelta=76)
   EventLinks(0)=(DrawX=1266,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=584
   ObjComment="Short Station Wall"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=901,OverrideDelta=14)
   OutputLinks(1)=(DrawY=922,OverrideDelta=35)
   OutputLinks(2)=(DrawY=943,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1018,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=832
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=869,OverrideDelta=14)
   InputLinks(1)=(DrawY=890,OverrideDelta=35)
   InputLinks(2)=(DrawY=911,OverrideDelta=56)
   OutputLinks(0)=(DrawY=890,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=1166,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1217,OverrideDelta=76)
   EventLinks(0)=(DrawX=1266,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=421
   SizeY=210
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=816
   ObjComment="Long Station Wall"
   DrawWidth=421
   DrawHeight=210
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=336
   ObjPosY=112
   ObjComment="Player Start Floor"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=189,OverrideDelta=14)
   OutputLinks(1)=(DrawY=210,OverrideDelta=35)
   OutputLinks(2)=(DrawY=231,OverrideDelta=56)
   VariableLinks(0)=(DrawX=418,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=336
   ObjPosY=120
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=157,OverrideDelta=14)
   InputLinks(1)=(DrawY=178,OverrideDelta=35)
   InputLinks(2)=(DrawY=199,OverrideDelta=56)
   OutputLinks(0)=(DrawY=178,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=558,OverrideDelta=16)
   VariableLinks(1)=(DrawX=609,OverrideDelta=76)
   EventLinks(0)=(DrawX=658,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=512
   ObjPosY=256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=421,OverrideDelta=14)
   OutputLinks(1)=(DrawY=442,OverrideDelta=35)
   OutputLinks(2)=(DrawY=463,OverrideDelta=56)
   VariableLinks(0)=(DrawX=418,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=336
   ObjPosY=352
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=381,OverrideDelta=14)
   InputLinks(1)=(DrawY=402,OverrideDelta=35)
   InputLinks(2)=(DrawY=423,OverrideDelta=56)
   OutputLinks(0)=(DrawY=402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=582,OverrideDelta=16)
   VariableLinks(1)=(DrawX=633,OverrideDelta=76)
   EventLinks(0)=(DrawX=682,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=544
   ObjPosY=344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=474
   SizeY=232
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=320
   ObjPosY=336
   ObjComment="Park Entrance Floor"
   DrawWidth=474
   DrawHeight=232
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=112
   ObjComment="Tall Wall Large Chamber"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=181,OverrideDelta=14)
   OutputLinks(1)=(DrawY=202,OverrideDelta=35)
   OutputLinks(2)=(DrawY=223,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1602,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=112
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=149,OverrideDelta=14)
   InputLinks(1)=(DrawY=170,OverrideDelta=35)
   InputLinks(2)=(DrawY=191,OverrideDelta=56)
   OutputLinks(0)=(DrawY=170,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=1758,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1809,OverrideDelta=76)
   EventLinks(0)=(DrawX=1858,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1720
   ObjPosY=112
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1696
   ObjPosY=248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=645,OverrideDelta=14)
   OutputLinks(1)=(DrawY=666,OverrideDelta=35)
   OutputLinks(2)=(DrawY=687,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1594,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=576
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=605,OverrideDelta=14)
   InputLinks(1)=(DrawY=626,OverrideDelta=35)
   InputLinks(2)=(DrawY=647,OverrideDelta=56)
   OutputLinks(0)=(DrawY=626,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=1750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1801,OverrideDelta=76)
   EventLinks(0)=(DrawX=1850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=568
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1696
   ObjPosY=704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=543
   SizeY=219
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1496
   ObjPosY=560
   ObjComment="Plant Room Wall"
   DrawWidth=543
   DrawHeight=219
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=816
   ObjComment="PlantRoom_Door_Ceiling"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=893,OverrideDelta=14)
   OutputLinks(1)=(DrawY=914,OverrideDelta=35)
   OutputLinks(2)=(DrawY=935,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1586,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=824
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=861,OverrideDelta=14)
   InputLinks(1)=(DrawY=882,OverrideDelta=35)
   InputLinks(2)=(DrawY=903,OverrideDelta=56)
   OutputLinks(0)=(DrawY=882,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=1750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1801,OverrideDelta=76)
   EventLinks(0)=(DrawX=1850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=96
   ObjComment="Tunnel_Center_Wall_1"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=328
   ObjComment="Tunnel_Center_Wall_2"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_5
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_2')),DrawY=-411,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-390,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-369,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=440
   ObjPosY=-480
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_5"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_9
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=-211,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-190,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-169,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=432
   ObjPosY=-280
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_9"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_10
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_3')),DrawY=-587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-566,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-545,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=-656
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_10"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_3
   Bank=AkBank'WW_ENV_BurningParis.WwiseDefaultBank_WW_ENV_BurningParis'
   InputLinks(0)=(DrawY=-596,OverrideDelta=13)
   InputLinks(1)=(DrawY=-576,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_2')),DrawY=-586,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=-632
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_3"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_2
   Bank=AkBank'WW_ENV_EvacuationPoint.WwiseDefaultBank_WW_ENV_EvacuationPoint'
   InputLinks(0)=(DrawY=-412,OverrideDelta=13)
   InputLinks(1)=(DrawY=-392,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_3')),DrawY=-402,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=-448
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_2"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_Catacombs.WwiseDefaultBank_WW_ENV_Catacombs'
   InputLinks(0)=(DrawY=-212,OverrideDelta=13)
   InputLinks(1)=(DrawY=-192,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=-202,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=-248
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_1')),DrawY=-795,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-774,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-753,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=440
   ObjPosY=-864
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_1
   Bank=AkBank'WW_ENV_Manor.WwiseDefaultBank_WW_ENV_Manor'
   InputLinks(0)=(DrawY=-812,OverrideDelta=13)
   InputLinks(1)=(DrawY=-792,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_1')),DrawY=-802,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=-848
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_1"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_1
   InputLinks(0)=(DrawY=-819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-797,OverrideDelta=36)
   InputLinks(2)=(DrawY=-775,OverrideDelta=58)
   InputLinks(3)=(DrawY=-753,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-786,OverrideDelta=47)
   VariableLinks(0)=(DrawX=885,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=-856
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_1"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_2
   InputLinks(0)=(DrawY=-619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-597,OverrideDelta=36)
   InputLinks(2)=(DrawY=-575,OverrideDelta=58)
   InputLinks(3)=(DrawY=-553,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-586,OverrideDelta=47)
   VariableLinks(0)=(DrawX=893,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=-656
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_2"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_3
   InputLinks(0)=(DrawY=-435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-413,OverrideDelta=36)
   InputLinks(2)=(DrawY=-391,OverrideDelta=58)
   InputLinks(3)=(DrawY=-369,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-402,OverrideDelta=47)
   VariableLinks(0)=(DrawX=885,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=-472
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_3"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=-219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-197,OverrideDelta=36)
   InputLinks(2)=(DrawY=-175,OverrideDelta=58)
   InputLinks(3)=(DrawY=-153,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-186,OverrideDelta=47)
   VariableLinks(0)=(DrawX=885,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=-256
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=672
   SizeY=870
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=-936
   ObjComment="Audio_Setup"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=397,OverrideDelta=14)
   OutputLinks(1)=(DrawY=418,OverrideDelta=35)
   OutputLinks(2)=(DrawY=439,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1594,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=328
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=365,OverrideDelta=14)
   InputLinks(1)=(DrawY=386,OverrideDelta=35)
   InputLinks(2)=(DrawY=407,OverrideDelta=56)
   OutputLinks(0)=(DrawY=386,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=1766,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1817,OverrideDelta=76)
   EventLinks(0)=(DrawX=1866,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1728
   ObjPosY=328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=550
   SizeY=204
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=320
   ObjComment="Large Chamber Floor"
   DrawWidth=550
   DrawHeight=204
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=1064
   ObjComment="Plantroom_Floor"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-HostileGrounds.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=1173,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1194,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1215,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1590,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=1104
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1133,OverrideDelta=14)
   InputLinks(1)=(DrawY=1154,OverrideDelta=35)
   InputLinks(2)=(DrawY=1175,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=1742,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1793,OverrideDelta=76)
   EventLinks(0)=(DrawX=1842,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=1096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawner'KF-HostileGrounds.TheWorld:PersistentLevel.KFSpawner_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=1240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=885
   SizeY=604
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1272
   ObjPosY=-880
   ObjComment="Benchmark"
   DrawWidth=885
   DrawHeight=604
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-798,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=2064,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=-832
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1576
   ObjPosY=-376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-462,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-462,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=1600,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=-496
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0'),(LinkedOp=SeqAct_ConsoleCommand'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1399,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=-768
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=CameraActor'KF-HostileGrounds.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1784
   ObjPosY=-640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=80,G=0,R=222,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.997650,OutVal=(X=644.207520,Y=237.480469,Z=-0.000092),ArriveTangent=(X=66.157639,Y=140.382431,Z=-0.000017),LeaveTangent=(X=66.157639,Y=140.382431,Z=-0.000017),InterpMode=CIM_CurveAutoClamped),(InVal=9.002378,OutVal=(X=810.675293,Y=3128.640625,Z=-0.000153),ArriveTangent=(X=65.700432,Y=23.583221,Z=-0.000014),LeaveTangent=(X=65.700432,Y=23.583221,Z=-0.000014),InterpMode=CIM_CurveAutoClamped),(InVal=11.999361,OutVal=(X=1433.581055,Y=3164.648438,Z=-0.000214),ArriveTangent=(X=316.261688,Y=0.000000,Z=-0.000015),LeaveTangent=(X=316.261688,Y=0.000000,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=17.000662,OutVal=(X=3909.691895,Y=3163.853516,Z=-0.000275),ArriveTangent=(X=24.196915,Y=-0.423645,Z=-0.000017),LeaveTangent=(X=24.196915,Y=-0.423645,Z=-0.000017),InterpMode=CIM_CurveAutoClamped),(InVal=21.011791,OutVal=(X=3952.150635,Y=912.515625,Z=-0.000366),ArriveTangent=(X=0.001967,Y=-0.007843,Z=-0.000025),LeaveTangent=(X=0.001967,Y=-0.007843,Z=-0.000025),InterpMode=CIM_CurveAutoClamped),(InVal=22.989120,OutVal=(X=3952.152588,Y=912.507813,Z=-0.000427),ArriveTangent=(X=0.001968,Y=-0.007858,Z=0.000000),LeaveTangent=(X=0.001968,Y=-0.007858,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=27.012842,OutVal=(X=5212.233887,Y=-69.980469,Z=15.999481),ArriveTangent=(X=309.646057,Y=-167.657242,Z=0.000000),LeaveTangent=(X=309.646057,Y=-167.657242,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=29.997774,OutVal=(X=6122.354492,Y=-397.439453,Z=15.999420),ArriveTangent=(X=13.803352,Y=-192.570847,Z=-0.000019),LeaveTangent=(X=13.803352,Y=-192.570847,Z=-0.000019),InterpMode=CIM_CurveAutoClamped),(InVal=35.011925,OutVal=(X=6147.045898,Y=-2762.414063,Z=15.999329),ArriveTangent=(X=0.000000,Y=-44.948776,Z=-0.000024),LeaveTangent=(X=0.000000,Y=-44.948776,Z=-0.000024),InterpMode=CIM_CurveAutoClamped),(InVal=38.999641,OutVal=(X=4390.678711,Y=-2842.732422,Z=15.999207),ArriveTangent=(X=-350.807434,Y=-13.357767,Z=0.000000),LeaveTangent=(X=-350.807434,Y=-13.357767,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=42.981594,OutVal=(X=3351.226563,Y=-2875.273438,Z=31.999146),ArriveTangent=(X=-321.195892,Y=0.000000,Z=0.000000),LeaveTangent=(X=-321.195892,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=47.012211,OutVal=(X=1817.074219,Y=-2807.054688,Z=31.999084),ArriveTangent=(X=-352.059509,Y=18.275509,Z=-0.000017),LeaveTangent=(X=-352.059509,Y=18.275509,Z=-0.000017),InterpMode=CIM_CurveAutoClamped),(InVal=50.015106,OutVal=(X=875.011719,Y=-2746.732422,Z=31.999023),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000024),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000024),InterpMode=CIM_CurveAutoClamped),(InVal=52.006325,OutVal=(X=875.013672,Y=-2746.740234,Z=31.998962),ArriveTangent=(X=0.001822,Y=0.000000,Z=-0.000026),LeaveTangent=(X=0.001822,Y=0.000000,Z=-0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=56.989941,OutVal=(X=925.070313,Y=-364.146484,Z=31.998840),ArriveTangent=(X=8.616603,Y=360.412354,Z=-0.000070),LeaveTangent=(X=8.616603,Y=360.412354,Z=-0.000070),InterpMode=CIM_CurveAutoClamped),(InVal=60.008884,OutVal=(X=945.846680,Y=418.400391,Z=-0.001221),ArriveTangent=(X=0.000000,Y=332.777008,Z=-0.000027),LeaveTangent=(X=0.000000,Y=332.777008,Z=-0.000027),InterpMode=CIM_CurveAutoClamped),(InVal=67.010338,OutVal=(X=785.506836,Y=3420.408203,Z=-0.001282),ArriveTangent=(X=-58.334251,Y=0.000000,Z=-0.000020),LeaveTangent=(X=-58.334251,Y=0.000000,Z=-0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=69.998398,OutVal=(X=82.171875,Y=3390.453125,Z=-0.001434),ArriveTangent=(X=-236.750778,Y=-0.008577,Z=-0.000145),LeaveTangent=(X=-236.750778,Y=-0.008577,Z=-0.000145),InterpMode=CIM_CurveAutoClamped),(InVal=72.008560,OutVal=(X=-397.826172,Y=3390.445313,Z=-320.001495),ArriveTangent=(X=-287.888123,Y=-0.004686,Z=-127.950836),LeaveTangent=(X=-287.888123,Y=-0.004686,Z=-127.950836),InterpMode=CIM_CurveAutoClamped),(InVal=75.000320,OutVal=(X=-1357.822266,Y=3390.429688,Z=-640.001587),ArriveTangent=(X=-29.019531,Y=-0.011932,Z=0.000000),LeaveTangent=(X=-29.019531,Y=-0.011932,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=78.991768,OutVal=(X=-1402.675781,Y=2319.402344,Z=-640.001587),InterpMode=CIM_CurveAutoClamped),(InVal=85.996582,OutVal=(X=2149.196777,Y=2455.361328,Z=-640.001587),ArriveTangent=(X=244.163757,Y=45.746140,Z=0.000000),LeaveTangent=(X=244.163757,Y=45.746140,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=92.008896,OutVal=(X=2949.200684,Y=3895.345703,Z=-640.001587),ArriveTangent=(X=173.722763,Y=0.000000,Z=0.000000),LeaveTangent=(X=173.722763,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=95.022491,OutVal=(X=3717.202637,Y=3895.337891,Z=-640.001587),ArriveTangent=(X=0.000000,Y=-0.005219,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.005219,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=100.991165,OutVal=(X=3715.438965,Y=55.341797,Z=-640.001587),ArriveTangent=(X=-0.672436,Y=-544.468201,Z=0.000000),LeaveTangent=(X=-0.672436,Y=-544.468201,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=107.995880,OutVal=(X=3667.197021,Y=-3168.259766,Z=-640.001587),ArriveTangent=(X=-20.298004,Y=-60.853271,Z=0.000000),LeaveTangent=(X=-20.298004,Y=-60.853271,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=111.002052,OutVal=(X=2774.517578,Y=-3269.300781,Z=-640.001587),ArriveTangent=(X=-291.845123,Y=-19.839811,Z=0.000000),LeaveTangent=(X=-291.845123,Y=-19.839811,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=115.000603,OutVal=(X=1622.902832,Y=-3313.291016,Z=-640.001587),ArriveTangent=(X=-279.061432,Y=-0.008942,Z=0.000000),LeaveTangent=(X=-279.061432,Y=-0.008942,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=117.995537,OutVal=(X=822.905762,Y=-3313.302734,Z=-640.001587),ArriveTangent=(X=-266.617554,Y=-0.009777,Z=0.000000),LeaveTangent=(X=-266.617554,Y=-0.009777,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=121.001686,OutVal=(X=22.908691,Y=-3633.314453,Z=-640.001587),ArriveTangent=(X=-292.567871,Y=-0.009743,Z=0.000000),LeaveTangent=(X=-292.567871,Y=-0.009743,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=124.011215,OutVal=(X=-937.088379,Y=-3633.326172,Z=-960.001587),ArriveTangent=(X=-288.237396,Y=0.000000,Z=0.000000),LeaveTangent=(X=-288.237396,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=125.997551,OutVal=(X=-1417.086426,Y=-3473.333984,Z=-960.001587),ArriveTangent=(X=0.000000,Y=110.425011,Z=0.000000),LeaveTangent=(X=0.000000,Y=110.425011,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=129.996796,OutVal=(X=-1153.084473,Y=-2865.341797,Z=-904.001587),ArriveTangent=(X=0.000000,Y=204.186050,Z=0.000000),LeaveTangent=(X=0.000000,Y=204.186050,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=132.998825,OutVal=(X=-1283.685059,Y=-2043.771484,Z=-944.001587),ArriveTangent=(X=-90.353592,Y=197.307846,Z=0.000000),LeaveTangent=(X=-90.353592,Y=197.307846,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=136.995575,OutVal=(X=-3010.080078,Y=-1484.427734,Z=-944.001587),ArriveTangent=(X=-427.662384,Y=0.000000,Z=0.000000),LeaveTangent=(X=-427.662384,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=140.003647,OutVal=(X=-4279.383789,Y=-1492.771484,Z=-944.001587),ArriveTangent=(X=-2.293625,Y=0.000000,Z=0.000000),LeaveTangent=(X=-2.293625,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=143.996170,OutVal=(X=-4282.769531,Y=-229.648438,Z=-944.001587),InterpMode=CIM_CurveAutoClamped),(InVal=148.005722,OutVal=(X=-3020.850586,Y=-296.572266,Z=-944.001587),ArriveTangent=(X=358.369904,Y=0.000000,Z=0.000000),LeaveTangent=(X=358.369904,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=150.999557,OutVal=(X=-1772.966309,Y=-287.046875,Z=-944.001587),ArriveTangent=(X=367.816498,Y=7.573483,Z=0.000000),LeaveTangent=(X=367.816498,Y=7.573483,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=154.010284,OutVal=(X=-812.273438,Y=-51.935547,Z=-944.001587),ArriveTangent=(X=315.096252,Y=131.177856,Z=0.000000),LeaveTangent=(X=315.096252,Y=131.177856,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=158.005417,OutVal=(X=434.553711,Y=869.031250,Z=-944.001587),ArriveTangent=(X=188.249344,Y=0.000000,Z=0.000000),LeaveTangent=(X=188.249344,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=160.998764,OutVal=(X=778.911621,Y=-530.033203,Z=-968.001587),ArriveTangent=(X=0.000000,Y=-467.647766,Z=0.000000),LeaveTangent=(X=0.000000,Y=-467.647766,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.989487,OutVal=(X=767.824219,Y=-2864.701172,Z=-968.001587),ArriveTangent=(X=-5.883896,Y=0.000000,Z=0.000000),LeaveTangent=(X=-5.883896,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=169.991226,OutVal=(X=-1056.062988,Y=-2858.093750,Z=-968.001587),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.997650,OutVal=(X=0.000000,Y=0.000000,Z=86.132813),InterpMode=CIM_CurveAutoClamped),(InVal=9.002378,OutVal=(X=0.000000,Y=-1.054688,Z=-90.878906),InterpMode=CIM_CurveAutoClamped),(InVal=11.999361,OutVal=(X=0.000000,Y=-0.703125,Z=1.933594),ArriveTangent=(X=0.000000,Y=0.065932,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.065932,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=17.000662,OutVal=(X=0.000000,Y=-0.527344,Z=-88.945313),ArriveTangent=(X=0.000000,Y=0.090787,Z=-10.356856),LeaveTangent=(X=0.000000,Y=0.090787,Z=-10.356856),InterpMode=CIM_CurveAutoClamped),(InVal=21.011791,OutVal=(X=0.000000,Y=5.625000,Z=-113.378906),InterpMode=CIM_CurveAutoClamped),(InVal=22.989120,OutVal=(X=0.000000,Y=2.285156,Z=-26.718750),ArriveTangent=(X=0.000000,Y=-0.125090,Z=7.460835),LeaveTangent=(X=0.000000,Y=-0.125090,Z=7.460835),InterpMode=CIM_CurveAutoClamped),(InVal=27.012842,OutVal=(X=0.000000,Y=2.109375,Z=-15.468750),ArriveTangent=(X=0.000000,Y=-0.111715,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.111715,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=29.997774,OutVal=(X=0.000000,Y=-0.878906,Z=-90.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-16.041880),LeaveTangent=(X=0.000000,Y=0.000000,Z=-16.041880),InterpMode=CIM_CurveAutoClamped),(InVal=35.011925,OutVal=(X=0.000000,Y=4.921875,Z=-143.789063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.841708),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.841708),InterpMode=CIM_CurveAutoClamped),(InVal=38.999641,OutVal=(X=0.000000,Y=0.703125,Z=-178.945313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.520449),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.520449),InterpMode=CIM_CurveAutoClamped),(InVal=42.981594,OutVal=(X=0.000000,Y=4.042969,Z=-267.187500),InterpMode=CIM_CurveAutoClamped),(InVal=47.012211,OutVal=(X=0.000000,Y=0.000000,Z=-183.867188),ArriveTangent=(X=0.000000,Y=0.000000,Z=25.116919),LeaveTangent=(X=0.000000,Y=0.000000,Z=25.116919),InterpMode=CIM_CurveAutoClamped),(InVal=50.015106,OutVal=(X=0.000000,Y=1.582031,Z=-90.527344),InterpMode=CIM_CurveAutoClamped),(InVal=52.006325,OutVal=(X=0.000000,Y=0.878906,Z=-268.417969),ArriveTangent=(X=0.000000,Y=-0.432600,Z=-0.110851),LeaveTangent=(X=0.000000,Y=-0.432600,Z=-0.110851),InterpMode=CIM_CurveAutoClamped),(InVal=56.989941,OutVal=(X=0.000000,Y=-1.757813,Z=-268.593750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.101045),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.101045),InterpMode=CIM_CurveAutoClamped),(InVal=60.008884,OutVal=(X=0.000000,Y=-1.406250,Z=-366.679688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-26.822243),LeaveTangent=(X=0.000000,Y=0.000000,Z=-26.822243),InterpMode=CIM_CurveAutoClamped),(InVal=67.010338,OutVal=(X=0.000000,Y=-1.406250,Z=-537.363281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.772840),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.772840),InterpMode=CIM_CurveAutoClamped),(InVal=69.998398,OutVal=(X=0.000000,Y=-1.406250,Z=-538.593750),InterpMode=CIM_CurveAutoClamped),(InVal=72.008560,OutVal=(X=0.000000,Y=-1.406250,Z=-538.593750),InterpMode=CIM_CurveAutoClamped),(InVal=75.000320,OutVal=(X=0.000000,Y=-2.812500,Z=-452.812500),ArriveTangent=(X=0.000000,Y=-0.302064,Z=25.197165),LeaveTangent=(X=0.000000,Y=-0.302064,Z=25.197165),InterpMode=CIM_CurveAutoClamped),(InVal=78.991768,OutVal=(X=0.000000,Y=-3.515625,Z=-362.636719),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.201591),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.201591),InterpMode=CIM_CurveAutoClamped),(InVal=85.996582,OutVal=(X=0.000000,Y=-3.515625,Z=-359.648438),InterpMode=CIM_CurveAutoClamped),(InVal=92.008896,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=95.022491,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=100.991165,OutVal=(X=0.000000,Y=0.000000,Z=-451.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.482256),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.482256),InterpMode=CIM_CurveAutoClamped),(InVal=107.995880,OutVal=(X=0.000000,Y=-2.460938,Z=-537.363281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.934332),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.934332),InterpMode=CIM_CurveAutoClamped),(InVal=111.002052,OutVal=(X=0.000000,Y=-2.460938,Z=-630.769043),InterpMode=CIM_CurveAutoClamped),(InVal=115.000603,OutVal=(X=0.000000,Y=-2.460938,Z=-542.285156),InterpMode=CIM_CurveAutoClamped),(InVal=117.995537,OutVal=(X=0.000000,Y=-2.460938,Z=-632.285156),InterpMode=CIM_CurveAutoClamped),(InVal=121.001686,OutVal=(X=0.000000,Y=-2.460938,Z=-542.285156),InterpMode=CIM_CurveAutoClamped),(InVal=124.011215,OutVal=(X=0.000000,Y=-2.460938,Z=-542.285156),InterpMode=CIM_CurveAutoClamped),(InVal=125.997551,OutVal=(X=0.000000,Y=-2.460938,Z=-542.285156),InterpMode=CIM_CurveAutoClamped),(InVal=129.996796,OutVal=(X=0.000000,Y=-2.460938,Z=-722.285156),InterpMode=CIM_CurveAutoClamped),(InVal=132.998825,OutVal=(X=0.000000,Y=0.000000,Z=-619.980469),InterpMode=CIM_CurveAutoClamped),(InVal=136.995575,OutVal=(X=0.000000,Y=-1.230469,Z=-783.457031),ArriveTangent=(X=0.000000,Y=-0.301132,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.301132,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=140.003647,OutVal=(X=0.000000,Y=-2.109375,Z=-628.242188),InterpMode=CIM_CurveAutoClamped),(InVal=143.996170,OutVal=(X=0.000000,Y=-2.109375,Z=-722.460938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-22.472198),LeaveTangent=(X=0.000000,Y=0.000000,Z=-22.472198),InterpMode=CIM_CurveAutoClamped),(InVal=148.005722,OutVal=(X=0.000000,Y=-2.109375,Z=-808.066406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.399028),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.399028),InterpMode=CIM_CurveAutoClamped),(InVal=150.999557,OutVal=(X=0.000000,Y=-0.175781,Z=-808.593750),InterpMode=CIM_CurveAutoClamped),(InVal=154.010284,OutVal=(X=0.000000,Y=-3.339844,Z=-701.367188),InterpMode=CIM_CurveAutoClamped),(InVal=158.005417,OutVal=(X=0.000000,Y=-2.988281,Z=-792.246094),ArriveTangent=(X=0.000000,Y=0.211250,Z=-9.470591),LeaveTangent=(X=0.000000,Y=0.211250,Z=-9.470591),InterpMode=CIM_CurveAutoClamped),(InVal=160.998764,OutVal=(X=0.000000,Y=0.000000,Z=-807.539063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.704695),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.704695),InterpMode=CIM_CurveAutoClamped),(InVal=165.989487,OutVal=(X=0.000000,Y=0.000000,Z=-901.054688),InterpMode=CIM_CurveAutoClamped),(InVal=169.991226,OutVal=(X=0.000000,Y=0.000000,Z=-900.527344),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.997650),(Time=9.002378),(Time=11.999361),(Time=17.000662),(Time=21.011791),(Time=22.989120),(Time=27.012842),(Time=29.997774),(Time=35.011925),(Time=38.999641),(Time=42.981594),(Time=47.012211),(Time=50.015106),(Time=52.006325),(Time=56.989941),(Time=60.008884),(Time=67.010338),(Time=69.998398),(Time=72.008560),(Time=75.000320),(Time=78.991768),(Time=85.996582),(Time=92.008896),(Time=95.022491),(Time=100.991165),(Time=107.995880),(Time=111.002052),(Time=115.000603),(Time=117.995537),(Time=121.001686),(Time=124.011215),(Time=125.997551),(Time=129.996796),(Time=132.998825),(Time=136.995575),(Time=140.003647),(Time=143.996170),(Time=148.005722),(Time=150.999557),(Time=154.010284),(Time=158.005417),(Time=160.998764),(Time=165.989487),(Time=169.991226)))
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
      InterpTracks(0)=InterpTrackMove'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="NewCameraGroup"
      GroupColor=(B=160,G=0,R=179,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=170.483673
   InterpGroups(0)=InterpGroup'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1680
   ObjPosY=-656
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-818,OverrideDelta=15)
   InputLinks(1)=(DrawY=-796,OverrideDelta=37)
   InputLinks(2)=(DrawY=-774,OverrideDelta=59)
   InputLinks(3)=(DrawY=-752,OverrideDelta=81)
   InputLinks(4)=(DrawY=-730,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-802,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-746,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=1711,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=1781,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-HostileGrounds.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1680
   ObjPosY=-856
   DrawWidth=156
   DrawHeight=173
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object
