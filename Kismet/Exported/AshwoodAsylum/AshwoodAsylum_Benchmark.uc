Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=CameraActor'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1160
   ObjPosY=88
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=CameraActor'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1176
   ObjPosY=248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=CameraActor'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1160
   ObjPosY=-72
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=CameraActor'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.CameraActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1192
   ObjPosY=424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SingleCameraSwitch"
   MaxWidth=250
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),DrawY=-14,OverrideDelta=11)
   VariableLinks(0)=(DrawX=517,OverrideDelta=93)
   ObjInstanceVersion=2
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=-80
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=4
   bLooping=True
   InputLinks(0)=(DrawY=14,OverrideDelta=47)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetCameraTarget'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_1')),DrawY=-19,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetCameraTarget'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_3')),LinkDesc="Link 2",DrawY=3,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_SetCameraTarget'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_4')),LinkDesc="Link 3",DrawY=25,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_SetCameraTarget'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_2')),LinkDesc="Link 4",DrawY=47,OverrideDelta=80)
   VariableLinks(0)=(DrawX=842,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=-56
   DrawWidth=68
   DrawHeight=133
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=992
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_1
   InputLinks(0)=(DrawY=-134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-134,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=1078,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=1138,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1040
   ObjPosY=-168
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_1"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_3
   InputLinks(0)=(DrawY=42,OverrideDelta=11)
   OutputLinks(0)=(DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=1086,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=1146,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1048
   ObjPosY=8
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_3"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1000
   ObjPosY=96
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_4
   InputLinks(0)=(DrawY=202,OverrideDelta=11)
   OutputLinks(0)=(DrawY=202,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_3'),DrawX=1102,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=1162,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1064
   ObjPosY=168
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_4"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_3"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_2
   InputLinks(0)=(DrawY=362,OverrideDelta=11)
   OutputLinks(0)=(DrawY=362,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=1118,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=1178,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1080
   ObjPosY=328
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_2"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'AshwoodAsylum_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1032
   ObjPosY=416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object
