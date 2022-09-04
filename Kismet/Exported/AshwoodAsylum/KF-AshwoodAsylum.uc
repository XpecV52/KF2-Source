Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=2189
   SizeY=1818
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9768
   ObjPosY=-8168
   ObjComment="Guard Room Hanged Ghost with observers"
   DrawWidth=2189
   DrawHeight=1818
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=4394
   SizeY=1549
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=-8088
   ObjComment="Hallway Encounter "
   DrawWidth=4394
   DrawHeight=1549
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=792
   SizeY=446
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8176
   ObjPosY=-6040
   ObjComment="Cell Talker A"
   DrawWidth=792
   DrawHeight=446
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=772
   SizeY=424
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-5568
   ObjComment="Cell Talker B"
   DrawWidth=772
   DrawHeight=424
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),DrawY=-9587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9566,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9545,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7542,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=-9656
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-9595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9553,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9574,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),DrawX=-7298,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7247,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7198,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7336
   ObjPosY=-9632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=KFSpawner'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7296
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_23
   Duration=20.000000
   InputLinks(0)=(DrawY=-7523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7481,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=-7518,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7486,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1428,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1480
   ObjPosY=-7560
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_23"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_2
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_23')),DrawY=-7484,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-7464,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-1821,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1760,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-1679,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1864
   ObjPosY=-7552
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_2"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_301
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-536
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_301"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_300
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-632
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_300"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_299
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-736
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_299"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_298
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-832
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_298"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_297
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-936
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_297"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_296
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_296"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-7571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_296',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_297',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_298',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_299',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_300',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_301'),DrawX=-1002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=-7608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-7907,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7886,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7865,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7886,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-7944
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1)),DrawY=-7779,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7758,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7737,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1824
   ObjPosY=-7848
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1112
   ObjPosY=-7736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-7736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-864
   ObjPosY=-7736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-744
   ObjPosY=-7728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-632
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFPlayerStart'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=CameraActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1424
   ObjPosY=-6864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=1352
   SizeY=603
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1936
   ObjPosY=-7136
   ObjComment="Benchmark"
   DrawWidth=1352
   DrawHeight=603
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=InterpData Name=InterpData_22
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=942.214844,Y=99.800781,Z=3.000031),ArriveTangent=(X=0.000000,Y=76.411987,Z=1.000010),LeaveTangent=(X=0.000000,Y=76.411987,Z=1.000010),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=703.000000,Y=1465.064453,Z=6.000061),ArriveTangent=(X=0.000000,Y=446.099609,Z=0.000026),LeaveTangent=(X=0.000000,Y=446.099609,Z=0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=934.277344,Y=2776.398438,Z=6.000092),ArriveTangent=(X=0.000000,Y=436.072266,Z=0.000000),LeaveTangent=(X=0.000000,Y=436.072266,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=269.796875,Y=4081.498047,Z=-11.999878),ArriveTangent=(X=-54.800484,Y=416.841797,Z=0.000000),LeaveTangent=(X=-54.800484,Y=416.841797,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=194.988281,Y=5277.449219,Z=0.000153),ArriveTangent=(X=0.000000,Y=264.680847,Z=3.000010),LeaveTangent=(X=0.000000,Y=264.680847,Z=3.000010),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=1243.181641,Y=5763.472656,Z=6.000183),ArriveTangent=(X=329.492523,Y=0.000000,Z=0.000000),LeaveTangent=(X=329.492523,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=2171.943359,Y=5530.210938,Z=-14.999786),ArriveTangent=(X=0.000000,Y=-160.877716,Z=0.000000),LeaveTangent=(X=0.000000,Y=-160.877716,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=24.000000,OutVal=(X=2050.669922,Y=4143.623047,Z=-14.999756),ArriveTangent=(X=-53.743164,Y=-482.521484,Z=0.000010),LeaveTangent=(X=-53.743164,Y=-482.521484,Z=0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=27.000000,OutVal=(X=1849.484375,Y=2635.082031,Z=-14.999725),ArriveTangent=(X=-49.406338,Y=-450.132172,Z=0.000000),LeaveTangent=(X=-49.406338,Y=-450.132172,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=(X=1752.101563,Y=1442.830078,Z=-20.999695),ArriveTangent=(X=-69.611092,Y=-385.255219,Z=0.000000),LeaveTangent=(X=-69.611092,Y=-385.255219,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=1030.423828,Y=323.550781,Z=-11.999664),ArriveTangent=(X=0.000000,Y=-393.318024,Z=0.000026),LeaveTangent=(X=0.000000,Y=-393.318024,Z=0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=1104.492188,Y=-917.078125,Z=-11.999634),ArriveTangent=(X=14.046440,Y=-365.787109,Z=0.000026),LeaveTangent=(X=14.046440,Y=-365.787109,Z=0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=1128.279297,Y=-1871.171875,Z=0.000397),ArriveTangent=(X=13.043723,Y=-284.603180,Z=3.500010),LeaveTangent=(X=13.043723,Y=-284.603180,Z=3.500010),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=1187.898438,Y=-2624.697266,Z=9.000427),ArriveTangent=(X=47.144653,Y=0.000000,Z=7.349197),LeaveTangent=(X=47.144653,Y=0.000000,Z=7.349197),InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=(X=2513.902344,Y=-2620.636719,Z=522.000488),ArriveTangent=(X=205.912903,Y=3.552625,Z=0.000000),LeaveTangent=(X=205.912903,Y=3.552625,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=47.000000,OutVal=(X=2749.476563,Y=-2555.830078,Z=486.000610),ArriveTangent=(X=216.945786,Y=12.058123,Z=0.000000),LeaveTangent=(X=216.945786,Y=12.058123,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=4482.515625,Y=-2539.330078,Z=486.000732),ArriveTangent=(X=476.519867,Y=0.000000,Z=0.000000),LeaveTangent=(X=476.519867,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=53.000000,OutVal=(X=5608.595703,Y=-2568.722656,Z=462.000854),ArriveTangent=(X=412.934570,Y=0.000000,Z=-5.047449),LeaveTangent=(X=412.934570,Y=0.000000,Z=-5.047449),InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=(X=6960.123047,Y=-2564.019531,Z=453.000977),ArriveTangent=(X=161.751221,Y=0.000000,Z=-2.499959),LeaveTangent=(X=161.751221,Y=0.000000,Z=-2.499959),InterpMode=CIM_CurveAutoClamped),(InVal=59.000000,OutVal=(X=7196.275391,Y=-3535.484375,Z=447.001099),ArriveTangent=(X=158.134094,Y=0.000000,Z=0.000000),LeaveTangent=(X=158.134094,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=62.000000,OutVal=(X=8399.707031,Y=-3313.013672,Z=447.001221),ArriveTangent=(X=403.091156,Y=124.998123,Z=0.000102),LeaveTangent=(X=403.091156,Y=124.998123,Z=0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=(X=9614.822266,Y=-2716.669922,Z=459.001343),ArriveTangent=(X=325.879883,Y=194.418625,Z=1.900964),LeaveTangent=(X=325.879883,Y=194.418625,Z=1.900964),InterpMode=CIM_CurveAutoClamped),(InVal=68.000000,OutVal=(X=10354.986328,Y=-2146.501953,Z=462.001465),ArriveTangent=(X=294.389648,Y=0.000000,Z=0.000102),LeaveTangent=(X=294.389648,Y=0.000000,Z=0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=11381.160156,Y=-2216.488281,Z=462.001587),ArriveTangent=(X=0.000000,Y=-53.286049,Z=0.000000),LeaveTangent=(X=0.000000,Y=-53.286049,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=74.000000,OutVal=(X=11360.095703,Y=-3113.384766,Z=159.001694),ArriveTangent=(X=-16.167145,Y=-296.754883,Z=-2.472012),LeaveTangent=(X=-16.167145,Y=-296.754883,Z=-2.472012),InterpMode=CIM_CurveAutoClamped),(InVal=77.000000,OutVal=(X=11063.250000,Y=-3997.017578,Z=156.001755),ArriveTangent=(X=-176.426437,Y=-224.641602,Z=-2.407611),LeaveTangent=(X=-176.426437,Y=-224.641602,Z=-2.407611),InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=(X=10119.398438,Y=-4461.234375,Z=63.001808),ArriveTangent=(X=-264.794586,Y=0.000000,Z=0.000000),LeaveTangent=(X=-264.794586,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=83.000000,OutVal=(X=9474.482422,Y=-4419.267578,Z=66.001854),ArriveTangent=(X=0.000000,Y=28.497131,Z=1.375391),LeaveTangent=(X=0.000000,Y=28.497131,Z=1.375391),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=9588.087891,Y=-3045.324219,Z=75.001900),ArriveTangent=(X=0.000000,Y=9.173462,Z=4.637859),LeaveTangent=(X=0.000000,Y=9.173462,Z=4.637859),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=8349.728516,Y=-3032.205078,Z=156.001953),ArriveTangent=(X=0.000000,Y=10.815735,Z=0.000000),LeaveTangent=(X=0.000000,Y=10.815735,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=94.000000,OutVal=(X=8357.541016,Y=-1649.730469,Z=117.002014),ArriveTangent=(X=0.000000,Y=487.653656,Z=0.000000),LeaveTangent=(X=0.000000,Y=487.653656,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=97.000000,OutVal=(X=8352.181641,Y=-106.283203,Z=117.002075),ArriveTangent=(X=0.000000,Y=484.722656,Z=0.000020),LeaveTangent=(X=0.000000,Y=484.722656,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=(X=8625.535156,Y=1258.605469,Z=117.002136),ArriveTangent=(X=0.000000,Y=122.279297,Z=0.000051),LeaveTangent=(X=0.000000,Y=122.279297,Z=0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=103.000000,OutVal=(X=7571.488281,Y=1427.605469,Z=123.002197),ArriveTangent=(X=-230.186798,Y=46.657551,Z=0.000051),LeaveTangent=(X=-230.186798,Y=46.657551,Z=0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=106.000000,OutVal=(X=7152.164063,Y=1538.550781,Z=123.002258),ArriveTangent=(X=-121.891602,Y=82.918961,Z=0.000020),LeaveTangent=(X=-121.891602,Y=82.918961,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=6840.138672,Y=2712.267578,Z=123.002319),ArriveTangent=(X=0.000000,Y=404.104492,Z=0.000020),LeaveTangent=(X=0.000000,Y=404.104492,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=112.000000,OutVal=(X=7136.460938,Y=3963.177734,Z=123.002380),ArriveTangent=(X=167.928009,Y=67.782288,Z=0.000000),LeaveTangent=(X=167.928009,Y=67.782288,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=(X=7950.544922,Y=4051.453125,Z=114.002441),ArriveTangent=(X=376.521149,Y=0.000000,Z=-4.499979),LeaveTangent=(X=376.521149,Y=0.000000,Z=-4.499979),InterpMode=CIM_CurveAutoClamped),(InVal=118.000000,OutVal=(X=9395.587891,Y=3925.332031,Z=96.002502),ArriveTangent=(X=195.028183,Y=-84.841881,Z=0.000000),LeaveTangent=(X=195.028183,Y=-84.841881,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=122.000000,OutVal=(X=9766.636719,Y=2642.945313,Z=138.002594),ArriveTangent=(X=70.108154,Y=-401.888184,Z=0.000000),LeaveTangent=(X=70.108154,Y=-401.888184,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=126.000000,OutVal=(X=9956.453125,Y=710.226563,Z=120.002625),ArriveTangent=(X=62.007813,Y=-447.618164,Z=0.000000),LeaveTangent=(X=62.007813,Y=-447.618164,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=10262.699219,Y=-938.000000,Z=126.002686),ArriveTangent=(X=144.007355,Y=-233.452164,Z=2.215018),LeaveTangent=(X=144.007355,Y=-233.452164,Z=2.215018),InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=(X=11983.330078,Y=-1575.611328,Z=141.002747),ArriveTangent=(X=174.280792,Y=-226.233643,Z=0.000036),LeaveTangent=(X=174.280792,Y=-226.233643,Z=0.000036),InterpMode=CIM_CurveAutoClamped),(InVal=139.000000,OutVal=(X=12375.601563,Y=-3079.146484,Z=141.002808),ArriveTangent=(X=0.000000,Y=-160.696182,Z=0.000000),LeaveTangent=(X=0.000000,Y=-160.696182,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=11444.714844,Y=-3406.285156,Z=132.002899),ArriveTangent=(X=-40.817741,Y=0.000000,Z=0.000000),LeaveTangent=(X=-40.817741,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=146.000000,OutVal=(X=11386.703125,Y=-2218.701172,Z=453.002930),ArriveTangent=(X=-39.828247,Y=284.596527,Z=0.000000),LeaveTangent=(X=-39.828247,Y=284.596527,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=149.000000,OutVal=(X=11050.429688,Y=-1667.853516,Z=450.003052),ArriveTangent=(X=0.000000,Y=298.951599,Z=0.000000),LeaveTangent=(X=0.000000,Y=298.951599,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=152.000000,OutVal=(X=11152.376953,Y=-324.652344,Z=456.003174),ArriveTangent=(X=43.571289,Y=16.662613,Z=3.287053),LeaveTangent=(X=43.571289,Y=16.662613,Z=3.287053),InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=(X=11311.857422,Y=-304.304688,Z=471.003296),ArriveTangent=(X=51.698566,Y=16.246498,Z=0.000000),LeaveTangent=(X=51.698566,Y=16.246498,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=158.000000,OutVal=(X=11462.568359,Y=250.906250,Z=435.003418),ArriveTangent=(X=102.402496,Y=0.000000,Z=-1.863682),LeaveTangent=(X=102.402496,Y=0.000000,Z=-1.863682),InterpMode=CIM_CurveAutoClamped),(InVal=162.000000,OutVal=(X=13132.300781,Y=178.306641,Z=432.003540),ArriveTangent=(X=11.346405,Y=0.000000,Z=0.000000),LeaveTangent=(X=11.346405,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=13147.361328,Y=1584.183594,Z=432.003662),ArriveTangent=(X=0.000000,Y=418.836914,Z=0.000031),LeaveTangent=(X=0.000000,Y=418.836914,Z=0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,OutVal=(X=13129.533203,Y=3529.001953,Z=432.003784),ArriveTangent=(X=0.000000,Y=307.284027,Z=0.000070),LeaveTangent=(X=0.000000,Y=307.284027,Z=0.000070),InterpMode=CIM_CurveAutoClamped),(InVal=173.000000,OutVal=(X=13174.978516,Y=4215.658203,Z=450.003906),ArriveTangent=(X=21.138346,Y=238.520508,Z=2.072573),LeaveTangent=(X=21.138346,Y=238.520508,Z=2.072573),InterpMode=CIM_CurveAutoClamped),(InVal=176.000000,OutVal=(X=13256.363281,Y=4960.125000,Z=453.004028),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000070),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000070),InterpMode=CIM_CurveAutoClamped),(InVal=181.000000,OutVal=(X=11645.212891,Y=4804.121094,Z=453.004150),ArriveTangent=(X=-399.589355,Y=0.000000,Z=0.000031),LeaveTangent=(X=-399.589355,Y=0.000000,Z=0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=184.000000,OutVal=(X=10059.648438,Y=4813.730469,Z=453.004272),ArriveTangent=(X=-411.277344,Y=0.000000,Z=0.000000),LeaveTangent=(X=-411.277344,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=188.000000,OutVal=(X=8766.271484,Y=4705.371094,Z=435.004395),ArriveTangent=(X=-18.405426,Y=-67.989151,Z=0.000000),LeaveTangent=(X=-18.405426,Y=-67.989151,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=191.000000,OutVal=(X=8741.517578,Y=3235.912109,Z=435.004517),ArriveTangent=(X=0.000000,Y=-466.763672,Z=0.000102),LeaveTangent=(X=0.000000,Y=-466.763672,Z=0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=194.000000,OutVal=(X=8760.710938,Y=1904.789063,Z=450.004639),InterpMode=CIM_CurveAutoClamped),(InVal=197.000000,OutVal=(X=8751.339844,Y=1919.126953,Z=444.004761),ArriveTangent=(X=-7.725693,Y=10.901400,Z=0.000000),LeaveTangent=(X=-7.725693,Y=10.901400,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=(X=7764.568359,Y=2100.023438,Z=444.004883),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000102),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=203.000000,OutVal=(X=7844.398438,Y=837.234375,Z=453.005005),ArriveTangent=(X=55.819828,Y=-186.670563,Z=0.000000),LeaveTangent=(X=55.819828,Y=-186.670563,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=206.000000,OutVal=(X=8358.250000,Y=549.103516,Z=447.005127),ArriveTangent=(X=89.955841,Y=-182.144775,Z=0.000000),LeaveTangent=(X=89.955841,Y=-182.144775,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=209.000000,OutVal=(X=8505.509766,Y=-592.892578,Z=447.005249),ArriveTangent=(X=0.000000,Y=-252.737564,Z=0.000102),LeaveTangent=(X=0.000000,Y=-252.737564,Z=0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=(X=8218.746094,Y=-1056.982422,Z=453.005371),ArriveTangent=(X=0.000000,Y=-260.184723,Z=0.000000),LeaveTangent=(X=0.000000,Y=-260.184723,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=(X=8365.031250,Y=-2293.314453,Z=444.005493),ArriveTangent=(X=0.000000,Y=-397.563477,Z=-1.750695),LeaveTangent=(X=0.000000,Y=-397.563477,Z=-1.750695),InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,OutVal=(X=8332.027344,Y=-3442.363281,Z=441.005615),ArriveTangent=(X=-26.677124,Y=-50.357819,Z=-2.201122),LeaveTangent=(X=-26.677124,Y=-50.357819,Z=-2.201122),InterpMode=CIM_CurveAutoClamped),(InVal=221.000000,OutVal=(X=7071.076172,Y=-3506.873047,Z=414.005737),InterpMode=CIM_CurveAutoClamped),(InVal=224.000000,OutVal=(X=7088.000000,Y=-2628.119141,Z=477.005859),ArriveTangent=(X=0.000000,Y=106.509903,Z=0.000000),LeaveTangent=(X=0.000000,Y=106.509903,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=227.000000,OutVal=(X=6498.769531,Y=-2472.166016,Z=447.005981),ArriveTangent=(X=0.000000,Y=107.810921,Z=0.000000),LeaveTangent=(X=0.000000,Y=107.810921,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=230.000000,OutVal=(X=6529.460938,Y=-1532.849609,Z=453.006104),ArriveTangent=(X=1.885760,Y=195.364151,Z=0.000061),LeaveTangent=(X=1.885760,Y=195.364151,Z=0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=236.000000,OutVal=(X=6533.757813,Y=-713.888672,Z=453.006226),ArriveTangent=(X=0.000000,Y=185.641495,Z=0.000000),LeaveTangent=(X=0.000000,Y=185.641495,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=239.000000,OutVal=(X=6517.507813,Y=137.923828,Z=180.006332),ArriveTangent=(X=0.000000,Y=223.052414,Z=-36.100632),LeaveTangent=(X=0.000000,Y=223.052414,Z=-36.100632),InterpMode=CIM_CurveAutoClamped),(InVal=242.000000,OutVal=(X=6869.832031,Y=624.425781,Z=126.006393),ArriveTangent=(X=0.000000,Y=244.391556,Z=0.000000),LeaveTangent=(X=0.000000,Y=244.391556,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=(X=6502.900391,Y=1607.017578,Z=129.006454),ArriveTangent=(X=-217.316177,Y=75.254562,Z=2.201241),LeaveTangent=(X=-217.316177,Y=75.254562,Z=2.201241),InterpMode=CIM_CurveAutoClamped),(InVal=248.000000,OutVal=(X=5349.437500,Y=1708.720703,Z=156.006516),ArriveTangent=(X=-234.080460,Y=0.000000,Z=0.000000),LeaveTangent=(X=-234.080460,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=251.000000,OutVal=(X=4939.876953,Y=878.380859,Z=132.006577),ArriveTangent=(X=-255.123337,Y=-13.670883,Z=-3.801770),LeaveTangent=(X=-255.123337,Y=-13.670883,Z=-3.801770),InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=(X=3405.658203,Y=861.585938,Z=126.006638),ArriveTangent=(X=-248.972397,Y=-13.509811,Z=0.000000),LeaveTangent=(X=-248.972397,Y=-13.509811,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=257.000000,OutVal=(X=3009.447266,Y=307.232422,Z=135.006699),ArriveTangent=(X=0.000000,Y=-303.453125,Z=2.500020),LeaveTangent=(X=0.000000,Y=-303.453125,Z=2.500020),InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=(X=3022.179688,Y=-1075.714844,Z=141.006760),ArriveTangent=(X=10.472610,Y=-100.676224,Z=0.000000),LeaveTangent=(X=10.472610,Y=-100.676224,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=263.000000,OutVal=(X=4135.464844,Y=-1210.906250,Z=132.006821),ArriveTangent=(X=11.085358,Y=0.000000,Z=0.000000),LeaveTangent=(X=11.085358,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=266.000000,OutVal=(X=4148.953125,Y=-19.664063,Z=132.006882),ArriveTangent=(X=10.998703,Y=0.000000,Z=0.000051),LeaveTangent=(X=10.998703,Y=0.000000,Z=0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=269.000000,OutVal=(X=4868.957031,Y=-21.869141,Z=279.006958),ArriveTangent=(X=0.000000,Y=-1.832962,Z=48.000031),LeaveTangent=(X=0.000000,Y=-1.832962,Z=48.000031),InterpMode=CIM_CurveAutoClamped),(InVal=272.000000,OutVal=(X=4836.593750,Y=-871.912109,Z=420.007080),ArriveTangent=(X=0.000000,Y=-186.590637,Z=14.785638),LeaveTangent=(X=0.000000,Y=-186.590637,Z=14.785638),InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=(X=5013.902344,Y=-1212.855469,Z=441.007202),ArriveTangent=(X=92.249954,Y=0.000000,Z=2.126201),LeaveTangent=(X=92.249954,Y=0.000000,Z=2.126201),InterpMode=CIM_CurveAutoClamped),(InVal=278.000000,OutVal=(X=5402.638672,Y=-360.113281,Z=444.007324),ArriveTangent=(X=0.000000,Y=379.676758,Z=0.000000),LeaveTangent=(X=0.000000,Y=379.676758,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=281.000000,OutVal=(X=5048.019531,Y=1065.205078,Z=441.007446),ArriveTangent=(X=-135.871414,Y=379.923492,Z=-1.900838),LeaveTangent=(X=-135.871414,Y=379.923492,Z=-1.900838),InterpMode=CIM_CurveAutoClamped),(InVal=284.000000,OutVal=(X=4587.410156,Y=1919.427734,Z=429.007568),ArriveTangent=(X=-240.405899,Y=0.000000,Z=0.000000),LeaveTangent=(X=-240.405899,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=287.000000,OutVal=(X=3569.773438,Y=1587.759766,Z=435.007690),ArriveTangent=(X=0.000000,Y=-155.037109,Z=0.000000),LeaveTangent=(X=0.000000,Y=-155.037109,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=289.000000,OutVal=(X=3590.205078,Y=1144.242188,Z=111.007797),ArriveTangent=(X=17.449100,Y=0.000000,Z=0.000000),LeaveTangent=(X=17.449100,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=292.000000,OutVal=(X=3694.189453,Y=1531.810547,Z=111.007858),ArriveTangent=(X=10.903607,Y=197.186783,Z=0.000020),LeaveTangent=(X=10.903607,Y=197.186783,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=(X=3709.675781,Y=2337.753906,Z=111.007919),ArriveTangent=(X=0.000000,Y=250.183273,Z=0.000000),LeaveTangent=(X=0.000000,Y=250.183273,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=298.000000,OutVal=(X=3499.972656,Y=3032.910156,Z=-17.992035),ArriveTangent=(X=-146.812927,Y=84.961510,Z=0.000000),LeaveTangent=(X=-146.812927,Y=84.961510,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=301.000000,OutVal=(X=2140.054688,Y=3157.552734,Z=-17.992004),ArriveTangent=(X=-100.690659,Y=81.675095,Z=0.000025),LeaveTangent=(X=-100.690659,Y=81.675095,Z=0.000025),InterpMode=CIM_CurveAutoClamped),(InVal=304.000000,OutVal=(X=2004.560547,Y=3731.654297,Z=-11.991974),ArriveTangent=(X=0.000000,Y=296.928833,Z=0.000025),LeaveTangent=(X=0.000000,Y=296.928833,Z=0.000025),InterpMode=CIM_CurveAutoClamped),(InVal=307.000000,OutVal=(X=2022.064453,Y=4972.542969,Z=-11.991943),ArriveTangent=(X=12.517694,Y=362.719727,Z=0.000000),LeaveTangent=(X=12.517694,Y=362.719727,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,OutVal=(X=2152.175781,Y=5907.972656,Z=-53.991928),ArriveTangent=(X=94.764175,Y=2.605026,Z=0.000000),LeaveTangent=(X=94.764175,Y=2.605026,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=313.000000,OutVal=(X=3256.554688,Y=5911.109375,Z=-47.991913),ArriveTangent=(X=316.340485,Y=0.000000,Z=3.287009),LeaveTangent=(X=316.340485,Y=0.000000,Z=3.287009),InterpMode=CIM_CurveAutoClamped),(InVal=316.000000,OutVal=(X=4050.218750,Y=5709.101563,Z=-32.991882),ArriveTangent=(X=245.706711,Y=0.000000,Z=0.000026),LeaveTangent=(X=245.706711,Y=0.000000,Z=0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=319.000000,OutVal=(X=4730.794922,Y=5928.386719,Z=-32.991852),ArriveTangent=(X=243.095047,Y=0.000000,Z=0.000026),LeaveTangent=(X=243.095047,Y=0.000000,Z=0.000026),InterpMode=CIM_CurveAutoClamped),(InVal=322.000000,OutVal=(X=5508.789063,Y=5386.921875,Z=-14.991821),ArriveTangent=(X=167.431839,Y=-1.240135,Z=13.007026),LeaveTangent=(X=167.431839,Y=-1.240135,Z=13.007026),InterpMode=CIM_CurveAutoClamped),(InVal=325.000000,OutVal=(X=5811.207031,Y=5385.429688,Z=129.008224),InterpMode=CIM_CurveAutoClamped),(InVal=328.000000,OutVal=(X=5797.900391,Y=6314.503906,Z=-71.991745),ArriveTangent=(X=-8.440809,Y=272.756500,Z=-74.000000),LeaveTangent=(X=-8.440809,Y=272.756500,Z=-74.000000),InterpMode=CIM_CurveAutoClamped),(InVal=331.000000,OutVal=(X=5744.441406,Y=7021.968750,Z=-314.991760),ArriveTangent=(X=0.000000,Y=344.305328,Z=-17.852541),LeaveTangent=(X=0.000000,Y=344.305328,Z=-17.852541),InterpMode=CIM_CurveAutoClamped),(InVal=334.000000,OutVal=(X=6057.646484,Y=8380.335938,Z=-338.991760),ArriveTangent=(X=162.849960,Y=161.407928,Z=0.000000),LeaveTangent=(X=162.849960,Y=161.407928,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=337.000000,OutVal=(X=6743.267578,Y=8615.605469,Z=-326.991760),ArriveTangent=(X=139.626297,Y=0.000000,Z=0.000000),LeaveTangent=(X=139.626297,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,OutVal=(X=6988.005859,Y=7958.445313,Z=-329.991760),ArriveTangent=(X=0.000000,Y=-269.060547,Z=0.000000),LeaveTangent=(X=0.000000,Y=-269.060547,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=343.000000,OutVal=(X=6965.289063,Y=7001.242188,Z=-320.991760),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.061438),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.061438),InterpMode=CIM_CurveAutoClamped),(InVal=346.000000,OutVal=(X=7720.697266,Y=7067.664063,Z=-146.991745),ArriveTangent=(X=35.690788,Y=49.215508,Z=46.500004),LeaveTangent=(X=35.690788,Y=49.215508,Z=46.500004),InterpMode=CIM_CurveAutoClamped),(InVal=349.000000,OutVal=(X=7766.666016,Y=7717.089844,Z=-41.991730),ArriveTangent=(X=31.628172,Y=153.718887,Z=18.341690),LeaveTangent=(X=31.628172,Y=153.718887,Z=18.341690),InterpMode=CIM_CurveAutoClamped),(InVal=352.000000,OutVal=(X=8036.304688,Y=8012.011719,Z=-11.991699),ArriveTangent=(X=105.192711,Y=97.929039,Z=0.000000),LeaveTangent=(X=105.192711,Y=97.929039,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=355.000000,OutVal=(X=8397.822266,Y=8304.664063,Z=-26.991669),ArriveTangent=(X=143.748047,Y=102.044273,Z=0.000000),LeaveTangent=(X=143.748047,Y=102.044273,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=358.000000,OutVal=(X=8898.792969,Y=8624.277344,Z=3.008362),ArriveTangent=(X=185.281250,Y=0.000000,Z=19.348988),LeaveTangent=(X=185.281250,Y=0.000000,Z=19.348988),InterpMode=CIM_CurveAutoClamped),(InVal=361.000000,OutVal=(X=9509.509766,Y=8444.453125,Z=132.008408),ArriveTangent=(X=0.000000,Y=-131.293137,Z=4.736116),LeaveTangent=(X=0.000000,Y=-131.293137,Z=4.736116),InterpMode=CIM_CurveAutoClamped),(InVal=364.000000,OutVal=(X=9200.648438,Y=6888.703125,Z=138.008469),ArriveTangent=(X=-137.434372,Y=0.000000,Z=0.000000),LeaveTangent=(X=-137.434372,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=366.000000,OutVal=(X=8822.337891,Y=6900.648438,Z=126.008530),ArriveTangent=(X=-25.659885,Y=12.810593,Z=-11.705652),LeaveTangent=(X=-25.659885,Y=12.810593,Z=-11.705652),InterpMode=CIM_CurveAutoClamped),(InVal=369.000000,OutVal=(X=8792.529297,Y=7525.546875,Z=-5.991425),ArriveTangent=(X=-23.363335,Y=0.000000,Z=-31.261251),LeaveTangent=(X=-23.363335,Y=0.000000,Z=-31.261251),InterpMode=CIM_CurveAutoClamped),(InVal=372.000000,OutVal=(X=8226.226563,Y=7235.761719,Z=-65.991409),ArriveTangent=(X=0.000000,Y=-119.010155,Z=0.000000),LeaveTangent=(X=0.000000,Y=-119.010155,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=374.000000,OutVal=(X=8321.775391,Y=6930.496094,Z=-59.991409),ArriveTangent=(X=29.139063,Y=-226.213058,Z=0.000000),LeaveTangent=(X=29.139063,Y=-226.213058,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=377.000000,OutVal=(X=8371.921875,Y=5961.003906,Z=-368.991455),ArriveTangent=(X=30.526691,Y=-309.453125,Z=-4.888603),LeaveTangent=(X=30.526691,Y=-309.453125,Z=-4.888603),InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=(X=8544.789063,Y=5073.777344,Z=-374.991455),ArriveTangent=(X=0.000000,Y=-404.958984,Z=0.000000),LeaveTangent=(X=0.000000,Y=-404.958984,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=383.000000,OutVal=(X=8478.343750,Y=3531.250000,Z=-362.991455),ArriveTangent=(X=-50.201927,Y=0.000000,Z=0.000000),LeaveTangent=(X=-50.201927,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=386.000000,OutVal=(X=7695.300781,Y=3788.863281,Z=-371.991455),ArriveTangent=(X=-22.236092,Y=175.712799,Z=-6.916960),LeaveTangent=(X=-22.236092,Y=175.712799,Z=-6.916960),InterpMode=CIM_CurveAutoClamped),(InVal=389.000000,OutVal=(X=7667.488281,Y=5230.519531,Z=-500.991455),ArriveTangent=(X=-22.271225,Y=81.612030,Z=0.000000),LeaveTangent=(X=-22.271225,Y=81.612030,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=392.000000,OutVal=(X=6853.449219,Y=5337.222656,Z=-359.991455),ArriveTangent=(X=-72.818489,Y=61.036556,Z=25.020782),LeaveTangent=(X=-72.818489,Y=61.036556,Z=25.020782),InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,OutVal=(X=6752.832031,Y=5638.484375,Z=-318.808777),ArriveTangent=(X=0.000000,Y=32.316620,Z=0.000000),LeaveTangent=(X=0.000000,Y=32.316620,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=399.000000,OutVal=(X=8431.558594,Y=5696.406250,Z=-345.808777),ArriveTangent=(X=0.000000,Y=35.556065,Z=0.000000),LeaveTangent=(X=0.000000,Y=35.556065,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=402.000000,OutVal=(X=8345.931641,Y=6306.066406,Z=-336.808777),ArriveTangent=(X=0.000000,Y=244.945969,Z=7.220009),LeaveTangent=(X=0.000000,Y=244.945969,Z=7.220009),InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,OutVal=(X=8364.128906,Y=7166.082031,Z=-60.808762),ArriveTangent=(X=14.498978,Y=187.049240,Z=29.468311),LeaveTangent=(X=14.498978,Y=187.049240,Z=29.468311),InterpMode=CIM_CurveAutoClamped),(InVal=408.000000,OutVal=(X=8837.347656,Y=7506.007813,Z=-18.808746),ArriveTangent=(X=51.684284,Y=0.000000,Z=26.702074),LeaveTangent=(X=51.684284,Y=0.000000,Z=26.702074),InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,OutVal=(X=8892.037109,Y=6975.121094,Z=80.191292),ArriveTangent=(X=30.368750,Y=-275.125793,Z=36.600018),LeaveTangent=(X=30.368750,Y=-275.125793,Z=36.600018),InterpMode=CIM_CurveAutoClamped),(InVal=413.000000,OutVal=(X=8989.191406,Y=6130.378906,Z=164.191345),InterpMode=CIM_CurveAutoClamped),(InVal=416.000000,OutVal=(X=7509.669922,Y=6218.800781,Z=137.191406),ArriveTangent=(X=-383.125977,Y=0.000000,Z=-6.309977),LeaveTangent=(X=-383.125977,Y=0.000000,Z=-6.309977),InterpMode=CIM_CurveAutoClamped),(InVal=419.000000,OutVal=(X=6690.435547,Y=5916.039063,Z=125.191467),ArriveTangent=(X=-19.721359,Y=-175.981567,Z=-1.900870),LeaveTangent=(X=-19.721359,Y=-175.981567,Z=-1.900870),InterpMode=CIM_CurveAutoClamped),(InVal=422.000000,OutVal=(X=6665.929688,Y=5018.921875,Z=122.191528),ArriveTangent=(X=-19.571098,Y=-324.625000,Z=-1.499980),LeaveTangent=(X=-19.571098,Y=-324.625000,Z=-1.499980),InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,OutVal=(X=5993.640625,Y=3968.289063,Z=116.191589),ArriveTangent=(X=0.000000,Y=-16.677551,Z=0.000000),LeaveTangent=(X=0.000000,Y=-16.677551,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=428.000000,OutVal=(X=7554.849609,Y=3947.818359,Z=116.191650),ArriveTangent=(X=526.273438,Y=-13.555460,Z=0.000020),LeaveTangent=(X=526.273438,Y=-13.555460,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=431.000000,OutVal=(X=9151.281250,Y=3848.908203,Z=116.191711),ArriveTangent=(X=541.710266,Y=0.000000,Z=0.000020),LeaveTangent=(X=541.710266,Y=0.000000,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=434.000000,OutVal=(X=10805.111328,Y=4174.742188,Z=116.191772),ArriveTangent=(X=371.756012,Y=0.000000,Z=0.000020),LeaveTangent=(X=371.756012,Y=0.000000,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=437.000000,OutVal=(X=11494.335938,Y=3918.234375,Z=116.191833),ArriveTangent=(X=0.000000,Y=-85.799156,Z=0.000000),LeaveTangent=(X=0.000000,Y=-85.799156,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=(X=10821.523438,Y=3659.947266,Z=110.191895),ArriveTangent=(X=-340.323090,Y=0.000000,Z=-4.925949),LeaveTangent=(X=-340.323090,Y=0.000000,Z=-4.925949),InterpMode=CIM_CurveAutoClamped),(InVal=443.000000,OutVal=(X=9441.101563,Y=3679.453125,Z=-351.808105),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.000000,Y=0.000000,Z=88.769531),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.000000,Y=0.000000,Z=87.363281),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000000,Z=90.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.046264),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.046264),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.000000,Y=-5.625000,Z=102.480469),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=0.000000,Y=-5.625000,Z=1.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.677758),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.677758),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=0.000000,Y=-5.625000,Z=-1.757813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.669593),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.669593),InterpMode=CIM_CurveAutoClamped),(InVal=21.000000,OutVal=(X=0.000000,Y=-5.625000,Z=-95.273438),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.146243),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.146243),InterpMode=CIM_CurveAutoClamped),(InVal=24.000000,OutVal=(X=0.000000,Y=-5.625000,Z=-95.449219),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.146078),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.146078),InterpMode=CIM_CurveAutoClamped),(InVal=27.000000,OutVal=(X=0.000000,Y=-5.625000,Z=-157.851563),InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=(X=0.000000,Y=-5.625000,Z=-149.941406),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.763248),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.763248),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=0.000000,Y=-5.625000,Z=-82.617188),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.143778),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.143778),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=0.000000,Y=-5.625000,Z=-81.210938),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.149167),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.149167),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=0.000000,Y=-5.625000,Z=1.933594),ArriveTangent=(X=0.000000,Y=0.000000,Z=28.564453),LeaveTangent=(X=0.000000,Y=0.000000,Z=28.564453),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=0.000000,Y=-5.625000,Z=90.175781),InterpMode=CIM_CurveAutoClamped),(InVal=45.000000,OutVal=(X=0.000000,Y=-5.625000,Z=90.175781),InterpMode=CIM_CurveAutoClamped),(InVal=47.000000,OutVal=(X=0.000000,Y=-6.855469,Z=0.175781),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=0.000000,Y=-6.855469,Z=0.878906),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.583530),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.583530),InterpMode=CIM_CurveAutoClamped),(InVal=53.000000,OutVal=(X=0.000000,Y=-6.855469,Z=179.472656),InterpMode=CIM_CurveAutoClamped),(InVal=56.000000,OutVal=(X=0.000000,Y=-6.855469,Z=89.296875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-29.941406),LeaveTangent=(X=0.000000,Y=0.000000,Z=-29.941406),InterpMode=CIM_CurveAutoClamped),(InVal=59.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-0.175781),InterpMode=CIM_CurveAutoClamped),(InVal=62.000000,OutVal=(X=0.000000,Y=-7.734375,Z=59.414063),InterpMode=CIM_CurveAutoClamped),(InVal=65.000000,OutVal=(X=0.000000,Y=-7.734375,Z=46.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.029575),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.029575),InterpMode=CIM_CurveAutoClamped),(InVal=68.000000,OutVal=(X=0.000000,Y=-7.734375,Z=0.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-22.587891),LeaveTangent=(X=0.000000,Y=0.000000,Z=-22.587891),InterpMode=CIM_CurveAutoClamped),(InVal=71.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-89.296875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.197179),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.197179),InterpMode=CIM_CurveAutoClamped),(InVal=74.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-93.339844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.241524),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.241524),InterpMode=CIM_CurveAutoClamped),(InVal=77.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-215.507813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-19.122574),LeaveTangent=(X=0.000000,Y=0.000000,Z=-19.122574),InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-245.566406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.869141),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.869141),InterpMode=CIM_CurveAutoClamped),(InVal=83.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-280.722656),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-180.878906),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-270.878906),InterpMode=CIM_CurveAutoClamped),(InVal=94.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-270.175781),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.292969),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.292969),InterpMode=CIM_CurveAutoClamped),(InVal=97.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-269.121094),InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-269.648438),InterpMode=CIM_CurveAutoClamped),(InVal=103.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-178.417969),InterpMode=CIM_CurveAutoClamped),(InVal=106.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-267.011719),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-265.253906),InterpMode=CIM_CurveAutoClamped),(InVal=112.000000,OutVal=(X=0.000000,Y=-6.503906,Z=-308.144531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.568819),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.568819),InterpMode=CIM_CurveAutoClamped),(InVal=115.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-394.980469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.855469),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.855469),InterpMode=CIM_CurveAutoClamped),(InVal=118.000000,OutVal=(X=0.000000,Y=-6.152344,Z=-439.277344),InterpMode=CIM_CurveAutoClamped),(InVal=122.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-421.523438),InterpMode=CIM_CurveAutoClamped),(InVal=126.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-439.804688),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-364.394531),InterpMode=CIM_CurveAutoClamped),(InVal=135.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-426.269531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-19.257813),LeaveTangent=(X=0.000000,Y=0.000000,Z=-19.257813),InterpMode=CIM_CurveAutoClamped),(InVal=139.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-537.714844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-25.378418),LeaveTangent=(X=0.000000,Y=0.000000,Z=-25.378418),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-629.296875),InterpMode=CIM_CurveAutoClamped),(InVal=146.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-629.296875),InterpMode=CIM_CurveAutoClamped),(InVal=149.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-630.703125),InterpMode=CIM_CurveAutoClamped),(InVal=152.000000,OutVal=(X=0.000000,Y=-7.558594,Z=-539.824219),ArriveTangent=(X=0.000000,Y=0.000000,Z=30.556641),LeaveTangent=(X=0.000000,Y=0.000000,Z=30.556641),InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=(X=0.000000,Y=-5.976563,Z=-447.363281),ArriveTangent=(X=0.000000,Y=0.556641,Z=30.351563),LeaveTangent=(X=0.000000,Y=0.556641,Z=30.351563),InterpMode=CIM_CurveAutoClamped),(InVal=158.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-357.714844),ArriveTangent=(X=0.000000,Y=0.000000,Z=24.935825),LeaveTangent=(X=0.000000,Y=0.000000,Z=24.935825),InterpMode=CIM_CurveAutoClamped),(InVal=162.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-272.812500),ArriveTangent=(X=0.000000,Y=0.000000,Z=25.638950),LeaveTangent=(X=0.000000,Y=0.000000,Z=25.638950),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-178.242188),InterpMode=CIM_CurveAutoClamped),(InVal=170.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-263.847656),InterpMode=CIM_CurveAutoClamped),(InVal=173.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-114.082031),InterpMode=CIM_CurveAutoClamped),(InVal=176.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-146.425781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.349609),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.349609),InterpMode=CIM_CurveAutoClamped),(InVal=181.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-180.878906),InterpMode=CIM_CurveAutoClamped),(InVal=184.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-177.539063),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.421526),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.421526),InterpMode=CIM_CurveAutoClamped),(InVal=188.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-91.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.791280),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.791280),InterpMode=CIM_CurveAutoClamped),(InVal=191.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-90.175781),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.577793),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.577793),InterpMode=CIM_CurveAutoClamped),(InVal=194.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-87.539063),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.159924),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.159924),InterpMode=CIM_CurveAutoClamped),(InVal=197.000000,OutVal=(X=0.000000,Y=-4.218750,Z=89.824219),ArriveTangent=(X=0.000000,Y=0.000000,Z=32.098576),LeaveTangent=(X=0.000000,Y=0.000000,Z=32.098576),InterpMode=CIM_CurveAutoClamped),(InVal=200.000000,OutVal=(X=0.000000,Y=-4.218750,Z=143.085938),ArriveTangent=(X=0.000000,Y=0.000000,Z=21.035156),LeaveTangent=(X=0.000000,Y=0.000000,Z=21.035156),InterpMode=CIM_CurveAutoClamped),(InVal=203.000000,OutVal=(X=0.000000,Y=-4.218750,Z=216.035156),ArriveTangent=(X=0.000000,Y=0.000000,Z=21.357422),LeaveTangent=(X=0.000000,Y=0.000000,Z=21.357422),InterpMode=CIM_CurveAutoClamped),(InVal=206.000000,OutVal=(X=0.000000,Y=-4.218750,Z=271.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.053613),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.053613),InterpMode=CIM_CurveAutoClamped),(InVal=209.000000,OutVal=(X=0.000000,Y=-4.218750,Z=276.679688),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.287926),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.287926),InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=(X=0.000000,Y=-3.515625,Z=387.421875),ArriveTangent=(X=0.000000,Y=0.000000,Z=29.091797),LeaveTangent=(X=0.000000,Y=0.000000,Z=29.091797),InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=(X=0.000000,Y=-3.515625,Z=451.230469),InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,OutVal=(X=0.000000,Y=-3.515625,Z=450.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.468750),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.468750),InterpMode=CIM_CurveAutoClamped),(InVal=221.000000,OutVal=(X=0.000000,Y=-3.515625,Z=448.417969),InterpMode=CIM_CurveAutoClamped),(InVal=224.000000,OutVal=(X=0.000000,Y=-3.515625,Z=449.121094),InterpMode=CIM_CurveAutoClamped),(InVal=227.000000,OutVal=(X=0.000000,Y=-3.515625,Z=448.066406),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.866915),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.866915),InterpMode=CIM_CurveAutoClamped),(InVal=230.000000,OutVal=(X=0.000000,Y=-2.636719,Z=360.175781),InterpMode=CIM_CurveAutoClamped),(InVal=236.000000,OutVal=(X=0.000000,Y=-8.964844,Z=450.703125),InterpMode=CIM_CurveAutoClamped),(InVal=239.000000,OutVal=(X=0.000000,Y=-3.339844,Z=440.683594),InterpMode=CIM_CurveAutoClamped),(InVal=242.000000,OutVal=(X=0.000000,Y=-3.339844,Z=503.613281),ArriveTangent=(X=0.000000,Y=0.000000,Z=16.669922),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.669922),InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=(X=0.000000,Y=-3.339844,Z=540.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=19.783394),LeaveTangent=(X=0.000000,Y=0.000000,Z=19.783394),InterpMode=CIM_CurveAutoClamped),(InVal=248.000000,OutVal=(X=0.000000,Y=-3.339844,Z=627.187500),ArriveTangent=(X=0.000000,Y=0.000000,Z=34.833984),LeaveTangent=(X=0.000000,Y=0.000000,Z=34.833984),InterpMode=CIM_CurveAutoClamped),(InVal=251.000000,OutVal=(X=0.000000,Y=-3.339844,Z=749.707031),InterpMode=CIM_CurveAutoClamped),(InVal=254.000000,OutVal=(X=0.000000,Y=-3.339844,Z=720.175781),InterpMode=CIM_CurveAutoClamped),(InVal=257.000000,OutVal=(X=0.000000,Y=-3.339844,Z=720.527344),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.117188),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.117188),InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=(X=0.000000,Y=-3.339844,Z=720.878906),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.291800),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.291800),InterpMode=CIM_CurveAutoClamped),(InVal=263.000000,OutVal=(X=0.000000,Y=-1.757813,Z=812.460938),InterpMode=CIM_CurveAutoClamped),(InVal=266.000000,OutVal=(X=0.000000,Y=-4.042969,Z=809.824219),InterpMode=CIM_CurveAutoClamped),(InVal=269.000000,OutVal=(X=0.000000,Y=-4.042969,Z=809.824219),InterpMode=CIM_CurveAutoClamped),(InVal=272.000000,OutVal=(X=0.000000,Y=-4.042969,Z=808.242188),InterpMode=CIM_CurveAutoClamped),(InVal=275.000000,OutVal=(X=0.000000,Y=-4.042969,Z=826.347656),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.561479),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.561479),InterpMode=CIM_CurveAutoClamped),(InVal=278.000000,OutVal=(X=0.000000,Y=-4.042969,Z=901.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=23.525391),LeaveTangent=(X=0.000000,Y=0.000000,Z=23.525391),InterpMode=CIM_CurveAutoClamped),(InVal=281.000000,OutVal=(X=0.000000,Y=-4.042969,Z=967.500000),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.994860),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.994860),InterpMode=CIM_CurveAutoClamped),(InVal=284.000000,OutVal=(X=0.000000,Y=-4.042969,Z=989.824219),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.281843),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.281843),InterpMode=CIM_CurveAutoClamped),(InVal=287.000000,OutVal=(X=0.000000,Y=-4.042969,Z=1082.636719),InterpMode=CIM_CurveAutoClamped),(InVal=289.000000,OutVal=(X=0.000000,Y=-4.042969,Z=1082.636719),InterpMode=CIM_CurveAutoClamped),(InVal=292.000000,OutVal=(X=0.000000,Y=-8.789063,Z=1166.132813),InterpMode=CIM_CurveAutoClamped),(InVal=295.000000,OutVal=(X=0.000000,Y=-4.394531,Z=985.781250),InterpMode=CIM_CurveAutoClamped),(InVal=298.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1078.769531),InterpMode=CIM_CurveAutoClamped),(InVal=301.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1078.242188),InterpMode=CIM_CurveAutoClamped),(InVal=304.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1167.890625),InterpMode=CIM_CurveAutoClamped),(InVal=307.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1167.363281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.436648),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.436648),InterpMode=CIM_CurveAutoClamped),(InVal=310.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1077.187500),InterpMode=CIM_CurveAutoClamped),(InVal=313.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1079.648438),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.839126),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.839126),InterpMode=CIM_CurveAutoClamped),(InVal=316.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1105.664063),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.990337),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.990337),InterpMode=CIM_CurveAutoClamped),(InVal=319.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1262.636719),InterpMode=CIM_CurveAutoClamped),(InVal=322.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1204.980469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-15.263672),LeaveTangent=(X=0.000000,Y=0.000000,Z=-15.263672),InterpMode=CIM_CurveAutoClamped),(InVal=325.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1171.054688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.129631),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.129631),InterpMode=CIM_CurveAutoClamped),(InVal=328.000000,OutVal=(X=0.000000,Y=-4.394531,Z=1168.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.880776),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.880776),InterpMode=CIM_CurveAutoClamped),(InVal=331.000000,OutVal=(X=0.000000,Y=-3.515625,Z=1154.003906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.335938),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.335938),InterpMode=CIM_CurveAutoClamped),(InVal=334.000000,OutVal=(X=0.000000,Y=-3.515625,Z=1142.226563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.926828),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.926828),InterpMode=CIM_CurveAutoClamped),(InVal=337.000000,OutVal=(X=0.000000,Y=-3.515625,Z=998.613281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-30.871052),LeaveTangent=(X=0.000000,Y=0.000000,Z=-30.871052),InterpMode=CIM_CurveAutoClamped),(InVal=340.000000,OutVal=(X=0.000000,Y=-3.515625,Z=942.890625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.080078),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.080078),InterpMode=CIM_CurveAutoClamped),(InVal=343.000000,OutVal=(X=0.000000,Y=-5.976563,Z=896.132813),InterpMode=CIM_CurveAutoClamped),(InVal=346.000000,OutVal=(X=0.000000,Y=-5.976563,Z=901.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.505852),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.505852),InterpMode=CIM_CurveAutoClamped),(InVal=349.000000,OutVal=(X=0.000000,Y=-5.976563,Z=902.285156),InterpMode=CIM_CurveAutoClamped),(InVal=352.000000,OutVal=(X=0.000000,Y=-5.976563,Z=901.933594),InterpMode=CIM_CurveAutoClamped),(InVal=355.000000,OutVal=(X=0.000000,Y=-5.976563,Z=992.812500),InterpMode=CIM_CurveAutoClamped),(InVal=358.000000,OutVal=(X=0.000000,Y=-5.976563,Z=986.484375),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.535837),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.535837),InterpMode=CIM_CurveAutoClamped),(InVal=361.000000,OutVal=(X=0.000000,Y=-5.976563,Z=969.785156),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.182107),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.182107),InterpMode=CIM_CurveAutoClamped),(InVal=364.000000,OutVal=(X=0.000000,Y=-5.976563,Z=968.203125),InterpMode=CIM_CurveAutoClamped),(InVal=366.000000,OutVal=(X=0.000000,Y=-5.976563,Z=986.660156),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.460774),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.460774),InterpMode=CIM_CurveAutoClamped),(InVal=369.000000,OutVal=(X=0.000000,Y=-5.976563,Z=991.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.538261),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.538261),InterpMode=CIM_CurveAutoClamped),(InVal=372.000000,OutVal=(X=0.000000,Y=-5.976563,Z=1040.449219),ArriveTangent=(X=0.000000,Y=0.000000,Z=31.505726),LeaveTangent=(X=0.000000,Y=0.000000,Z=31.505726),InterpMode=CIM_CurveAutoClamped),(InVal=374.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1159.804688),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.992920),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.992920),InterpMode=CIM_CurveAutoClamped),(InVal=377.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1170.351563),InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1169.824219),InterpMode=CIM_CurveAutoClamped),(InVal=383.000000,OutVal=(X=0.000000,Y=-3.339844,Z=1183.007813),ArriveTangent=(X=0.000000,Y=-0.439453,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.439453,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=386.000000,OutVal=(X=0.000000,Y=-4.921875,Z=1100.917969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-31.728516),LeaveTangent=(X=0.000000,Y=0.000000,Z=-31.728516),InterpMode=CIM_CurveAutoClamped),(InVal=389.000000,OutVal=(X=0.000000,Y=-4.921875,Z=992.636719),InterpMode=CIM_CurveAutoClamped),(InVal=392.000000,OutVal=(X=0.000000,Y=-4.921875,Z=1065.410156),ArriveTangent=(X=0.000000,Y=0.000000,Z=29.414063),LeaveTangent=(X=0.000000,Y=0.000000,Z=29.414063),InterpMode=CIM_CurveAutoClamped),(InVal=395.000000,OutVal=(X=0.000000,Y=-4.921875,Z=1169.121094),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.740733),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.740733),InterpMode=CIM_CurveAutoClamped),(InVal=399.000000,OutVal=(X=0.000000,Y=-4.921875,Z=1173.339844),InterpMode=CIM_CurveAutoClamped),(InVal=402.000000,OutVal=(X=0.000000,Y=-4.921875,Z=1168.593750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.923247),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.923247),InterpMode=CIM_CurveAutoClamped),(InVal=405.000000,OutVal=(X=0.000000,Y=-4.921875,Z=1167.011719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.304983),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.304983),InterpMode=CIM_CurveAutoClamped),(InVal=408.000000,OutVal=(X=0.000000,Y=-4.921875,Z=991.757813),InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,OutVal=(X=0.000000,Y=-4.921875,Z=997.558594),InterpMode=CIM_CurveAutoClamped),(InVal=413.000000,OutVal=(X=0.000000,Y=-4.921875,Z=985.781250),InterpMode=CIM_CurveAutoClamped),(InVal=416.000000,OutVal=(X=0.000000,Y=-4.921875,Z=1021.992188),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.480469),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.480469),InterpMode=CIM_CurveAutoClamped),(InVal=419.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1060.664063),InterpMode=CIM_CurveAutoClamped),(InVal=422.000000,OutVal=(X=0.000000,Y=-2.285156,Z=952.910156),InterpMode=CIM_CurveAutoClamped),(InVal=425.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1124.296875),InterpMode=CIM_CurveAutoClamped),(InVal=428.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1073.496094),InterpMode=CIM_CurveAutoClamped),(InVal=431.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1104.257813),InterpMode=CIM_CurveAutoClamped),(InVal=434.000000,OutVal=(X=0.000000,Y=-2.285156,Z=1077.539063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.669796),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.669796),InterpMode=CIM_CurveAutoClamped),(InVal=437.000000,OutVal=(X=0.000000,Y=-2.285156,Z=949.218750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-27.066835),LeaveTangent=(X=0.000000,Y=0.000000,Z=-27.066835),InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=(X=0.000000,Y=-2.285156,Z=900.878906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.995433),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.995433),InterpMode=CIM_CurveAutoClamped),(InVal=443.000000,OutVal=(X=0.000000,Y=-2.285156,Z=899.648438),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.000000),(Time=6.000000),(Time=9.000000),(Time=12.000000),(Time=15.000000),(Time=18.000000),(Time=21.000000),(Time=24.000000),(Time=27.000000),(Time=30.000000),(Time=33.000000),(Time=36.000000),(Time=39.000000),(Time=42.000000),(Time=45.000000),(Time=47.000000),(Time=50.000000),(Time=53.000000),(Time=56.000000),(Time=59.000000),(Time=62.000000),(Time=65.000000),(Time=68.000000),(Time=71.000000),(Time=74.000000),(Time=77.000000),(Time=80.000000),(Time=83.000000),(Time=88.000000),(Time=91.000000),(Time=94.000000),(Time=97.000000),(Time=100.000000),(Time=103.000000),(Time=106.000000),(Time=109.000000),(Time=112.000000),(Time=115.000000),(Time=118.000000),(Time=122.000000),(Time=126.000000),(Time=130.000000),(Time=135.000000),(Time=139.000000),(Time=143.000000),(Time=146.000000),(Time=149.000000),(Time=152.000000),(Time=155.000000),(Time=158.000000),(Time=162.000000),(Time=165.000000),(Time=170.000000),(Time=173.000000),(Time=176.000000),(Time=181.000000),(Time=184.000000),(Time=188.000000),(Time=191.000000),(Time=194.000000),(Time=197.000000),(Time=200.000000),(Time=203.000000),(Time=206.000000),(Time=209.000000),(Time=212.000000),(Time=215.000000),(Time=218.000000),(Time=221.000000),(Time=224.000000),(Time=227.000000),(Time=230.000000),(Time=236.000000),(Time=239.000000),(Time=242.000000),(Time=245.000000),(Time=248.000000),(Time=251.000000),(Time=254.000000),(Time=257.000000),(Time=260.000000),(Time=263.000000),(Time=266.000000),(Time=269.000000),(Time=272.000000),(Time=275.000000),(Time=278.000000),(Time=281.000000),(Time=284.000000),(Time=287.000000),(Time=289.000000),(Time=292.000000),(Time=295.000000),(Time=298.000000),(Time=301.000000),(Time=304.000000),(Time=307.000000),(Time=310.000000),(Time=313.000000),(Time=316.000000),(Time=319.000000),(Time=322.000000),(Time=325.000000),(Time=328.000000),(Time=331.000000),(Time=334.000000),(Time=337.000000),(Time=340.000000),(Time=343.000000),(Time=346.000000),(Time=349.000000),(Time=352.000000),(Time=355.000000),(Time=358.000000),(Time=361.000000),(Time=364.000000),(Time=366.000000),(Time=369.000000),(Time=372.000000),(Time=374.000000),(Time=377.000000),(Time=380.000000),(Time=383.000000),(Time=386.000000),(Time=389.000000),(Time=392.000000),(Time=395.000000),(Time=399.000000),(Time=402.000000),(Time=405.000000),(Time=408.000000),(Time=410.000000),(Time=413.000000),(Time=416.000000),(Time=419.000000),(Time=422.000000),(Time=425.000000),(Time=428.000000),(Time=431.000000),(Time=434.000000),(Time=437.000000),(Time=440.000000),(Time=443.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_0.InterpTrackMove_0'
      GroupName="CamTrack_Main"
      GroupColor=(B=0,G=109,R=212,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="CamTrack_Main",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=203,G=126,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=445.000000
   InterpGroups(0)=InterpGroup'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=445.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1496
   ObjPosY=-6824
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_22"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_22
   PlayRate=0.850000
   InputLinks(0)=(DrawY=-7026,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7004,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6982,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6960,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6938,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-7010,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6954,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_22'),DrawX=-1456,OverrideDelta=17)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),LinkDesc="CamTrack_Main",MinVars=0,DrawX=-1388,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1488
   ObjPosY=-7064
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_22"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjValue=CameraActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1064
   ObjPosY=-6760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-792,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-856
   ObjPosY=-6888
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-1224,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1288
   ObjPosY=-6888
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_44
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0'),(LinkedOp=SeqAct_Interp'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_22')),DrawY=-6814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1681,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=-6880
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_44"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=747
   SizeY=210
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1936
   ObjPosY=-6360
   ObjComment="Single Camera"
   DrawWidth=747
   DrawHeight=210
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="SingleCameraSwitch"
   InputLinks(0)=(DrawY=-6262,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1477,OverrideDelta=123)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1632
   ObjPosY=-6296
   DrawWidth=311
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Camera"
   MaxWidth=168
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-6262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1820,OverrideDelta=52)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=-6328
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   ReTriggerDelay=120.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-5635,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5614,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5593,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9542,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=-5704
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_NonRadio_Spirit_Chatter'
   InputLinks(0)=(DrawY=-5966,ActivateDelay=4.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5966,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-9056,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9104
   ObjPosY=-6000
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-5920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-5771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5729,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5750,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-9082,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9031,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8982,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-5808
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=-5672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   ReTriggerDelay=240.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-7179,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7158,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7137,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6486,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6624
   ObjPosY=-7248
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-7083,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7062,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7041,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_17')),DrawY=-7062,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=-5946,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5895,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5846,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-7120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_0
   InputLinks(0)=(DrawY=-7307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7265,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_20',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_21'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13')),DrawY=-7286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=-5954,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5903,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5854,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-7344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_0"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-7216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_313'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-6992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_139'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-6992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_17
   InputLinks(0)=(DrawY=-7283,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7241,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_22',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_23'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=-7262,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=-5506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-7320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_17"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_18
   InputLinks(0)=(DrawY=-7299,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7257,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_24'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_25',InputLinkIdx=1),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-7278,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61'),DrawX=-5010,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4959,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4910,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5048
   ObjPosY=-7336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_18"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_19
   InputLinks(0)=(DrawY=-7291,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7249,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_27',InputLinkIdx=2),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_26'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-7270,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=-4530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4568
   ObjPosY=-7328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_19"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-7059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7017,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_18')),DrawY=-7038,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47'),DrawX=-5498,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5447,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5398,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-7096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-7067,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7046,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7025,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_19')),DrawY=-7046,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=-5002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5040
   ObjPosY=-7104
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-7059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7017,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-7038,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=-4514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4552
   ObjPosY=-7096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_138'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5528
   ObjPosY=-6968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_314'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5432
   ObjPosY=-6968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_136'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5032
   ObjPosY=-6976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_315'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4936
   ObjPosY=-6976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_135'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4544
   ObjPosY=-6968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_290'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4448
   ObjPosY=-6968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_20
   InputLinks(0)=(DrawY=-7587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52'),DrawX=-5938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-7624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_20"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-7496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_21
   InputLinks(0)=(DrawY=-7803,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7782,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7761,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7782,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),DrawX=-5954,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5903,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5854,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-7840
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_21"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5984
   ObjPosY=-7712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_22
   InputLinks(0)=(DrawY=-7563,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7542,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7521,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7542,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-5498,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5447,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5398,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-7600
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_22"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_23
   InputLinks(0)=(DrawY=-7795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),DrawX=-5498,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5447,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5398,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-7832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_23"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_24
   InputLinks(0)=(DrawY=-7803,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7782,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7761,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7782,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-5002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5040
   ObjPosY=-7840
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_24"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_25
   InputLinks(0)=(DrawY=-7571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=-5002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5040
   ObjPosY=-7608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_25"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_26
   InputLinks(0)=(DrawY=-7787,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7745,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-4514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4552
   ObjPosY=-7824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_26"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_27
   InputLinks(0)=(DrawY=-7555,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7534,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7513,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7534,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),DrawX=-4514,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4463,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4414,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4552
   ObjPosY=-7592
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_27"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5528
   ObjPosY=-7704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5032
   ObjPosY=-7712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5032
   ObjPosY=-7480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5528
   ObjPosY=-7472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4544
   ObjPosY=-7696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4544
   ObjPosY=-7464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-7192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5040
   ObjPosY=-7208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4560
   ObjPosY=-7200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-7755,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7734,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7713,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-7734,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=-4146,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4095,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4046,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4184
   ObjPosY=-7792
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_115'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4176
   ObjPosY=-7664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-7523,ActivateDelay=2.250000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7481,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-7502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-4154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4192
   ObjPosY=-7560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-7267,ActivateDelay=2.250000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7225,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_9',InputLinkIdx=1)),DrawY=-7246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=-4154,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4103,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4054,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4192
   ObjPosY=-7304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4184
   ObjPosY=-7432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4184
   ObjPosY=-7176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Spirits_Whispers_OS'
   InputLinks(0)=(DrawY=-6702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=-4752,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-6736
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4784
   ObjPosY=-6656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-6878,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6878,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),DrawX=-5944,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-6912
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-6832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64'),DrawX=-5488,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-6888
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5520
   ObjPosY=-6808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-6846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),DrawX=-4488,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4536
   ObjPosY=-6880
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),DrawX=-4992,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5040
   ObjPosY=-6888
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5024
   ObjPosY=-6808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4520
   ObjPosY=-6800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_0
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9666,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9643,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9620,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9597,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9574,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9551,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9528,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9505,OverrideDelta=176)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-9482,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=-9736
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_0"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Level Loaded All"
   MaxWidth=223
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=1)),DrawY=-9046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9641,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-9112
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="Level Loaded All"
   InputLinks(0)=(DrawY=-9462,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9194,OverrideDelta=110)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9336
   ObjPosY=-9496
   DrawWidth=284
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_1
   InputLinks(0)=(DrawY=-9355,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9334,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9313,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9334,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),DrawX=-9258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9296
   ObjPosY=-9392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_1"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-9264
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9192
   ObjPosY=-9264
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-9264
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-9264
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=-6992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-6992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-7046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-2848,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2896
   ObjPosY=-7080
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-7046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-2720,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2768
   ObjPosY=-7080
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-7000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-7054,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7054,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=-2992,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-7088
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=-7456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3528
   ObjPosY=-7464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3608
   ObjPosY=-7456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_8
   InputLinks(0)=(DrawY=-7563,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7542,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7521,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7542,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=-3146,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3095,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3046,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3184
   ObjPosY=-7600
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_8"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3760
   ObjPosY=-7456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_9
   InputLinks(0)=(DrawY=-7579,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7558,ActivateDelay=12.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7537,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_8'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),DrawY=-7558,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=-3586,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3535,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3486,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3624
   ObjPosY=-7616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_9"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=-7464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3080
   ObjPosY=-7464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2976
   ObjPosY=-7464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-7464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3752
   ObjPosY=-7344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-7344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-7344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3456
   ObjPosY=-7344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-7811,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7790,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7769,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7790,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=-3210,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3159,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3110,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3248
   ObjPosY=-7848
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_139'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_313'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3144
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_138'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_314'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_136'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_315'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2744
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_135'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2640
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_290'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-7720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=-7008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-7054,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7054,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=-3144,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3192
   ObjPosY=-7088
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=2
   InputLinks(0)=(DrawY=-7172,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7152,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0')),DrawY=-7172,OverrideDelta=13)
   OutputLinks(1)=(LinkDesc="Link 2",DrawY=-7152,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-6252,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-7208
   DrawWidth=89
   DrawHeight=101
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-4770,ActivateDelay=120.000000,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4748,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4726,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4704,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4682,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-4754,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4698,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-9019,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),LinkDesc="Picture",MinVars=0,DrawX=-8964,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=-4808
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=4.900000,OutVal=(X=0.000000,Y=0.003906,Z=-0.000061),ArriveTangent=(X=0.000000,Y=0.001563,Z=-0.000024),LeaveTangent=(X=0.000000,Y=0.001563,Z=-0.000024),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=0.007813,Z=-0.000122),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=4.900000,OutVal=(X=0.000000,Y=-33.750000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=4.900000),(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      GroupName="Picture"
      GroupColor=(B=0,G=145,R=191,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=-4608
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8968
   ObjPosY=-4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Level Loaded All"
   MaxWidth=223
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-4670,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9561,OverrideDelta=79)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9672
   ObjPosY=-4736
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=2
   InputLinks(0)=(DrawY=-4556,OverrideDelta=13)
   InputLinks(1)=(DrawY=-4536,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-4556,OverrideDelta=13)
   OutputLinks(1)=(LinkDesc="Link 2",DrawY=-4536,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9220,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9264
   ObjPosY=-4592
   DrawWidth=89
   DrawHeight=101
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_SpiritA_BehindCells'
   InputLinks(0)=(DrawY=-5966,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5966,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=-7560,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7608
   ObjPosY=-6000
   ObjComment="Female Ghost"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=-5920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-5424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_SpiritG_BehindCells'
   InputLinks(0)=(DrawY=-5470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-7528,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-5504
   ObjComment="Male Ghost"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   ReTriggerDelay=120.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12'),(LinkedOp=SeqAct_RandomSwitch'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-3995,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3974,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3953,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9558,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9696
   ObjPosY=-4064
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-4091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4070,ActivateDelay=13.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4049,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1)),DrawY=-4070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=-9050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-4128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-4000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Outside_Fountain_Children_LP'
   InputLinks(0)=(DrawY=-3830,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3830,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=-8992,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-3864
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_2
   LinkCount=2
   InputLinks(0)=(DrawY=-4132,OverrideDelta=13)
   InputLinks(1)=(DrawY=-4112,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-4132,OverrideDelta=13)
   OutputLinks(1)=(LinkDesc="Link 2",DrawY=-4112,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9276,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-4168
   DrawWidth=89
   DrawHeight=101
   Name="SeqAct_RandomSwitch_2"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-3784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_69
   SizeX=805
   SizeY=572
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=220,G=0,R=255,A=255)
   FillColor=(B=208,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3768
   ObjPosY=-9720
   ObjComment="Test Tools"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_69"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=805
   SizeY=572
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=0,G=242,R=255,A=255)
   FillColor=(B=0,G=238,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2912
   ObjPosY=-9720
   ObjComment="Lights"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_45
   SizeX=805
   SizeY=572
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=0,G=255,R=85,A=255)
   FillColor=(B=0,G=255,R=105,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-288
   ObjPosY=-9720
   ObjComment="Ammo"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_45"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=805
   SizeY=572
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1160
   ObjPosY=-9728
   ObjComment="Audio"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_60
   SizeX=805
   SizeY=572
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=0,G=24,R=255,A=255)
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2040
   ObjPosY=-9720
   ObjComment="Delete"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_60"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=616
   SizeY=206
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-7120
   ObjComment="."
   DrawWidth=616
   DrawHeight=206
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=192
   SizeY=185
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4856
   ObjPosY=-6768
   ObjComment="Whispers Swell"
   DrawWidth=192
   DrawHeight=185
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=192
   SizeY=185
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=-6904
   ObjComment="."
   DrawWidth=192
   DrawHeight=185
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=192
   SizeY=185
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5088
   ObjPosY=-6912
   ObjComment="."
   DrawWidth=192
   DrawHeight=185
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=192
   SizeY=185
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5592
   ObjPosY=-6904
   ObjComment="."
   DrawWidth=192
   DrawHeight=185
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=192
   SizeY=185
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6040
   ObjPosY=-6936
   ObjComment="."
   DrawWidth=192
   DrawHeight=185
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=192
   SizeY=185
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-6024
   ObjComment="."
   DrawWidth=192
   DrawHeight=185
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=930
   SizeY=433
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9736
   ObjPosY=-4864
   ObjComment="Picture Frame 1"
   DrawWidth=930
   DrawHeight=433
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=959
   SizeY=567
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9736
   ObjPosY=-4216
   ObjComment="Fountain Ghosts"
   DrawWidth=959
   DrawHeight=567
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-6771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6729,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6750,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=-8826,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8775,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8726,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=-6808
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9256
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9056
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8960
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_429'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_225'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8760
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_430'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8656
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_428'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8560
   ObjPosY=-6608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-7440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-7440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-7440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=-7440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_2
   InputLinks(0)=(DrawY=-7571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=-8730,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8679,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8630,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=-7608
   ObjComment="Off "
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_2"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_3
   InputLinks(0)=(DrawY=-7299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7257,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7278,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-8738,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8687,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8638,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-7336
   ObjComment="On"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_3"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8656
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-9160
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-9160
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-9160
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-9160
   ObjComment="Light Fixtures"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   ReTriggerDelay=20.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_16'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10'),(LinkedOp=SeqAct_RandomSwitch'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_3')),ActivateDelay=3.000000,DrawY=-7595,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_16',InputLinkIdx=1),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16'),(LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),ActivateDelay=20.000000,DrawY=-7574,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7553,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9406,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-7664
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_16
   InputLinks(0)=(DrawY=-7011,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6990,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6969,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6990,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98'),DrawX=-8794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=-7048
   ObjComment="Light Cones"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_16"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-6912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-6912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8624
   ObjPosY=-6912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8520
   ObjPosY=-6912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100'),DrawX=-9128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9176
   ObjPosY=-8040
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101'),DrawX=-8968,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9016
   ObjPosY=-8040
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102'),DrawX=-8800,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8848
   ObjPosY=-8040
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Inside_Lights_TurnOff'
   InputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=-8648,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-8040
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9000
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-7960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=663
   SizeY=189
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-8056
   ObjComment="Lights"
   DrawWidth=663
   DrawHeight=189
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   Event=AkEvent'WW_ENV_Asylum.Play_ENV_Asylum_Spirits_Whispers_OS'
   InputLinks(0)=(DrawY=-7774,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7774,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),DrawX=-8624,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-7808
   ObjComment="Spirits"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=TargetPoint'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TargetPoint_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8656
   ObjPosY=-7728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_3
   LinkCount=3
   InputLinks(0)=(DrawY=-7750,OverrideDelta=19)
   InputLinks(1)=(DrawY=-7718,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=-7755,OverrideDelta=14)
   OutputLinks(1)=(LinkDesc="Link 2",DrawY=-7734,OverrideDelta=35)
   OutputLinks(2)=(LinkDesc="Link 3",DrawY=-7713,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8756,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8800
   ObjPosY=-7792
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_3"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=276
   SizeY=201
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-7840
   ObjComment="Spirits"
   DrawWidth=276
   DrawHeight=201
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-7851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131'),DrawX=-8402,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8351,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8302,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8440
   ObjPosY=-7888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8440
   ObjPosY=-7760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-7760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8240
   ObjPosY=-7760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=-7760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8040
   ObjPosY=-7760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7936
   ObjPosY=-7760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=Emitter'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Emitter_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7840
   ObjPosY=-7760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=860
   SizeY=312
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=0,G=242,R=255,A=255)
   FillColor=(B=0,G=238,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-7928
   ObjComment="."
   DrawWidth=860
   DrawHeight=312
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_68
   SizeX=860
   SizeY=312
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=0,G=242,R=255,A=255)
   FillColor=(B=0,G=238,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=-6824
   ObjComment="."
   DrawWidth=860
   DrawHeight=312
   Name="SequenceFrame_68"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-5531,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5510,ActivateDelay=15.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5489,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=1)),DrawY=-5510,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-9098,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9047,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8998,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-5568
   ObjComment="Flicker Lights"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_167'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-5400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_170'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-5400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_297'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-5400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_298'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=-5400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-5251,ActivateDelay=15.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5209,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-5230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=-9122,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9071,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9022,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-5288
   ObjComment="Standard Lights"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-5144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-5144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-5144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=-5144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-8915,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8873,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8894,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),DrawX=-9250,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9199,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9150,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-8952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_297'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9280
   ObjPosY=-8824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_298'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-8824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_167'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-8824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=SpotLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.SpotLight_170'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-8824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_6'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_7',InputLinkIdx=1)),ActivateDelay=0.500000,DrawY=-5891,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_6',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_7')),ActivateDelay=7.000000,DrawY=-5870,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5849,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6590,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-5960
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_6
   InputLinks(0)=(DrawY=-6019,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5998,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5977,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5998,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=-6234,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6183,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6134,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6272
   ObjPosY=-6056
   ObjComment="Light On"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_6"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-5928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-5587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=-6218,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6167,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6118,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6256
   ObjPosY=-5624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-5496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_7
   InputLinks(0)=(DrawY=-5811,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5790,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5769,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5790,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117'),DrawX=-6226,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6175,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6126,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-5848
   ObjComment="Light Off"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_7"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6256
   ObjPosY=-5712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-5696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_10
   InputLinks(0)=(DrawY=-5795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),DrawX=-5442,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5391,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5342,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5480
   ObjPosY=-5832
   ObjComment="Light Off"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_10"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5464
   ObjPosY=-5480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-5571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),DrawX=-5434,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5383,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5334,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-5608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5480
   ObjPosY=-5912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_11
   InputLinks(0)=(DrawY=-6003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5961,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5982,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),DrawX=-5450,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5399,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5350,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5488
   ObjPosY=-6040
   ObjComment="Light On"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_11"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_11'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_10',InputLinkIdx=1)),ActivateDelay=0.500000,DrawY=-5875,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_11',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_10')),ActivateDelay=7.000000,DrawY=-5854,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5833,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5806,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-5944
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_12'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_13',InputLinkIdx=1)),ActivateDelay=0.500000,DrawY=-5899,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_12',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_13')),ActivateDelay=7.000000,DrawY=-5878,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5857,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5006,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5144
   ObjPosY=-5968
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_12
   InputLinks(0)=(DrawY=-6027,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6006,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5985,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6006,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),DrawX=-4650,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4599,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4550,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4688
   ObjPosY=-6064
   ObjComment="Light On"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_12"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4680
   ObjPosY=-5936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-5595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5553,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5574,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),DrawX=-4634,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4583,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4534,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4672
   ObjPosY=-5632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4664
   ObjPosY=-5504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_13
   InputLinks(0)=(DrawY=-5819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=-4642,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4591,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4542,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4680
   ObjPosY=-5856
   ObjComment="Light Off"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_13"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4672
   ObjPosY=-5720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-5696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_14
   InputLinks(0)=(DrawY=-5795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=-3914,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3863,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3814,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3952
   ObjPosY=-5832
   ObjComment="Light Off"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_14"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-5480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-5571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=-3906,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3855,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3806,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-5608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3952
   ObjPosY=-5912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_15
   InputLinks(0)=(DrawY=-6003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5961,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5982,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),DrawX=-3922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-6040
   ObjComment="Light On"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_15"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_15'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_14',InputLinkIdx=1)),ActivateDelay=0.500000,DrawY=-5875,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_15',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_14')),ActivateDelay=7.000000,DrawY=-5854,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5833,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-4274,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4416
   ObjPosY=-5944
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=187
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_4'),(LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_5',InputLinkIdx=1)),ActivateDelay=0.500000,DrawY=-5899,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16'),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_4',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_5')),ActivateDelay=7.000000,DrawY=-5878,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5857,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3554,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3696
   ObjPosY=-5968
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=187
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_4
   InputLinks(0)=(DrawY=-6027,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6006,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5985,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6006,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112'),DrawX=-3202,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3151,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3102,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3240
   ObjPosY=-6064
   ObjComment="Light On"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_4"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3232
   ObjPosY=-5936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-5595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5553,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5574,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),DrawX=-3186,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3135,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3086,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3224
   ObjPosY=-5632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=PointLight'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.PointLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3216
   ObjPosY=-5504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_5
   InputLinks(0)=(DrawY=-5819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5777,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),DrawX=-3194,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3143,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3094,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3232
   ObjPosY=-5856
   ObjComment="Light Off"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_5"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3224
   ObjPosY=-5720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9328
   ObjPosY=-9064
   ObjComment="windows"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-9064
   ObjComment="windows"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-9064
   ObjComment="windows"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-9064
   ObjComment="windows"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=InterpActor'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.InterpActor_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8928
   ObjPosY=-9064
   ObjComment="windows"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=3869
   SizeY=884
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-6184
   ObjComment="Windows"
   DrawWidth=3869
   DrawHeight=884
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=2023
   SizeY=1595
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9848
   ObjPosY=-9816
   ObjComment="Level Start"
   DrawWidth=2023
   DrawHeight=1595
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=965
   SizeY=990
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-6048
   ObjComment="Dead End Light flicker"
   DrawWidth=965
   DrawHeight=990
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_54
   SizeX=192
   SizeY=185
   BorderWidth=4
   bDrawBox=True
   BorderColor=(B=255,G=53,R=0,A=255)
   FillColor=(B=255,G=106,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-3872
   ObjComment="."
   DrawWidth=192
   DrawHeight=185
   Name="SequenceFrame_54"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_25
   SizeX=1749
   SizeY=572
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7648
   ObjPosY=-9728
   ObjComment="Portal Spawn"
   DrawWidth=1749
   DrawHeight=572
   Name="SequenceFrame_25"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=1585
   SizeY=725
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1936
   ObjPosY=-8008
   ObjComment="Change Player Start"
   DrawWidth=1585
   DrawHeight=725
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=Trigger'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Trigger_2'
   MaxTriggerCount=0
   ReTriggerDelay=30.000000
   bClientSideOnly=True
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11'),(LinkedOp=SeqAct_ChangeCollision'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_2')),DrawY=-5899,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5878,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5857,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8038,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-5968
   ObjName="Trigger_2 Touch"
   DrawWidth=159
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=Trigger'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Trigger_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7712
   ObjPosY=-5720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_2
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-5790,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_3')),DrawY=-5790,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=-7686,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7744
   ObjPosY=-5824
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_2"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_3
   InputLinks(0)=(DrawY=-5790,ActivateDelay=10.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5790,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=-7502,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-5824
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_3"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=Trigger'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Trigger_0'
   MaxTriggerCount=0
   ReTriggerDelay=30.000000
   bClientSideOnly=True
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3'),(LinkedOp=SeqAct_ChangeCollision'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_1')),DrawY=-5427,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5406,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5385,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-8006,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8120
   ObjPosY=-5496
   ObjName="Trigger_0 Touch"
   DrawWidth=159
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_0
   InputLinks(0)=(DrawY=-5302,ActivateDelay=10.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5302,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=-7502,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-5336
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_0"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_1
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-5302,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_0')),DrawY=-5302,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=-7686,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7744
   ObjPosY=-5336
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_1"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=Trigger'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Trigger_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7712
   ObjPosY=-5232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=852
   SizeY=364
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7640
   ObjPosY=-9040
   ObjComment="Security Office Spawns"
   DrawWidth=852
   DrawHeight=364
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-8899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8857,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8878,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),DrawX=-7234,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7183,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7134,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7272
   ObjPosY=-8936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7272
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7072
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6968
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-8675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8633,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158'),DrawX=-9258,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9207,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9158,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9296
   ObjPosY=-8712
   ObjComment="High Desirability Spawns"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9184
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23')),DrawY=-8891,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=1)),DrawY=-8870,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8849,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7482,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7568
   ObjPosY=-8960
   ObjName="TriggerVolume_14 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=-8475,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25',InputLinkIdx=1)),DrawY=-8454,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8433,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7470,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7552
   ObjPosY=-8544
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=-8507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153',SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_156'),DrawX=-7234,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7183,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7134,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7272
   ObjPosY=-8544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7264
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-8488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7176
   ObjPosY=-8400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9176
   ObjPosY=-8480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7072
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-8488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8968
   ObjPosY=-8480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6976
   ObjPosY=-8400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_156"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=-8899,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27',InputLinkIdx=1)),DrawY=-8878,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8857,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6538,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6624
   ObjPosY=-8968
   ObjName="TriggerVolume_12 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_28
   SizeX=852
   SizeY=364
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6704
   ObjPosY=-9032
   ObjComment="Labratory Office Spawns"
   DrawWidth=852
   DrawHeight=364
   Name="SequenceFrame_28"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-8899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8878,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8857,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8878,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159'),DrawX=-6306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-8936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9288
   ObjPosY=-8408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=852
   SizeY=364
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7640
   ObjPosY=-8624
   ObjComment="Collapsed ceiling overlook Spawns"
   DrawWidth=852
   DrawHeight=364
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-8467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8425,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8446,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),DrawX=-6306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-8504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=852
   SizeY=364
   BorderWidth=4
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6704
   ObjPosY=-8600
   ObjComment="Patient Cells"
   DrawWidth=852
   DrawHeight=364
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   IgnoredClassProximityTypes(0)=Class'KFGame.KFPawn_Monster'
   IgnoredClassProximityTypes(1)=Class'KFGame.KFPawn_MonsterBoss'
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=-8467,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26',InputLinkIdx=1)),DrawY=-8446,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8425,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6538,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6624
   ObjPosY=-8536
   ObjName="TriggerVolume_13 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=KFSpawnVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawnVolume_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-8352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=KFSpawner'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=-9384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-9571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164'),DrawX=-6762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6800
   ObjPosY=-9608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30')),DrawY=-9571,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9550,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9529,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6970,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7056
   ObjPosY=-9640
   ObjName="TriggerVolume_14 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_19"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29')),DrawY=-9587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9566,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9545,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6454,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=-9656
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=-9587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163'),DrawX=-6242,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6191,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6142,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6280
   ObjPosY=-9624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=KFSpawner'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ASHWOODASYLUM.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
