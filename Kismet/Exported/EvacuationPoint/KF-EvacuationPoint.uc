Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=285,OverrideDelta=14)
   InputLinks(1)=(DrawY=306,OverrideDelta=35)
   InputLinks(2)=(DrawY=327,OverrideDelta=56)
   OutputLinks(0)=(DrawY=306,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=2374,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2425,OverrideDelta=76)
   EventLinks(0)=(DrawX=2474,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=248
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=277,OverrideDelta=14)
   OutputLinks(1)=(DrawY=298,OverrideDelta=35)
   OutputLinks(2)=(DrawY=319,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2178,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2096
   ObjPosY=208
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=473
   SizeY=308
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2064
   ObjPosY=184
   ObjComment="Portal Spawns - Tower 1"
   DrawWidth=473
   DrawHeight=308
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2328
   ObjPosY=416
   ObjComment="PARENT - Tower 1 Vent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=473
   SizeY=308
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2064
   ObjPosY=640
   ObjComment="Portal Spawns - Tower 2"
   DrawWidth=473
   DrawHeight=308
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=733,OverrideDelta=14)
   OutputLinks(1)=(DrawY=754,OverrideDelta=35)
   OutputLinks(2)=(DrawY=775,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2178,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2096
   ObjPosY=664
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=741,OverrideDelta=14)
   InputLinks(1)=(DrawY=762,OverrideDelta=35)
   InputLinks(2)=(DrawY=783,OverrideDelta=56)
   OutputLinks(0)=(DrawY=762,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=2374,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2425,OverrideDelta=76)
   EventLinks(0)=(DrawX=2474,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=704
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=864
   ObjComment="PARENT - Tower 2 Vent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=650
   SizeY=365
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2688
   ObjPosY=160
   ObjComment="Portal Spawns - Ferry Upper Deck Front"
   DrawWidth=650
   DrawHeight=365
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=253,OverrideDelta=14)
   OutputLinks(1)=(DrawY=274,OverrideDelta=35)
   OutputLinks(2)=(DrawY=295,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2806,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2720
   ObjPosY=184
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=261,OverrideDelta=14)
   InputLinks(1)=(DrawY=282,OverrideDelta=35)
   InputLinks(2)=(DrawY=303,OverrideDelta=56)
   OutputLinks(0)=(DrawY=282,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=2998,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3049,OverrideDelta=76)
   EventLinks(0)=(DrawX=3098,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=224
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=813,OverrideDelta=14)
   InputLinks(1)=(DrawY=834,OverrideDelta=35)
   InputLinks(2)=(DrawY=855,OverrideDelta=56)
   OutputLinks(0)=(DrawY=834,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=3062,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3113,OverrideDelta=76)
   EventLinks(0)=(DrawX=3162,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3024
   ObjPosY=776
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=805,OverrideDelta=14)
   OutputLinks(1)=(DrawY=826,OverrideDelta=35)
   OutputLinks(2)=(DrawY=847,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2866,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2784
   ObjPosY=736
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=642
   SizeY=409
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2752
   ObjPosY=712
   ObjComment="Portal Spawns - Ferry Upper Deck Back"
   DrawWidth=642
   DrawHeight=409
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=384
   ObjComment="PARENT - Upper Deck Front Vent 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3064
   ObjPosY=424
   ObjComment="CHILD"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=944
   ObjComment="PARENT - Upper Deck Back Vent 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=992
   ObjComment="CHILD - Upper Deck Back Vent 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=797,OverrideDelta=14)
   InputLinks(1)=(DrawY=818,OverrideDelta=35)
   InputLinks(2)=(DrawY=839,OverrideDelta=56)
   OutputLinks(0)=(DrawY=818,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=1134,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1185,OverrideDelta=76)
   EventLinks(0)=(DrawX=1234,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=789,OverrideDelta=14)
   OutputLinks(1)=(DrawY=810,OverrideDelta=35)
   OutputLinks(2)=(DrawY=831,OverrideDelta=56)
   VariableLinks(0)=(DrawX=942,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=856
   ObjPosY=720
   ObjName="TriggerVolume_13 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=824
   ObjPosY=696
   ObjComment="Portal Spawns - Ticketing Building Upstairs Right"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=1965,OverrideDelta=14)
   InputLinks(1)=(DrawY=1986,OverrideDelta=35)
   InputLinks(2)=(DrawY=2007,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1986,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=1094,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1145,OverrideDelta=76)
   EventLinks(0)=(DrawX=1194,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1056
   ObjPosY=1928
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=1957,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1978,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1999,OverrideDelta=56)
   VariableLinks(0)=(DrawX=902,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=1888
   ObjName="TriggerVolume_16 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=644
   SizeY=355
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=784
   ObjPosY=1864
   ObjComment="Portal Spawns - Ticketing Building Downstairs Right"
   DrawWidth=644
   DrawHeight=355
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1056
   ObjPosY=2080
   ObjComment="PARENT - Downstairs Ceiling 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1144
   ObjPosY=2112
   ObjComment="CHILD"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1208
   ObjPosY=960
   ObjComment="PARENT - Upstairs Right Ceiling Vent 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-184
   ObjPosY=976
   ObjComment="PARENT - Triage Area Wall Vent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=1032
   ObjComment="CHILD"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=1080
   ObjComment="CHILD"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=229,OverrideDelta=14)
   InputLinks(1)=(DrawY=250,OverrideDelta=35)
   InputLinks(2)=(DrawY=271,OverrideDelta=56)
   OutputLinks(0)=(DrawY=250,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-34,OverrideDelta=16)
   VariableLinks(1)=(DrawX=17,OverrideDelta=76)
   EventLinks(0)=(DrawX=66,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-72
   ObjPosY=192
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=221,OverrideDelta=14)
   OutputLinks(1)=(DrawY=242,OverrideDelta=35)
   OutputLinks(2)=(DrawY=263,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-210,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=152
   ObjName="TriggerVolume_18 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=621
   SizeY=469
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-320
   ObjPosY=128
   ObjComment="Portal Spawns - Outside Ticketing Building"
   DrawWidth=621
   DrawHeight=469
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=821,OverrideDelta=14)
   InputLinks(1)=(DrawY=842,OverrideDelta=35)
   InputLinks(2)=(DrawY=863,OverrideDelta=56)
   OutputLinks(0)=(DrawY=842,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=-50,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1,OverrideDelta=76)
   EventLinks(0)=(DrawX=50,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=813,OverrideDelta=14)
   OutputLinks(1)=(DrawY=834,OverrideDelta=35)
   OutputLinks(2)=(DrawY=855,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-202,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-288
   ObjPosY=744
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=735
   SizeY=449
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-312
   ObjPosY=720
   ObjComment="Portal Spawns - Outside Triage Area"
   DrawWidth=735
   DrawHeight=449
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=416
   ObjComment="PARENT - Outside Vent 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=40
   ObjPosY=472
   ObjComment="CHILD"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Mover Name=SeqEvent_Mover_0
   MaxWidth=148
   OutputLinks(0)=(DrawY=3365,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3387,OverrideDelta=36)
   OutputLinks(2)=(DrawY=3409,OverrideDelta=58)
   OutputLinks(3)=(DrawY=3431,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-432,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-366,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-480
   ObjPosY=3296
   ObjName="InterpActor_0 Mover"
   DrawWidth=133
   DrawHeight=216
   Name="SeqEvent_Mover_0"
   ObjectArchetype=SeqEvent_Mover'Engine.Default__SeqEvent_Mover'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bLooping=True
   InputLinks(0)=(DrawY=3310,OverrideDelta=15)
   InputLinks(1)=(DrawY=3332,OverrideDelta=37)
   InputLinks(2)=(DrawY=3354,OverrideDelta=59)
   InputLinks(3)=(DrawY=3376,OverrideDelta=81)
   InputLinks(4)=(DrawY=3398,OverrideDelta=103)
   OutputLinks(0)=(DrawY=3326,OverrideDelta=31)
   OutputLinks(1)=(DrawY=3382,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-97,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),LinkDesc="Base",MinVars=0,DrawX=-50,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="Light",MinVars=0,DrawX=-2,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=3272
   DrawWidth=158
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_4
      Name="InterpCurveEdSetup_4"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=5263.998047,Y=2895.998779,Z=463.999847),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=5263.997559,Y=2895.998535,Z=463.999817),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=5263.998047,Y=2895.998779,Z=463.999847),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=-95.405273,Y=-1.669922,Z=-73.081055),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-95.405273,Y=-1.669922,Z=11.293945),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=-95.405273,Y=-1.669922,Z=-73.081055),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackMove_1'
      GroupName="Base"
      GroupColor=(B=214,G=102,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=5263.998047,Y=2895.998779,Z=463.999847),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=5263.997070,Y=2895.998291,Z=463.999786),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=5263.998047,Y=2895.998779,Z=463.999847),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=-82.419434,Y=35.705566,Z=-249.125977),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-82.419434,Y=35.705566,Z=-164.750977),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=-82.419434,Y=35.705566,Z=-249.125977),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_4.InterpTrackMove_1'
      GroupName="Light"
      GroupColor=(B=0,G=178,R=161,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=10.000000
   InterpGroups(0)=InterpGroup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1'
   InterpGroups(1)=InterpGroup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_4'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=3472
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=3472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=734
   SizeY=1145
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-552
   ObjPosY=3048
   ObjComment="Searchlights - NO LONGER USED"
   DrawWidth=734
   DrawHeight=1145
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(DrawY=3149,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3170,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3191,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-456
   ObjPosY=3080
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8
   ObjPosY=3440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1032
   ObjPosY=1472
   ObjComment="PARENT - Inside 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=621
   SizeY=469
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=784
   ObjPosY=1256
   ObjComment="Portal Spawns - Restaurant"
   DrawWidth=621
   DrawHeight=469
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=1349,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1370,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1391,OverrideDelta=56)
   VariableLinks(0)=(DrawX=894,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=1280
   ObjName="TriggerVolume_14 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=1349,OverrideDelta=14)
   InputLinks(1)=(DrawY=1370,OverrideDelta=35)
   InputLinks(2)=(DrawY=1391,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=1078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1129,OverrideDelta=76)
   EventLinks(0)=(DrawX=1178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1040
   ObjPosY=1312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=144
   ObjPosY=504
   ObjComment="CHILD"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=4016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(DrawY=3717,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3738,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3759,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=3648
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8
   ObjPosY=4040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=1999.996948,Y=2399.998047,Z=815.999695),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1999.996826,Y=2399.997803,Z=815.999634),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=1999.996948,Y=2399.998047,Z=815.999695),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=-101.030273,Y=-1.801758,Z=-73.190918),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-101.030273,Y=-1.801758,Z=-118.190918),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=-101.030273,Y=-1.801758,Z=-73.190918),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackMove_1'
      GroupName="Base"
      GroupColor=(B=214,G=102,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=1999.996582,Y=2399.998047,Z=815.999756),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=1999.996460,Y=2399.997803,Z=815.999695),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=1999.996582,Y=2399.998047,Z=815.999756),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=-73.059082,Y=34.260864,Z=-242.556152),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-73.059082,Y=34.255371,Z=-287.556152),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=-73.059082,Y=34.260864,Z=-242.556152),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000),(Time=10.000000)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_4.InterpTrackMove_1'
      GroupName="Light"
      GroupColor=(B=0,G=178,R=161,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=10.000000
   InterpGroups(0)=InterpGroup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1'
   InterpGroups(1)=InterpGroup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-64
   ObjPosY=4040
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bLooping=True
   InputLinks(0)=(DrawY=3878,OverrideDelta=15)
   InputLinks(1)=(DrawY=3900,OverrideDelta=37)
   InputLinks(2)=(DrawY=3922,OverrideDelta=59)
   InputLinks(3)=(DrawY=3944,OverrideDelta=81)
   InputLinks(4)=(DrawY=3966,OverrideDelta=103)
   OutputLinks(0)=(DrawY=3894,OverrideDelta=31)
   OutputLinks(1)=(DrawY=3950,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=-33,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),LinkDesc="Base",MinVars=0,DrawX=14,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),LinkDesc="Light",MinVars=0,DrawX=62,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-64
   ObjPosY=3840
   DrawWidth=158
   DrawHeight=157
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Mover Name=SeqEvent_Mover_1
   MaxWidth=148
   OutputLinks(0)=(DrawY=3933,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3955,OverrideDelta=36)
   OutputLinks(2)=(DrawY=3977,OverrideDelta=58)
   OutputLinks(3)=(DrawY=3999,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-368,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-302,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-416
   ObjPosY=3864
   ObjName="InterpActor_0 Mover"
   DrawWidth=133
   DrawHeight=216
   Name="SeqEvent_Mover_1"
   ObjectArchetype=SeqEvent_Mover'Engine.Default__SeqEvent_Mover'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFSpawner'KF-EvacuationPoint.TheWorld:PersistentLevel.KFSpawner_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1144
   ObjPosY=392
   ObjComment="PARENT - Upstairs Right Ceiling Vent 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=136
   ObjComment="Portal Spawns - Office Building"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=229,OverrideDelta=14)
   OutputLinks(1)=(DrawY=250,OverrideDelta=35)
   OutputLinks(2)=(DrawY=271,OverrideDelta=56)
   VariableLinks(0)=(DrawX=930,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=160
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=237,OverrideDelta=14)
   InputLinks(1)=(DrawY=258,OverrideDelta=35)
   InputLinks(2)=(DrawY=279,OverrideDelta=56)
   OutputLinks(0)=(DrawY=258,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=1126,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1177,OverrideDelta=76)
   EventLinks(0)=(DrawX=1226,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1088
   ObjPosY=200
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   InputLinks(0)=(DrawY=3022,OverrideDelta=15)
   InputLinks(1)=(DrawY=3044,OverrideDelta=37)
   InputLinks(2)=(DrawY=3066,OverrideDelta=59)
   InputLinks(3)=(DrawY=3088,OverrideDelta=81)
   InputLinks(4)=(DrawY=3110,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=3038,OverrideDelta=31)
   OutputLinks(1)=(DrawY=3094,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=1217,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="FlythroughCamera",MinVars=0,DrawX=1284,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=2984
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAuto),(InVal=2.668726,OutVal=(X=464.000244,Y=-0.000977,Z=-0.000061),ArriveTangent=(X=187.532990,Y=-0.000477,Z=-0.000030),LeaveTangent=(X=187.532990,Y=-0.000477,Z=-0.000030),InterpMode=CIM_CurveAuto),(InVal=5.119102,OutVal=(X=960.000610,Y=-0.002441,Z=-0.000153),ArriveTangent=(X=190.902863,Y=36.205296,Z=-0.000025),LeaveTangent=(X=190.902863,Y=36.205296,Z=-0.000025),InterpMode=CIM_CurveAuto),(InVal=7.529840,OutVal=(X=1392.000732,Y=175.997070,Z=-0.000183),ArriveTangent=(X=271.263824,Y=38.751640,Z=-0.000020),LeaveTangent=(X=271.263824,Y=38.751640,Z=-0.000020),InterpMode=CIM_CurveAuto),(InVal=9.660808,OutVal=(X=2192.000977,Y=175.996094,Z=-0.000244),ArriveTangent=(X=421.520264,Y=-0.000515,Z=-0.000032),LeaveTangent=(X=421.520264,Y=-0.000515,Z=-0.000032),InterpMode=CIM_CurveAuto),(InVal=12.274570,OutVal=(X=3392.000977,Y=175.994629,Z=-0.000336),ArriveTangent=(X=347.398651,Y=-0.000353,Z=-0.000022),LeaveTangent=(X=347.398651,Y=-0.000353,Z=-0.000022),InterpMode=CIM_CurveAuto),(InVal=15.187599,OutVal=(X=4112.000977,Y=175.994141,Z=-0.000366),ArriveTangent=(X=332.479675,Y=-0.000335,Z=-0.000021),LeaveTangent=(X=332.479675,Y=-0.000335,Z=-0.000021),InterpMode=CIM_CurveAuto),(InVal=18.097483,OutVal=(X=5328.000977,Y=175.992676,Z=-0.000458),ArriveTangent=(X=310.487213,Y=-68.997566,Z=-0.000025),LeaveTangent=(X=310.487213,Y=-68.997566,Z=-0.000025),InterpMode=CIM_CurveAuto),(InVal=21.216833,OutVal=(X=5984.000977,Y=-240.008301,Z=-0.000519),ArriveTangent=(X=109.988106,Y=-232.475159,Z=-0.000019),LeaveTangent=(X=109.988106,Y=-232.475159,Z=-0.000019),InterpMode=CIM_CurveAuto),(InVal=24.498175,OutVal=(X=6032.000977,Y=-1312.009277,Z=-0.000580),ArriveTangent=(X=-31.930805,Y=-351.239319,Z=24.562130),LeaveTangent=(X=-31.930805,Y=-351.239319,Z=24.562130),InterpMode=CIM_CurveAuto),(InVal=27.730919,OutVal=(X=5776.000977,Y=-2528.011230,Z=159.999298),ArriveTangent=(X=-103.158455,Y=-232.706711,Z=23.990311),LeaveTangent=(X=-103.158455,Y=-232.706711,Z=23.990311),InterpMode=CIM_CurveAuto),(InVal=31.167526,OutVal=(X=5344.000977,Y=-2864.012207,Z=159.999237),ArriveTangent=(X=-81.205368,Y=64.963943,Z=-0.000022),LeaveTangent=(X=-81.205368,Y=64.963943,Z=-0.000022),InterpMode=CIM_CurveAuto),(InVal=34.627014,OutVal=(X=5216.000977,Y=-2080.013672,Z=159.999146),ArriveTangent=(X=-153.059158,Y=87.125626,Z=-0.000022),LeaveTangent=(X=-153.059158,Y=87.125626,Z=-0.000022),InterpMode=CIM_CurveAuto),(InVal=37.962284,OutVal=(X=4304.000977,Y=-2272.014648,Z=159.999084),ArriveTangent=(X=-286.697296,Y=61.988289,Z=-0.000020),LeaveTangent=(X=-286.697296,Y=61.988289,Z=-0.000020),InterpMode=CIM_CurveAuto),(InVal=40.821701,OutVal=(X=3440.000977,Y=-1696.015625,Z=159.999023),ArriveTangent=(X=-272.679321,Y=24.788729,Z=-0.000019),LeaveTangent=(X=-272.679321,Y=24.788729,Z=-0.000019),InterpMode=CIM_CurveAuto),(InVal=44.416752,OutVal=(X=2544.000977,Y=-2112.016602,Z=159.998962),ArriveTangent=(X=-343.716370,Y=-56.561260,Z=-0.000021),LeaveTangent=(X=-343.716370,Y=-56.561260,Z=-0.000021),InterpMode=CIM_CurveAuto),(InVal=48.176601,OutVal=(X=912.001221,Y=-2112.018066,Z=159.998871),ArriveTangent=(X=-195.213348,Y=148.018631,Z=-0.000020),LeaveTangent=(X=-195.213348,Y=148.018631,Z=-0.000020),InterpMode=CIM_CurveAuto),(InVal=51.875256,OutVal=(X=1088.001465,Y=-1008.019043,Z=159.998810),ArriveTangent=(X=118.403076,Y=185.676971,Z=-0.000026),LeaveTangent=(X=118.403076,Y=185.676971,Z=-0.000026),InterpMode=CIM_CurveAuto),(InVal=54.122398,OutVal=(X=1616.001831,Y=-1008.020508,Z=159.998718),ArriveTangent=(X=142.904587,Y=-96.305817,Z=-0.000041),LeaveTangent=(X=142.904587,Y=-96.305817,Z=-0.000041),InterpMode=CIM_CurveAuto),(InVal=57.025551,OutVal=(X=1824.002319,Y=-1504.022461,Z=159.998596),ArriveTangent=(X=109.352562,Y=-197.368423,Z=-0.000036),LeaveTangent=(X=109.352562,Y=-197.368423,Z=-0.000036),InterpMode=CIM_CurveAuto),(InVal=60.121349,OutVal=(X=2272.002441,Y=-2192.023926,Z=159.998505),ArriveTangent=(X=161.469864,Y=-99.188972,Z=-0.000022),LeaveTangent=(X=161.469864,Y=-99.188972,Z=-0.000022),InterpMode=CIM_CurveAuto),(InVal=63.961830,OutVal=(X=2944.002441,Y=-2192.024902,Z=159.998444),ArriveTangent=(X=101.324913,Y=-74.787735,Z=26.537455),LeaveTangent=(X=101.324913,Y=-74.787735,Z=26.537455),InterpMode=CIM_CurveAuto),(InVal=66.753479,OutVal=(X=2944.002441,Y=-2688.025879,Z=335.998352),ArriveTangent=(X=4.681890,Y=-194.298721,Z=70.228325),LeaveTangent=(X=4.681890,Y=-194.298721,Z=70.228325),InterpMode=CIM_CurveAuto),(InVal=70.796677,OutVal=(X=2976.002441,Y=-3520.026855,Z=639.998291),ArriveTangent=(X=142.866348,Y=-88.241241,Z=39.918530),LeaveTangent=(X=142.866348,Y=-88.241241,Z=39.918530),InterpMode=CIM_CurveAuto),(InVal=74.368988,OutVal=(X=4032.002441,Y=-3360.027832,Z=639.998291),ArriveTangent=(X=184.441986,Y=177.437576,Z=0.000000),LeaveTangent=(X=184.441986,Y=177.437576,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=77.649780,OutVal=(X=4240.002441,Y=-2304.028809,Z=639.998291),ArriveTangent=(X=-43.899864,Y=221.809570,Z=0.000000),LeaveTangent=(X=-43.899864,Y=221.809570,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=81.293839,OutVal=(X=3728.002441,Y=-1824.029785,Z=639.998291),ArriveTangent=(X=-113.666054,Y=127.038261,Z=0.000000),LeaveTangent=(X=-113.666054,Y=127.038261,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=84.828705,OutVal=(X=3424.002441,Y=-1392.030762,Z=639.998291),ArriveTangent=(X=-43.039459,Y=131.383270,Z=0.000000),LeaveTangent=(X=-43.039459,Y=131.383270,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=88.357124,OutVal=(X=3424.002441,Y=-896.032227,Z=639.998291),ArriveTangent=(X=0.000000,Y=160.717102,Z=0.000000),LeaveTangent=(X=0.000000,Y=160.717102,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=92.792992,OutVal=(X=3424.002441,Y=-112.033691,Z=639.998291),ArriveTangent=(X=0.000000,Y=172.684998,Z=0.000000),LeaveTangent=(X=0.000000,Y=172.684998,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=96.973953,OutVal=(X=3424.002441,Y=591.964844,Z=639.998291),ArriveTangent=(X=11.314510,Y=111.259064,Z=0.000000),LeaveTangent=(X=11.314510,Y=111.259064,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=101.277672,OutVal=(X=3520.002441,Y=831.963867,Z=639.998291),ArriveTangent=(X=92.759682,Y=30.919641,Z=0.000000),LeaveTangent=(X=92.759682,Y=30.919641,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=104.735947,OutVal=(X=4144.002441,Y=831.962891,Z=639.998291),ArriveTangent=(X=148.435333,Y=-0.000270,Z=0.000000),LeaveTangent=(X=148.435333,Y=-0.000270,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=108.499672,OutVal=(X=4592.002441,Y=831.961914,Z=639.998291),ArriveTangent=(X=267.744202,Y=-0.000383,Z=0.000000),LeaveTangent=(X=267.744202,Y=-0.000383,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=112.385040,OutVal=(X=6192.002930,Y=831.959961,Z=639.998291),ArriveTangent=(X=378.654022,Y=35.019550,Z=0.000000),LeaveTangent=(X=378.654022,Y=35.019550,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=115.809776,OutVal=(X=7360.002930,Y=1087.958496,Z=639.998291),ArriveTangent=(X=326.866730,Y=39.922195,Z=0.000000),LeaveTangent=(X=326.866730,Y=39.922195,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=118.797440,OutVal=(X=8288.002930,Y=1087.957031,Z=639.998291),ArriveTangent=(X=123.996902,Y=-121.414032,Z=0.000000),LeaveTangent=(X=123.996902,Y=-121.414032,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=122.003479,OutVal=(X=8128.002930,Y=335.956055,Z=639.998291),ArriveTangent=(X=117.200188,Y=-127.391815,Z=0.000000),LeaveTangent=(X=117.200188,Y=-127.391815,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=125.077293,OutVal=(X=9024.002930,Y=287.955078,Z=639.998291),ArriveTangent=(X=124.121216,Y=-240.147888,Z=0.000000),LeaveTangent=(X=124.121216,Y=-240.147888,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=127.933167,OutVal=(X=8864.002930,Y=-1088.045898,Z=639.998291),ArriveTangent=(X=-48.018124,Y=-418.040466,Z=0.000000),LeaveTangent=(X=-48.018124,Y=-418.040466,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=130.741821,OutVal=(X=8752.002930,Y=-2080.046875,Z=639.998291),ArriveTangent=(X=-205.726044,Y=-171.208588,Z=-55.228466),LeaveTangent=(X=-205.726044,Y=-171.208588,Z=-55.228466),InterpMode=CIM_CurveAuto),(InVal=133.727280,OutVal=(X=7672.002930,Y=-2080.047852,Z=319.998291),ArriveTangent=(X=-176.902084,Y=193.936783,Z=-52.415443),LeaveTangent=(X=-176.902084,Y=193.936783,Z=-52.415443),InterpMode=CIM_CurveAuto),(InVal=136.846893,OutVal=(X=7672.002930,Y=-896.048828,Z=319.998230),ArriveTangent=(X=-104.140480,Y=297.889923,Z=-0.000018),LeaveTangent=(X=-104.140480,Y=297.889923,Z=-0.000018),InterpMode=CIM_CurveAuto),(InVal=140.333740,OutVal=(X=6984.002930,Y=-112.049805,Z=319.998169),ArriveTangent=(X=-109.027496,Y=260.518066,Z=-0.000018),LeaveTangent=(X=-109.027496,Y=260.518066,Z=-0.000018),InterpMode=CIM_CurveAuto),(InVal=143.817612,OutVal=(X=6912.002930,Y=919.949219,Z=319.998108),ArriveTangent=(X=-112.908730,Y=274.907928,Z=-0.000019),LeaveTangent=(X=-112.908730,Y=274.907928,Z=-0.000019),InterpMode=CIM_CurveAuto),(InVal=146.852280,OutVal=(X=6248.002930,Y=1679.948242,Z=319.998047),ArriveTangent=(X=5.326249,Y=139.813721,Z=-0.000020),LeaveTangent=(X=5.326249,Y=139.813721,Z=-0.000020),InterpMode=CIM_CurveAuto),(InVal=149.825592,OutVal=(X=6944.002930,Y=1759.947266,Z=319.997986),ArriveTangent=(X=253.559845,Y=1.293278,Z=51.746887),LeaveTangent=(X=253.559845,Y=1.293278,Z=51.746887),InterpMode=CIM_CurveAuto),(InVal=153.036224,OutVal=(X=7816.002930,Y=1687.945801,Z=639.997925),ArriveTangent=(X=219.517990,Y=-14.831458,Z=65.703629),LeaveTangent=(X=219.517990,Y=-14.831458,Z=65.703629),InterpMode=CIM_CurveAuto),(InVal=155.034576,OutVal=(X=8087.468750,Y=1682.690430,Z=662.247192),ArriveTangent=(X=293.215515,Y=-0.000163,Z=18.659168),LeaveTangent=(X=293.215515,Y=-0.000163,Z=18.659168),InterpMode=CIM_CurveAuto),(InVal=159.038635,OutVal=(X=9576.002930,Y=1687.944824,Z=751.997925),ArriveTangent=(X=222.294876,Y=54.523682,Z=13.697673),LeaveTangent=(X=222.294876,Y=54.523682,Z=13.697673),InterpMode=CIM_CurveAuto),(InVal=161.586838,OutVal=(X=9544.002930,Y=2039.943848,Z=751.997925),ArriveTangent=(X=-197.598495,Y=61.400391,Z=17.862011),LeaveTangent=(X=-197.598495,Y=61.400391,Z=17.862011),InterpMode=CIM_CurveAuto),(InVal=166.204681,OutVal=(X=8160.002930,Y=2127.942871,Z=879.997925),ArriveTangent=(X=-187.225235,Y=66.015564,Z=17.315628),LeaveTangent=(X=-187.225235,Y=66.015564,Z=17.315628),InterpMode=CIM_CurveAuto),(InVal=168.979004,OutVal=(X=8160.002930,Y=2527.941895,Z=879.997925),ArriveTangent=(X=127.943710,Y=129.210022,Z=0.000000),LeaveTangent=(X=127.943710,Y=129.210022,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=172.519958,OutVal=(X=8968.002930,Y=2943.939941,Z=879.997925),ArriveTangent=(X=92.976494,Y=70.882736,Z=0.000000),LeaveTangent=(X=92.976494,Y=70.882736,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=177.669373,OutVal=(X=8968.002930,Y=3143.938965,Z=879.997925),ArriveTangent=(X=0.000000,Y=81.988792,Z=0.000000),LeaveTangent=(X=0.000000,Y=81.988792,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=182.667664,OutVal=(X=8968.002930,Y=3775.937988,Z=879.997925),ArriveTangent=(X=-133.960022,Y=78.498665,Z=0.000000),LeaveTangent=(X=-133.960022,Y=78.498665,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=187.045303,OutVal=(X=7712.002930,Y=3879.937012,Z=879.997925),ArriveTangent=(X=-296.359467,Y=15.227670,Z=0.000000),LeaveTangent=(X=-296.359467,Y=15.227670,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=189.497208,OutVal=(X=6944.002930,Y=3879.936035,Z=879.997925),ArriveTangent=(X=-309.748688,Y=-30.668562,Z=0.000000),LeaveTangent=(X=-309.748688,Y=-30.668562,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=192.262436,OutVal=(X=6096.002930,Y=3719.935059,Z=879.997925),ArriveTangent=(X=-293.943665,Y=-19.052320,Z=0.000000),LeaveTangent=(X=-293.943665,Y=-19.052320,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=195.375885,OutVal=(X=5216.002930,Y=3767.933594,Z=879.997925),ArriveTangent=(X=-258.739563,Y=45.659504,Z=0.000000),LeaveTangent=(X=-258.739563,Y=45.659504,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=198.044312,OutVal=(X=4600.002930,Y=3983.932617,Z=879.997925),ArriveTangent=(X=-226.673538,Y=-34.265007,Z=0.000000),LeaveTangent=(X=-226.673538,Y=-34.265007,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=201.446289,OutVal=(X=3840.002930,Y=3559.931152,Z=879.997925),ArriveTangent=(X=-153.010498,Y=-117.226158,Z=0.000000),LeaveTangent=(X=-153.010498,Y=-117.226158,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=204.527527,OutVal=(X=3608.002930,Y=3223.930176,Z=879.997925),ArriveTangent=(X=84.124634,Y=-54.357769,Z=0.000000),LeaveTangent=(X=84.124634,Y=-54.357769,Z=0.000000),InterpMode=CIM_CurveAuto),(InVal=207.627594,OutVal=(X=4360.002930,Y=3223.929199,Z=879.997925),ArriveTangent=(X=217.620163,Y=-0.000418,Z=-26.004925),LeaveTangent=(X=217.620163,Y=-0.000418,Z=-26.004925),InterpMode=CIM_CurveAuto),(InVal=210.372574,OutVal=(X=4880.002930,Y=3223.927734,Z=727.997925),ArriveTangent=(X=113.000221,Y=59.107277,Z=-33.030834),LeaveTangent=(X=113.000221,Y=59.107277,Z=-33.030834),InterpMode=CIM_CurveAuto),(InVal=212.229355,OutVal=(X=4880.002930,Y=3495.926758,Z=727.997925),ArriveTangent=(X=-152.276505,Y=63.918072,Z=-39.479095),LeaveTangent=(X=-152.276505,Y=63.918072,Z=-39.479095),InterpMode=CIM_CurveAuto),(InVal=214.627991,OutVal=(X=4232.002930,Y=3495.925781,Z=559.997925),ArriveTangent=(X=-144.663696,Y=-44.649723,Z=-37.505402),LeaveTangent=(X=-144.663696,Y=-44.649723,Z=-37.505402),InterpMode=CIM_CurveAuto),(InVal=216.708710,OutVal=(X=4232.002930,Y=3295.924805,Z=559.997925),ArriveTangent=(X=162.926468,Y=-46.818405,Z=-37.454361),LeaveTangent=(X=162.926468,Y=-46.818405,Z=-37.454361),InterpMode=CIM_CurveAuto),(InVal=218.899857,OutVal=(X=4928.002930,Y=3295.923828,Z=399.997925),ArriveTangent=(X=137.128662,Y=46.911995,Z=-36.086491),LeaveTangent=(X=137.128662,Y=46.911995,Z=-36.086491),InterpMode=CIM_CurveAuto),(InVal=221.142502,OutVal=(X=4840.002930,Y=3503.922852,Z=399.997925),ArriveTangent=(X=-151.533447,Y=25.583088,Z=-35.423401),LeaveTangent=(X=-151.533447,Y=25.583088,Z=-35.423401),InterpMode=CIM_CurveAuto),(InVal=222.964966,OutVal=(X=4312.002930,Y=3399.921875,Z=255.997925),ArriveTangent=(X=-234.490311,Y=-26.279579,Z=-36.386444),LeaveTangent=(X=-234.490311,Y=-26.279579,Z=-36.386444),InterpMode=CIM_CurveAuto),(InVal=225.100021,OutVal=(X=3912.002930,Y=3399.920898,Z=255.997864),ArriveTangent=(X=-94.568886,Y=79.437401,Z=-0.000029),LeaveTangent=(X=-94.568886,Y=79.437401,Z=-0.000029),InterpMode=CIM_CurveAuto),(InVal=227.194687,OutVal=(X=3912.002930,Y=3735.919922,Z=255.997803),ArriveTangent=(X=159.846191,Y=103.429428,Z=-0.000029),LeaveTangent=(X=159.846191,Y=103.429428,Z=-0.000029),InterpMode=CIM_CurveAuto),(InVal=229.354111,OutVal=(X=4592.002930,Y=3839.918945,Z=255.997742),ArriveTangent=(X=292.927155,Y=21.636259,Z=-0.000025),LeaveTangent=(X=292.927155,Y=21.636259,Z=-0.000025),InterpMode=CIM_CurveAuto),(InVal=232.001343,OutVal=(X=5320.002930,Y=3839.917969,Z=255.997681),ArriveTangent=(X=256.759796,Y=-73.544655,Z=-0.000025),LeaveTangent=(X=256.759796,Y=-73.544655,Z=-0.000025),InterpMode=CIM_CurveAuto),(InVal=235.554459,OutVal=(X=6184.002930,Y=3383.916504,Z=255.997589),ArriveTangent=(X=24.498356,Y=-154.726852,Z=-2.578799),LeaveTangent=(X=24.498356,Y=-154.726852,Z=-2.578799),InterpMode=CIM_CurveAuto),(InVal=238.205841,OutVal=(X=5472.002930,Y=2879.915527,Z=239.997528),ArriveTangent=(X=-371.853027,Y=-96.244583,Z=-2.916511),LeaveTangent=(X=-371.853027,Y=-96.244583,Z=-2.916511),InterpMode=CIM_CurveAuto),(InVal=241.040497,OutVal=(X=4144.002930,Y=2855.915039,Z=239.997498),ArriveTangent=(X=-454.824554,Y=81.939453,Z=-0.000014),LeaveTangent=(X=-454.824554,Y=81.939453,Z=-0.000014),InterpMode=CIM_CurveAuto),(InVal=244.942505,OutVal=(X=2408.002930,Y=3431.914063,Z=239.997437),ArriveTangent=(X=-413.887634,Y=114.691406,Z=-0.000023),LeaveTangent=(X=-413.887634,Y=114.691406,Z=-0.000023),InterpMode=CIM_CurveAuto),(InVal=249.061996,OutVal=(X=824.003357,Y=3775.912109,Z=239.997314),ArriveTangent=(X=-377.521423,Y=45.218071,Z=-0.000024),LeaveTangent=(X=-377.521423,Y=45.218071,Z=-0.000024),InterpMode=CIM_CurveAuto),(InVal=252.550018,OutVal=(X=-463.996338,Y=3775.911133,Z=239.997253),ArriveTangent=(X=-309.587311,Y=-0.000287,Z=-22.365646),LeaveTangent=(X=-309.587311,Y=-0.000287,Z=-22.365646),InterpMode=CIM_CurveAuto),(InVal=255.858139,OutVal=(X=-1279.995972,Y=3775.910156,Z=87.997192),ArriveTangent=(X=-150.515762,Y=-161.440689,Z=-23.062931),LeaveTangent=(X=-150.515762,Y=-161.440689,Z=-23.062931),InterpMode=CIM_CurveAuto),(InVal=259.140686,OutVal=(X=-1455.995728,Y=2711.909180,Z=87.997131),ArriveTangent=(X=17.911161,Y=-258.432220,Z=12.793639),LeaveTangent=(X=17.911161,Y=-258.432220,Z=12.793639),InterpMode=CIM_CurveAuto),(InVal=262.111237,OutVal=(X=-1167.995728,Y=2159.908203,Z=167.997070),ArriveTangent=(X=121.510826,Y=-214.090790,Z=11.572442),LeaveTangent=(X=121.510826,Y=-214.090790,Z=11.572442),InterpMode=CIM_CurveAuto),(InVal=266.053650,OutVal=(X=-615.995728,Y=1231.907227,Z=167.997009),InterpMode=CIM_CurveAuto)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAuto),(InVal=2.668726,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.790604),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.790604),InterpMode=CIM_CurveAuto),(InVal=5.119102,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.514277),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.514277),InterpMode=CIM_CurveAuto),(InVal=7.529840,ArriveTangent=(X=0.000000,Y=0.000000,Z=9.908173),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.908173),InterpMode=CIM_CurveAuto),(InVal=9.660808,ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.226307),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.226307),InterpMode=CIM_CurveAuto),(InVal=12.274570,OutVal=(X=0.000000,Y=0.000000,Z=-67.500000),InterpMode=CIM_CurveAuto),(InVal=15.187599,ArriveTangent=(X=0.000000,Y=0.000000,Z=7.728092),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.728092),InterpMode=CIM_CurveAuto),(InVal=18.097483,OutVal=(X=0.000000,Y=0.000000,Z=-22.500000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.994315),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.994315),InterpMode=CIM_CurveAuto),(InVal=21.216833,OutVal=(X=0.000000,Y=0.000000,Z=-84.375000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.666924),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.666924),InterpMode=CIM_CurveAuto),(InVal=24.498175,OutVal=(X=0.000000,Y=0.000000,Z=-84.375000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.771620),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.771620),InterpMode=CIM_CurveAuto),(InVal=27.730919,OutVal=(X=0.000000,Y=0.000000,Z=-135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.337976),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.337976),InterpMode=CIM_CurveAuto),(InVal=31.167526,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.525432),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.525432),InterpMode=CIM_CurveAuto),(InVal=34.627014,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAuto),(InVal=37.962284,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.528580),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.528580),InterpMode=CIM_CurveAuto),(InVal=40.821701,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=27.887659),LeaveTangent=(X=0.000000,Y=0.000000,Z=27.887659),InterpMode=CIM_CurveAuto),(InVal=44.416752,ArriveTangent=(X=0.000000,Y=0.000000,Z=24.473478),LeaveTangent=(X=0.000000,Y=0.000000,Z=24.473478),InterpMode=CIM_CurveAuto),(InVal=48.176601,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.066764),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.066764),InterpMode=CIM_CurveAuto),(InVal=51.875256,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-15.136744),LeaveTangent=(X=0.000000,Y=0.000000,Z=-15.136744),InterpMode=CIM_CurveAuto),(InVal=54.122398,ArriveTangent=(X=0.000000,Y=0.000000,Z=-26.212090),LeaveTangent=(X=0.000000,Y=0.000000,Z=-26.212090),InterpMode=CIM_CurveAuto),(InVal=57.025551,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),InterpMode=CIM_CurveAuto),(InVal=60.121349,InterpMode=CIM_CurveAuto),(InVal=63.961830,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-13.570301),LeaveTangent=(X=0.000000,Y=0.000000,Z=-13.570301),InterpMode=CIM_CurveAuto),(InVal=66.753479,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.583908),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.583908),InterpMode=CIM_CurveAuto),(InVal=70.796677,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=23.635977),LeaveTangent=(X=0.000000,Y=0.000000,Z=23.635977),InterpMode=CIM_CurveAuto),(InVal=74.368988,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=39.398209),LeaveTangent=(X=0.000000,Y=0.000000,Z=39.398209),InterpMode=CIM_CurveAuto),(InVal=77.649780,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.498335),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.498335),InterpMode=CIM_CurveAuto),(InVal=81.293839,OutVal=(X=0.000000,Y=0.000000,Z=135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-12.536697),LeaveTangent=(X=0.000000,Y=0.000000,Z=-12.536697),InterpMode=CIM_CurveAuto),(InVal=84.828705,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-19.112917),LeaveTangent=(X=0.000000,Y=0.000000,Z=-19.112917),InterpMode=CIM_CurveAuto),(InVal=88.357124,ArriveTangent=(X=0.000000,Y=0.000000,Z=11.300447),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.300447),InterpMode=CIM_CurveAuto),(InVal=92.792992,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=20.889355),LeaveTangent=(X=0.000000,Y=0.000000,Z=20.889355),InterpMode=CIM_CurveAuto),(InVal=96.973953,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.214706),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.214706),InterpMode=CIM_CurveAuto),(InVal=101.277672,ArriveTangent=(X=0.000000,Y=0.000000,Z=-34.784882),LeaveTangent=(X=0.000000,Y=0.000000,Z=-34.784882),InterpMode=CIM_CurveAuto),(InVal=104.735947,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.461922),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.461922),InterpMode=CIM_CurveAuto),(InVal=108.499672,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=23.532200),LeaveTangent=(X=0.000000,Y=0.000000,Z=23.532200),InterpMode=CIM_CurveAuto),(InVal=112.385040,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAuto),(InVal=115.809776,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.035308),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.035308),InterpMode=CIM_CurveAuto),(InVal=118.797440,ArriveTangent=(X=0.000000,Y=0.000000,Z=-29.061775),LeaveTangent=(X=0.000000,Y=0.000000,Z=-29.061775),InterpMode=CIM_CurveAuto),(InVal=122.003479,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.497316),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.497316),InterpMode=CIM_CurveAuto),(InVal=125.077293,OutVal=(X=0.000000,Y=0.000000,Z=-135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-15.177866),LeaveTangent=(X=0.000000,Y=0.000000,Z=-15.177866),InterpMode=CIM_CurveAuto),(InVal=127.933167,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.944175),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.944175),InterpMode=CIM_CurveAuto),(InVal=130.741821,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-15.533007),LeaveTangent=(X=0.000000,Y=0.000000,Z=-15.533007),InterpMode=CIM_CurveAuto),(InVal=133.727280,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-22.112761),LeaveTangent=(X=0.000000,Y=0.000000,Z=-22.112761),InterpMode=CIM_CurveAuto),(InVal=136.846893,OutVal=(X=0.000000,Y=0.000000,Z=-315.000000),InterpMode=CIM_CurveAuto),(InVal=140.333740,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.455575),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.455575),InterpMode=CIM_CurveAuto),(InVal=143.817612,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.806774),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.806774),InterpMode=CIM_CurveAuto),(InVal=146.852280,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=29.960152),LeaveTangent=(X=0.000000,Y=0.000000,Z=29.960152),InterpMode=CIM_CurveAuto),(InVal=149.825592,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=29.107635),LeaveTangent=(X=0.000000,Y=0.000000,Z=29.107635),InterpMode=CIM_CurveAuto),(InVal=153.036224,ArriveTangent=(X=0.000000,Y=0.000000,Z=16.771652),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.771652),InterpMode=CIM_CurveAuto),(InVal=155.034576,OutVal=(X=0.000000,Y=0.000000,Z=-2.636719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.496987),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.496987),InterpMode=CIM_CurveAuto),(InVal=159.038635,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.138129),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.138129),InterpMode=CIM_CurveAuto),(InVal=161.586838,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=31.398066),LeaveTangent=(X=0.000000,Y=0.000000,Z=31.398066),InterpMode=CIM_CurveAuto),(InVal=166.204681,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAuto),(InVal=168.979004,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-35.627892),LeaveTangent=(X=0.000000,Y=0.000000,Z=-35.627892),InterpMode=CIM_CurveAuto),(InVal=172.519958,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.178146),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.178146),InterpMode=CIM_CurveAuto),(InVal=177.669373,OutVal=(X=0.000000,Y=0.000000,Z=45.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=22.172501),LeaveTangent=(X=0.000000,Y=0.000000,Z=22.172501),InterpMode=CIM_CurveAuto),(InVal=182.667664,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=19.198093),LeaveTangent=(X=0.000000,Y=0.000000,Z=19.198093),InterpMode=CIM_CurveAuto),(InVal=187.045303,OutVal=(X=0.000000,Y=0.000000,Z=225.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.178039),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.178039),InterpMode=CIM_CurveAuto),(InVal=189.497208,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.625427),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.625427),InterpMode=CIM_CurveAuto),(InVal=192.262436,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-15.309566),LeaveTangent=(X=0.000000,Y=0.000000,Z=-15.309566),InterpMode=CIM_CurveAuto),(InVal=195.375885,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-15.565884),LeaveTangent=(X=0.000000,Y=0.000000,Z=-15.565884),InterpMode=CIM_CurveAuto),(InVal=198.044312,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAuto),(InVal=201.446289,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=27.764002),LeaveTangent=(X=0.000000,Y=0.000000,Z=27.764002),InterpMode=CIM_CurveAuto),(InVal=204.527527,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=29.120064),LeaveTangent=(X=0.000000,Y=0.000000,Z=29.120064),InterpMode=CIM_CurveAuto),(InVal=207.627594,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=15.397653),LeaveTangent=(X=0.000000,Y=0.000000,Z=15.397653),InterpMode=CIM_CurveAuto),(InVal=210.372574,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=39.115463),LeaveTangent=(X=0.000000,Y=0.000000,Z=39.115463),InterpMode=CIM_CurveAuto),(InVal=212.229355,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=42.299030),LeaveTangent=(X=0.000000,Y=0.000000,Z=42.299030),InterpMode=CIM_CurveAuto),(InVal=214.627991,OutVal=(X=0.000000,Y=0.000000,Z=630.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=40.184361),LeaveTangent=(X=0.000000,Y=0.000000,Z=40.184361),InterpMode=CIM_CurveAuto),(InVal=216.708710,OutVal=(X=0.000000,Y=0.000000,Z=720.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=42.136154),LeaveTangent=(X=0.000000,Y=0.000000,Z=42.136154),InterpMode=CIM_CurveAuto),(InVal=218.899857,OutVal=(X=0.000000,Y=0.000000,Z=810.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=40.597301),LeaveTangent=(X=0.000000,Y=0.000000,Z=40.597301),InterpMode=CIM_CurveAuto),(InVal=221.142502,OutVal=(X=0.000000,Y=0.000000,Z=900.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=22.139626),LeaveTangent=(X=0.000000,Y=0.000000,Z=22.139626),InterpMode=CIM_CurveAuto),(InVal=222.964966,OutVal=(X=0.000000,Y=0.000000,Z=900.000000),InterpMode=CIM_CurveAuto),(InVal=225.100021,OutVal=(X=0.000000,Y=0.000000,Z=900.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.278000),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.278000),InterpMode=CIM_CurveAuto),(InVal=227.194687,OutVal=(X=0.000000,Y=0.000000,Z=810.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-42.312229),LeaveTangent=(X=0.000000,Y=0.000000,Z=-42.312229),InterpMode=CIM_CurveAuto),(InVal=229.354111,OutVal=(X=0.000000,Y=0.000000,Z=720.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-28.086056),LeaveTangent=(X=0.000000,Y=0.000000,Z=-28.086056),InterpMode=CIM_CurveAuto),(InVal=232.001343,OutVal=(X=0.000000,Y=0.000000,Z=675.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-29.030628),LeaveTangent=(X=0.000000,Y=0.000000,Z=-29.030628),InterpMode=CIM_CurveAuto),(InVal=235.554459,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.758408),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.758408),InterpMode=CIM_CurveAuto),(InVal=238.205841,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAuto),(InVal=241.040497,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAuto),(InVal=244.942505,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=22.439695),LeaveTangent=(X=0.000000,Y=0.000000,Z=22.439695),InterpMode=CIM_CurveAuto),(InVal=249.061996,OutVal=(X=0.000000,Y=0.000000,Z=720.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=47.321640),LeaveTangent=(X=0.000000,Y=0.000000,Z=47.321640),InterpMode=CIM_CurveAuto),(InVal=252.550018,OutVal=(X=0.000000,Y=0.000000,Z=900.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=33.107014),LeaveTangent=(X=0.000000,Y=0.000000,Z=33.107014),InterpMode=CIM_CurveAuto),(InVal=255.858139,OutVal=(X=0.000000,Y=0.000000,Z=945.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.655672),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.655672),InterpMode=CIM_CurveAuto),(InVal=259.140686,OutVal=(X=0.000000,Y=0.000000,Z=990.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.392866),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.392866),InterpMode=CIM_CurveAuto),(InVal=262.111237,OutVal=(X=0.000000,Y=0.000000,Z=1035.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.019017),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.019017),InterpMode=CIM_CurveAuto),(InVal=266.053650,OutVal=(X=0.000000,Y=0.000000,Z=1080.000000),InterpMode=CIM_CurveAuto)))
         LookupTrack=(Points=(,(Time=2.668726),(Time=5.119102),(Time=7.529840),(Time=9.660808),(Time=12.274570),(Time=15.187599),(Time=18.097483),(Time=21.216833),(Time=24.498175),(Time=27.730919),(Time=31.167526),(Time=34.627014),(Time=37.962284),(Time=40.821701),(Time=44.416752),(Time=48.176601),(Time=51.875256),(Time=54.122398),(Time=57.025551),(Time=60.121349),(Time=63.961830),(Time=66.753479),(Time=70.796677),(Time=74.368988),(Time=77.649780),(Time=81.293839),(Time=84.828705),(Time=88.357124),(Time=92.792992),(Time=96.973953),(Time=101.277672),(Time=104.735947),(Time=108.499672),(Time=112.385040),(Time=115.809776),(Time=118.797440),(Time=122.003479),(Time=125.077293),(Time=127.933167),(Time=130.741821),(Time=133.727280),(Time=136.846893),(Time=140.333740),(Time=143.817612),(Time=146.852280),(Time=149.825592),(Time=153.036224),(Time=155.034576),(Time=159.038635),(Time=161.586838),(Time=166.204681),(Time=168.979004),(Time=172.519958),(Time=177.669373),(Time=182.667664),(Time=187.045303),(Time=189.497208),(Time=192.262436),(Time=195.375885),(Time=198.044312),(Time=201.446289),(Time=204.527527),(Time=207.627594),(Time=210.372574),(Time=212.229355),(Time=214.627991),(Time=216.708710),(Time=218.899857),(Time=221.142502),(Time=222.964966),(Time=225.100021),(Time=227.194687),(Time=229.354111),(Time=232.001343),(Time=235.554459),(Time=238.205841),(Time=241.040497),(Time=244.942505),(Time=249.061996),(Time=252.550018),(Time=255.858139),(Time=259.140686),(Time=262.111237),(Time=266.053650)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="FlythroughCamera"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="FlythroughCamera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=266.542908
   InterpGroups(0)=InterpGroup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=3184
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KF-EvacuationPoint.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1296
   ObjPosY=3184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=3106,OverrideDelta=11)
   VariableLinks(0)=(DrawX=943,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=3040
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=3362,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3362,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=1080,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=3328
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=3034,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3034,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=1528,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1464
   ObjPosY=3000
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1240
   ObjPosY=3432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=805
   SizeY=572
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=2952
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object
