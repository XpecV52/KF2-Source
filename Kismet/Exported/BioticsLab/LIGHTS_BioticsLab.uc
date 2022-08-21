Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=PointLightToggleable'LIGHTS_BioticsLab.TheWorld:PersistentLevel.PointLightToggleable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1672
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2136
   ObjPosY=520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_14"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_9
   InputLinks(0)=(DrawY=442,OverrideDelta=11)
   OutputLinks(0)=(DrawY=442,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=2194,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=2250,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2160
   ObjPosY=408
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_9"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_13
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1191
   ObjPosY=489
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_13"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_8
   InputLinks(0)=(DrawY=427,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=427,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_13'),DrawX=1217,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=1273,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1183
   ObjPosY=393
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_8"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=431,OverrideDelta=23)
   OutputLinks(0)=(DrawY=421,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_8')),DrawY=441,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=988,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1038,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=959
   ObjPosY=385
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1960
   ObjPosY=760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_11"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="MetalDetectorRightActivated"
   bClientSideOnly=True
   MaxWidth=419
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=434,OverrideDelta=11)
   VariableLinks(0)=(DrawX=777,OverrideDelta=177)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=368
   DrawWidth=229
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=429,OverrideDelta=14)
   InputLinks(1)=(DrawY=450,OverrideDelta=35)
   InputLinks(2)=(DrawY=471,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=450,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=1438,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1489,OverrideDelta=76)
   EventLinks(0)=(DrawX=1538,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1400
   ObjPosY=392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=1.500000
   InputLinks(0)=(DrawY=445,OverrideDelta=14)
   InputLinks(1)=(DrawY=466,OverrideDelta=35)
   InputLinks(2)=(DrawY=487,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=450,OverrideDelta=19)
   OutputLinks(1)=(DrawY=482,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1716,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1664
   ObjPosY=408
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=421,OverrideDelta=14)
   InputLinks(1)=(DrawY=442,OverrideDelta=35)
   InputLinks(2)=(DrawY=463,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_9')),DrawY=442,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=1926,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1977,OverrideDelta=76)
   EventLinks(0)=(DrawX=2026,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=384
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=1780
   SizeY=516
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=336
   ObjComment="Metal Detector Alarm - Right"
   DrawWidth=1780
   DrawHeight=516
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2120
   ObjPosY=1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_8"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=1158,OverrideDelta=23)
   OutputLinks(0)=(DrawY=1148,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_7')),DrawY=1168,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=997,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1047,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=968
   ObjPosY=1112
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_7
   InputLinks(0)=(DrawY=1154,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=1154,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_9'),DrawX=1226,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=1282,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1192
   ObjPosY=1120
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_7"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1200
   ObjPosY=1216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_9"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_6
   InputLinks(0)=(DrawY=1154,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1154,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_10'),DrawX=2322,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=2378,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=1120
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_6"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2272
   ObjPosY=1216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_10"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=PointLightToggleable'LIGHTS_BioticsLab.TheWorld:PersistentLevel.PointLightToggleable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1720
   ObjPosY=1272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="MetalDetectorLeftActivated"
   bClientSideOnly=True
   MaxWidth=412
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=1162,OverrideDelta=11)
   VariableLinks(0)=(DrawX=742,OverrideDelta=174)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=1096
   DrawWidth=226
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=1141,OverrideDelta=14)
   InputLinks(1)=(DrawY=1162,OverrideDelta=35)
   InputLinks(2)=(DrawY=1183,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=1162,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=1470,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1521,OverrideDelta=76)
   EventLinks(0)=(DrawX=1570,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=1104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=1.500000
   InputLinks(0)=(DrawY=1141,OverrideDelta=14)
   InputLinks(1)=(DrawY=1162,OverrideDelta=35)
   InputLinks(2)=(DrawY=1183,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3',InputLinkIdx=1)),DrawY=1146,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1178,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1764,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=1104
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=1133,OverrideDelta=14)
   InputLinks(1)=(DrawY=1154,OverrideDelta=35)
   InputLinks(2)=(DrawY=1175,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_6')),DrawY=1154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=1990,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2041,OverrideDelta=76)
   EventLinks(0)=(DrawX=2090,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1952
   ObjPosY=1096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1940
   SizeY=468
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=504
   ObjPosY=1064
   ObjComment="Metal Detector Alarm - Left"
   DrawWidth=1940
   DrawHeight=468
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object
