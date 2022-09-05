Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="ChangeCamera"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),DrawY=-7750,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5165,OverrideDelta=75)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5272
   ObjPosY=-7816
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4328
   ObjPosY=-8056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_2
   InputLinks(0)=(DrawY=-8110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-4418,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-4358,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-8144
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_2"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4504
   ObjPosY=-8056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=11
   bLooping=True
   InputLinks(0)=(DrawY=-7654,OverrideDelta=131)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_2')),DrawY=-7769,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_3')),LinkDesc="Link 2",DrawY=-7746,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_4')),LinkDesc="Link 3",DrawY=-7723,OverrideDelta=62)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_5')),LinkDesc="Link 4",DrawY=-7700,OverrideDelta=85)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_6')),LinkDesc="Link 5",DrawY=-7677,OverrideDelta=108)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_7')),LinkDesc="Link 6",DrawY=-7654,OverrideDelta=131)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_8')),LinkDesc="Link 7",DrawY=-7631,OverrideDelta=154)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_9')),LinkDesc="Link 8",DrawY=-7608,OverrideDelta=177)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_10')),LinkDesc="Link 9",DrawY=-7585,OverrideDelta=200)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_11')),LinkDesc="Link 10",DrawY=-7562,OverrideDelta=223)
   OutputLinks(10)=(Links=((LinkedOp=SeqAct_SetCameraTarget'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetCameraTarget_1')),LinkDesc="Link 11",DrawY=-7539,OverrideDelta=246)
   VariableLinks(0)=(DrawX=-4828,OverrideDelta=18)
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4864
   ObjPosY=-7808
   DrawWidth=73
   DrawHeight=301
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4456
   ObjPosY=-7832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_3
   InputLinks(0)=(DrawY=-7934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7934,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-4386,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=-4326,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-7968
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_3"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-7832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4432
   ObjPosY=-7608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_3"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_4
   InputLinks(0)=(DrawY=-7710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7710,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_3'),DrawX=-4362,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-4302,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-7744
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_4"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4256
   ObjPosY=-7608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-7368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_4"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_5
   InputLinks(0)=(DrawY=-7470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_4'),DrawX=-4338,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-4278,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4376
   ObjPosY=-7504
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_5"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4232
   ObjPosY=-7368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4216
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_6
   InputLinks(0)=(DrawY=-7246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_5'),DrawX=-4322,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-4262,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4360
   ObjPosY=-7280
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_6"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4392
   ObjPosY=-7144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_5"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4384
   ObjPosY=-6912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_6"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_7
   InputLinks(0)=(DrawY=-7014,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7014,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_6'),DrawX=-4314,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-4254,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4352
   ObjPosY=-7048
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_7"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4208
   ObjPosY=-6912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4192
   ObjPosY=-6680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_8
   InputLinks(0)=(DrawY=-6782,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6782,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_7'),DrawX=-4298,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-4238,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4336
   ObjPosY=-6816
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_8"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4368
   ObjPosY=-6680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_7"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4144
   ObjPosY=-6448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_9
   InputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6550,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_8'),DrawX=-4250,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-4190,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4288
   ObjPosY=-6584
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_9"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4320
   ObjPosY=-6448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_8"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4120
   ObjPosY=-6200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_10
   InputLinks(0)=(DrawY=-6302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6302,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_9'),DrawX=-4226,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-4166,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4264
   ObjPosY=-6336
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_10"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4296
   ObjPosY=-6200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_9"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4096
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_11
   InputLinks(0)=(DrawY=-6062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_10'),DrawX=-4202,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=-4142,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4240
   ObjPosY=-6096
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_11"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4272
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_10"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=CameraActor'Sanitarium_Benchmark.TheWorld:PersistentLevel.CameraActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=-5704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetCameraTarget Name=SeqAct_SetCameraTarget_1
   InputLinks(0)=(DrawY=-5806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5806,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-4194,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-4134,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4232
   ObjPosY=-5840
   DrawWidth=136
   DrawHeight=77
   Name="SeqAct_SetCameraTarget_1"
   ObjectArchetype=SeqAct_SetCameraTarget'Engine.Default__SeqAct_SetCameraTarget'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'Sanitarium_Benchmark.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4264
   ObjPosY=-5704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object
