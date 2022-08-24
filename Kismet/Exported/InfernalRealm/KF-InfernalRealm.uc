Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=2203
   SizeY=1791
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=336
   ObjPosY=312
   ObjComment="Floor_Portals"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=746
   SizeY=466
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=1680
   ObjComment="Wall_Portals"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=677,OverrideDelta=14)
   OutputLinks(1)=(DrawY=698,OverrideDelta=35)
   OutputLinks(2)=(DrawY=719,OverrideDelta=56)
   VariableLinks(0)=(DrawX=498,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=416
   ObjPosY=608
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=637,OverrideDelta=14)
   InputLinks(1)=(DrawY=658,OverrideDelta=35)
   InputLinks(2)=(DrawY=679,OverrideDelta=56)
   OutputLinks(0)=(DrawY=658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=694,OverrideDelta=16)
   VariableLinks(1)=(DrawX=745,OverrideDelta=76)
   EventLinks(0)=(DrawX=794,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=656
   ObjPosY=600
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=1277,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1298,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1319,OverrideDelta=56)
   VariableLinks(0)=(DrawX=482,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=1208
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=1245,OverrideDelta=14)
   InputLinks(1)=(DrawY=1266,OverrideDelta=35)
   InputLinks(2)=(DrawY=1287,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1266,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=662,OverrideDelta=16)
   VariableLinks(1)=(DrawX=713,OverrideDelta=76)
   EventLinks(0)=(DrawX=762,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=1208
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=1293,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1314,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1335,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1394,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1312
   ObjPosY=1224
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=1253,OverrideDelta=14)
   InputLinks(1)=(DrawY=1274,OverrideDelta=35)
   InputLinks(2)=(DrawY=1295,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1274,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=1558,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1609,OverrideDelta=76)
   EventLinks(0)=(DrawX=1658,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=1216
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=1216
   ObjComment="Center_Chamber"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=1517,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1538,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1559,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2074,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=1448
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=1477,OverrideDelta=14)
   InputLinks(1)=(DrawY=1498,OverrideDelta=35)
   InputLinks(2)=(DrawY=1519,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1498,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=2238,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2289,OverrideDelta=76)
   EventLinks(0)=(DrawX=2338,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2200
   ObjPosY=1440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2176
   ObjPosY=1600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=1440
   ObjComment="Torch_Room"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=1192
   ObjComment="West_View"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=416
   ObjPosY=616
   ObjComment="Green_Statue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=2)),DrawY=1261,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1282,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1303,OverrideDelta=56)
   VariableLinks(0)=(DrawX=954,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=872
   ObjPosY=1192
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=1250,OverrideDelta=35)
   InputLinks(1)=(DrawY=1271,OverrideDelta=56)
   InputLinks(2)=(DrawY=1229,OverrideDelta=14)
   OutputLinks(0)=(DrawY=1250,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=1126,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1177,OverrideDelta=76)
   EventLinks(0)=(DrawX=1226,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1088
   ObjPosY=1192
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1056
   ObjPosY=1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=1168
   ObjComment="Behind_Door_Tall_Stairs"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=1805,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1826,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1847,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1466,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1384
   ObjPosY=1736
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=1765,OverrideDelta=14)
   InputLinks(1)=(DrawY=1786,OverrideDelta=35)
   InputLinks(2)=(DrawY=1807,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1786,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=1638,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1689,OverrideDelta=76)
   EventLinks(0)=(DrawX=1738,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1600
   ObjPosY=1728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1584
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1368
   ObjPosY=1720
   ObjComment="South_View_Lower_Hall"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=909,OverrideDelta=14)
   OutputLinks(1)=(DrawY=930,OverrideDelta=35)
   OutputLinks(2)=(DrawY=951,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1996,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1914
   ObjPosY=840
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=869,OverrideDelta=14)
   InputLinks(1)=(DrawY=890,OverrideDelta=35)
   InputLinks(2)=(DrawY=911,OverrideDelta=56)
   OutputLinks(0)=(DrawY=890,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=2150,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2201,OverrideDelta=76)
   EventLinks(0)=(DrawX=2250,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2136
   ObjPosY=1000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=471
   SizeY=557
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=800
   ObjComment="Abaddon_Chamber"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=565,OverrideDelta=14)
   OutputLinks(1)=(DrawY=586,OverrideDelta=35)
   OutputLinks(2)=(DrawY=607,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1938,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1856
   ObjPosY=496
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=525,OverrideDelta=14)
   InputLinks(1)=(DrawY=546,OverrideDelta=35)
   InputLinks(2)=(DrawY=567,OverrideDelta=56)
   OutputLinks(0)=(DrawY=546,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=2094,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2145,OverrideDelta=76)
   EventLinks(0)=(DrawX=2194,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2056
   ObjPosY=488
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1848
   ObjPosY=488
   ObjComment="NorthEast_Corner"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1749,OverrideDelta=14)
   InputLinks(1)=(DrawY=1770,OverrideDelta=35)
   InputLinks(2)=(DrawY=1791,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1770,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=774,OverrideDelta=16)
   VariableLinks(1)=(DrawX=825,OverrideDelta=76)
   EventLinks(0)=(DrawX=874,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=1712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=1720
   ObjComment="South_West"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=1805,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1826,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1847,OverrideDelta=56)
   VariableLinks(0)=(DrawX=574,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=488
   ObjPosY=1736
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=424
   ObjComment="Start"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=509,OverrideDelta=14)
   OutputLinks(1)=(DrawY=530,OverrideDelta=35)
   OutputLinks(2)=(DrawY=551,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1222,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=440
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=461,OverrideDelta=14)
   InputLinks(1)=(DrawY=482,OverrideDelta=35)
   InputLinks(2)=(DrawY=503,OverrideDelta=56)
   OutputLinks(0)=(DrawY=482,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=1414,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1465,OverrideDelta=76)
   EventLinks(0)=(DrawX=1514,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1376
   ObjPosY=424
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1384
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),DrawY=1837,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1858,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1879,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2002,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=1768
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=1813,OverrideDelta=14)
   InputLinks(1)=(DrawY=1834,OverrideDelta=35)
   InputLinks(2)=(DrawY=1855,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1834,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=2150,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2201,OverrideDelta=76)
   EventLinks(0)=(DrawX=2250,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=1776
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=1920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1880
   ObjPosY=1752
   ObjComment="Wall_South_View"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=1061,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1082,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=1103,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=992
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=1077,OverrideDelta=14)
   InputLinks(1)=(DrawY=1098,OverrideDelta=35)
   InputLinks(2)=(DrawY=1119,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1098,OverrideDelta=35)
   VariableLinks(0)=(DrawX=-1634,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1583,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_0'),DrawX=-1534,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1672
   ObjPosY=1040
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_0
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=1338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1672,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1602,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=1272
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_0"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=1125,OverrideDelta=14)
   InputLinks(1)=(DrawY=1146,OverrideDelta=35)
   InputLinks(2)=(DrawY=1167,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1146,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-866,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-815,OverrideDelta=76)
   EventLinks(0)=(DrawX=-766,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-904
   ObjPosY=1088
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=1499
   SizeY=680
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1968
   ObjPosY=944
   ObjComment="Move_Player_Starts"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-657,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-678,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=-994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-736
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_6
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=2109,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2130,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2151,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=2040
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_6"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bLooping=True
   InputLinks(0)=(DrawY=2086,OverrideDelta=15)
   InputLinks(1)=(DrawY=2108,OverrideDelta=37)
   InputLinks(2)=(DrawY=2130,OverrideDelta=59)
   InputLinks(3)=(DrawY=2152,OverrideDelta=81)
   InputLinks(4)=(DrawY=2174,OverrideDelta=103)
   OutputLinks(0)=(DrawY=2102,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2158,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-1916,OverrideDelta=29)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Pend_2",MinVars=0,DrawX=-1860,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1960
   ObjPosY=2048
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(InVal=0.998690,OutVal=(X=0.000000,Y=-0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.997440,OutVal=(X=0.000000,Y=-0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(InVal=0.998690,OutVal=(X=0.000000,Y=0.000000,Z=33.750000),InterpMode=CIM_CurveAutoClamped),(InVal=1.997440,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,,(Time=0.998690),(Time=1.997440)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.012773,Event=AkEvent'WW_ENV_Infernal.Play_Clock_Pend')
         AkEvents(1)=(Time=1.004308,Event=AkEvent'WW_ENV_Infernal.Play_Clock_Pend')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackAkEvent'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackAkEvent_0'
      GroupName="Pend_2"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.997440
   InterpGroups(0)=InterpGroup'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.997440
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1928
   ObjPosY=2296
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=InterpActor'KF-INFERNALREALM.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1860
   ObjPosY=2205
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=606
   SizeY=763
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2240
   ObjPosY=1896
   ObjComment="Pendulums"
   DrawWidth=606
   DrawHeight=763
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-INFERNALREALM.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=1789,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1810,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1831,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1066,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=984
   ObjPosY=1720
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=1765,OverrideDelta=14)
   InputLinks(1)=(DrawY=1786,OverrideDelta=35)
   InputLinks(2)=(DrawY=1807,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1786,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=1206,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1257,OverrideDelta=76)
   EventLinks(0)=(DrawX=1306,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1168
   ObjPosY=1728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawner'KF-INFERNALREALM.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1152
   ObjPosY=1896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1'),(LinkedOp=SeqAct_Interp'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1199,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=-880
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1400
   ObjPosY=-432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=1704,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1640
   ObjPosY=-880
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=1200,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=-608
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   InputLinks(0)=(DrawY=-842,OverrideDelta=15)
   InputLinks(1)=(DrawY=-820,OverrideDelta=37)
   InputLinks(2)=(DrawY=-798,OverrideDelta=59)
   InputLinks(3)=(DrawY=-776,OverrideDelta=81)
   InputLinks(4)=(DrawY=-754,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-826,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-770,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=1399,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=1469,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1368
   ObjPosY=-880
   DrawWidth=156
   DrawHeight=173
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroupDirector_1.InterpTrackDirector_1'
      GroupColor=(B=147,G=189,R=0,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.498448,OutVal=(X=960.000122,Y=-0.000122,Z=0.000000),ArriveTangent=(X=341.258942,Y=-0.000103,Z=0.000000),LeaveTangent=(X=341.258942,Y=-0.000103,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=7.032784,OutVal=(X=2400.000488,Y=-240.000244,Z=0.000000),ArriveTangent=(X=162.937881,Y=0.000000,Z=0.000000),LeaveTangent=(X=162.937881,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.465555,OutVal=(X=2720.001465,Y=159.999756,Z=0.000000),ArriveTangent=(X=157.664978,Y=0.000000,Z=0.000000),LeaveTangent=(X=157.664978,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.407037,OutVal=(X=3760.003906,Y=-0.000366,Z=0.000000),ArriveTangent=(X=58.170029,Y=-96.700272,Z=0.000000),LeaveTangent=(X=58.170029,Y=-96.700272,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=17.200230,OutVal=(X=3840.004395,Y=-1120.000366,Z=0.000000),ArriveTangent=(X=48.663429,Y=-359.518951,Z=0.000000),LeaveTangent=(X=48.663429,Y=-359.518951,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=20.192547,OutVal=(X=4080.004395,Y=-2080.000977,Z=160.000000),ArriveTangent=(X=0.000000,Y=-371.348969,Z=0.000000),LeaveTangent=(X=0.000000,Y=-371.348969,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.094019,OutVal=(X=4000.005371,Y=-3680.001953,Z=0.000000),ArriveTangent=(X=0.000000,Y=-179.082397,Z=0.000000),LeaveTangent=(X=0.000000,Y=-179.082397,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=27.479687,OutVal=(X=4960.007324,Y=-4000.003906,Z=160.000000),ArriveTangent=(X=310.651855,Y=-66.568581,Z=0.000000),LeaveTangent=(X=310.651855,Y=-66.568581,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=31.304672,OutVal=(X=6240.008301,Y=-4160.004883,Z=0.000000),ArriveTangent=(X=51.060745,Y=-94.355385,Z=0.000000),LeaveTangent=(X=51.060745,Y=-94.355385,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=34.861897,OutVal=(X=6320.009766,Y=-5600.007324,Z=0.000000),ArriveTangent=(X=52.309425,Y=-288.702118,Z=0.000000),LeaveTangent=(X=52.309425,Y=-288.702118,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=38.304375,OutVal=(X=7440.012207,Y=-6240.010254,Z=0.000000),ArriveTangent=(X=262.933899,Y=-0.001480,Z=0.000000),LeaveTangent=(X=262.933899,Y=-0.001480,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=41.555611,OutVal=(X=8080.014160,Y=-6240.012207,Z=0.000000),ArriveTangent=(X=300.133514,Y=-0.001514,Z=0.000000),LeaveTangent=(X=300.133514,Y=-0.001514,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=44.701546,OutVal=(X=9360.017578,Y=-6480.014648,Z=0.000000),ArriveTangent=(X=261.308655,Y=-0.001053,Z=0.000000),LeaveTangent=(X=261.308655,Y=-0.001053,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=48.335281,OutVal=(X=9920.019531,Y=-6480.016113,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=52.695763,OutVal=(X=9840.021484,Y=-4880.018066,Z=0.000000),ArriveTangent=(X=0.000000,Y=307.916809,Z=0.000000),LeaveTangent=(X=0.000000,Y=307.916809,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=55.743832,OutVal=(X=9840.023438,Y=-4160.020020,Z=0.000000),ArriveTangent=(X=0.001595,Y=325.398590,Z=0.000000),LeaveTangent=(X=0.001595,Y=325.398590,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=58.842060,OutVal=(X=9920.026367,Y=-2880.021484,Z=0.000000),ArriveTangent=(X=51.635723,Y=330.238922,Z=0.000000),LeaveTangent=(X=51.635723,Y=330.238922,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=61.557796,OutVal=(X=10240.028320,Y=-2240.022461,Z=0.000000),ArriveTangent=(X=190.862061,Y=0.000000,Z=0.000000),LeaveTangent=(X=190.862061,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=64.582939,OutVal=(X=11120.030273,Y=-2240.023438,Z=0.000000),ArriveTangent=(X=0.001450,Y=-0.000763,Z=0.000000),LeaveTangent=(X=0.001450,Y=-0.000763,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=68.101921,OutVal=(X=11120.032227,Y=-3520.024414,Z=0.000000),ArriveTangent=(X=0.001328,Y=-0.000641,Z=0.000000),LeaveTangent=(X=0.001328,Y=-0.000641,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=72.156281,OutVal=(X=12480.034180,Y=-3520.025391,Z=-160.000031),ArriveTangent=(X=304.401886,Y=0.000000,Z=-0.000036),LeaveTangent=(X=304.401886,Y=0.000000,Z=-0.000036),InterpMode=CIM_CurveAutoClamped),(InVal=76.249062,OutVal=(X=13600.037109,Y=-2880.026367,Z=-160.000092),ArriveTangent=(X=273.711578,Y=0.000000,Z=0.000000),LeaveTangent=(X=273.711578,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=79.112640,OutVal=(X=14384.070313,Y=-2882.652832,Z=-0.000137),ArriveTangent=(X=152.680725,Y=0.000000,Z=0.000000),LeaveTangent=(X=152.680725,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=83.014030,OutVal=(X=14704.076172,Y=-1842.653687,Z=-0.000137),ArriveTangent=(X=0.003334,Y=319.214752,Z=0.000000),LeaveTangent=(X=0.003334,Y=319.214752,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=87.633545,OutVal=(X=14704.082031,Y=-162.654297,Z=-320.000244),ArriveTangent=(X=0.001278,Y=345.482422,Z=-0.000088),LeaveTangent=(X=0.001278,Y=345.482422,Z=-0.000088),InterpMode=CIM_CurveAutoClamped),(InVal=90.655518,OutVal=(X=14704.085938,Y=797.345825,Z=-320.000366),ArriveTangent=(X=0.001253,Y=282.287842,Z=0.000000),LeaveTangent=(X=0.001253,Y=282.287842,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=93.868317,OutVal=(X=14704.089844,Y=1597.345947,Z=-160.000473),ArriveTangent=(X=0.000000,Y=0.000473,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.000473,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=96.108734,OutVal=(X=14064.093750,Y=1597.346436,Z=-160.000534),ArriveTangent=(X=-270.426270,Y=0.000000,Z=0.000000),LeaveTangent=(X=-270.426270,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=99.193214,OutVal=(X=13264.097656,Y=1517.346680,Z=159.999420),ArriveTangent=(X=-213.201141,Y=0.000000,Z=0.000000),LeaveTangent=(X=-213.201141,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=102.112427,OutVal=(X=12784.099609,Y=1917.346802,Z=159.999420),ArriveTangent=(X=0.000000,Y=224.359802,Z=0.000000),LeaveTangent=(X=0.000000,Y=224.359802,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=104.756279,OutVal=(X=12784.101563,Y=2797.347168,Z=159.999420),ArriveTangent=(X=0.000000,Y=274.479462,Z=0.000000),LeaveTangent=(X=0.000000,Y=274.479462,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=109.107491,OutVal=(X=12304.103516,Y=3837.348145,Z=-0.000580),ArriveTangent=(X=-180.313339,Y=0.000000,Z=0.000000),LeaveTangent=(X=-180.313339,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=112.742355,OutVal=(X=11344.105469,Y=3837.348145,Z=311.999451),ArriveTangent=(X=-266.643066,Y=0.000000,Z=87.770203),LeaveTangent=(X=-266.643066,Y=0.000000,Z=87.770203),InterpMode=CIM_CurveAutoClamped),(InVal=116.308113,OutVal=(X=10384.107422,Y=3837.348633,Z=631.999573),ArriveTangent=(X=-281.946503,Y=0.000362,Z=73.551468),LeaveTangent=(X=-281.946503,Y=0.000362,Z=73.551468),InterpMode=CIM_CurveAutoClamped),(InVal=119.268402,OutVal=(X=9504.109375,Y=4157.349609,Z=791.999756),ArriveTangent=(X=-312.278564,Y=0.001060,Z=0.000263),LeaveTangent=(X=-312.278564,Y=0.001060,Z=0.000263),InterpMode=CIM_CurveAutoClamped),(InVal=122.968811,OutVal=(X=8304.114258,Y=4157.351074,Z=792.000122),ArriveTangent=(X=-317.086823,Y=0.000000,Z=0.000086),LeaveTangent=(X=-317.086823,Y=0.000000,Z=0.000086),InterpMode=CIM_CurveAutoClamped),(InVal=126.332687,OutVal=(X=7264.117676,Y=4157.351074,Z=792.000366),ArriveTangent=(X=-308.961578,Y=0.000000,Z=0.000000),LeaveTangent=(X=-308.961578,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=130.218887,OutVal=(X=6064.119141,Y=3837.351074,Z=632.000732),ArriveTangent=(X=-292.663330,Y=0.000000,Z=-73.038200),LeaveTangent=(X=-292.663330,Y=0.000000,Z=-73.038200),InterpMode=CIM_CurveAutoClamped),(InVal=133.986526,OutVal=(X=5024.119629,Y=3837.351563,Z=152.000885),ArriveTangent=(X=-254.801346,Y=0.000000,Z=0.000000),LeaveTangent=(X=-254.801346,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=137.754166,OutVal=(X=4144.120117,Y=3357.352539,Z=152.000885),ArriveTangent=(X=0.000000,Y=-203.100204,Z=0.000000),LeaveTangent=(X=0.000000,Y=-203.100204,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=141.992706,OutVal=(X=4144.120605,Y=2077.353516,Z=152.000885),ArriveTangent=(X=0.000000,Y=-282.155243,Z=0.000000),LeaveTangent=(X=0.000000,Y=-282.155243,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=145.693054,OutVal=(X=3744.122070,Y=1117.353638,Z=-7.999115),ArriveTangent=(X=0.000000,Y=-261.229675,Z=0.000000),LeaveTangent=(X=0.000000,Y=-261.229675,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=149.955048,OutVal=(X=4304.123047,Y=-2.646240,Z=-7.999115),ArriveTangent=(X=173.977493,Y=-228.345139,Z=0.000000),LeaveTangent=(X=173.977493,Y=-228.345139,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=153.050339,OutVal=(X=5024.124023,Y=-562.646484,Z=-7.999115),ArriveTangent=(X=226.606995,Y=0.000000,Z=0.000000),LeaveTangent=(X=226.606995,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=156.662704,OutVal=(X=5824.125000,Y=-2.646851,Z=152.000885),ArriveTangent=(X=282.014526,Y=176.258835,Z=0.000000),LeaveTangent=(X=282.014526,Y=176.258835,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=159.858505,OutVal=(X=6944.125977,Y=637.353088,Z=152.000885),ArriveTangent=(X=332.938995,Y=0.000000,Z=0.000000),LeaveTangent=(X=332.938995,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=163.390671,OutVal=(X=8064.127441,Y=637.353088,Z=-7.999115),ArriveTangent=(X=114.113968,Y=0.000000,Z=0.000000),LeaveTangent=(X=114.113968,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=167.931915,OutVal=(X=8304.129883,Y=2397.353271,Z=632.000977),ArriveTangent=(X=111.148659,Y=0.000107,Z=0.000130),LeaveTangent=(X=111.148659,Y=0.000107,Z=0.000130),InterpMode=CIM_CurveAutoClamped),(InVal=172.798218,OutVal=(X=10144.131836,Y=2397.353516,Z=632.001221),ArriveTangent=(X=47.435135,Y=0.000000,Z=0.000057),LeaveTangent=(X=47.435135,Y=0.000000,Z=0.000057),InterpMode=CIM_CurveAutoClamped),(InVal=176.442474,OutVal=(X=10224.133789,Y=1037.354248,Z=632.001465),ArriveTangent=(X=42.943573,Y=-319.455292,Z=0.000000),LeaveTangent=(X=42.943573,Y=-319.455292,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=180.311005,OutVal=(X=10624.135742,Y=-2.645874,Z=472.001648),ArriveTangent=(X=173.531982,Y=-0.000076,Z=-62.491226),LeaveTangent=(X=173.531982,Y=-0.000076,Z=-62.491226),InterpMode=CIM_CurveAutoClamped),(InVal=184.123550,OutVal=(X=11664.137695,Y=-2.645996,Z=152.001617),ArriveTangent=(X=348.620331,Y=-0.000071,Z=0.000000),LeaveTangent=(X=348.620331,Y=-0.000071,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=189.617844,OutVal=(X=13904.141602,Y=-162.646484,Z=152.001617),ArriveTangent=(X=0.002350,Y=-70.752975,Z=0.000000),LeaveTangent=(X=0.002350,Y=-70.752975,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=193.264587,OutVal=(X=13904.145508,Y=-1282.646606,Z=-7.998383),ArriveTangent=(X=0.000000,Y=-0.000168,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000168,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=197.077087,OutVal=(X=12784.148438,Y=-1282.646851,Z=-7.998383),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.498448,InterpMode=CIM_CurveAutoClamped),(InVal=7.032784,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.465555,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.407037,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=17.200230,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=20.192547,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.094019,InterpMode=CIM_CurveAutoClamped),(InVal=27.479687,InterpMode=CIM_CurveAutoClamped),(InVal=31.304672,InterpMode=CIM_CurveAutoClamped),(InVal=34.861897,InterpMode=CIM_CurveAutoClamped),(InVal=38.304375,InterpMode=CIM_CurveAutoClamped),(InVal=41.555611,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=44.701546,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=48.335281,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=52.695763,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=55.743832,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=58.842060,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-30.959940),LeaveTangent=(X=0.000000,Y=0.000000,Z=-30.959940),InterpMode=CIM_CurveAutoClamped),(InVal=61.557796,ArriveTangent=(X=0.000000,Y=0.000000,Z=-31.354084),LeaveTangent=(X=0.000000,Y=0.000000,Z=-31.354084),InterpMode=CIM_CurveAutoClamped),(InVal=64.582939,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=68.101921,InterpMode=CIM_CurveAutoClamped),(InVal=72.156281,InterpMode=CIM_CurveAutoClamped),(InVal=76.249062,InterpMode=CIM_CurveAutoClamped),(InVal=79.112640,OutVal=(X=0.000000,Y=0.000000,Z=1.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.823681),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.823681),InterpMode=CIM_CurveAutoClamped),(InVal=83.014030,OutVal=(X=0.000000,Y=0.000000,Z=91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=87.633545,OutVal=(X=0.000000,Y=0.000000,Z=1.054688),InterpMode=CIM_CurveAutoClamped),(InVal=90.655518,OutVal=(X=0.000000,Y=0.000000,Z=91.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=28.870344),LeaveTangent=(X=0.000000,Y=0.000000,Z=28.870344),InterpMode=CIM_CurveAutoClamped),(InVal=93.868317,OutVal=(X=0.000000,Y=0.000000,Z=181.054688),InterpMode=CIM_CurveAutoClamped),(InVal=96.108734,OutVal=(X=0.000000,Y=0.000000,Z=181.054688),InterpMode=CIM_CurveAutoClamped),(InVal=99.193214,OutVal=(X=0.000000,Y=0.000000,Z=271.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=44.972321),LeaveTangent=(X=0.000000,Y=0.000000,Z=44.972321),InterpMode=CIM_CurveAutoClamped),(InVal=102.112427,OutVal=(X=0.000000,Y=0.000000,Z=451.054688),InterpMode=CIM_CurveAutoClamped),(InVal=104.756279,OutVal=(X=0.000000,Y=0.000000,Z=451.054688),InterpMode=CIM_CurveAutoClamped),(InVal=109.107491,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=112.742355,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=116.308113,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=119.268402,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=122.968811,OutVal=(X=0.000000,Y=0.000000,Z=451.054688),InterpMode=CIM_CurveAutoClamped),(InVal=126.332687,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=130.218887,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=133.986526,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=137.754166,OutVal=(X=0.000000,Y=0.000000,Z=631.054688),InterpMode=CIM_CurveAutoClamped),(InVal=141.992706,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=145.693054,OutVal=(X=0.000000,Y=0.000000,Z=631.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=22.606417),LeaveTangent=(X=0.000000,Y=0.000000,Z=22.606417),InterpMode=CIM_CurveAutoClamped),(InVal=149.955048,OutVal=(X=0.000000,Y=0.000000,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=153.050339,OutVal=(X=0.000000,Y=0.000000,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=156.662704,OutVal=(X=0.000000,Y=0.000000,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=159.858505,OutVal=(X=0.000000,Y=0.000000,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=163.390671,OutVal=(X=0.000000,Y=0.000000,Z=631.054688),InterpMode=CIM_CurveAutoClamped),(InVal=167.931915,OutVal=(X=0.000000,Y=0.000000,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=172.798218,OutVal=(X=0.000000,Y=0.000000,Z=631.054688),InterpMode=CIM_CurveAutoClamped),(InVal=176.442474,OutVal=(X=0.000000,Y=0.000000,Z=631.054688),InterpMode=CIM_CurveAutoClamped),(InVal=180.311005,OutVal=(X=0.000000,Y=0.000000,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=184.123550,OutVal=(X=0.000000,Y=0.000000,Z=721.054688),InterpMode=CIM_CurveAutoClamped),(InVal=189.617844,OutVal=(X=0.000000,Y=0.000000,Z=631.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-19.691420),LeaveTangent=(X=0.000000,Y=0.000000,Z=-19.691420),InterpMode=CIM_CurveAutoClamped),(InVal=193.264587,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped),(InVal=197.077087,OutVal=(X=0.000000,Y=0.000000,Z=541.054688),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.498448),(Time=7.032784),(Time=10.465555),(Time=14.407037),(Time=17.200230),(Time=20.192547),(Time=24.094019),(Time=27.479687),(Time=31.304672),(Time=34.861897),(Time=38.304375),(Time=41.555611),(Time=44.701546),(Time=48.335281),(Time=52.695763),(Time=55.743832),(Time=58.842060),(Time=61.557796),(Time=64.582939),(Time=68.101921),(Time=72.156281),(Time=76.249062),(Time=79.112640),(Time=83.014030),(Time=87.633545),(Time=90.655518),(Time=93.868317),(Time=96.108734),(Time=99.193214),(Time=102.112427),(Time=104.756279),(Time=109.107491),(Time=112.742355),(Time=116.308113),(Time=119.268402),(Time=122.968811),(Time=126.332687),(Time=130.218887),(Time=133.986526),(Time=137.754166),(Time=141.992706),(Time=145.693054),(Time=149.955048),(Time=153.050339),(Time=156.662704),(Time=159.858505),(Time=163.390671),(Time=167.931915),(Time=172.798218),(Time=176.442474),(Time=180.311005),(Time=184.123550),(Time=189.617844),(Time=193.264587),(Time=197.077087)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="NewCameraGroup"
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=197.348663
   InterpGroups(0)=InterpGroup'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_1'
   InterpGroups(1)=InterpGroupDirector'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroupDirector_1'
   CurveEdSetup=InterpCurveEdSetup'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1368
   ObjPosY=-632
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=CameraActor'KF-INFERNALREALM.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1504
   ObjPosY=-680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=725
   SizeY=572
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1072
   ObjPosY=-904
   ObjComment="Benchmark"
   DrawWidth=725
   DrawHeight=572
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1144
   ObjPosY=-552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=-552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-944
   ObjPosY=-552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1160
   ObjPosY=-464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-928
   ObjPosY=-464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-968
   ObjPosY=-400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1104
   ObjPosY=-400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-952
   ObjPosY=1432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-920
   ObjPosY=1280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-816
   ObjPosY=1280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-768
   ObjPosY=1432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-808
   ObjPosY=1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-712
   ObjPosY=1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-211,OverrideDelta=14)
   InputLinks(1)=(DrawY=-190,OverrideDelta=35)
   InputLinks(2)=(DrawY=-169,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-190,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-1026,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-975,OverrideDelta=76)
   EventLinks(0)=(DrawX=-926,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1064
   ObjPosY=-248
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1144
   ObjPosY=-56
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=-56
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-944
   ObjPosY=-56
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1096
   ObjPosY=40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-896
   ObjPosY=40
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=205,OverrideDelta=14)
   InputLinks(1)=(DrawY=226,OverrideDelta=35)
   InputLinks(2)=(DrawY=247,OverrideDelta=56)
   OutputLinks(0)=(DrawY=226,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114',SeqVar_Object'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=-1026,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-975,OverrideDelta=76)
   EventLinks(0)=(DrawX=-926,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1064
   ObjPosY=168
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1072
   ObjPosY=320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-976
   ObjPosY=320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1112
   ObjPosY=408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-912
   ObjPosY=408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SpawnsOff"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17',InputLinkIdx=1)),DrawY=-758,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1522,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1616
   ObjPosY=-824
   ObjComment="SpawnsOff"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=1202,ActivateDelay=20.000000,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=1202,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1188,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1312
   ObjPosY=1168
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-491,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-470,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-449,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2032
   ObjPosY=-560
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_2
   LinkCount=3
   IncrementAmount=0
   InputLinks(0)=(DrawY=-430,OverrideDelta=19)
   InputLinks(1)=(DrawY=-398,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=-435,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),LinkDesc="Link 2",DrawY=-414,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),LinkDesc="Link 3",DrawY=-393,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-1556,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1600
   ObjPosY=-472
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_2"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=-550,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-550,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1556,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=-584
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFPlayerStart'KF-INFERNALREALM.TheWorld:PersistentLevel.KFPlayerStart_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-INFERNALREALM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-832
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
