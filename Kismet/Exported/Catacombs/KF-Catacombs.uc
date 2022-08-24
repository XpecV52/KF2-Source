Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=333,OverrideDelta=14)
   InputLinks(1)=(DrawY=354,OverrideDelta=35)
   InputLinks(2)=(DrawY=375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=1254,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1305,OverrideDelta=76)
   EventLinks(0)=(DrawX=1354,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1216
   ObjPosY=296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=325,OverrideDelta=14)
   OutputLinks(1)=(DrawY=346,OverrideDelta=35)
   OutputLinks(2)=(DrawY=367,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1062,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=976
   ObjPosY=256
   ObjName="TriggerVolume_15 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=944
   ObjPosY=232
   ObjComment="Portal Spawns - Ritual Room"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=456
   ObjComment="PARENT - Wall 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=1156
   SizeY=427
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=808
   ObjComment="Portal Spawns - Sewer"
   DrawWidth=1156
   DrawHeight=427
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=901,OverrideDelta=14)
   OutputLinks(1)=(DrawY=922,OverrideDelta=35)
   OutputLinks(2)=(DrawY=943,OverrideDelta=56)
   VariableLinks(0)=(DrawX=538,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=456
   ObjPosY=832
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=909,OverrideDelta=14)
   InputLinks(1)=(DrawY=930,OverrideDelta=35)
   InputLinks(2)=(DrawY=951,OverrideDelta=56)
   OutputLinks(0)=(DrawY=930,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=734,OverrideDelta=16)
   VariableLinks(1)=(DrawX=785,OverrideDelta=76)
   EventLinks(0)=(DrawX=834,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=696
   ObjPosY=872
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=1485,OverrideDelta=14)
   InputLinks(1)=(DrawY=1506,OverrideDelta=35)
   InputLinks(2)=(DrawY=1527,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1506,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=758,OverrideDelta=16)
   VariableLinks(1)=(DrawX=809,OverrideDelta=76)
   EventLinks(0)=(DrawX=858,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=720
   ObjPosY=1448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=1477,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1498,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1519,OverrideDelta=56)
   VariableLinks(0)=(DrawX=562,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=480
   ObjPosY=1408
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=1384
   ObjComment="Portal Spawns - Occult Room"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=688
   ObjPosY=1608
   ObjComment="PARENT - Floor 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=776
   ObjPosY=1640
   ObjComment="CHILD - Floor 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=341,OverrideDelta=14)
   InputLinks(1)=(DrawY=362,OverrideDelta=35)
   InputLinks(2)=(DrawY=383,OverrideDelta=56)
   OutputLinks(0)=(DrawY=362,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=2022,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2073,OverrideDelta=76)
   EventLinks(0)=(DrawX=2122,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   ObjPosY=304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=333,OverrideDelta=14)
   OutputLinks(1)=(DrawY=354,OverrideDelta=35)
   OutputLinks(2)=(DrawY=375,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1826,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=264
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=240
   ObjComment="Portal Spawns - Entrance"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1952
   ObjPosY=464
   ObjComment="PARENT - Wall 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=496
   ObjComment="CHILD - Wall 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1200
   ObjPosY=2584
   ObjComment="CHILD - Floor 1 - No longer used"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=2536
   ObjComment="PARENT - Wall 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=2312
   ObjComment="Portal Spawns - Occult Room Main Entrance"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=2405,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2426,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2447,OverrideDelta=56)
   VariableLinks(0)=(DrawX=978,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=896
   ObjPosY=2336
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=2413,OverrideDelta=14)
   InputLinks(1)=(DrawY=2434,OverrideDelta=35)
   InputLinks(2)=(DrawY=2455,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2434,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=1174,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1225,OverrideDelta=76)
   EventLinks(0)=(DrawX=1274,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=2376
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=688
   ObjPosY=1048
   ObjComment="PARENT - Ceiling 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=2445,OverrideDelta=14)
   InputLinks(1)=(DrawY=2466,OverrideDelta=35)
   InputLinks(2)=(DrawY=2487,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2466,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=2030,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2081,OverrideDelta=76)
   EventLinks(0)=(DrawX=2130,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=2408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=2437,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2458,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2479,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1834,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1752
   ObjPosY=2368
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1720
   ObjPosY=2344
   ObjComment="Portal Spawns - Sacrificial Room"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1960
   ObjPosY=2568
   ObjComment="PARENT - Floor 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=496
   ObjComment="CHILD - Wall 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=805
   SizeY=572
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4200
   ObjPosY=1184
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4608
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=1266,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1266,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=4896,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4832
   ObjPosY=1232
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=1594,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1594,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=4448,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4384
   ObjPosY=1560
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=1338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4327,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4232
   ObjPosY=1272
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KF-CATACOMBS.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4664
   ObjPosY=1416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="FlythroughCamera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=69,G=225,R=0,A=255)
      bCollapsed=True
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=0.000488,Y=-0.000488,Z=0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=423.730713,Y=340.863037,Z=-23.999878),ArriveTangent=(X=15.525681,Y=232.589539,Z=0.000000),LeaveTangent=(X=15.525681,Y=232.589539,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=436.599121,Y=930.357666,Z=32.000092),ArriveTangent=(X=13.315338,Y=220.833191,Z=16.000032),LeaveTangent=(X=13.315338,Y=220.833191,Z=16.000032),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=2138.121582,Y=1555.445557,Z=64.000305),ArriveTangent=(X=319.918152,Y=283.126648,Z=0.000000),LeaveTangent=(X=319.918152,Y=283.126648,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=9.500000,OutVal=(X=2546.732422,Y=2215.497803,Z=80.000214),ArriveTangent=(X=189.350342,Y=179.128571,Z=0.000000),LeaveTangent=(X=189.350342,Y=179.128571,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,OutVal=(X=2895.522949,Y=2413.627686,Z=64.000244),ArriveTangent=(X=298.904694,Y=0.000000,Z=-18.894577),LeaveTangent=(X=298.904694,Y=0.000000,Z=-18.894577),InterpMode=CIM_CurveAutoClamped),(InVal=13.500000,OutVal=(X=3876.700684,Y=2309.098877,Z=-263.999664),ArriveTangent=(X=52.572159,Y=-107.932159,Z=-97.277634),LeaveTangent=(X=52.572159,Y=-107.932159,Z=-97.277634),InterpMode=CIM_CurveAutoClamped),(InVal=15.500000,OutVal=(X=3921.033936,Y=1694.305664,Z=-375.999664),ArriveTangent=(X=53.303131,Y=-300.531250,Z=-20.390678),LeaveTangent=(X=53.303131,Y=-300.531250,Z=-20.390678),InterpMode=CIM_CurveAutoClamped),(InVal=17.000000,OutVal=(X=4304.307129,Y=1257.239502,Z=-391.999664),ArriveTangent=(X=343.595306,Y=0.000000,Z=-6.857134),LeaveTangent=(X=343.595306,Y=0.000000,Z=-6.857134),InterpMode=CIM_CurveAutoClamped),(InVal=19.000000,OutVal=(X=5142.499023,Y=1308.856445,Z=-399.999634),ArriveTangent=(X=536.192017,Y=14.359856,Z=0.000000),LeaveTangent=(X=536.192017,Y=14.359856,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=6449.075195,Y=1324.908691,Z=-383.999634),ArriveTangent=(X=511.373779,Y=0.000000,Z=0.000000),LeaveTangent=(X=511.373779,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=23.000000,OutVal=(X=7187.994141,Y=949.068848,Z=-383.999634),ArriveTangent=(X=11.545853,Y=-306.272736,Z=0.000000),LeaveTangent=(X=11.545853,Y=-306.272736,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=7197.366211,Y=30.137451,Z=-759.999634),ArriveTangent=(X=9.070087,Y=-357.389282,Z=-38.073360),LeaveTangent=(X=9.070087,Y=-357.389282,Z=-38.073360),InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=(X=7258.511719,Y=-659.182983,Z=-799.999634),ArriveTangent=(X=-71.279297,Y=-156.038574,Z=0.000000),LeaveTangent=(X=-71.279297,Y=-156.038574,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=30.000000,OutVal=(X=6372.331055,Y=-705.895752,Z=-719.999634),ArriveTangent=(X=-450.315308,Y=-24.480089,Z=19.700006),LeaveTangent=(X=-450.315308,Y=-24.480089,Z=19.700006),InterpMode=CIM_CurveAutoClamped),(InVal=32.000000,OutVal=(X=5232.092773,Y=-769.343384,Z=-695.999634),ArriveTangent=(X=-495.134338,Y=0.000000,Z=8.193336),LeaveTangent=(X=-495.134338,Y=0.000000,Z=8.193336),InterpMode=CIM_CurveAutoClamped),(InVal=33.500000,OutVal=(X=4639.360840,Y=-690.782471,Z=-687.999634),ArriveTangent=(X=-129.733093,Y=-69.335487,Z=10.449799),LeaveTangent=(X=-129.733093,Y=-69.335487,Z=10.449799),InterpMode=CIM_CurveUser),(InVal=36.000000,OutVal=(X=4632.127930,Y=-1577.201172,Z=-463.999603),ArriveTangent=(X=0.000000,Y=-315.399445,Z=81.394211),LeaveTangent=(X=0.000000,Y=-315.399445,Z=81.394211),InterpMode=CIM_CurveAutoClamped),(InVal=37.500000,OutVal=(X=4700.292480,Y=-1970.286987,Z=-359.999512),ArriveTangent=(X=0.000000,Y=-201.616135,Z=50.285740),LeaveTangent=(X=0.000000,Y=-201.616135,Z=50.285740),InterpMode=CIM_CurveAutoClamped),(InVal=39.500000,OutVal=(X=4673.755371,Y=-2282.857666,Z=-287.999512),ArriveTangent=(X=-31.218391,Y=-142.346649,Z=0.000076),LeaveTangent=(X=-31.218391,Y=-142.346649,Z=0.000076),InterpMode=CIM_CurveAutoClamped),(InVal=41.500000,OutVal=(X=4164.342773,Y=-2539.673584,Z=-287.999451),ArriveTangent=(X=-229.538940,Y=-64.674850,Z=0.000000),LeaveTangent=(X=-229.538940,Y=-64.674850,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=43.500000,OutVal=(X=3755.599609,Y=-2609.134521,Z=-303.999420),ArriveTangent=(X=-243.108154,Y=0.000000,Z=-14.673320),LeaveTangent=(X=-243.108154,Y=0.000000,Z=-14.673320),InterpMode=CIM_CurveAutoClamped),(InVal=45.500000,OutVal=(X=3191.910156,Y=-2065.018066,Z=-359.999420),ArriveTangent=(X=0.000000,Y=349.355347,Z=0.000000),LeaveTangent=(X=0.000000,Y=349.355347,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=48.000000,OutVal=(X=3920.920166,Y=-1037.035522,Z=-359.999390),ArriveTangent=(X=214.725235,Y=322.449036,Z=0.000000),LeaveTangent=(X=214.725235,Y=322.449036,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=49.500000,OutVal=(X=4101.510254,Y=-390.262085,Z=-415.999420),ArriveTangent=(X=1.179951,Y=419.108582,Z=0.000000),LeaveTangent=(X=1.179951,Y=419.108582,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=51.500000,OutVal=(X=4102.383789,Y=429.844482,Z=-407.999390),ArriveTangent=(X=0.000000,Y=475.844055,Z=0.000000),LeaveTangent=(X=0.000000,Y=475.844055,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=53.000000,OutVal=(X=4094.400879,Y=1275.192139,Z=-407.999420),ArriveTangent=(X=-12.570293,Y=468.545502,Z=0.000000),LeaveTangent=(X=-12.570293,Y=468.545502,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=54.500000,OutVal=(X=3930.568359,Y=1835.480957,Z=-407.999420),ArriveTangent=(X=-195.444611,Y=0.000000,Z=0.000000),LeaveTangent=(X=-195.444611,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=(X=3403.473145,Y=1662.019531,Z=-407.999390),ArriveTangent=(X=-373.770508,Y=-177.885864,Z=0.000051),LeaveTangent=(X=-373.770508,Y=-177.885864,Z=0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=57.500000,OutVal=(X=2809.256836,Y=1294.697266,Z=-391.999390),ArriveTangent=(X=-548.801270,Y=0.000000,Z=18.674671),LeaveTangent=(X=-548.801270,Y=0.000000,Z=18.674671),InterpMode=CIM_CurveAutoClamped),(InVal=59.000000,OutVal=(X=1757.069336,Y=1334.197510,Z=-343.999420),ArriveTangent=(X=-475.961853,Y=0.000000,Z=23.999990),LeaveTangent=(X=-475.961853,Y=0.000000,Z=23.999990),InterpMode=CIM_CurveAutoClamped),(InVal=60.500000,OutVal=(X=1314.137207,Y=1013.844727,Z=-319.999420),ArriveTangent=(X=0.000000,Y=-326.890289,Z=13.714286),LeaveTangent=(X=0.000000,Y=-326.890289,Z=13.714286),InterpMode=CIM_CurveAutoClamped),(InVal=62.500000,OutVal=(X=1369.365234,Y=62.340820,Z=-295.999420),ArriveTangent=(X=0.000000,Y=-436.980225,Z=8.193336),LeaveTangent=(X=0.000000,Y=-436.980225,Z=8.193336),InterpMode=CIM_CurveAutoClamped),(InVal=64.000000,OutVal=(X=1325.680664,Y=-515.586060,Z=-287.999420),ArriveTangent=(X=-56.097027,Y=-388.783203,Z=0.000000),LeaveTangent=(X=-56.097027,Y=-388.783203,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=65.500000,OutVal=(X=1141.334229,Y=-1104.008789,Z=-311.999420),ArriveTangent=(X=-109.036293,Y=-449.287109,Z=-26.920012),LeaveTangent=(X=-109.036293,Y=-449.287109,Z=-26.920012),InterpMode=CIM_CurveAutoClamped),(InVal=67.000000,OutVal=(X=998.571777,Y=-1863.447388,Z=-375.999420),ArriveTangent=(X=0.000000,Y=-406.661621,Z=0.000000),LeaveTangent=(X=0.000000,Y=-406.661621,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=68.500000,OutVal=(X=1053.166504,Y=-2323.993652,Z=-359.999420),ArriveTangent=(X=0.000000,Y=-337.048126,Z=0.000000),LeaveTangent=(X=0.000000,Y=-337.048126,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=313.663330,Y=-3211.639893,Z=-383.999420),ArriveTangent=(X=0.000000,Y=-350.915802,Z=0.000000),LeaveTangent=(X=0.000000,Y=-350.915802,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=73.000000,OutVal=(X=946.346436,Y=-3903.114746,Z=-327.999420),ArriveTangent=(X=344.130432,Y=0.000000,Z=0.000000),LeaveTangent=(X=344.130432,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=74.500000,OutVal=(X=1518.119873,Y=-3694.820313,Z=-351.999420),ArriveTangent=(X=339.671051,Y=0.000000,Z=-16.000000),LeaveTangent=(X=339.671051,Y=0.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=76.000000,OutVal=(X=1965.359619,Y=-3983.876465,Z=-375.999420),ArriveTangent=(X=332.256927,Y=0.000000,Z=0.000000),LeaveTangent=(X=332.256927,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=77.500000,OutVal=(X=2514.890625,Y=-3906.833984,Z=-319.999420),ArriveTangent=(X=314.052826,Y=0.000000,Z=57.717354),LeaveTangent=(X=314.052826,Y=0.000000,Z=57.717354),InterpMode=CIM_CurveAutoClamped),(InVal=79.000000,OutVal=(X=2907.518066,Y=-4412.768555,Z=-199.999420),ArriveTangent=(X=279.440826,Y=-271.395996,Z=52.592041),LeaveTangent=(X=279.440826,Y=-271.395996,Z=52.592041),InterpMode=CIM_CurveAutoClamped),(InVal=80.500000,OutVal=(X=3353.213135,Y=-4721.021973,Z=-151.999390),ArriveTangent=(X=300.059296,Y=0.000000,Z=0.000000),LeaveTangent=(X=300.059296,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=82.500000,OutVal=(X=3957.725586,Y=-4663.745117,Z=-207.999329),ArriveTangent=(X=0.000000,Y=59.268890,Z=0.000000),LeaveTangent=(X=0.000000,Y=59.268890,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=(X=3609.770996,Y=-4072.224609,Z=-103.999329),ArriveTangent=(X=-159.667969,Y=225.859695,Z=56.888901),LeaveTangent=(X=-159.667969,Y=225.859695,Z=56.888901),InterpMode=CIM_CurveAutoClamped),(InVal=87.000000,OutVal=(X=3239.219727,Y=-3647.376465,Z=48.000732),ArriveTangent=(X=-87.873260,Y=218.771072,Z=84.571449),LeaveTangent=(X=-87.873260,Y=218.771072,Z=84.571449),InterpMode=CIM_CurveAutoClamped),(InVal=88.500000,OutVal=(X=3165.538330,Y=-3306.525879,Z=192.000732),ArriveTangent=(X=0.000000,Y=180.220490,Z=57.344044),LeaveTangent=(X=0.000000,Y=180.220490,Z=57.344044),InterpMode=CIM_CurveAutoClamped),(InVal=90.500000,OutVal=(X=3514.279785,Y=-3016.604736,Z=256.000763),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=3030.011230,Y=-3024.061523,Z=224.000793),ArriveTangent=(X=-152.683136,Y=-8.114027,Z=0.000000),LeaveTangent=(X=-152.683136,Y=-8.114027,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=94.500000,OutVal=(X=2859.711182,Y=-3159.664063,Z=280.000824),ArriveTangent=(X=-49.696278,Y=-169.453201,Z=59.268337),LeaveTangent=(X=-49.696278,Y=-169.453201,Z=59.268337),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=2821.508301,Y=-3673.470703,Z=408.000854),ArriveTangent=(X=0.000000,Y=-327.852051,Z=16.196487),LeaveTangent=(X=0.000000,Y=-327.852051,Z=16.196487),InterpMode=CIM_CurveAutoClamped),(InVal=97.000000,OutVal=(X=3156.461426,Y=-3979.294189,Z=416.000885),ArriveTangent=(X=373.438110,Y=-208.827148,Z=0.000000),LeaveTangent=(X=373.438110,Y=-208.827148,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=3568.384521,Y=-4109.375977,Z=408.000916),ArriveTangent=(X=390.097473,Y=-102.566696,Z=-6.399976),LeaveTangent=(X=390.097473,Y=-102.566696,Z=-6.399976),InterpMode=CIM_CurveAutoClamped),(InVal=99.500000,OutVal=(X=4131.705078,Y=-4235.710938,Z=400.000946),ArriveTangent=(X=394.036865,Y=0.000000,Z=-10.138103),LeaveTangent=(X=394.036865,Y=0.000000,Z=-10.138103),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=4750.495117,Y=-4226.584961,Z=368.001007),ArriveTangent=(X=282.574493,Y=256.535034,Z=0.000000),LeaveTangent=(X=282.574493,Y=256.535034,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=102.500000,OutVal=(X=4846.544922,Y=-3834.596191,Z=384.001007),ArriveTangent=(X=128.246307,Y=0.000000,Z=0.000000),LeaveTangent=(X=128.246307,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=104.000000,OutVal=(X=5328.883789,Y=-3871.059082,Z=376.001038),ArriveTangent=(X=354.987152,Y=0.000000,Z=0.000000),LeaveTangent=(X=354.987152,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=106.000000,OutVal=(X=6089.000000,Y=-3719.882568,Z=424.001068),ArriveTangent=(X=396.144806,Y=0.000000,Z=22.857161),LeaveTangent=(X=396.144806,Y=0.000000,Z=22.857161),InterpMode=CIM_CurveAutoClamped),(InVal=107.500000,OutVal=(X=6715.390625,Y=-4042.071289,Z=456.001099),ArriveTangent=(X=409.492828,Y=-141.837128,Z=0.000000),LeaveTangent=(X=409.492828,Y=-141.837128,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=7317.478516,Y=-4171.870117,Z=432.001129),ArriveTangent=(X=344.787384,Y=0.000000,Z=-24.579985),LeaveTangent=(X=344.787384,Y=0.000000,Z=-24.579985),InterpMode=CIM_CurveAutoClamped),(InVal=111.000000,OutVal=(X=7922.146484,Y=-3516.564941,Z=360.001160),ArriveTangent=(X=292.263397,Y=65.421692,Z=0.000000),LeaveTangent=(X=292.263397,Y=65.421692,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=112.500000,OutVal=(X=8340.400391,Y=-3469.518066,Z=360.001190),ArriveTangent=(X=174.804657,Y=0.000000,Z=0.000000),LeaveTangent=(X=174.804657,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=114.000000,OutVal=(X=8495.701172,Y=-3952.656738,Z=328.001221),ArriveTangent=(X=0.000000,Y=-326.790527,Z=-36.281590),LeaveTangent=(X=0.000000,Y=-326.790527,Z=-36.281590),InterpMode=CIM_CurveAutoClamped),(InVal=115.500000,OutVal=(X=8216.239258,Y=-4449.889648,Z=240.001251),ArriveTangent=(X=-278.436371,Y=-44.930977,Z=-73.142815),LeaveTangent=(X=-278.436371,Y=-44.930977,Z=-73.142815),InterpMode=CIM_CurveAutoClamped),(InVal=117.500000,OutVal=(X=7436.750000,Y=-4485.625000,Z=72.001373),ArriveTangent=(X=-382.227905,Y=350.111664,Z=0.000000),LeaveTangent=(X=-382.227905,Y=350.111664,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=120.000000,OutVal=(X=7195.703613,Y=-3118.488037,Z=72.001373),ArriveTangent=(X=-452.614960,Y=126.312607,Z=0.000000),LeaveTangent=(X=-452.614960,Y=126.312607,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=122.000000,OutVal=(X=6903.507324,Y=-3725.395508,Z=-7.998657),ArriveTangent=(X=-203.503296,Y=-281.489807,Z=-53.999985),LeaveTangent=(X=-203.503296,Y=-281.489807,Z=-53.999985),InterpMode=CIM_CurveAutoClamped),(InVal=124.000000,OutVal=(X=6381.690430,Y=-4244.447266,Z=-143.998566),ArriveTangent=(X=-211.795441,Y=-355.620270,Z=-14.673233),LeaveTangent=(X=-211.795441,Y=-355.620270,Z=-14.673233),InterpMode=CIM_CurveUser),(InVal=125.000000,OutVal=(X=6168.546875,Y=-4567.922852,Z=-151.998505),ArriveTangent=(X=-362.827515,Y=-181.266327,Z=-6.399976),LeaveTangent=(X=-362.827515,Y=-181.266327,Z=-6.399976),InterpMode=CIM_CurveUser),(InVal=127.000000,OutVal=(X=5404.264648,Y=-4585.916016,Z=-159.998535),ArriveTangent=(X=-314.777344,Y=0.000000,Z=0.000000),LeaveTangent=(X=-314.777344,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=129.500000,OutVal=(X=4752.048828,Y=-4131.462891,Z=-143.998505),ArriveTangent=(X=-191.720810,Y=276.340576,Z=0.000000),LeaveTangent=(X=-191.720810,Y=276.340576,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=132.000000,OutVal=(X=4437.740234,Y=-3195.212891,Z=-207.998474),ArriveTangent=(X=-185.908569,Y=331.352661,Z=0.000000),LeaveTangent=(X=-185.908569,Y=331.352661,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=133.500000,OutVal=(X=4008.414551,Y=-2784.711426,Z=-207.998444),ArriveTangent=(X=-273.140259,Y=268.166077,Z=0.000000),LeaveTangent=(X=-273.140259,Y=268.166077,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=136.000000,OutVal=(X=3345.179199,Y=-2122.548584,Z=-335.998352),ArriveTangent=(X=0.000000,Y=315.743805,Z=-0.000071),LeaveTangent=(X=0.000000,Y=315.743805,Z=-0.000071),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=3481.821777,Y=-1363.864258,Z=-335.998413),ArriveTangent=(X=0.000000,Y=308.953186,Z=0.000000),LeaveTangent=(X=0.000000,Y=308.953186,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=139.000000,OutVal=(X=3323.965820,Y=-1121.230103,Z=-319.998413),ArriveTangent=(X=-124.822021,Y=264.121826,Z=20.000000),LeaveTangent=(X=-124.822021,Y=264.121826,Z=20.000000),InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=(X=3232.177734,Y=-835.620605,Z=-295.998413),ArriveTangent=(X=0.000000,Y=252.129227,Z=43.784492),LeaveTangent=(X=0.000000,Y=252.129227,Z=43.784492),InterpMode=CIM_CurveAutoClamped),(InVal=142.000000,OutVal=(X=3721.006836,Y=-364.842407,Z=88.001587),ArriveTangent=(X=246.023300,Y=135.958191,Z=0.000046),LeaveTangent=(X=246.023300,Y=135.958191,Z=0.000046),InterpMode=CIM_CurveAutoClamped),(InVal=143.500000,OutVal=(X=4093.259277,Y=-242.566162,Z=88.001617),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000051),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=(X=4089.582520,Y=-888.244873,Z=136.001648),ArriveTangent=(X=-6.079361,Y=-357.966949,Z=0.000000),LeaveTangent=(X=-6.079361,Y=-357.966949,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=146.500000,OutVal=(X=3575.265381,Y=-1316.467041,Z=112.001678),ArriveTangent=(X=-300.492035,Y=0.000000,Z=0.000000),LeaveTangent=(X=-300.492035,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=147.500000,OutVal=(X=3332.696533,Y=-1232.259766,Z=120.001709),ArriveTangent=(X=-354.039673,Y=0.000000,Z=0.000229),LeaveTangent=(X=-354.039673,Y=0.000000,Z=0.000229),InterpMode=CIM_CurveAutoClamped),(InVal=148.500000,OutVal=(X=2867.186035,Y=-1294.075195,Z=120.001801),ArriveTangent=(X=-298.762054,Y=-108.089584,Z=0.000183),LeaveTangent=(X=-298.762054,Y=-108.089584,Z=0.000183),InterpMode=CIM_CurveAutoClamped),(InVal=150.500000,OutVal=(X=2436.410400,Y=-1967.682739,Z=128.001892),ArriveTangent=(X=-500.356781,Y=3.826289,Z=0.000000),LeaveTangent=(X=-500.356781,Y=3.826289,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=152.000000,OutVal=(X=2008.346191,Y=-1467.823242,Z=136.001831),ArriveTangent=(X=-378.536743,Y=111.649658,Z=0.000000),LeaveTangent=(X=-378.536743,Y=111.649658,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=(X=530.734863,Y=-1324.168701,Z=64.002045),ArriveTangent=(X=-186.494049,Y=386.241547,Z=-22.975985),LeaveTangent=(X=-186.494049,Y=386.241547,Z=-22.975985),InterpMode=CIM_CurveUser),(InVal=156.500000,OutVal=(X=379.870605,Y=-696.969604,Z=32.001984),ArriveTangent=(X=96.739899,Y=298.051392,Z=0.000000),LeaveTangent=(X=96.739899,Y=298.051392,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=158.000000,OutVal=(X=875.644775,Y=-8.831787,Z=64.002075),ArriveTangent=(X=400.923767,Y=165.497101,Z=44.800026),LeaveTangent=(X=400.923767,Y=165.497101,Z=44.800026),InterpMode=CIM_CurveUser),(InVal=159.000000,OutVal=(X=1309.210205,Y=3.671875,Z=160.002075),ArriveTangent=(X=452.357544,Y=6.413574,Z=76.000000),LeaveTangent=(X=452.357544,Y=6.413574,Z=76.000000),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=1780.359863,Y=7.139648,Z=216.002075),ArriveTangent=(X=445.430145,Y=226.482269,Z=12.804873),LeaveTangent=(X=445.430145,Y=226.482269,Z=12.804873),InterpMode=CIM_CurveUser),(InVal=161.500000,OutVal=(X=2009.108398,Y=609.911865,Z=248.002106),ArriveTangent=(X=298.836609,Y=284.599304,Z=0.000000),LeaveTangent=(X=298.836609,Y=284.599304,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=163.500000,OutVal=(X=2653.967285,Y=484.449951,Z=224.002136),ArriveTangent=(X=186.961319,Y=-122.650963,Z=0.000000),LeaveTangent=(X=186.961319,Y=-122.650963,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=2822.389893,Y=114.700439,Z=240.002167),ArriveTangent=(X=178.619797,Y=-177.341537,Z=0.000000),LeaveTangent=(X=178.619797,Y=-177.341537,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=166.500000,OutVal=(X=3209.345215,Y=-57.013184,Z=208.002197),ArriveTangent=(X=319.841797,Y=0.000000,Z=-47.569054),LeaveTangent=(X=319.841797,Y=0.000000,Z=-47.569054),InterpMode=CIM_CurveAutoClamped),(InVal=167.500000,OutVal=(X=3621.994385,Y=-27.978027,Z=72.002258),ArriveTangent=(X=384.785004,Y=0.000000,Z=-32.934341),LeaveTangent=(X=384.785004,Y=0.000000,Z=-32.934341),InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,OutVal=(X=4556.092773,Y=-98.769287,Z=40.002350),ArriveTangent=(X=94.195923,Y=-253.419312,Z=0.000000),LeaveTangent=(X=94.195923,Y=-253.419312,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=172.000000,OutVal=(X=4592.392090,Y=-760.039063,Z=272.002380),ArriveTangent=(X=257.497437,Y=-200.528595,Z=81.744034),LeaveTangent=(X=257.497437,Y=-200.528595,Z=81.744034),InterpMode=CIM_CurveUser),(InVal=175.000000,OutVal=(X=5613.415527,Y=-937.434570,Z=376.002380),ArriveTangent=(X=0.000000,Y=-136.014038,Z=27.340685),LeaveTangent=(X=0.000000,Y=-136.014038,Z=27.340685),InterpMode=CIM_CurveAutoClamped),(InVal=177.000000,OutVal=(X=5484.985352,Y=-1822.039185,Z=416.002411),ArriveTangent=(X=0.000000,Y=-348.719513,Z=0.000000),LeaveTangent=(X=0.000000,Y=-348.719513,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=178.500000,OutVal=(X=5576.374023,Y=-2197.975830,Z=376.002441),ArriveTangent=(X=135.202301,Y=-241.168823,Z=-56.696663),LeaveTangent=(X=135.202301,Y=-241.168823,Z=-56.696663),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=6456.902344,Y=-2545.545654,Z=96.002472),ArriveTangent=(X=421.575012,Y=0.000000,Z=-12.896355),LeaveTangent=(X=421.575012,Y=0.000000,Z=-12.896355),InterpMode=CIM_CurveAutoClamped),(InVal=181.500000,OutVal=(X=6864.575684,Y=-2263.355469,Z=88.002533),ArriveTangent=(X=0.000000,Y=261.792511,Z=-12.870186),LeaveTangent=(X=0.000000,Y=261.792511,Z=-12.870186),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=6667.302734,Y=-1760.168091,Z=-175.997467),ArriveTangent=(X=-96.764191,Y=358.513641,Z=-102.710617),LeaveTangent=(X=-96.764191,Y=358.513641,Z=-102.710617),InterpMode=CIM_CurveAutoClamped),(InVal=184.500000,OutVal=(X=6572.034180,Y=-1187.814575,Z=-263.997345),ArriveTangent=(X=-43.715530,Y=489.176239,Z=-55.999950),LeaveTangent=(X=-43.715530,Y=489.176239,Z=-55.999950),InterpMode=CIM_CurveAutoClamped),(InVal=186.000000,OutVal=(X=6530.975586,Y=-292.639404,Z=-343.997314),ArriveTangent=(X=-106.576126,Y=448.478333,Z=0.000000),LeaveTangent=(X=-106.576126,Y=448.478333,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=187.500000,OutVal=(X=5825.189453,Y=-144.093994,Z=-271.997223),ArriveTangent=(X=-79.309174,Y=174.016022,Z=72.710503),LeaveTangent=(X=-79.309174,Y=174.016022,Z=72.710503),InterpMode=CIM_CurveAutoClamped),(InVal=189.500000,OutVal=(X=5760.843750,Y=549.341553,Z=-63.997070),ArriveTangent=(X=-250.816864,Y=140.325409,Z=151.999985),LeaveTangent=(X=-250.816864,Y=140.325409,Z=151.999985),InterpMode=CIM_CurveUser),(InVal=191.000000,OutVal=(X=5378.645508,Y=677.751709,Z=41.214813),ArriveTangent=(X=-348.299622,Y=0.000000,Z=67.200050),LeaveTangent=(X=-348.299622,Y=0.000000,Z=67.200050),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=4890.094727,Y=576.289063,Z=104.003052),ArriveTangent=(X=-96.664978,Y=-384.267242,Z=8.000046),LeaveTangent=(X=-96.664978,Y=-384.267242,Z=8.000046),InterpMode=CIM_CurveUser),(InVal=193.000000,OutVal=(X=4780.572266,Y=39.260742,Z=48.002960),ArriveTangent=(X=-156.032104,Y=-125.725418,Z=14.940369),LeaveTangent=(X=-156.032104,Y=-125.725418,Z=14.940369),InterpMode=CIM_CurveUser),(InVal=194.000000,OutVal=(X=4343.764160,Y=-32.896729,Z=112.002869),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=0.527344,Z=-4.746094),ArriveTangent=(X=0.000000,Y=0.600190,Z=-5.363534),LeaveTangent=(X=0.000000,Y=0.600190,Z=-5.363534),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=0.000000,Y=7.031250,Z=-59.062500),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=0.000000,Y=1.406250,Z=46.230469),InterpMode=CIM_CurveUser),(InVal=9.500000,OutVal=(X=0.000000,Y=-4.394531,Z=-55.371094),ArriveTangent=(X=0.000000,Y=-3.076172,Z=0.000000),LeaveTangent=(X=0.000000,Y=-3.076172,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,OutVal=(X=0.000000,Y=-10.898438,Z=-15.996094),ArriveTangent=(X=0.000000,Y=-4.394531,Z=0.000000),LeaveTangent=(X=0.000000,Y=-4.394531,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.500000,OutVal=(X=0.000000,Y=-21.972656,Z=-74.531250),InterpMode=CIM_CurveAutoClamped),(InVal=15.500000,OutVal=(X=0.000000,Y=-5.273438,Z=-63.984375),ArriveTangent=(X=0.000000,Y=4.728807,Z=0.000000),LeaveTangent=(X=0.000000,Y=4.728807,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=17.000000,OutVal=(X=0.000000,Y=-1.054688,Z=-86.835938),ArriveTangent=(X=0.000000,Y=3.729488,Z=-10.597098),LeaveTangent=(X=0.000000,Y=3.729488,Z=-10.597098),InterpMode=CIM_CurveAutoClamped),(InVal=19.000000,OutVal=(X=0.000000,Y=7.910156,Z=-101.074219),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=0.000000,Y=-0.175781,Z=-56.425781),ArriveTangent=(X=0.000000,Y=-5.493164,Z=0.000000),LeaveTangent=(X=0.000000,Y=-5.493164,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=23.000000,OutVal=(X=0.000000,Y=-14.062500,Z=-92.988281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.272616),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.272616),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=0.000000,Y=0.000000,Z=-94.921875),ArriveTangent=(X=0.000000,Y=4.545571,Z=-2.213758),LeaveTangent=(X=0.000000,Y=4.545571,Z=-2.213758),InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=(X=0.000000,Y=6.679688,Z=-222.363281),InterpMode=CIM_CurveUser),(InVal=30.000000,OutVal=(X=0.000000,Y=1.230469,Z=-186.679688),InterpMode=CIM_CurveAutoClamped),(InVal=32.000000,OutVal=(X=0.000000,Y=5.800781,Z=-207.773438),ArriveTangent=(X=0.000000,Y=3.063616,Z=0.000000),LeaveTangent=(X=0.000000,Y=3.063616,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=33.500000,OutVal=(X=0.000000,Y=11.953125,Z=-105.117188),ArriveTangent=(X=0.000000,Y=-2.611607,Z=38.331192),LeaveTangent=(X=0.000000,Y=-2.611607,Z=38.331192),InterpMode=CIM_CurveUser),(InVal=36.000000,OutVal=(X=0.000000,Y=5.976563,Z=-72.421875),ArriveTangent=(X=0.000000,Y=-3.295898,Z=23.554688),LeaveTangent=(X=0.000000,Y=-3.295898,Z=23.554688),InterpMode=CIM_CurveAutoClamped),(InVal=37.500000,OutVal=(X=0.000000,Y=-1.230469,Z=-10.898438),InterpMode=CIM_CurveAutoClamped),(InVal=39.500000,OutVal=(X=0.000000,Y=7.734375,Z=-140.800781),ArriveTangent=(X=0.000000,Y=7.244594,Z=0.000000),LeaveTangent=(X=0.000000,Y=7.244594,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=41.500000,OutVal=(X=0.000000,Y=29.179688,Z=15.292969),ArriveTangent=(X=0.000000,Y=0.000000,Z=68.554688),LeaveTangent=(X=0.000000,Y=0.000000,Z=68.554688),InterpMode=CIM_CurveAutoClamped),(InVal=43.500000,OutVal=(X=0.000000,Y=0.878906,Z=133.417969),ArriveTangent=(X=0.000000,Y=-3.813887,Z=0.000000),LeaveTangent=(X=0.000000,Y=-3.813887,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=45.500000,OutVal=(X=0.000000,Y=-2.636719,Z=69.960938),ArriveTangent=(X=0.000000,Y=-0.930125,Z=-5.453587),LeaveTangent=(X=0.000000,Y=-0.930125,Z=-5.453587),InterpMode=CIM_CurveAutoClamped),(InVal=48.000000,OutVal=(X=0.000000,Y=-3.867188,Z=64.335938),InterpMode=CIM_CurveUser),(InVal=49.500000,OutVal=(X=0.000000,Y=-0.351563,Z=99.316406),InterpMode=CIM_CurveAutoClamped),(InVal=51.500000,OutVal=(X=0.000000,Y=-0.351563,Z=52.031250),InterpMode=CIM_CurveAutoClamped),(InVal=53.000000,OutVal=(X=0.000000,Y=-0.351563,Z=105.996094),ArriveTangent=(X=0.000000,Y=0.000000,Z=44.941406),LeaveTangent=(X=0.000000,Y=0.000000,Z=44.941406),InterpMode=CIM_CurveAutoClamped),(InVal=54.500000,OutVal=(X=0.000000,Y=-2.812500,Z=186.855469),ArriveTangent=(X=0.000000,Y=-1.289062,Z=41.308594),LeaveTangent=(X=0.000000,Y=-1.289062,Z=41.308594),InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=(X=0.000000,Y=-4.218750,Z=229.921875),InterpMode=CIM_CurveAutoClamped),(InVal=57.500000,OutVal=(X=0.000000,Y=-4.218750,Z=185.976563),InterpMode=CIM_CurveAutoClamped),(InVal=59.000000,OutVal=(X=0.000000,Y=2.988281,Z=205.136719),ArriveTangent=(X=0.000000,Y=4.921875,Z=21.654509),LeaveTangent=(X=0.000000,Y=4.921875,Z=21.654509),InterpMode=CIM_CurveAutoClamped),(InVal=60.500000,OutVal=(X=0.000000,Y=10.546875,Z=257.343750),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.175615),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.175615),InterpMode=CIM_CurveAutoClamped),(InVal=62.500000,OutVal=(X=0.000000,Y=6.679688,Z=259.804688),InterpMode=CIM_CurveAutoClamped),(InVal=64.000000,OutVal=(X=0.000000,Y=9.492188,Z=235.019531),InterpMode=CIM_CurveAutoClamped),(InVal=65.500000,OutVal=(X=0.000000,Y=0.703125,Z=309.726563),ArriveTangent=(X=0.000000,Y=-4.083537,Z=18.221798),LeaveTangent=(X=0.000000,Y=-4.083537,Z=18.221798),InterpMode=CIM_CurveAutoClamped),(InVal=67.000000,OutVal=(X=0.000000,Y=-3.164063,Z=323.085938),InterpMode=CIM_CurveAutoClamped),(InVal=68.500000,OutVal=(X=0.000000,Y=-1.582031,Z=269.472656),ArriveTangent=(X=0.000000,Y=1.224361,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.224361,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=0.000000,Y=1.757813,Z=373.007813),ArriveTangent=(X=0.000000,Y=0.000000,Z=31.494072),LeaveTangent=(X=0.000000,Y=0.000000,Z=31.494072),InterpMode=CIM_CurveAutoClamped),(InVal=73.000000,OutVal=(X=0.000000,Y=-5.097656,Z=416.601563),ArriveTangent=(X=0.000000,Y=-2.650126,Z=0.000000),LeaveTangent=(X=0.000000,Y=-2.650126,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=74.500000,OutVal=(X=0.000000,Y=-7.910156,Z=332.050781),InterpMode=CIM_CurveAutoClamped),(InVal=76.000000,OutVal=(X=0.000000,Y=-0.878906,Z=352.265625),InterpMode=CIM_CurveAutoClamped),(InVal=77.500000,OutVal=(X=0.000000,Y=-1.230469,Z=315.878906),InterpMode=CIM_CurveAutoClamped),(InVal=79.000000,OutVal=(X=0.000000,Y=-1.230469,Z=337.324219),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.222656),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.222656),InterpMode=CIM_CurveAutoClamped),(InVal=80.500000,OutVal=(X=0.000000,Y=-2.812500,Z=370.546875),ArriveTangent=(X=0.000000,Y=0.000000,Z=31.835039),LeaveTangent=(X=0.000000,Y=0.000000,Z=31.835039),InterpMode=CIM_CurveAutoClamped),(InVal=82.500000,OutVal=(X=0.000000,Y=-1.230469,Z=454.746094),ArriveTangent=(X=0.000000,Y=1.512715,Z=19.165703),LeaveTangent=(X=0.000000,Y=1.512715,Z=19.165703),InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=(X=0.000000,Y=8.437500,Z=478.652344),InterpMode=CIM_CurveAutoClamped),(InVal=87.000000,OutVal=(X=0.000000,Y=7.910156,Z=448.417969),ArriveTangent=(X=0.000000,Y=-0.674460,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.674460,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=88.500000,OutVal=(X=0.000000,Y=-1.582031,Z=458.613281),ArriveTangent=(X=0.000000,Y=-5.876116,Z=0.000000),LeaveTangent=(X=0.000000,Y=-5.876116,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.500000,OutVal=(X=0.000000,Y=-12.656250,Z=380.917969),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=0.000000,Y=-5.449219,Z=521.542969),ArriveTangent=(X=0.000000,Y=5.476505,Z=62.973633),LeaveTangent=(X=0.000000,Y=5.476505,Z=62.973633),InterpMode=CIM_CurveAutoClamped),(InVal=94.500000,OutVal=(X=0.000000,Y=9.492188,Z=632.812500),ArriveTangent=(X=0.000000,Y=0.000000,Z=53.685463),LeaveTangent=(X=0.000000,Y=0.000000,Z=53.685463),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=0.000000,Y=-2.285156,Z=685.019531),ArriveTangent=(X=0.000000,Y=-3.680962,Z=20.643105),LeaveTangent=(X=0.000000,Y=-3.680962,Z=20.643105),InterpMode=CIM_CurveAutoClamped),(InVal=97.000000,OutVal=(X=0.000000,Y=-4.394531,Z=697.851563),ArriveTangent=(X=0.000000,Y=-2.724609,Z=20.802044),LeaveTangent=(X=0.000000,Y=-2.724609,Z=20.802044),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=0.000000,Y=-7.734375,Z=728.789063),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.180899),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.180899),InterpMode=CIM_CurveAutoClamped),(InVal=99.500000,OutVal=(X=0.000000,Y=-7.031250,Z=742.500000),ArriveTangent=(X=0.000000,Y=0.956016,Z=20.059195),LeaveTangent=(X=0.000000,Y=0.956016,Z=20.059195),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=0.000000,Y=-3.164063,Z=862.910156),InterpMode=CIM_CurveUser),(InVal=102.500000,OutVal=(X=0.000000,Y=-6.503906,Z=731.777344),InterpMode=CIM_CurveAutoClamped),(InVal=104.000000,OutVal=(X=0.000000,Y=-4.921875,Z=768.867188),InterpMode=CIM_CurveAutoClamped),(InVal=106.000000,OutVal=(X=0.000000,Y=-4.921875,Z=686.953125),InterpMode=CIM_CurveAutoClamped),(InVal=107.500000,OutVal=(X=0.000000,Y=-6.679688,Z=735.117188),ArriveTangent=(X=0.000000,Y=0.000000,Z=51.820759),LeaveTangent=(X=0.000000,Y=0.000000,Z=51.820759),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=0.000000,Y=-5.097656,Z=849.902344),ArriveTangent=(X=0.000000,Y=0.853795,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.853795,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=111.000000,OutVal=(X=0.000000,Y=-3.691406,Z=737.226563),ArriveTangent=(X=0.000000,Y=0.904018,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.904018,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=112.500000,OutVal=(X=0.000000,Y=-1.933594,Z=773.085938),InterpMode=CIM_CurveAutoClamped),(InVal=114.000000,OutVal=(X=0.000000,Y=-9.316406,Z=612.949219),ArriveTangent=(X=0.000000,Y=-4.980469,Z=-61.508148),LeaveTangent=(X=0.000000,Y=-4.980469,Z=-61.508148),InterpMode=CIM_CurveAutoClamped),(InVal=115.500000,OutVal=(X=0.000000,Y=-16.875000,Z=560.566406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-46.226540),LeaveTangent=(X=0.000000,Y=0.000000,Z=-46.226540),InterpMode=CIM_CurveAutoClamped),(InVal=117.500000,OutVal=(X=0.000000,Y=-2.636719,Z=449.648438),InterpMode=CIM_CurveUser),(InVal=120.000000,OutVal=(X=0.000000,Y=-10.019531,Z=580.605469),ArriveTangent=(X=0.000000,Y=-3.437500,Z=0.000000),LeaveTangent=(X=0.000000,Y=-3.437500,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=122.000000,OutVal=(X=0.000000,Y=-18.105469,Z=569.355469),InterpMode=CIM_CurveAutoClamped),(InVal=124.000000,OutVal=(X=0.000000,Y=-6.855469,Z=618.925781),ArriveTangent=(X=0.000000,Y=4.767434,Z=0.000000),LeaveTangent=(X=0.000000,Y=4.767434,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=125.000000,OutVal=(X=0.000000,Y=-2.988281,Z=558.281250),ArriveTangent=(X=0.000000,Y=2.531250,Z=-32.809074),LeaveTangent=(X=0.000000,Y=2.531250,Z=-32.809074),InterpMode=CIM_CurveUser),(InVal=127.000000,OutVal=(X=0.000000,Y=-0.527344,Z=532.441406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-19.621420),LeaveTangent=(X=0.000000,Y=0.000000,Z=-19.621420),InterpMode=CIM_CurveAutoClamped),(InVal=129.500000,OutVal=(X=0.000000,Y=-0.878906,Z=463.183594),ArriveTangent=(X=0.000000,Y=-0.316582,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.316582,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=132.000000,OutVal=(X=0.000000,Y=-4.746094,Z=479.179688),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.887695),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.887695),InterpMode=CIM_CurveAutoClamped),(InVal=133.500000,OutVal=(X=0.000000,Y=-4.746094,Z=502.734375),InterpMode=CIM_CurveAutoClamped),(InVal=136.000000,OutVal=(X=0.000000,Y=-4.746094,Z=460.019531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.554688),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.554688),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=0.000000,Y=2.109375,Z=419.238281),InterpMode=CIM_CurveAutoClamped),(InVal=139.000000,OutVal=(X=0.000000,Y=-3.515625,Z=488.320313),InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=(X=0.000000,Y=12.304688,Z=409.570313),InterpMode=CIM_CurveAutoClamped),(InVal=142.000000,OutVal=(X=0.000000,Y=-4.394531,Z=411.503906),InterpMode=CIM_CurveAutoClamped),(InVal=143.500000,OutVal=(X=0.000000,Y=1.406250,Z=257.167969),ArriveTangent=(X=0.000000,Y=0.791456,Z=-93.339844),LeaveTangent=(X=0.000000,Y=0.791456,Z=-93.339844),InterpMode=CIM_CurveAutoClamped),(InVal=145.000000,OutVal=(X=0.000000,Y=1.933594,Z=131.484375),ArriveTangent=(X=0.000000,Y=0.000000,Z=-58.216644),LeaveTangent=(X=0.000000,Y=0.000000,Z=-58.216644),InterpMode=CIM_CurveAutoClamped),(InVal=146.500000,OutVal=(X=0.000000,Y=-5.976563,Z=76.464844),InterpMode=CIM_CurveAutoClamped),(InVal=147.500000,OutVal=(X=0.000000,Y=-5.449219,Z=186.152344),ArriveTangent=(X=0.000000,Y=0.615234,Z=76.848167),LeaveTangent=(X=0.000000,Y=0.615234,Z=76.848167),InterpMode=CIM_CurveAutoClamped),(InVal=148.500000,OutVal=(X=0.000000,Y=-4.746094,Z=234.843750),InterpMode=CIM_CurveAutoClamped),(InVal=150.500000,OutVal=(X=0.000000,Y=-17.402344,Z=153.281250),InterpMode=CIM_CurveUser),(InVal=152.000000,OutVal=(X=0.000000,Y=-6.152344,Z=148.007813),ArriveTangent=(X=0.000000,Y=4.531250,Z=-6.463067),LeaveTangent=(X=0.000000,Y=4.531250,Z=-6.463067),InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=(X=0.000000,Y=2.988281,Z=55.898438),InterpMode=CIM_CurveUser),(InVal=156.500000,OutVal=(X=0.000000,Y=-2.812500,Z=25.664063),ArriveTangent=(X=0.000000,Y=-0.504844,Z=-12.929688),LeaveTangent=(X=0.000000,Y=-0.504844,Z=-12.929688),InterpMode=CIM_CurveUser),(InVal=158.000000,OutVal=(X=0.000000,Y=0.703125,Z=-2.285156),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.198635),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.198635),InterpMode=CIM_CurveUser),(InVal=159.000000,OutVal=(X=0.000000,Y=0.703125,Z=-4.394531),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=0.000000,Y=-1.230469,Z=33.222656),ArriveTangent=(X=0.000000,Y=-1.828125,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.828125,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=161.500000,OutVal=(X=0.000000,Y=-3.867188,Z=-58.710938),ArriveTangent=(X=0.000000,Y=-0.863636,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.863636,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=163.500000,OutVal=(X=0.000000,Y=-4.746094,Z=-29.179688),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=0.000000,Y=-2.812500,Z=-166.640625),InterpMode=CIM_CurveAutoClamped),(InVal=166.500000,OutVal=(X=0.000000,Y=-8.085938,Z=-52.734375),ArriveTangent=(X=0.000000,Y=0.000000,Z=62.794872),LeaveTangent=(X=0.000000,Y=0.000000,Z=62.794872),InterpMode=CIM_CurveAutoClamped),(InVal=167.500000,OutVal=(X=0.000000,Y=-5.097656,Z=-4.921875),ArriveTangent=(X=0.000000,Y=3.275291,Z=0.000000),LeaveTangent=(X=0.000000,Y=3.275291,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,OutVal=(X=0.000000,Y=3.691406,Z=-65.039063),InterpMode=CIM_CurveUser),(InVal=172.000000,OutVal=(X=0.000000,Y=-9.492188,Z=50.800781),InterpMode=CIM_CurveUser),(InVal=175.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-98.789063),ArriveTangent=(X=0.000000,Y=1.125000,Z=-38.340157),LeaveTangent=(X=0.000000,Y=1.125000,Z=-38.340157),InterpMode=CIM_CurveAutoClamped),(InVal=177.000000,OutVal=(X=0.000000,Y=-3.867188,Z=-153.808594),ArriveTangent=(X=0.000000,Y=2.590906,Z=0.000000),LeaveTangent=(X=0.000000,Y=2.590906,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=178.500000,OutVal=(X=0.000000,Y=4.042969,Z=3.691406),ArriveTangent=(X=0.000000,Y=0.000000,Z=48.892639),LeaveTangent=(X=0.000000,Y=0.000000,Z=48.892639),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=0.000000,Y=3.164063,Z=42.011719),InterpMode=CIM_CurveAutoClamped),(InVal=181.500000,OutVal=(X=0.000000,Y=3.515625,Z=30.761719),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=0.000000,Y=-8.437500,Z=186.679688),ArriveTangent=(X=0.000000,Y=-6.796875,Z=0.000000),LeaveTangent=(X=0.000000,Y=-6.796875,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=184.500000,OutVal=(X=0.000000,Y=-16.875000,Z=93.691406),InterpMode=CIM_CurveAutoClamped),(InVal=186.000000,OutVal=(X=0.000000,Y=-6.503906,Z=163.476563),ArriveTangent=(X=0.000000,Y=5.712891,Z=72.825851),LeaveTangent=(X=0.000000,Y=5.712891,Z=72.825851),InterpMode=CIM_CurveUser),(InVal=187.500000,OutVal=(X=0.000000,Y=5.976563,Z=107.402344),InterpMode=CIM_CurveAutoClamped),(InVal=189.500000,OutVal=(X=0.000000,Y=2.460938,Z=166.464844),ArriveTangent=(X=0.000000,Y=0.000000,Z=197.799683),LeaveTangent=(X=0.000000,Y=0.000000,Z=197.799683),InterpMode=CIM_CurveUser),(InVal=191.000000,OutVal=(X=0.000000,Y=-0.483398,Z=199.687500),ArriveTangent=(X=0.000000,Y=-2.882813,Z=35.296875),LeaveTangent=(X=0.000000,Y=-2.882813,Z=35.296875),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=0.000000,Y=-4.746094,Z=254.707031),ArriveTangent=(X=0.000000,Y=1.002428,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.002428,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=193.000000,OutVal=(X=0.000000,Y=-4.570313,Z=190.371094),ArriveTangent=(X=0.000000,Y=2.642803,Z=-26.357126),LeaveTangent=(X=0.000000,Y=2.642803,Z=-26.357126),InterpMode=CIM_CurveUser),(InVal=194.000000,OutVal=(X=0.000000,Y=0.000000,Z=178.593750),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.000000),(Time=4.000000),(Time=7.500000),(Time=9.500000),(Time=11.500000),(Time=13.500000),(Time=15.500000),(Time=17.000000),(Time=19.000000),(Time=21.000000),(Time=23.000000),(Time=25.000000),(Time=27.500000),(Time=30.000000),(Time=32.000000),(Time=33.500000),(Time=36.000000),(Time=37.500000),(Time=39.500000),(Time=41.500000),(Time=43.500000),(Time=45.500000),(Time=48.000000),(Time=49.500000),(Time=51.500000),(Time=53.000000),(Time=54.500000),(Time=56.000000),(Time=57.500000),(Time=59.000000),(Time=60.500000),(Time=62.500000),(Time=64.000000),(Time=65.500000),(Time=67.000000),(Time=68.500000),(Time=71.000000),(Time=73.000000),(Time=74.500000),(Time=76.000000),(Time=77.500000),(Time=79.000000),(Time=80.500000),(Time=82.500000),(Time=85.000000),(Time=87.000000),(Time=88.500000),(Time=90.500000),(Time=93.000000),(Time=94.500000),(Time=96.000000),(Time=97.000000),(Time=98.000000),(Time=99.500000),(Time=101.000000),(Time=102.500000),(Time=104.000000),(Time=106.000000),(Time=107.500000),(Time=109.000000),(Time=111.000000),(Time=112.500000),(Time=114.000000),(Time=115.500000),(Time=117.500000),(Time=120.000000),(Time=122.000000),(Time=124.000000),(Time=125.000000),(Time=127.000000),(Time=129.500000),(Time=132.000000),(Time=133.500000),(Time=136.000000),(Time=138.000000),(Time=139.000000),(Time=140.000000),(Time=142.000000),(Time=143.500000),(Time=145.000000),(Time=146.500000),(Time=147.500000),(Time=148.500000),(Time=150.500000),(Time=152.000000),(Time=155.000000),(Time=156.500000),(Time=158.000000),(Time=159.000000),(Time=160.000000),(Time=161.500000),(Time=163.500000),(Time=165.000000),(Time=166.500000),(Time=167.500000),(Time=170.000000),(Time=172.000000),(Time=175.000000),(Time=177.000000),(Time=178.500000),(Time=180.000000),(Time=181.500000),(Time=183.000000),(Time=184.500000),(Time=186.000000),(Time=187.500000),(Time=189.500000),(Time=191.000000),(Time=192.000000),(Time=193.000000),(Time=194.000000)))
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
      InterpTracks(0)=InterpTrackMove'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="FlythroughCamera"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=194.093643
   InterpGroups(0)=InterpGroup'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=194.093643
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=1416
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   PlayRate=0.650000
   InputLinks(0)=(DrawY=1254,OverrideDelta=15)
   InputLinks(1)=(DrawY=1276,OverrideDelta=37)
   InputLinks(2)=(DrawY=1298,OverrideDelta=59)
   InputLinks(3)=(DrawY=1320,OverrideDelta=81)
   InputLinks(4)=(DrawY=1342,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=1270,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1326,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=4585,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="FlythroughCamera",MinVars=0,DrawX=4652,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=1216
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=1453,OverrideDelta=14)
   InputLinks(1)=(DrawY=1474,OverrideDelta=35)
   InputLinks(2)=(DrawY=1495,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1474,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=2070,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2121,OverrideDelta=76)
   EventLinks(0)=(DrawX=2170,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=1416
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=1445,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1466,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1487,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1874,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1792
   ObjPosY=1376
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2024
   ObjPosY=1592
   ObjComment="PARENT - Wall 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1157
   SizeY=815
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=1304
   ObjComment="Portal Spawns - Hallway Hole"
   DrawWidth=1157
   DrawHeight=815
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=2877,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2898,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2919,OverrideDelta=56)
   VariableLinks(0)=(DrawX=790,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=2808
   ObjName="TriggerVolume_16 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=2885,OverrideDelta=14)
   InputLinks(1)=(DrawY=2906,OverrideDelta=35)
   InputLinks(2)=(DrawY=2927,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2906,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=958,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1009,OverrideDelta=76)
   EventLinks(0)=(DrawX=1058,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=920
   ObjPosY=2848
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=2984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=973
   SizeY=385
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=2776
   ObjComment="Lower Catwalks"
   DrawWidth=973
   DrawHeight=385
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=2925,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2946,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2967,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1818,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1736
   ObjPosY=2856
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=2925,OverrideDelta=14)
   InputLinks(1)=(DrawY=2946,OverrideDelta=35)
   InputLinks(2)=(DrawY=2967,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2946,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=1998,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2049,OverrideDelta=76)
   EventLinks(0)=(DrawX=2098,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1960
   ObjPosY=2888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1968
   ObjPosY=3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=1130
   SizeY=402
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=2824
   ObjComment="Rock Bridge"
   DrawWidth=1130
   DrawHeight=402
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-CATACOMBS.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2136
   ObjPosY=1600
   ObjComment="child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=1461,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1482,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1503,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2410,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2328
   ObjPosY=1392
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=1469,OverrideDelta=14)
   InputLinks(1)=(DrawY=1490,OverrideDelta=35)
   InputLinks(2)=(DrawY=1511,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1490,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=2646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2697,OverrideDelta=76)
   EventLinks(0)=(DrawX=2746,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2608
   ObjPosY=1432
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=Emitter'KF-CATACOMBS.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=1560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=513
   SizeY=292
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=1360
   ObjComment="Rock Emitter Handling"
   DrawWidth=513
   DrawHeight=292
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=1893,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1914,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1935,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2398,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2312
   ObjPosY=1824
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1877,OverrideDelta=14)
   InputLinks(1)=(DrawY=1898,OverrideDelta=35)
   InputLinks(2)=(DrawY=1919,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1898,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=2654,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2705,OverrideDelta=76)
   EventLinks(0)=(DrawX=2754,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=1840
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=Emitter'KF-CATACOMBS.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2622
   ObjPosY=1969
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=537
   SizeY=269
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2280
   ObjPosY=1792
   ObjComment="Rock Emitter Handling"
   DrawWidth=537
   DrawHeight=269
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=965,OverrideDelta=14)
   OutputLinks(1)=(DrawY=986,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1007,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1078,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=992
   ObjPosY=896
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=973,OverrideDelta=14)
   InputLinks(1)=(DrawY=994,OverrideDelta=35)
   InputLinks(2)=(DrawY=1015,OverrideDelta=56)
   OutputLinks(0)=(DrawY=994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=1374,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1425,OverrideDelta=76)
   EventLinks(0)=(DrawX=1474,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1336
   ObjPosY=936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'KF-CATACOMBS.TheWorld:PersistentLevel.Emitter_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1344
   ObjPosY=1064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=577
   SizeY=293
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=960
   ObjPosY=864
   ObjComment="Rock Emitter Handling"
   DrawWidth=577
   DrawHeight=293
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=2941,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2962,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2983,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1238,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1152
   ObjPosY=2872
   ObjName="TriggerVolume_12 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=2925,OverrideDelta=14)
   InputLinks(1)=(DrawY=2946,OverrideDelta=35)
   InputLinks(2)=(DrawY=2967,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2946,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=1454,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1505,OverrideDelta=76)
   EventLinks(0)=(DrawX=1554,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1416
   ObjPosY=2888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=Emitter'KF-CATACOMBS.TheWorld:PersistentLevel.Emitter_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1424
   ObjPosY=3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=497
   SizeY=269
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=2840
   ObjComment="Rock Emitter Handling"
   DrawWidth=497
   DrawHeight=269
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-CATACOMBS.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   bPlayerOnly=False
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=2981,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3002,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3023,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2330,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2248
   ObjPosY=2912
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=2973,OverrideDelta=14)
   InputLinks(1)=(DrawY=2994,OverrideDelta=35)
   InputLinks(2)=(DrawY=3015,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=2566,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2617,OverrideDelta=76)
   EventLinks(0)=(DrawX=2666,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=2936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=Emitter'KF-CATACOMBS.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=3072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=513
   SizeY=277
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2216
   ObjPosY=2880
   ObjComment="Rock Emitter Handling"
   DrawWidth=513
   DrawHeight=277
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=2069,OverrideDelta=14)
   InputLinks(1)=(DrawY=2090,OverrideDelta=35)
   InputLinks(2)=(DrawY=2111,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2090,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=4750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4801,OverrideDelta=76)
   EventLinks(0)=(DrawX=4850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4712
   ObjPosY=2032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=2168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4736
   ObjPosY=2168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4832
   ObjPosY=2168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4624
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=2437,OverrideDelta=14)
   InputLinks(1)=(DrawY=2458,OverrideDelta=35)
   InputLinks(2)=(DrawY=2479,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2458,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=4774,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4825,OverrideDelta=76)
   EventLinks(0)=(DrawX=4874,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4736
   ObjPosY=2400
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=2552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4752
   ObjPosY=2552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4856
   ObjPosY=2552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4648
   ObjPosY=2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4744
   ObjPosY=2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4848
   ObjPosY=2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=2845,OverrideDelta=14)
   InputLinks(1)=(DrawY=2866,OverrideDelta=35)
   InputLinks(2)=(DrawY=2887,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2866,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=4798,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4849,OverrideDelta=76)
   EventLinks(0)=(DrawX=4898,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4760
   ObjPosY=2808
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4752
   ObjPosY=2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4856
   ObjPosY=2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=3032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4752
   ObjPosY=3032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-CATACOMBS.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4856
   ObjPosY=3032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxTriggerCount=2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=2253,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2274,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=2295,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3672
   ObjPosY=2184
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SpawnOFF"
   MaxWidth=187
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16',InputLinkIdx=1)),DrawY=2338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4325,OverrideDelta=61)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4232
   ObjPosY=2272
   ObjComment="SpawnOFF"
   DrawWidth=113
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="SpawnOFF"
   InputLinks(0)=(DrawY=2130,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),ActivateDelay=1.000000,DrawY=2130,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4052,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3928
   ObjPosY=2096
   ObjComment="SpawnOFF"
   DrawWidth=248
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=3
   IncrementAmount=0
   InputLinks(0)=(DrawY=2234,OverrideDelta=19)
   InputLinks(1)=(DrawY=2266,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=2229,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),LinkDesc="Link 2",DrawY=2250,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),LinkDesc="Link 3",DrawY=2271,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3996,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CATACOMBS.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3952
   ObjPosY=2192
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object
