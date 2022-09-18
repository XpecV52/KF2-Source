Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=861,OverrideDelta=14)
   OutputLinks(1)=(DrawY=882,OverrideDelta=35)
   OutputLinks(2)=(DrawY=903,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=96
   ObjPosY=792
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   bLooping=True
   bClientSideOnly=True
   InputLinks(0)=(DrawY=950,OverrideDelta=15)
   InputLinks(1)=(DrawY=972,OverrideDelta=37)
   InputLinks(2)=(DrawY=994,OverrideDelta=59)
   InputLinks(3)=(DrawY=1016,OverrideDelta=81)
   InputLinks(4)=(DrawY=1038,OverrideDelta=103)
   OutputLinks(0)=(DrawY=966,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1022,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=584,OverrideDelta=41)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),LinkDesc="Fan",MinVars=0,DrawX=628,OverrideDelta=88)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=912
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_5
      Tabs(0)=(Curves=((CurveObject=InterpTrackMove'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3.InterpTrackMove_1',CurveColor=(B=0,G=42,R=230,A=255),CurveName="Fan_Movement")))
      Name="InterpCurveEdSetup_5"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=(,(InVal=0.500000),(InVal=1.000000)))
         EulerTrack=(Points=(,(InVal=0.500000,OutVal=(X=180.000000,Y=0.000000,Z=0.000000),ArriveTangent=(X=360.000000,Y=0.000000,Z=0.000000),LeaveTangent=(X=360.000000,Y=0.000000,Z=0.000000)),(InVal=1.000000,OutVal=(X=360.000000,Y=0.000000,Z=0.000000))))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3.InterpTrackMove_1'
      GroupName="Fan"
      GroupColor=(B=0,G=42,R=230,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_5'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=1112
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=InterpActor'KF-CARILLONHAMLET.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=678
   ObjPosY=1069
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=1301,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1322,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1343,OverrideDelta=56)
   VariableLinks(0)=(DrawX=186,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=1232
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=1496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=1309,OverrideDelta=14)
   InputLinks(1)=(DrawY=1330,OverrideDelta=35)
   InputLinks(2)=(DrawY=1351,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1330,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0',SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=510,OverrideDelta=16)
   VariableLinks(1)=(DrawX=561,OverrideDelta=76)
   EventLinks(0)=(DrawX=610,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=472
   ObjPosY=1272
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=1496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=InterpActor'KF-CARILLONHAMLET.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=1144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=InterpActor'KF-CARILLONHAMLET.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=1168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_1')),DrawY=909,OverrideDelta=14)
   OutputLinks(1)=(DrawY=930,OverrideDelta=35)
   OutputLinks(2)=(DrawY=951,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1152
   ObjPosY=840
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_1
   Bank=AkBank'WW_ENV_EvacuationPoint.WwiseDefaultBank_WW_ENV_EvacuationPoint'
   InputLinks(0)=(DrawY=932,OverrideDelta=13)
   InputLinks(1)=(DrawY=952,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=942,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=896
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_1"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=949,OverrideDelta=14)
   InputLinks(1)=(DrawY=971,OverrideDelta=36)
   InputLinks(2)=(DrawY=993,OverrideDelta=58)
   InputLinks(3)=(DrawY=1015,OverrideDelta=80)
   OutputLinks(0)=(DrawY=982,OverrideDelta=47)
   VariableLinks(0)=(DrawX=1781,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=912
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=TargetPoint'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1352
   ObjPosY=1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=440
   ObjPosY=1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=1677,OverrideDelta=14)
   InputLinks(1)=(DrawY=1698,OverrideDelta=35)
   InputLinks(2)=(DrawY=1719,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1698,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=422,OverrideDelta=16)
   VariableLinks(1)=(DrawX=473,OverrideDelta=76)
   EventLinks(0)=(DrawX=522,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=384
   ObjPosY=1640
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=1709,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1730,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1751,OverrideDelta=56)
   VariableLinks(0)=(DrawX=82,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=1640
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_Destruction.WwiseDefaultBank_WW_ENV_Destruction'
   InputLinks(0)=(DrawY=1044,OverrideDelta=13)
   InputLinks(1)=(DrawY=1064,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=1054,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=1008
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=1701,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1722,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1743,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1194,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1112
   ObjPosY=1632
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_ENV_RandomMetalCreaksLP'
   InputLinks(0)=(DrawY=1706,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1706,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=1440,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=1672
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1156
   SizeY=655
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-448
   ObjPosY=-360
   ObjComment="Benchmark"
   DrawWidth=1156
   DrawHeight=655
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=56
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-321,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-416
   ObjPosY=-304
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-222,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-222,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=464,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=-256
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-238,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-238,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-64,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=-272
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackMove'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2',CurveColor=(B=0,G=191,R=145,A=255),CurveName="Camera_Movement")),ViewStartInput=-13.000000,ViewEndInput=143.000000,ViewStartOutput=-3488.004639,ViewEndOutput=1887.998413)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=160.000000,Y=-0.000244,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=19.646139,OutVal=(X=-1120.001221,Y=-0.000854,Z=-0.000053),ArriveTangent=(X=-46.935486,Y=-0.000084,Z=0.000000),LeaveTangent=(X=-46.935486,Y=-0.000084,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=34.940006,OutVal=(X=-1600.001709,Y=-400.001587,Z=-0.000031),ArriveTangent=(X=0.000000,Y=-44.103786,Z=0.000004),LeaveTangent=(X=0.000000,Y=-44.103786,Z=0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=49.852493,OutVal=(X=-1600.001709,Y=-1440.001709,Z=79.999977),ArriveTangent=(X=0.000000,Y=-52.475956,Z=0.000000),LeaveTangent=(X=0.000000,Y=-52.475956,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=69.497986,OutVal=(X=-2156.249268,Y=-2213.464600,Z=79.999977),ArriveTangent=(X=0.000000,Y=-39.839268,Z=0.000000),LeaveTangent=(X=0.000000,Y=-39.839268,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.013893,OutVal=(X=-1520.001953,Y=-3040.002441,Z=79.999977),ArriveTangent=(X=48.361683,Y=-0.000122,Z=0.000000),LeaveTangent=(X=48.361683,Y=-0.000122,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=110.122559,OutVal=(X=-160.002075,Y=-3040.003418,Z=320.000153),ArriveTangent=(X=71.493370,Y=-0.000056,Z=11.531197),LeaveTangent=(X=71.493370,Y=-0.000056,Z=11.531197),InterpMode=CIM_CurveAutoClamped),(InVal=124.702423,OutVal=(X=959.998169,Y=-3040.004395,Z=480.000244),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.253801),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.253801),InterpMode=CIM_CurveAutoClamped),(InVal=144.702957,OutVal=(X=959.998169,Y=-1920.004395,Z=640.000305),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000012),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=154.703094,OutVal=(X=1439.998169,Y=-1920.004639,Z=640.000366),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000006),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=165.077042,OutVal=(X=1439.998169,Y=-1680.004883,Z=640.000427),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000009),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000009),InterpMode=CIM_CurveAutoClamped),(InVal=174.890305,OutVal=(X=1439.998169,Y=-1680.005371,Z=640.000549),ArriveTangent=(X=0.000000,Y=-0.000061,Z=0.000015),LeaveTangent=(X=0.000000,Y=-0.000061,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=185.077576,OutVal=(X=1439.998169,Y=-1680.006104,Z=640.000732),ArriveTangent=(X=0.000000,Y=-0.000061,Z=0.000015),LeaveTangent=(X=0.000000,Y=-0.000061,Z=0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=195.027588,OutVal=(X=1439.998169,Y=-1680.006592,Z=640.000854),InterpMode=CIM_CurveAutoClamped),(InVal=209.867294,OutVal=(X=1439.998169,Y=-1520.007080,Z=168.048615),ArriveTangent=(X=0.000000,Y=17.785250,Z=-18.859484),LeaveTangent=(X=0.000000,Y=17.785250,Z=-18.859484),InterpMode=CIM_CurveAutoClamped),(InVal=224.587845,OutVal=(X=1439.998169,Y=-1120.007568,Z=8.048645),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=239.875549,OutVal=(X=1512.582886,Y=-1143.304932,Z=8.048622),ArriveTangent=(X=10.453918,Y=-3.053512,Z=0.000000),LeaveTangent=(X=10.453918,Y=-3.053512,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=255.095840,OutVal=(X=2159.311523,Y=-1259.622314,Z=8.048630),ArriveTangent=(X=55.787964,Y=0.000000,Z=0.000000),LeaveTangent=(X=55.787964,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=270.095978,OutVal=(X=3198.519043,Y=-1259.123047,Z=8.048615),ArriveTangent=(X=0.000000,Y=0.076408,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.076408,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=289.826904,OutVal=(X=3195.605957,Y=-137.142212,Z=328.048676),ArriveTangent=(X=-0.398220,Y=1.122236,Z=0.000000),LeaveTangent=(X=-0.398220,Y=1.122236,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=304.761230,OutVal=(X=2471.085938,Y=-129.772461,Z=327.831970),ArriveTangent=(X=0.000000,Y=1.353666,Z=-0.040182),LeaveTangent=(X=0.000000,Y=1.353666,Z=-0.040182),InterpMode=CIM_CurveAutoClamped),(InVal=315.062012,OutVal=(X=2508.303223,Y=512.175537,Z=247.433594),ArriveTangent=(X=5.857841,Y=41.073307,Z=0.000000),LeaveTangent=(X=5.857841,Y=41.073307,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=330.128479,OutVal=(X=2657.944336,Y=912.144287,Z=287.284546),ArriveTangent=(X=0.000000,Y=35.439510,Z=0.000000),LeaveTangent=(X=0.000000,Y=35.439510,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=339.885986,OutVal=(X=2657.345215,Y=1391.925049,Z=284.414215),ArriveTangent=(X=-0.106544,Y=0.000000,Z=-0.135686),LeaveTangent=(X=-0.106544,Y=0.000000,Z=-0.135686),InterpMode=CIM_CurveAutoClamped),(InVal=369.920441,OutVal=(X=1056.120728,Y=1391.584717,Z=281.885345),ArriveTangent=(X=0.000000,Y=-0.031797,Z=-0.107567),LeaveTangent=(X=0.000000,Y=-0.031797,Z=-0.107567),InterpMode=CIM_CurveAutoClamped),(InVal=389.800079,OutVal=(X=1110.950806,Y=270.758301,Z=279.045105),ArriveTangent=(X=6.924631,Y=-1.400833,Z=-0.161504),LeaveTangent=(X=6.924631,Y=-1.400833,Z=-0.161504),InterpMode=CIM_CurveAutoClamped),(InVal=404.968506,OutVal=(X=1910.651001,Y=261.417725,Z=276.224945),ArriveTangent=(X=0.000000,Y=-1.684973,Z=-0.509852),LeaveTangent=(X=0.000000,Y=-1.684973,Z=-0.509852),InterpMode=CIM_CurveAutoClamped),(InVal=415.202209,OutVal=(X=1909.779663,Y=-222.091431,Z=112.709892),ArriveTangent=(X=-0.214239,Y=0.000000,Z=-0.559367),LeaveTangent=(X=-0.214239,Y=0.000000,Z=-0.559367),InterpMode=CIM_CurveAutoClamped),(InVal=425.150818,OutVal=(X=1508.785278,Y=-222.041748,Z=110.428215),ArriveTangent=(X=-39.405327,Y=0.006802,Z=-0.486317),LeaveTangent=(X=-39.405327,Y=0.006802,Z=-0.486317),InterpMode=CIM_CurveAutoClamped),(InVal=440.043884,OutVal=(X=930.885376,Y=-221.913940,Z=29.350731),ArriveTangent=(X=0.000000,Y=0.013099,Z=-0.165740),LeaveTangent=(X=0.000000,Y=0.013099,Z=-0.165740),InterpMode=CIM_CurveAutoClamped),(InVal=447.506409,OutVal=(X=1079.100464,Y=-221.748901,Z=28.725899),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.020925),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.020925),InterpMode=CIM_CurveAutoClamped),(InVal=469.946747,OutVal=(X=1078.899048,Y=-1101.542480,Z=28.543556),ArriveTangent=(X=-0.027365,Y=0.000000,Z=-0.014224),LeaveTangent=(X=-0.027365,Y=0.000000,Z=-0.014224),InterpMode=CIM_CurveAutoClamped),(InVal=480.368530,OutVal=(X=758.059204,Y=-1100.926758,Z=28.258469),ArriveTangent=(X=-32.388607,Y=0.076545,Z=0.000000),LeaveTangent=(X=-32.388607,Y=0.076545,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=495.079010,OutVal=(X=264.900024,Y=-1099.595459,Z=107.960655),ArriveTangent=(X=-0.735363,Y=0.000000,Z=5.291259),LeaveTangent=(X=-0.735363,Y=0.000000,Z=5.291259),InterpMode=CIM_CurveAutoClamped),(InVal=510.541656,OutVal=(X=260.372803,Y=-1417.909546,Z=187.912292),ArriveTangent=(X=-0.729527,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.729527,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=525.523926,OutVal=(X=-140.861328,Y=-1417.322876,Z=187.837830),ArriveTangent=(X=0.000000,Y=0.065064,Z=-0.008258),LeaveTangent=(X=0.000000,Y=0.065064,Z=-0.008258),InterpMode=CIM_CurveAutoClamped),(InVal=540.617554,OutVal=(X=99.316772,Y=-1415.797974,Z=187.644318),ArriveTangent=(X=0.446105,Y=0.251851,Z=-0.032049),LeaveTangent=(X=0.446105,Y=0.251851,Z=-0.032049),InterpMode=CIM_CurveAutoClamped),(InVal=555.601196,OutVal=(X=102.031250,Y=-1093.561035,Z=107.360435),InterpMode=CIM_CurveAutoClamped),(InVal=575.069397,OutVal=(X=-777.968994,Y=-1093.561523,Z=107.360435),ArriveTangent=(X=-0.000017,Y=-0.000068,Z=0.000000),LeaveTangent=(X=-0.000017,Y=-0.000068,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=590.060425,OutVal=(X=-777.969116,Y=-1493.561768,Z=107.360435),ArriveTangent=(X=-0.000021,Y=-0.000040,Z=0.000000),LeaveTangent=(X=-0.000021,Y=-0.000040,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=604.898438,OutVal=(X=-1577.969482,Y=-1493.562012,Z=107.360435),ArriveTangent=(X=-0.000162,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000162,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=620.168518,OutVal=(X=-1577.970459,Y=-213.562500,Z=27.360435),ArriveTangent=(X=-0.000160,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000160,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=635.317993,OutVal=(X=-2297.970947,Y=-213.562744,Z=27.360435),ArriveTangent=(X=-37.834930,Y=0.000000,Z=0.000000),LeaveTangent=(X=-37.834930,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=649.770813,OutVal=(X=-2697.971191,Y=-133.562744,Z=27.360435),ArriveTangent=(X=-0.000163,Y=12.219213,Z=0.000000),LeaveTangent=(X=-0.000163,Y=12.219213,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=665.090637,OutVal=(X=-2697.972168,Y=746.437256,Z=-132.639618),ArriveTangent=(X=-0.000055,Y=63.411942,Z=-0.000008),LeaveTangent=(X=-0.000055,Y=63.411942,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=685.095398,OutVal=(X=-2697.973145,Y=2106.437744,Z=-132.639679),ArriveTangent=(X=0.000000,Y=27.206112,Z=-0.000003),LeaveTangent=(X=0.000000,Y=27.206112,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=694.943481,OutVal=(X=-2457.973633,Y=2266.437988,Z=-132.639709),ArriveTangent=(X=0.000000,Y=24.875135,Z=-0.000007),LeaveTangent=(X=0.000000,Y=24.875135,Z=-0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=709.772949,OutVal=(X=-2457.974609,Y=2826.437988,Z=-292.639801),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000020),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=725.406555,OutVal=(X=-1737.975098,Y=2826.437988,Z=-292.639923),ArriveTangent=(X=11.600112,Y=0.000000,Z=-0.000008),LeaveTangent=(X=11.600112,Y=0.000000,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=740.355042,OutVal=(X=-1657.975586,Y=2106.438477,Z=-292.640045),ArriveTangent=(X=0.000000,Y=-45.529701,Z=0.000000),LeaveTangent=(X=0.000000,Y=-45.529701,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=755.277161,OutVal=(X=-1657.976074,Y=1466.438232,Z=-132.640076),InterpMode=CIM_CurveAutoClamped),(InVal=770.632568,OutVal=(X=-1177.976318,Y=1466.438232,Z=-132.640106),InterpMode=CIM_CurveAutoClamped),(InVal=785.003235,OutVal=(X=-1177.976563,Y=2026.438477,Z=27.359894),ArriveTangent=(X=0.000000,Y=0.000124,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.000124,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=800.203613,OutVal=(X=-857.977112,Y=2026.439209,Z=27.359894),InterpMode=CIM_CurveAutoClamped),(InVal=819.925781,OutVal=(X=-857.977295,Y=1226.438965,Z=267.359894),ArriveTangent=(X=0.000000,Y=-30.683895,Z=0.000000),LeaveTangent=(X=0.000000,Y=-30.683895,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=834.946960,OutVal=(X=-537.977539,Y=906.438965,Z=267.359894),InterpMode=CIM_CurveAutoClamped),(InVal=849.687073,OutVal=(X=-537.977783,Y=1386.438965,Z=267.359894),InterpMode=CIM_CurveAutoClamped),(InVal=870.139893,OutVal=(X=182.022217,Y=1386.438965,Z=267.359894),ArriveTangent=(X=23.133253,Y=0.000000,Z=0.000000),LeaveTangent=(X=23.133253,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=879.670105,OutVal=(X=336.990601,Y=1386.438965,Z=267.359894),ArriveTangent=(X=22.419241,Y=0.000000,Z=0.000000),LeaveTangent=(X=22.419241,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=899.937744,OutVal=(X=982.022095,Y=1386.438965,Z=267.359894),ArriveTangent=(X=37.729939,Y=0.000000,Z=0.000000),LeaveTangent=(X=37.729939,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=920.089783,OutVal=(X=1862.022583,Y=1386.438965,Z=267.359894),ArriveTangent=(X=0.000114,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000114,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=935.021973,OutVal=(X=1862.023315,Y=346.438965,Z=267.359894),InterpMode=CIM_CurveAutoClamped),(InVal=949.819275,OutVal=(X=1062.023071,Y=346.438965,Z=267.359894),InterpMode=CIM_CurveAutoClamped),(InVal=965.012329,OutVal=(X=1062.023071,Y=1386.438965,Z=267.359894),InterpMode=CIM_CurveAutoClamped),(InVal=980.303162,OutVal=(X=182.023071,Y=1386.438965,Z=267.359894),ArriveTangent=(X=-0.065361,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.065361,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=985.014465,OutVal=(X=181.842651,Y=1211.713623,Z=246.174225),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.194868),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.194868),InterpMode=CIM_CurveAutoClamped),(InVal=995.118958,OutVal=(X=182.023071,Y=1226.438965,Z=-212.640198),InterpMode=CIM_CurveAutoClamped),(InVal=1015.249146,OutVal=(X=182.023071,Y=426.438965,Z=27.359825),InterpMode=CIM_CurveAutoClamped),(InVal=1030.192627,OutVal=(X=-457.977295,Y=666.438965,Z=-52.640221),ArriveTangent=(X=-25.873587,Y=16.136229,Z=-0.000007),LeaveTangent=(X=-25.873587,Y=16.136229,Z=-0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=1040.038086,OutVal=(X=-617.977539,Y=826.438965,Z=-52.640251),ArriveTangent=(X=-24.831284,Y=0.000000,Z=-0.000007),LeaveTangent=(X=-24.831284,Y=0.000000,Z=-0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=1054.927734,OutVal=(X=-1177.978394,Y=826.438965,Z=-132.640320),ArriveTangent=(X=-0.000040,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000040,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1069.941406,OutVal=(X=-1177.978638,Y=1386.438965,Z=-132.640320),ArriveTangent=(X=-0.000040,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000040,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1084.861450,OutVal=(X=-1497.979126,Y=1386.438965,Z=-132.640381),ArriveTangent=(X=-0.000081,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000081,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1100.234985,OutVal=(X=-1497.979614,Y=426.438965,Z=27.359650),InterpMode=CIM_CurveAutoClamped),(InVal=1124.893188,OutVal=(X=-457.979736,Y=426.438965,Z=27.359650),InterpMode=CIM_CurveAutoClamped),(InVal=1135.067627,OutVal=(X=-457.979858,Y=746.438965,Z=-52.640381),ArriveTangent=(X=-0.000030,Y=39.937599,Z=-7.987524),LeaveTangent=(X=-0.000030,Y=39.937599,Z=-7.987524),InterpMode=CIM_CurveAutoClamped),(InVal=1144.924438,OutVal=(X=-537.980103,Y=1226.438965,Z=-132.640442),ArriveTangent=(X=-0.000061,Y=52.302334,Z=-14.104815),LeaveTangent=(X=-0.000061,Y=52.302334,Z=-14.104815),InterpMode=CIM_CurveAutoClamped),(InVal=1154.952026,OutVal=(X=-537.980347,Y=1786.439453,Z=-372.640564),ArriveTangent=(X=-0.000055,Y=0.000046,Z=-0.000010),LeaveTangent=(X=-0.000055,Y=0.000046,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=1169.515015,OutVal=(X=-1257.980591,Y=1786.439697,Z=-372.640625),ArriveTangent=(X=-0.000084,Y=0.000054,Z=-0.000006),LeaveTangent=(X=-0.000084,Y=0.000054,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=1174.755005,OutVal=(X=-1257.980835,Y=1946.439941,Z=-372.640686),ArriveTangent=(X=-0.000058,Y=25.108486,Z=-0.000023),LeaveTangent=(X=-0.000058,Y=25.108486,Z=-0.000023),InterpMode=CIM_CurveAutoClamped),(InVal=1185.445923,OutVal=(X=-1257.981567,Y=2186.440674,Z=-852.640930),ArriveTangent=(X=0.000000,Y=0.000063,Z=-0.000013),LeaveTangent=(X=0.000000,Y=0.000063,Z=-0.000013),InterpMode=CIM_CurveAutoClamped),(InVal=1194.896362,OutVal=(X=-1257.981445,Y=2186.440918,Z=-852.640991),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000012),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=1204.942993,OutVal=(X=-1257.981445,Y=2186.440918,Z=-852.641235),InterpMode=CIM_CurveAutoClamped),(InVal=1210.144897,OutVal=(X=-1257.981201,Y=2186.440186,Z=-852.641113),ArriveTangent=(X=0.000000,Y=-0.000229,Z=0.000038),LeaveTangent=(X=0.000000,Y=-0.000229,Z=0.000038),InterpMode=CIM_CurveAutoClamped),(InVal=1229.981934,OutVal=(X=-3577.982178,Y=1866.440674,Z=-692.641235),ArriveTangent=(X=0.000000,Y=-29.525057,Z=0.000000),LeaveTangent=(X=0.000000,Y=-29.525057,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1239.950073,OutVal=(X=-3257.983643,Y=1306.440674,Z=-692.641418),ArriveTangent=(X=0.000000,Y=-51.738529,Z=-0.000015),LeaveTangent=(X=0.000000,Y=-51.738529,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=1250.083008,OutVal=(X=-3737.984863,Y=826.440674,Z=-692.641541),ArriveTangent=(X=-38.628502,Y=0.000000,Z=-0.000010),LeaveTangent=(X=-38.628502,Y=0.000000,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=1264.802246,OutVal=(X=-4217.985840,Y=1146.440674,Z=-692.641663),ArriveTangent=(X=-0.000162,Y=40.692158,Z=0.000000),LeaveTangent=(X=-0.000162,Y=40.692158,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1280.104492,OutVal=(X=-4217.986816,Y=2426.441162,Z=-212.641724),ArriveTangent=(X=-0.000049,Y=47.696533,Z=0.000000),LeaveTangent=(X=-0.000049,Y=47.696533,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1294.855957,OutVal=(X=-4217.987305,Y=2826.441406,Z=-212.641754),ArriveTangent=(X=0.000000,Y=0.000079,Z=-0.000004),LeaveTangent=(X=0.000000,Y=0.000079,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=1310.354004,OutVal=(X=-3337.988770,Y=2826.441895,Z=-212.641846),ArriveTangent=(X=57.890659,Y=0.000000,Z=-0.000015),LeaveTangent=(X=57.890659,Y=0.000000,Z=-0.000015),InterpMode=CIM_CurveAutoClamped),(InVal=1325.258057,OutVal=(X=-2457.989746,Y=2826.441895,Z=-292.641998),ArriveTangent=(X=77.680367,Y=0.000000,Z=-0.000010),LeaveTangent=(X=77.680367,Y=0.000000,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=1340.219971,OutVal=(X=-1017.989502,Y=2826.441895,Z=-292.642059),ArriveTangent=(X=89.828552,Y=0.000000,Z=-0.000006),LeaveTangent=(X=89.828552,Y=0.000000,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=1355.537964,OutVal=(X=262.010498,Y=2186.442139,Z=-292.642181),ArriveTangent=(X=47.323231,Y=-20.154152,Z=-0.000008),LeaveTangent=(X=47.323231,Y=-20.154152,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=1370.481201,OutVal=(X=662.010376,Y=2026.442627,Z=-292.642303),ArriveTangent=(X=32.339497,Y=0.000000,Z=-0.000008),LeaveTangent=(X=32.339497,Y=0.000000,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=1385.223022,OutVal=(X=1222.010376,Y=2026.443115,Z=-292.642426),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000008),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000008),InterpMode=CIM_CurveAutoClamped),(InVal=1400.432739,OutVal=(X=1064.884155,Y=1226.442871,Z=-292.642548),ArriveTangent=(X=0.000000,Y=-21.674187,Z=-0.000006),LeaveTangent=(X=0.000000,Y=-21.674187,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=1414.943604,OutVal=(X=2102.010742,Y=1066.442871,Z=-292.642609),ArriveTangent=(X=67.118752,Y=0.000000,Z=-0.000004),LeaveTangent=(X=67.118752,Y=0.000000,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=1430.187866,OutVal=(X=3062.011230,Y=1066.442871,Z=-292.642670),ArriveTangent=(X=0.000217,Y=0.000000,Z=-0.000007),LeaveTangent=(X=0.000217,Y=0.000000,Z=-0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=1440.058105,OutVal=(X=3062.012207,Y=826.442871,Z=-292.642792),ArriveTangent=(X=0.000098,Y=-43.785080,Z=-0.000031),LeaveTangent=(X=0.000098,Y=-43.785080,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=1450.031372,OutVal=(X=3062.013184,Y=26.442871,Z=-612.642883),ArriveTangent=(X=0.000097,Y=-67.236298,Z=-0.000029),LeaveTangent=(X=0.000097,Y=-67.236298,Z=-0.000029),InterpMode=CIM_CurveAutoClamped),(InVal=1460.285278,OutVal=(X=3062.014160,Y=-533.557373,Z=-612.643005),ArriveTangent=(X=0.000000,Y=-0.000170,Z=-0.000009),LeaveTangent=(X=0.000000,Y=-0.000170,Z=-0.000009),InterpMode=CIM_CurveAutoClamped),(InVal=1470.126831,OutVal=(X=3062.013672,Y=-533.558044,Z=-612.643066),ArriveTangent=(X=-0.000124,Y=-0.000025,Z=-0.000006),LeaveTangent=(X=-0.000124,Y=-0.000025,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=1479.984863,OutVal=(X=2582.014160,Y=-533.558167,Z=-612.643127),ArriveTangent=(X=0.000000,Y=-0.000013,Z=-0.000006),LeaveTangent=(X=0.000000,Y=-0.000013,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=1489.557007,OutVal=(X=2582.014648,Y=-533.558289,Z=-612.643188),ArriveTangent=(X=0.000000,Y=-0.000018,Z=-0.000009),LeaveTangent=(X=0.000000,Y=-0.000018,Z=-0.000009),InterpMode=CIM_CurveAutoClamped),(InVal=1499.870239,OutVal=(X=2422.015625,Y=-533.558533,Z=-612.643311),ArriveTangent=(X=-29.708492,Y=-0.000014,Z=-0.000007),LeaveTangent=(X=-29.708492,Y=-0.000014,Z=-0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=1515.041992,OutVal=(X=982.015747,Y=-533.558655,Z=-612.643372),ArriveTangent=(X=-53.190620,Y=-0.000015,Z=-0.000007),LeaveTangent=(X=-53.190620,Y=-0.000015,Z=-0.000007),InterpMode=CIM_CurveAutoClamped),(InVal=1524.880005,OutVal=(X=662.015747,Y=-533.558899,Z=-612.643494),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000031),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000031),InterpMode=CIM_CurveAutoClamped),(InVal=1534.908447,OutVal=(X=662.015747,Y=506.441162,Z=-772.643677),ArriveTangent=(X=0.000000,Y=92.668221,Z=-10.590670),LeaveTangent=(X=0.000000,Y=92.668221,Z=-10.590670),InterpMode=CIM_CurveAutoClamped),(InVal=1555.095337,OutVal=(X=-537.984741,Y=2266.442139,Z=-932.644104),ArriveTangent=(X=0.000000,Y=91.132439,Z=-0.000051),LeaveTangent=(X=0.000000,Y=91.132439,Z=-0.000051),InterpMode=CIM_CurveAutoClamped),(InVal=1564.755127,OutVal=(X=-297.984985,Y=3226.441895,Z=-932.644348),ArriveTangent=(X=19.551195,Y=74.946320,Z=0.000000),LeaveTangent=(X=19.551195,Y=74.946320,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1579.646240,OutVal=(X=-57.985229,Y=4106.441895,Z=-852.644592),ArriveTangent=(X=13.854567,Y=52.647488,Z=0.000000),LeaveTangent=(X=13.854567,Y=52.647488,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1593.626465,OutVal=(X=102.014893,Y=4746.445313,Z=-1012.644958),ArriveTangent=(X=0.000210,Y=0.000000,Z=-0.000021),LeaveTangent=(X=0.000210,Y=0.000000,Z=-0.000021),InterpMode=CIM_CurveAutoClamped),(InVal=1608.391113,OutVal=(X=102.016113,Y=4746.444336,Z=-1012.645081),ArriveTangent=(X=0.000204,Y=-0.000164,Z=0.000000),LeaveTangent=(X=0.000204,Y=-0.000164,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1623.475830,OutVal=(X=902.016235,Y=3626.442871,Z=-692.645081),ArriveTangent=(X=29.181820,Y=-76.339142,Z=20.207409),LeaveTangent=(X=29.181820,Y=-76.339142,Z=20.207409),InterpMode=CIM_CurveAutoClamped),(InVal=1644.021606,OutVal=(X=1222.016235,Y=2026.443115,Z=-292.645142),InterpMode=CIM_CurveAutoClamped),(InVal=1653.996582,OutVal=(X=1222.016235,Y=2026.443359,Z=-292.645203),ArriveTangent=(X=0.000000,Y=0.000036,Z=-0.000009),LeaveTangent=(X=0.000000,Y=0.000036,Z=-0.000009),InterpMode=CIM_CurveAutoClamped),(InVal=1664.302734,OutVal=(X=262.016235,Y=2026.443848,Z=-292.645325),ArriveTangent=(X=-0.000118,Y=0.000035,Z=-0.000012),LeaveTangent=(X=-0.000118,Y=0.000035,Z=-0.000012),InterpMode=CIM_CurveAutoClamped),(InVal=1675.173340,OutVal=(X=262.015747,Y=2026.444092,Z=-292.645447),ArriveTangent=(X=-0.000086,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000086,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1699.577515,OutVal=(X=102.015747,Y=266.444092,Z=27.354546),ArriveTangent=(X=-12.129826,Y=-35.634354,Z=0.000000),LeaveTangent=(X=-12.129826,Y=-35.634354,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1714.745239,OutVal=(X=-217.984497,Y=-53.556152,Z=27.354546),ArriveTangent=(X=-35.710304,Y=0.000000,Z=0.000000),LeaveTangent=(X=-35.710304,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1734.798218,OutVal=(X=-1497.984985,Y=186.443848,Z=27.354546),ArriveTangent=(X=-0.000093,Y=23.866848,Z=0.000000),LeaveTangent=(X=-0.000093,Y=23.866848,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1755.034424,OutVal=(X=-1497.985718,Y=1386.443848,Z=-132.645538),ArriveTangent=(X=-0.000109,Y=14.420267,Z=-0.000006),LeaveTangent=(X=-0.000109,Y=14.420267,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=1765.060425,OutVal=(X=-1657.985962,Y=1466.443848,Z=-132.645569),ArriveTangent=(X=-0.000073,Y=14.641644,Z=-0.000006),LeaveTangent=(X=-0.000073,Y=14.641644,Z=-0.000006),InterpMode=CIM_CurveAutoClamped),(InVal=1785.088501,OutVal=(X=-1657.986450,Y=2826.443848,Z=-292.645691),ArriveTangent=(X=0.000000,Y=63.862240,Z=-0.000038),LeaveTangent=(X=0.000000,Y=63.862240,Z=-0.000038),InterpMode=CIM_CurveAutoClamped),(InVal=1794.740356,OutVal=(X=-1577.987183,Y=3386.443848,Z=-292.645874),ArriveTangent=(X=0.000000,Y=31.883627,Z=-0.000037),LeaveTangent=(X=0.000000,Y=31.883627,Z=-0.000037),InterpMode=CIM_CurveAutoClamped),(InVal=1815.197998,OutVal=(X=-1577.987671,Y=3786.443848,Z=-372.645905),ArriveTangent=(X=0.000000,Y=18.169556,Z=-6.813585),LeaveTangent=(X=0.000000,Y=18.169556,Z=-6.813585),InterpMode=CIM_CurveAutoClamped),(InVal=1829.964111,OutVal=(X=-1337.987671,Y=4026.443848,Z=-532.645935),ArriveTangent=(X=23.117056,Y=19.560156,Z=-12.414329),LeaveTangent=(X=23.117056,Y=19.560156,Z=-12.414329),InterpMode=CIM_CurveAutoClamped),(InVal=1864.662964,OutVal=(X=-57.987915,Y=4826.447266,Z=-1012.646362),ArriveTangent=(X=0.000137,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.000137,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1875.041138,OutVal=(X=-57.987061,Y=4826.445313,Z=-1012.646362),InterpMode=CIM_CurveAutoClamped),(InVal=1884.855957,OutVal=(X=-57.987305,Y=4826.447266,Z=-1012.646606),ArriveTangent=(X=-0.000055,Y=0.000000,Z=-0.000020),LeaveTangent=(X=-0.000055,Y=0.000000,Z=-0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=1899.982300,OutVal=(X=-537.987549,Y=4506.446777,Z=-1012.646851),ArriveTangent=(X=-38.682312,Y=-25.029734,Z=0.000000),LeaveTangent=(X=-38.682312,Y=-25.029734,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1920.014160,OutVal=(X=-1417.987915,Y=3946.446777,Z=-452.646851),ArriveTangent=(X=-19.983543,Y=-34.914547,Z=22.628517),LeaveTangent=(X=-19.983543,Y=-34.914547,Z=22.628517),InterpMode=CIM_CurveAutoClamped),(InVal=1934.351929,OutVal=(X=-1577.988159,Y=3306.446777,Z=-212.646881),ArriveTangent=(X=0.000000,Y=-37.407764,Z=0.000000),LeaveTangent=(X=0.000000,Y=-37.407764,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1949.954468,OutVal=(X=-937.988708,Y=2826.446777,Z=-212.646973),ArriveTangent=(X=51.339848,Y=-33.482510,Z=-0.000003),LeaveTangent=(X=51.339848,Y=-33.482510,Z=-0.000003),InterpMode=CIM_CurveAutoClamped),(InVal=1970.191528,OutVal=(X=262.011475,Y=2106.447021,Z=-212.647003),ArriveTangent=(X=0.000000,Y=-48.274998,Z=-0.000002),LeaveTangent=(X=0.000000,Y=-48.274998,Z=-0.000002),InterpMode=CIM_CurveAutoClamped),(InVal=1979.783569,OutVal=(X=262.011475,Y=1386.447021,Z=-212.647034),ArriveTangent=(X=0.000000,Y=-71.704903,Z=0.000000),LeaveTangent=(X=0.000000,Y=-71.704903,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1989.650879,OutVal=(X=247.484009,Y=711.116211,Z=-6.713379),ArriveTangent=(X=0.000000,Y=-58.261765,Z=0.000000),LeaveTangent=(X=0.000000,Y=-58.261765,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2009.992065,OutVal=(X=262.011475,Y=-373.553223,Z=-52.647072),ArriveTangent=(X=1.759491,Y=-0.000015,Z=-0.000002),LeaveTangent=(X=1.759491,Y=-0.000015,Z=-0.000002),InterpMode=CIM_CurveAutoClamped),(InVal=2029.912842,OutVal=(X=1062.011353,Y=-373.553345,Z=-52.647087),ArriveTangent=(X=0.000000,Y=-0.000015,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000015,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2049.754395,OutVal=(X=1062.011353,Y=-1173.554077,Z=27.352913),InterpMode=CIM_CurveAutoClamped),(InVal=2064.998779,OutVal=(X=742.011353,Y=-773.554199,Z=27.352913),ArriveTangent=(X=-19.185947,Y=31.976561,Z=0.000000),LeaveTangent=(X=-19.185947,Y=31.976561,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2074.772705,OutVal=(X=582.011353,Y=-373.554565,Z=107.352913),InterpMode=CIM_CurveAutoClamped),(InVal=2085.070313,OutVal=(X=582.011353,Y=-373.554688,Z=107.352913),ArriveTangent=(X=0.000000,Y=-0.000012,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000012,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2094.636475,OutVal=(X=582.011353,Y=-373.554810,Z=107.352913),InterpMode=CIM_CurveAutoClamped),(InVal=2115.013184,OutVal=(X=182.011353,Y=26.445313,Z=27.352913),ArriveTangent=(X=0.000000,Y=33.421299,Z=-4.786166),LeaveTangent=(X=0.000000,Y=33.421299,Z=-4.786166),InterpMode=CIM_CurveAutoClamped),(InVal=2144.781006,OutVal=(X=182.011353,Y=1946.445801,Z=-132.647125),ArriveTangent=(X=0.000000,Y=49.471420,Z=-0.000010),LeaveTangent=(X=0.000000,Y=49.471420,Z=-0.000010),InterpMode=CIM_CurveAutoClamped),(InVal=2154.789795,OutVal=(X=22.011353,Y=2346.446289,Z=-132.647186),ArriveTangent=(X=-28.509588,Y=35.497471,Z=-0.000005),LeaveTangent=(X=-28.509588,Y=35.497471,Z=-0.000005),InterpMode=CIM_CurveAutoClamped),(InVal=2169.571533,OutVal=(X=-937.989014,Y=2826.446777,Z=-132.647247),ArriveTangent=(X=-54.684906,Y=27.342457,Z=-0.000004),LeaveTangent=(X=-54.684906,Y=27.342457,Z=-0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=2184.048340,OutVal=(X=-1577.989380,Y=3146.446777,Z=-132.647308),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=19.646139,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=34.940006,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=49.852493,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=69.497986,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.013893,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=110.122559,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=124.702423,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=144.702957,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=154.703094,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.077042,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=174.890305,OutVal=(X=0.000000,Y=0.000000,Z=382.500000),InterpMode=CIM_CurveAutoClamped),(InVal=185.077576,OutVal=(X=0.000000,Y=0.000000,Z=495.000000),InterpMode=CIM_CurveAutoClamped),(InVal=195.027588,OutVal=(X=0.000000,Y=-45.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=209.867294,OutVal=(X=0.000000,Y=-22.500000,Z=450.000000),ArriveTangent=(X=0.000000,Y=1.522314,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.522314,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=224.587845,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=239.875549,OutVal=(X=0.000000,Y=-5.449219,Z=360.878906),InterpMode=CIM_CurveAutoClamped),(InVal=255.095840,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=270.095978,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=289.826904,OutVal=(X=0.000000,Y=-1.406250,Z=539.648438),InterpMode=CIM_CurveAutoClamped),(InVal=304.761230,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=315.062012,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=330.128479,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=339.885986,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=369.920441,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.528719),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.528719),InterpMode=CIM_CurveAutoClamped),(InVal=389.800079,OutVal=(X=0.000000,Y=-5.625000,Z=363.867188),ArriveTangent=(X=0.000000,Y=-0.540200,Z=-5.160882),LeaveTangent=(X=0.000000,Y=-0.540200,Z=-5.160882),InterpMode=CIM_CurveAutoClamped),(InVal=404.968506,OutVal=(X=0.000000,Y=-21.269531,Z=269.121094),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.175979),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.175979),InterpMode=CIM_CurveAutoClamped),(InVal=415.202209,OutVal=(X=0.000000,Y=-8.964844,Z=181.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.343881),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.343881),InterpMode=CIM_CurveAutoClamped),(InVal=425.150818,OutVal=(X=0.000000,Y=-15.117188,Z=180.175781),InterpMode=CIM_CurveAutoClamped),(InVal=440.043884,OutVal=(X=0.000000,Y=-9.140625,Z=203.554688),ArriveTangent=(X=0.000000,Y=0.291262,Z=3.376267),LeaveTangent=(X=0.000000,Y=0.291262,Z=3.376267),InterpMode=CIM_CurveAutoClamped),(InVal=447.506409,OutVal=(X=0.000000,Y=-7.558594,Z=262.792969),ArriveTangent=(X=0.000000,Y=0.220093,Z=4.937863),LeaveTangent=(X=0.000000,Y=0.220093,Z=4.937863),InterpMode=CIM_CurveAutoClamped),(InVal=469.946747,OutVal=(X=0.000000,Y=-2.460938,Z=351.210938),ArriveTangent=(X=0.000000,Y=0.509821,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.509821,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=480.368530,OutVal=(X=0.000000,Y=11.425781,Z=173.671875),InterpMode=CIM_CurveAutoClamped),(InVal=495.079010,OutVal=(X=0.000000,Y=-0.175781,Z=178.769531),ArriveTangent=(X=0.000000,Y=-0.566900,Z=0.214223),LeaveTangent=(X=0.000000,Y=-0.566900,Z=0.214223),InterpMode=CIM_CurveAutoClamped),(InVal=510.541656,OutVal=(X=0.000000,Y=-5.800781,Z=180.703125),ArriveTangent=(X=0.000000,Y=-0.329104,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.329104,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=525.523926,OutVal=(X=0.000000,Y=-10.195313,Z=125.859375),InterpMode=CIM_CurveAutoClamped),(InVal=540.617554,OutVal=(X=0.000000,Y=-5.625000,Z=381.445313),ArriveTangent=(X=0.000000,Y=0.338971,Z=8.514113),LeaveTangent=(X=0.000000,Y=0.338971,Z=8.514113),InterpMode=CIM_CurveAutoClamped),(InVal=555.601196,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.821645),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.821645),InterpMode=CIM_CurveAutoClamped),(InVal=575.069397,OutVal=(X=0.000000,Y=-7.031250,Z=582.011719),InterpMode=CIM_CurveAutoClamped),(InVal=590.060425,OutVal=(X=0.000000,Y=-6.152344,Z=548.964844),ArriveTangent=(X=0.000000,Y=0.125104,Z=-3.874207),LeaveTangent=(X=0.000000,Y=0.125104,Z=-3.874207),InterpMode=CIM_CurveAutoClamped),(InVal=604.898438,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=620.168518,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=635.317993,OutVal=(X=0.000000,Y=1.757813,Z=538.417969),InterpMode=CIM_CurveAutoClamped),(InVal=649.770813,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=665.090637,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=685.095398,OutVal=(X=0.000000,Y=-1.406250,Z=565.488281),InterpMode=CIM_CurveAutoClamped),(InVal=694.943481,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=709.772949,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=725.406555,OutVal=(X=0.000000,Y=5.625000,Z=362.812500),ArriveTangent=(X=0.000000,Y=0.576463,Z=-5.937528),LeaveTangent=(X=0.000000,Y=0.576463,Z=-5.937528),InterpMode=CIM_CurveAutoClamped),(InVal=740.355042,OutVal=(X=0.000000,Y=18.105469,Z=268.417969),InterpMode=CIM_CurveAutoClamped),(InVal=755.277161,OutVal=(X=0.000000,Y=1.582031,Z=347.871094),ArriveTangent=(X=0.000000,Y=-0.232903,Z=5.997254),LeaveTangent=(X=0.000000,Y=-0.232903,Z=5.997254),InterpMode=CIM_CurveAutoClamped),(InVal=770.632568,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=785.003235,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=800.203613,OutVal=(X=0.000000,Y=2.109375,Z=273.339844),InterpMode=CIM_CurveAutoClamped),(InVal=819.925781,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=834.946960,OutVal=(X=0.000000,Y=0.000000,Z=292.500000),InterpMode=CIM_CurveAutoClamped),(InVal=849.687073,OutVal=(X=0.000000,Y=0.000000,Z=292.500000),InterpMode=CIM_CurveAutoClamped),(InVal=870.139893,OutVal=(X=0.000000,Y=2.636719,Z=265.429688),ArriveTangent=(X=0.000000,Y=0.062002,Z=-3.503494),LeaveTangent=(X=0.000000,Y=0.062002,Z=-3.503494),InterpMode=CIM_CurveAutoClamped),(InVal=879.670105,OutVal=(X=0.000000,Y=3.010254,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=899.937744,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=920.089783,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=935.021973,OutVal=(X=0.000000,Y=-3.164063,Z=267.890625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.345071),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.345071),InterpMode=CIM_CurveAutoClamped),(InVal=949.819275,OutVal=(X=0.000000,Y=-2.285156,Z=201.093750),ArriveTangent=(X=0.000000,Y=0.106865,Z=-4.489725),LeaveTangent=(X=0.000000,Y=0.106865,Z=-4.489725),InterpMode=CIM_CurveAutoClamped),(InVal=965.012329,OutVal=(X=0.000000,Y=0.703125,Z=133.242188),ArriveTangent=(X=0.000000,Y=0.161458,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.161458,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=980.303162,OutVal=(X=0.000000,Y=2.636719,Z=266.308594),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.041087),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.041087),InterpMode=CIM_CurveAutoClamped),(InVal=985.014465,OutVal=(X=0.000000,Y=-55.195313,Z=269.296875),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.172298),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.172298),InterpMode=CIM_CurveAutoClamped),(InVal=995.118958,OutVal=(X=0.000000,Y=23.554688,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1015.249146,OutVal=(X=0.000000,Y=4.746094,Z=268.945313),ArriveTangent=(X=0.000000,Y=-0.897107,Z=-0.141622),LeaveTangent=(X=0.000000,Y=-0.897107,Z=-0.141622),InterpMode=CIM_CurveAutoClamped),(InVal=1030.192627,OutVal=(X=0.000000,Y=-7.910156,Z=115.488281),InterpMode=CIM_CurveAutoClamped),(InVal=1040.038086,OutVal=(X=0.000000,Y=0.527344,Z=177.363281),ArriveTangent=(X=0.000000,Y=0.405866,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.405866,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1054.927734,OutVal=(X=0.000000,Y=3.515625,Z=91.582031),InterpMode=CIM_CurveAutoClamped),(InVal=1069.941406,OutVal=(X=0.000000,Y=0.878906,Z=178.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.897540),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.897540),InterpMode=CIM_CurveAutoClamped),(InVal=1084.861450,OutVal=(X=0.000000,Y=2.636719,Z=238.183594),ArriveTangent=(X=0.000000,Y=0.139262,Z=2.954303),LeaveTangent=(X=0.000000,Y=0.139262,Z=2.954303),InterpMode=CIM_CurveAutoClamped),(InVal=1100.234985,OutVal=(X=0.000000,Y=5.097656,Z=267.890625),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.253639),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.253639),InterpMode=CIM_CurveAutoClamped),(InVal=1124.893188,OutVal=(X=0.000000,Y=-14.062500,Z=428.203125),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.811907),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.811907),InterpMode=CIM_CurveAutoClamped),(InVal=1135.067627,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1144.924438,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1154.952026,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1169.515015,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1174.755005,OutVal=(X=0.000000,Y=-67.500000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1185.445923,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1194.896362,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1204.942993,OutVal=(X=0.000000,Y=0.000000,Z=493.989258),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.116680),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.116680),InterpMode=CIM_CurveAutoClamped),(InVal=1210.144897,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1229.981934,OutVal=(X=0.000000,Y=0.000000,Z=540.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1239.950073,OutVal=(X=0.000000,Y=-0.351563,Z=619.980469),InterpMode=CIM_CurveAutoClamped),(InVal=1250.083008,OutVal=(X=0.000000,Y=3.691406,Z=510.117188),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.839662),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.839662),InterpMode=CIM_CurveAutoClamped),(InVal=1264.802246,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1280.104492,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1294.855957,OutVal=(X=0.000000,Y=0.000000,Z=450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1310.354004,OutVal=(X=0.000000,Y=-0.878906,Z=362.812500),InterpMode=CIM_CurveAutoClamped),(InVal=1325.258057,OutVal=(X=0.000000,Y=10.546875,Z=367.910156),InterpMode=CIM_CurveAutoClamped),(InVal=1340.219971,OutVal=(X=0.000000,Y=0.000000,Z=337.500000),InterpMode=CIM_CurveAutoClamped),(InVal=1355.537964,OutVal=(X=0.000000,Y=0.000000,Z=337.500000),InterpMode=CIM_CurveAutoClamped),(InVal=1370.481201,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1385.223022,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1400.432739,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1414.943604,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1430.187866,OutVal=(X=0.000000,Y=0.000000,Z=360.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1440.058105,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1450.031372,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1460.285278,OutVal=(X=0.000000,Y=0.000000,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1470.126831,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1479.984863,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1489.557007,OutVal=(X=0.000000,Y=67.500000,Z=270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1499.870239,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1515.041992,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1524.880005,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1534.908447,OutVal=(X=0.000000,Y=-0.351563,Z=119.531250),InterpMode=CIM_CurveAutoClamped),(InVal=1555.095337,OutVal=(X=0.000000,Y=4.921875,Z=75.058594),ArriveTangent=(X=0.000000,Y=0.233443,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.233443,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1564.755127,OutVal=(X=0.000000,Y=6.855469,Z=80.156250),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.429592),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.429592),InterpMode=CIM_CurveAutoClamped),(InVal=1579.646240,OutVal=(X=0.000000,Y=-4.570313,Z=85.605469),InterpMode=CIM_CurveAutoClamped),(InVal=1593.626465,OutVal=(X=0.000000,Y=0.175781,Z=84.550781),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.183796),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.183796),InterpMode=CIM_CurveAutoClamped),(InVal=1608.391113,OutVal=(X=0.000000,Y=0.000000,Z=-45.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.457197),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.457197),InterpMode=CIM_CurveAutoClamped),(InVal=1623.475830,OutVal=(X=0.000000,Y=26.367188,Z=-70.839844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.262963),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.262963),InterpMode=CIM_CurveAutoClamped),(InVal=1644.021606,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.326220),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.326220),InterpMode=CIM_CurveAutoClamped),(InVal=1653.996582,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1664.302734,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1675.173340,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1699.577515,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1714.745239,OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.110631),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.110631),InterpMode=CIM_CurveAutoClamped),(InVal=1734.798218,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1755.034424,OutVal=(X=0.000000,Y=-1.757813,Z=-232.910156),InterpMode=CIM_CurveAutoClamped),(InVal=1765.060425,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1785.088501,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1794.740356,OutVal=(X=0.000000,Y=-3.339844,Z=-280.722656),InterpMode=CIM_CurveAutoClamped),(InVal=1815.197998,OutVal=(X=0.000000,Y=21.972656,Z=-191.953125),InterpMode=CIM_CurveAutoClamped),(InVal=1829.964111,OutVal=(X=0.000000,Y=-18.281250,Z=-325.898438),InterpMode=CIM_CurveAutoClamped),(InVal=1864.662964,OutVal=(X=0.000000,Y=-1.933594,Z=-281.953125),ArriveTangent=(X=0.000000,Y=0.255950,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.255950,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1875.041138,OutVal=(X=0.000000,Y=0.000000,Z=-405.000000),ArriveTangent=(X=0.000000,Y=0.434854,Z=-9.195809),LeaveTangent=(X=0.000000,Y=0.434854,Z=-9.195809),InterpMode=CIM_CurveAutoClamped),(InVal=1884.855957,OutVal=(X=-9.008789,Y=25.795898,Z=-467.644043),ArriveTangent=(X=0.000000,Y=1.069723,Z=-4.174963),LeaveTangent=(X=0.000000,Y=1.069723,Z=-4.174963),InterpMode=CIM_CurveAutoClamped),(InVal=1899.982300,OutVal=(X=-9.008789,Y=33.354492,Z=-509.128418),InterpMode=CIM_CurveAutoClamped),(InVal=1920.014160,OutVal=(X=-9.008789,Y=31.069336,Z=-475.905762),ArriveTangent=(X=0.000000,Y=-0.291472,Z=1.674978),LeaveTangent=(X=0.000000,Y=-0.291472,Z=1.674978),InterpMode=CIM_CurveAutoClamped),(InVal=1934.351929,OutVal=(X=-8.393555,Y=-1.801758,Z=-451.560059),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.579148),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.579148),InterpMode=CIM_CurveAutoClamped),(InVal=1949.954468,OutVal=(X=-8.393555,Y=-1.625977,Z=-396.364746),InterpMode=CIM_CurveAutoClamped),(InVal=1970.191528,OutVal=(X=-8.393555,Y=-1.801758,Z=-451.560059),InterpMode=CIM_CurveAutoClamped),(InVal=1979.783569,OutVal=(X=-8.393555,Y=-1.801758,Z=-451.560059),InterpMode=CIM_CurveAutoClamped),(InVal=1989.650879,OutVal=(X=0.000000,Y=4.350586,Z=-452.438965),InterpMode=CIM_CurveAutoClamped),(InVal=2009.992065,OutVal=(X=-8.393555,Y=2.065430,Z=-357.692871),ArriveTangent=(X=0.000000,Y=-0.108057,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.108057,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2029.912842,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.990735),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.990735),InterpMode=CIM_CurveAutoClamped),(InVal=2049.754395,OutVal=(X=0.000000,Y=1.933594,Z=-595.898438),InterpMode=CIM_CurveAutoClamped),(InVal=2064.998779,OutVal=(X=0.000000,Y=0.000000,Z=-450.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2074.772705,OutVal=(X=0.000000,Y=9.140625,Z=-618.398438),ArriveTangent=(X=0.000000,Y=0.683104,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.683104,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2085.070313,OutVal=(X=0.000000,Y=13.710938,Z=-553.886719),ArriveTangent=(X=0.000000,Y=0.769996,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.769996,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2094.636475,OutVal=(X=0.000000,Y=25.839844,Z=-587.812500),InterpMode=CIM_CurveAutoClamped),(InVal=2115.013184,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2144.781006,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2154.789795,OutVal=(X=0.000000,Y=0.000000,Z=-202.500000),InterpMode=CIM_CurveAutoClamped),(InVal=2169.571533,OutVal=(X=0.000000,Y=0.000000,Z=-202.500000),InterpMode=CIM_CurveAutoClamped),(InVal=2184.048340,OutVal=(X=0.000000,Y=0.000000,Z=-270.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=19.646139),(Time=34.940006),(Time=49.852493),(Time=69.497986),(Time=90.013893),(Time=110.122559),(Time=124.702423),(Time=144.702957),(Time=154.703094),(Time=165.077042),(Time=174.890305),(Time=185.077576),(Time=195.027588),(Time=209.867294),(Time=224.587845),(Time=239.875549),(Time=255.095840),(Time=270.095978),(Time=289.826904),(Time=304.761230),(Time=315.062012),(Time=330.128479),(Time=339.885986),(Time=369.920441),(Time=389.800079),(Time=404.968506),(Time=415.202209),(Time=425.150818),(Time=440.043884),(Time=447.506409),(Time=469.946747),(Time=480.368530),(Time=495.079010),(Time=510.541656),(Time=525.523926),(Time=540.617554),(Time=555.601196),(Time=575.069397),(Time=590.060425),(Time=604.898438),(Time=620.168518),(Time=635.317993),(Time=649.770813),(Time=665.090637),(Time=685.095398),(Time=694.943481),(Time=709.772949),(Time=725.406555),(Time=740.355042),(Time=755.277161),(Time=770.632568),(Time=785.003235),(Time=800.203613),(Time=819.925781),(Time=834.946960),(Time=849.687073),(Time=870.139893),(Time=879.670105),(Time=899.937744),(Time=920.089783),(Time=935.021973),(Time=949.819275),(Time=965.012329),(Time=980.303162),(Time=985.014465),(Time=995.118958),(Time=1015.249146),(Time=1030.192627),(Time=1040.038086),(Time=1054.927734),(Time=1069.941406),(Time=1084.861450),(Time=1100.234985),(Time=1124.893188),(Time=1135.067627),(Time=1144.924438),(Time=1154.952026),(Time=1169.515015),(Time=1174.755005),(Time=1185.445923),(Time=1194.896362),(Time=1204.942993),(Time=1210.144897),(Time=1229.981934),(Time=1239.950073),(Time=1250.083008),(Time=1264.802246),(Time=1280.104492),(Time=1294.855957),(Time=1310.354004),(Time=1325.258057),(Time=1340.219971),(Time=1355.537964),(Time=1370.481201),(Time=1385.223022),(Time=1400.432739),(Time=1414.943604),(Time=1430.187866),(Time=1440.058105),(Time=1450.031372),(Time=1460.285278),(Time=1470.126831),(Time=1479.984863),(Time=1489.557007),(Time=1499.870239),(Time=1515.041992),(Time=1524.880005),(Time=1534.908447),(Time=1555.095337),(Time=1564.755127),(Time=1579.646240),(Time=1593.626465),(Time=1608.391113),(Time=1623.475830),(Time=1644.021606),(Time=1653.996582),(Time=1664.302734),(Time=1675.173340),(Time=1699.577515),(Time=1714.745239),(Time=1734.798218),(Time=1755.034424),(Time=1765.060425),(Time=1785.088501),(Time=1794.740356),(Time=1815.197998),(Time=1829.964111),(Time=1864.662964),(Time=1875.041138),(Time=1884.855957),(Time=1899.982300),(Time=1920.014160),(Time=1934.351929),(Time=1949.954468),(Time=1970.191528),(Time=1979.783569),(Time=1989.650879),(Time=2009.992065),(Time=2029.912842),(Time=2049.754395),(Time=2064.998779),(Time=2074.772705),(Time=2085.070313),(Time=2094.636475),(Time=2115.013184),(Time=2144.781006),(Time=2154.789795),(Time=2169.571533),(Time=2184.048340)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_2'
      GroupName="Camera"
      GroupColor=(B=0,G=191,R=145,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=2185.342529
   InterpGroups(0)=InterpGroup'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2185.342529
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=-24
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   PlayRate=4.000000
   ConstantCameraAnimRate=3.700000
   InputLinks(0)=(DrawY=-242,OverrideDelta=15)
   InputLinks(1)=(DrawY=-220,OverrideDelta=37)
   InputLinks(2)=(DrawY=-198,OverrideDelta=59)
   InputLinks(3)=(DrawY=-176,OverrideDelta=81)
   InputLinks(4)=(DrawY=-154,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2')),DrawY=-226,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-170,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=148,OverrideDelta=29)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),LinkDesc="Camera",MinVars=0,DrawX=204,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=-280
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=138,OverrideDelta=11)
   OutputLinks(0)=(DrawY=138,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-24,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=104
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=CameraActor'KF-CARILLONHAMLET.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-24
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=2208
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=2077,OverrideDelta=14)
   InputLinks(1)=(DrawY=2098,OverrideDelta=35)
   InputLinks(2)=(DrawY=2119,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2098,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=286,OverrideDelta=16)
   VariableLinks(1)=(DrawX=337,OverrideDelta=76)
   EventLinks(0)=(DrawX=386,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=248
   ObjPosY=2040
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-40
   ObjPosY=1968
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=2069,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2090,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2111,OverrideDelta=56)
   VariableLinks(0)=(DrawX=74,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=2000
   ObjName="TriggerVolume_7 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=2496,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2517,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2538,OverrideDelta=56)
   VariableLinks(0)=(DrawX=76,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6
   ObjPosY=2427
   ObjName="TriggerVolume_2 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-38
   ObjPosY=2395
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=2504,OverrideDelta=14)
   InputLinks(1)=(DrawY=2525,OverrideDelta=35)
   InputLinks(2)=(DrawY=2546,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2525,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=280,OverrideDelta=16)
   VariableLinks(1)=(DrawX=331,OverrideDelta=76)
   EventLinks(0)=(DrawX=380,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=242
   ObjPosY=2467
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=234
   ObjPosY=2635
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=907
   ObjPosY=2207
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=2076,OverrideDelta=14)
   InputLinks(1)=(DrawY=2097,OverrideDelta=35)
   InputLinks(2)=(DrawY=2118,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2097,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=953,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1004,OverrideDelta=76)
   EventLinks(0)=(DrawX=1053,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=915
   ObjPosY=2039
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=635
   ObjPosY=1967
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=2068,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2089,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2110,OverrideDelta=56)
   VariableLinks(0)=(DrawX=749,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=667
   ObjPosY=1999
   ObjName="TriggerVolume_3 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=920
   ObjPosY=2648
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=2517,OverrideDelta=14)
   InputLinks(1)=(DrawY=2538,OverrideDelta=35)
   InputLinks(2)=(DrawY=2559,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2538,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=966,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1017,OverrideDelta=76)
   EventLinks(0)=(DrawX=1066,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=2480
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=2408
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=2509,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2530,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2551,OverrideDelta=56)
   VariableLinks(0)=(DrawX=762,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=680
   ObjPosY=2440
   ObjName="TriggerVolume_0 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=2917,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2938,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2959,OverrideDelta=56)
   VariableLinks(0)=(DrawX=738,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=656
   ObjPosY=2848
   ObjName="TriggerVolume_5 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=2816
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=2925,OverrideDelta=14)
   InputLinks(1)=(DrawY=2946,OverrideDelta=35)
   InputLinks(2)=(DrawY=2967,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2946,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=942,OverrideDelta=16)
   VariableLinks(1)=(DrawX=993,OverrideDelta=76)
   EventLinks(0)=(DrawX=1042,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=2888
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=3056
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=3032
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=2909,OverrideDelta=14)
   InputLinks(1)=(DrawY=2930,OverrideDelta=35)
   InputLinks(2)=(DrawY=2951,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2930,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=262,OverrideDelta=16)
   VariableLinks(1)=(DrawX=313,OverrideDelta=76)
   EventLinks(0)=(DrawX=362,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=2872
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_33
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=2800
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_33"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=2901,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2922,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2943,OverrideDelta=56)
   VariableLinks(0)=(DrawX=66,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-16
   ObjPosY=2832
   ObjName="TriggerVolume_8 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFSpawner'KF-CARILLONHAMLET.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-360
   ObjPosY=2200
   ObjComment="PARENT - floor spawner"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-CARILLONHAMLET.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=2053,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2074,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2095,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-538,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-624
   ObjPosY=1984
   ObjName="TriggerVolume_16 Touch"
   ObjComment="When a player touches this volume..."
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=561
   SizeY=324
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-656
   ObjPosY=1952
   ObjComment="Portal spawn: floor"
   DrawWidth=561
   DrawHeight=324
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=2061,OverrideDelta=14)
   InputLinks(1)=(DrawY=2082,OverrideDelta=35)
   InputLinks(2)=(DrawY=2103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=-330,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-279,OverrideDelta=76)
   EventLinks(0)=(DrawX=-230,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-CARILLONHAMLET.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-368
   ObjPosY=2024
   ObjComment="...activate this portal spawner."
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object
