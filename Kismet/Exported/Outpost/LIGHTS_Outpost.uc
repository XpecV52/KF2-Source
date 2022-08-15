Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="MetalDetectorEntranceLeftActivated"
   MaxWidth=360
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(DrawX=780,OverrideDelta=148)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=336
   DrawWidth=200
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=398,OverrideDelta=23)
   OutputLinks(0)=(DrawY=388,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2')),DrawY=408,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=1149,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1199,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=352
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1848
   ObjPosY=712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_3"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_113'),DrawX=1386,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=1442,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1352
   ObjPosY=368
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_113
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1354
   ObjPosY=449
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_113"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=397,OverrideDelta=14)
   InputLinks(1)=(DrawY=418,OverrideDelta=35)
   InputLinks(2)=(DrawY=439,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=418,OverrideDelta=35)
   VariableLinks(0)=(DrawX=1630,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1681,OverrideDelta=76)
   EventLinks(0)=(DrawX=1730,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1592
   ObjPosY=360
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=2.000000
   InputLinks(0)=(DrawY=405,OverrideDelta=14)
   InputLinks(1)=(DrawY=426,OverrideDelta=35)
   InputLinks(2)=(DrawY=447,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=1)),DrawY=410,OverrideDelta=19)
   OutputLinks(1)=(DrawY=442,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=368
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=397,OverrideDelta=14)
   InputLinks(1)=(DrawY=418,OverrideDelta=35)
   InputLinks(2)=(DrawY=439,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_3')),DrawY=418,OverrideDelta=35)
   VariableLinks(0)=(DrawX=2142,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2193,OverrideDelta=76)
   EventLinks(0)=(DrawX=2242,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2104
   ObjPosY=360
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_3
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_114'),DrawX=2442,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=2498,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2408
   ObjPosY=368
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_3"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_114
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2410
   ObjPosY=449
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_114"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=1996
   SizeY=500
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=304
   ObjComment="Metal Detector Entrance Left"
   DrawWidth=1996
   DrawHeight=500
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="MetalDetectorEntranceRightActivated"
   MaxWidth=367
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_111')),DrawY=1082,OverrideDelta=11)
   VariableLinks(0)=(DrawX=783,OverrideDelta=151)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=1016
   DrawWidth=203
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_115
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2352
   ObjPosY=1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_115"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_4
   InputLinks(0)=(DrawY=1090,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_115'),DrawX=2386,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_117'),DrawX=2442,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2352
   ObjPosY=1056
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_4"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_114
   InputLinks(0)=(DrawY=1085,OverrideDelta=14)
   InputLinks(1)=(DrawY=1106,OverrideDelta=35)
   InputLinks(2)=(DrawY=1127,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_4')),DrawY=1106,OverrideDelta=35)
   VariableLinks(0)=(DrawX=2086,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2137,OverrideDelta=76)
   EventLinks(0)=(DrawX=2186,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2048
   ObjPosY=1048
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_114"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=2.000000
   InputLinks(0)=(DrawY=1093,OverrideDelta=14)
   InputLinks(1)=(DrawY=1114,OverrideDelta=35)
   InputLinks(2)=(DrawY=1135,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_114',InputLinkIdx=1)),DrawY=1098,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1130,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1884,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=1056
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_115
   InputLinks(0)=(DrawY=1085,OverrideDelta=14)
   InputLinks(1)=(DrawY=1106,OverrideDelta=35)
   InputLinks(2)=(DrawY=1127,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=1106,OverrideDelta=35)
   VariableLinks(0)=(DrawX=1574,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1625,OverrideDelta=76)
   EventLinks(0)=(DrawX=1674,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=1048
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_115"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_116
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1296
   ObjPosY=1136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_116"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=1090,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_115')),DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_116'),DrawX=1330,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_117'),DrawX=1386,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1296
   ObjPosY=1056
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_117
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1792
   ObjPosY=1400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_117"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_111
   InputLinks(0)=(DrawY=1086,OverrideDelta=23)
   OutputLinks(0)=(DrawY=1076,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5')),DrawY=1096,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_117'),DrawX=1093,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1143,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1064
   ObjPosY=1040
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_111"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=1940
   SizeY=508
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=984
   ObjComment="Metal Detector Entrance Right"
   DrawWidth=1940
   DrawHeight=508
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="MetalDetectorCICActivated"
   MaxWidth=298
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=1762,OverrideDelta=11)
   VariableLinks(0)=(DrawX=773,OverrideDelta=117)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=1696
   DrawWidth=169
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=1750,OverrideDelta=23)
   OutputLinks(0)=(DrawY=1740,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0')),DrawY=1760,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=1085,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1135,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1056
   ObjPosY=1704
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1784
   ObjPosY=2064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   InputLinks(0)=(DrawY=1754,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=1754,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_1'),DrawX=1322,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=1378,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1288
   ObjPosY=1720
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1288
   ObjPosY=1800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=1749,OverrideDelta=14)
   InputLinks(1)=(DrawY=1770,OverrideDelta=35)
   InputLinks(2)=(DrawY=1791,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=1770,OverrideDelta=35)
   VariableLinks(0)=(DrawX=1566,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1617,OverrideDelta=76)
   EventLinks(0)=(DrawX=1666,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=1712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=2.000000
   InputLinks(0)=(DrawY=1757,OverrideDelta=14)
   InputLinks(1)=(DrawY=1778,OverrideDelta=35)
   InputLinks(2)=(DrawY=1799,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=1762,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1794,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1876,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1824
   ObjPosY=1720
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=1749,OverrideDelta=14)
   InputLinks(1)=(DrawY=1770,OverrideDelta=35)
   InputLinks(2)=(DrawY=1791,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=1770,OverrideDelta=35)
   VariableLinks(0)=(DrawX=2078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2129,OverrideDelta=76)
   EventLinks(0)=(DrawX=2178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=1712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=1754,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1754,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=2378,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=2434,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2344
   ObjPosY=1720
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2344
   ObjPosY=1800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=1908
   SizeY=492
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=1664
   ObjComment="Metal Detector CIC"
   DrawWidth=1908
   DrawHeight=492
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object
