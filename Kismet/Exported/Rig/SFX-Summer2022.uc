Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=541,OverrideDelta=14)
   InputLinks(1)=(DrawY=563,OverrideDelta=36)
   InputLinks(2)=(DrawY=585,OverrideDelta=58)
   InputLinks(3)=(DrawY=607,OverrideDelta=80)
   OutputLinks(0)=(DrawY=574,OverrideDelta=47)
   VariableLinks(0)=(DrawX=749,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=504
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=-4773,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4752,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4731,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9642
   ObjPosY=-4842
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=-4773,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4752,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4731,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9642
   ObjPosY=-4842
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=549,OverrideDelta=14)
   OutputLinks(1)=(DrawY=570,OverrideDelta=35)
   OutputLinks(2)=(DrawY=591,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=336
   ObjPosY=480
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Lighting_1"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=874,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=388,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=296
   ObjPosY=808
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=248
   ObjPosY=968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=882,OverrideDelta=11)
   OutputLinks(0)=(DrawY=882,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=664,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=848
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=882,OverrideDelta=11)
   OutputLinks(0)=(DrawY=882,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=1128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1080
   ObjPosY=848
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=712
   ObjPosY=968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Lighting_2"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=874,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=852,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=808
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=866,OverrideDelta=11)
   OutputLinks(0)=(DrawY=866,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=1584,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=832
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1168
   ObjPosY=952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="Lighting_3"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=858,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=1308,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1216
   ObjPosY=792
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=1250,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1250,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=688,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=1216
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=272
   ObjPosY=1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Lighting_4"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=1242,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=412,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=320
   ObjPosY=1176
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=1250,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1250,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=1152,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=1216
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="Lighting_5"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),DrawY=1242,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=876,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=784
   ObjPosY=1176
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=1242,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1242,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),DrawX=1600,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=1208
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=1328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="Lighting_6"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=1234,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=1324,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1232
   ObjPosY=1168
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=1626,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1626,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),DrawX=608,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=560
   ObjPosY=1592
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=192
   ObjPosY=1712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_7
   EventName="Lighting_7"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=1618,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=332,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=1552
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_7"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=1634,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1634,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=1152,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=1600
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=1720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_8
   EventName="Lighting_8"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=1626,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=876,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=784
   ObjPosY=1560
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_8"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=1626,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1626,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=1688,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1640
   ObjPosY=1592
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1272
   ObjPosY=1712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="Lighting_9"
   MaxWidth=184
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),DrawY=1618,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=1412,OverrideDelta=60)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1320
   ObjPosY=1552
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_Rig.Play_ENV_Rig_ThunderDistantRandom'
   InputLinks(0)=(DrawY=2050,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2050,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=1168,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=2016
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=2136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Lighting_10"
   MaxWidth=192
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=2042,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=896,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=800
   ObjPosY=1976
   DrawWidth=116
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=1080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1112
   ObjPosY=1088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1576
   ObjPosY=1112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=1448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1576
   ObjPosY=1448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1648
   ObjPosY=1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=TargetPoint'SFX-summer2022.TheWorld:PersistentLevel.TargetPoint_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1168
   ObjPosY=2184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
