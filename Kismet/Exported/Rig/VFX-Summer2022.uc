Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=496
   ObjPosY=-1760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-1851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=622,OverrideDelta=16)
   VariableLinks(1)=(DrawX=673,OverrideDelta=76)
   EventLinks(0)=(DrawX=722,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=584
   ObjPosY=-1888
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Lighting_1"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-1843,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=408,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=261
   ObjPosY=-1909
   ObjComment="Lighting_1"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=320
   ObjPosY=-1728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_SequenceActivated Name=SeqEvent_SequenceActivated_1
   bClientSideOnly=True
   MaxWidth=283
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=986,OverrideDelta=11)
   VariableLinks(0)=(DrawX=349,OverrideDelta=109)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=208
   ObjPosY=920
   DrawWidth=161
   DrawHeight=128
   Name="SeqEvent_SequenceActivated_1"
   ObjectArchetype=SeqEvent_SequenceActivated'Engine.Default__SeqEvent_SequenceActivated'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="Lighting_1"
   InputLinks(0)=(DrawY=898,OverrideDelta=11)
   OutputLinks(0)=(DrawY=898,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1242,OverrideDelta=90)
   ObjInstanceVersion=3
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=864
   ObjComment="Lighting_1"
   DrawWidth=245
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   IncrementAmount=0
   InputLinks(0)=(DrawY=1220,OverrideDelta=13)
   InputLinks(1)=(DrawY=1240,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=1230,OverrideDelta=23)
   VariableLinks(0)=(DrawX=836,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=792
   ObjPosY=1184
   DrawWidth=89
   DrawHeight=101
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=1897
   SizeY=1310
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=-1928
   ObjComment="Lightning Emitters"
   DrawWidth=1897
   DrawHeight=1310
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=960
   ObjPosY=-1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Lighting_2"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-1818,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=1047,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=900
   ObjPosY=-1884
   ObjComment="Lighting_2"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-1827,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1806,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1785,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1806,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=1318,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1369,OverrideDelta=76)
   EventLinks(0)=(DrawX=1418,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1280
   ObjPosY=-1864
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1232
   ObjPosY=-1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1576
   ObjPosY=-1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="Lighting_3"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-1818,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=1659,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=-1884
   ObjComment="Lighting_3"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-1827,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1806,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1785,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1806,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=1934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1985,OverrideDelta=76)
   EventLinks(0)=(DrawX=2034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=-1864
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1848
   ObjPosY=-1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=-1408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Lighting_4"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-1518,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=411,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=264
   ObjPosY=-1584
   ObjComment="Lighting_4"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-1531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1510,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1489,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=686,OverrideDelta=16)
   VariableLinks(1)=(DrawX=737,OverrideDelta=76)
   EventLinks(0)=(DrawX=786,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=-1568
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=-1408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=-1400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="Lighting_5"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=-1514,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=995,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=-1580
   ObjComment="Lighting_5"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-1523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=1270,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1321,OverrideDelta=76)
   EventLinks(0)=(DrawX=1370,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1232
   ObjPosY=-1560
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=-1400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1568
   ObjPosY=-1376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="Lighting_6"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-1490,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=1651,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=-1556
   ObjComment="Lighting_6"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-1499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=1926,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1977,OverrideDelta=76)
   EventLinks(0)=(DrawX=2026,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=-1536
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=-1376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=-1088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_7
   EventName="Lighting_7"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-1198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=411,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=264
   ObjPosY=-1264
   ObjComment="Lighting_7"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_7"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-1211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1169,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1190,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=686,OverrideDelta=16)
   VariableLinks(1)=(DrawX=737,OverrideDelta=76)
   EventLinks(0)=(DrawX=786,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=-1248
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=-1088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=920
   ObjPosY=-1096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="Lighting_8"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-1206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=1003,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=856
   ObjPosY=-1272
   ObjComment="Lighting_8"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-1219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1177,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1198,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=1278,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1329,OverrideDelta=76)
   EventLinks(0)=(DrawX=1378,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1240
   ObjPosY=-1256
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1192
   ObjPosY=-1096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=-1088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="Lighting_9"
   bClientSideOnly=True
   MaxWidth=295
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-1198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=1635,OverrideDelta=115)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1488
   ObjPosY=-1264
   ObjComment="Lighting_9"
   DrawWidth=167
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-1211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1169,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1190,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=1910,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1961,OverrideDelta=76)
   EventLinks(0)=(DrawX=2010,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1872
   ObjPosY=-1248
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1824
   ObjPosY=-1088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=-752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Lighting_10"
   bClientSideOnly=True
   MaxWidth=303
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=-862,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=919,OverrideDelta=119)
   ObjInstanceVersion=2
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=768
   ObjPosY=-928
   ObjComment="Lighting_10"
   DrawWidth=171
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=-875,OverrideDelta=14)
   InputLinks(1)=(DrawY=-854,OverrideDelta=35)
   InputLinks(2)=(DrawY=-833,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-854,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=1190,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1241,OverrideDelta=76)
   EventLinks(0)=(DrawX=1290,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1152
   ObjPosY=-912
   ObjComment="Lightning_System_"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=Emitter'VFX-summer2022.TheWorld:PersistentLevel.Emitter_334'
   ObjInstanceVersion=1
   ParentSequence=Sequence'VFX-summer2022.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=-752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
