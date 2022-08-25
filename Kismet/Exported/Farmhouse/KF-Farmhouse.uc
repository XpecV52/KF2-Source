Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-FARMHOUSE.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=293,OverrideDelta=14)
   OutputLinks(1)=(DrawY=314,OverrideDelta=35)
   OutputLinks(2)=(DrawY=335,OverrideDelta=56)
   VariableLinks(0)=(DrawX=210,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=128
   ObjPosY=224
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=341,OverrideDelta=14)
   InputLinks(1)=(DrawY=362,OverrideDelta=35)
   InputLinks(2)=(DrawY=383,OverrideDelta=56)
   OutputLinks(0)=(DrawY=362,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=414,OverrideDelta=16)
   VariableLinks(1)=(DrawX=465,OverrideDelta=76)
   EventLinks(0)=(DrawX=514,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=376
   ObjPosY=304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-FARMHOUSE.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=200
   ObjPosY=488
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-FARMHOUSE.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=496
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=516
   SizeY=396
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=96
   ObjPosY=192
   ObjComment="Upstairs Portal Spawns"
   DrawWidth=516
   DrawHeight=396
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-FARMHOUSE.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1064
   ObjPosY=560
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=429,OverrideDelta=14)
   InputLinks(1)=(DrawY=450,OverrideDelta=35)
   InputLinks(2)=(DrawY=471,OverrideDelta=56)
   OutputLinks(0)=(DrawY=450,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=1158,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1209,OverrideDelta=76)
   EventLinks(0)=(DrawX=1258,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-FARMHOUSE.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=442,OverrideDelta=35)
   OutputLinks(1)=(DrawY=463,OverrideDelta=56)
   OutputLinks(2)=(DrawY=421,OverrideDelta=14)
   VariableLinks(0)=(DrawX=914,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=352
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=513
   SizeY=348
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=328
   ObjComment="Base Floor Portals"
   DrawWidth=513
   DrawHeight=348
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-FARMHOUSE.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=888
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-FARMHOUSE.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=781,OverrideDelta=14)
   OutputLinks(1)=(DrawY=802,OverrideDelta=35)
   OutputLinks(2)=(DrawY=823,OverrideDelta=56)
   VariableLinks(0)=(DrawX=306,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=712
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=757,OverrideDelta=14)
   InputLinks(1)=(DrawY=778,OverrideDelta=35)
   InputLinks(2)=(DrawY=799,OverrideDelta=56)
   OutputLinks(0)=(DrawY=778,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=518,OverrideDelta=16)
   VariableLinks(1)=(DrawX=569,OverrideDelta=76)
   EventLinks(0)=(DrawX=618,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=480
   ObjPosY=720
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=496
   SizeY=318
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=192
   ObjPosY=680
   ObjComment="BasementPortals"
   DrawWidth=496
   DrawHeight=318
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-FARMHOUSE.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1176
   ObjPosY=584
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=KFSpawner'KF-FARMHOUSE.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=912
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=KFSpawner'KF-FARMHOUSE.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=496
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=805
   SizeY=572
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-176
   ObjPosY=1352
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=1434,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1434,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=528,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=1400
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=1762,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1762,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=80,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=1728
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=1506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-49,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-144
   ObjPosY=1440
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KF-FARMHOUSE.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=296
   ObjPosY=1584
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
      InterpTracks(0)=InterpTrackDirector'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=0.000977,Y=0.000488,Z=-0.000053),InterpMode=CIM_CurveAuto),(InVal=3.500000,OutVal=(X=1145.701904,Y=167.285400,Z=38.679100),ArriveTangent=(X=288.294861,Y=74.531609,Z=2.437608),LeaveTangent=(X=288.294861,Y=74.531609,Z=2.437608),InterpMode=CIM_CurveAuto),(InVal=7.000000,OutVal=(X=2018.064941,Y=521.721741,Z=17.063202),ArriveTangent=(X=281.786865,Y=110.422028,Z=-4.893787),LeaveTangent=(X=281.786865,Y=110.422028,Z=-4.893787),InterpMode=CIM_CurveAuto),(InVal=10.000000,OutVal=(X=2977.316406,Y=885.028564,Z=6.869484),ArriveTangent=(X=277.704529,Y=141.584000,Z=-6.186439),LeaveTangent=(X=277.704529,Y=141.584000,Z=-6.186439),InterpMode=CIM_CurveAuto),(InVal=13.500000,OutVal=(X=3823.144287,Y=1442.017700,Z=-23.148651),ArriveTangent=(X=220.045898,Y=85.703110,Z=4.473001),LeaveTangent=(X=220.045898,Y=85.703110,Z=4.473001),InterpMode=CIM_CurveAuto),(InVal=16.000000,OutVal=(X=4297.591797,Y=1399.247192,Z=33.707489),ArriveTangent=(X=154.918213,Y=-90.665794,Z=11.983993),LeaveTangent=(X=154.918213,Y=-90.665794,Z=11.983993),InterpMode=CIM_CurveAuto),(InVal=18.500000,OutVal=(X=4597.735352,Y=988.688721,Z=36.771309),ArriveTangent=(X=40.598999,Y=-160.405975,Z=-1.151098),LeaveTangent=(X=40.598999,Y=-160.405975,Z=-1.151098),InterpMode=CIM_CurveAuto),(InVal=20.000000,OutVal=(X=4459.987793,Y=757.623291,Z=29.103096),ArriveTangent=(X=-82.243553,Y=-187.262527,Z=3.616603),LeaveTangent=(X=-82.243553,Y=-187.262527,Z=3.616603),InterpMode=CIM_CurveAuto),(InVal=23.500000,OutVal=(X=4186.517578,Y=52.376099,Z=54.854324),ArriveTangent=(X=-0.101863,Y=-199.382462,Z=3.442549),LeaveTangent=(X=-0.101863,Y=-199.382462,Z=3.442549),InterpMode=CIM_CurveAuto),(InVal=26.500000,OutVal=(X=4459.325684,Y=-538.362671,Z=51.479660),ArriveTangent=(X=148.012299,Y=-194.058151,Z=-5.318853),LeaveTangent=(X=148.012299,Y=-194.058151,Z=-5.318853),InterpMode=CIM_CurveAuto),(InVal=29.500000,OutVal=(X=5074.591309,Y=-1111.972778,Z=22.941208),ArriveTangent=(X=101.780663,Y=-201.731689,Z=-3.022308),LeaveTangent=(X=101.780663,Y=-201.731689,Z=-3.022308),InterpMode=CIM_CurveAuto),(InVal=31.500000,OutVal=(X=4968.229004,Y=-1547.021118,Z=36.368118),ArriveTangent=(X=71.764435,Y=-195.336044,Z=18.120287),LeaveTangent=(X=71.764435,Y=-195.336044,Z=18.120287),InterpMode=CIM_CurveAuto),(InVal=34.000000,OutVal=(X=5397.531250,Y=-1990.984985,Z=104.482498),ArriveTangent=(X=128.137604,Y=-225.741776,Z=8.198047),LeaveTangent=(X=128.137604,Y=-225.741776,Z=8.198047),InterpMode=CIM_CurveAuto),(InVal=36.500000,OutVal=(X=5608.916992,Y=-2675.729980,Z=77.358353),ArriveTangent=(X=83.795982,Y=-308.916016,Z=-16.382231),LeaveTangent=(X=83.795982,Y=-308.916016,Z=-16.382231),InterpMode=CIM_CurveAuto),(InVal=40.000000,OutVal=(X=5900.307129,Y=-3844.480957,Z=6.189117),ArriveTangent=(X=236.851227,Y=-66.983505,Z=-6.978331),LeaveTangent=(X=236.851227,Y=-66.983505,Z=-6.978331),InterpMode=CIM_CurveUser),(InVal=44.000000,OutVal=(X=6488.753906,Y=-3220.973389,Z=18.042542),ArriveTangent=(X=173.848373,Y=194.089401,Z=-5.743834),LeaveTangent=(X=173.848373,Y=194.089401,Z=-5.743834),InterpMode=CIM_CurveAuto),(InVal=49.500000,OutVal=(X=7551.866699,Y=-2000.631592,Z=-48.377308),ArriveTangent=(X=170.436890,Y=243.761749,Z=-0.873149),LeaveTangent=(X=170.436890,Y=243.761749,Z=-0.873149),InterpMode=CIM_CurveAuto),(InVal=53.500000,OutVal=(X=8107.904297,Y=-905.236816,Z=9.747620),ArriveTangent=(X=232.802780,Y=264.151764,Z=11.794785),LeaveTangent=(X=232.802780,Y=264.151764,Z=11.794785),InterpMode=CIM_CurveAuto),(InVal=59.500000,OutVal=(X=9879.894531,Y=640.885986,Z=69.570534),ArriveTangent=(X=42.461311,Y=260.040588,Z=-3.183177),LeaveTangent=(X=42.461311,Y=260.040588,Z=-3.183177),InterpMode=CIM_CurveAuto),(InVal=64.000000,OutVal=(X=8553.748047,Y=1825.189209,Z=-23.675735),ArriveTangent=(X=-294.093842,Y=197.253845,Z=-6.172690),LeaveTangent=(X=-294.093842,Y=197.253845,Z=-6.172690),InterpMode=CIM_CurveAuto),(InVal=66.500000,OutVal=(X=7821.237793,Y=2021.662842,Z=26.361702),ArriveTangent=(X=-161.088699,Y=-170.212097,Z=5.236576),LeaveTangent=(X=-161.088699,Y=-170.212097,Z=5.236576),InterpMode=CIM_CurveAuto),(InVal=73.000000,OutVal=(X=7103.949707,Y=293.280396,Z=23.453445),ArriveTangent=(X=-99.719673,Y=-256.285187,Z=2.011018),LeaveTangent=(X=-99.719673,Y=-256.285187,Z=2.011018),InterpMode=CIM_CurveAuto),(InVal=75.500000,OutVal=(X=6923.760742,Y=-284.903809,Z=44.460861),ArriveTangent=(X=-114.108047,Y=-193.611816,Z=3.905669),LeaveTangent=(X=-114.108047,Y=-193.611816,Z=3.905669),InterpMode=CIM_CurveAuto),(InVal=78.500000,OutVal=(X=6476.355469,Y=-771.584595,Z=44.934624),ArriveTangent=(X=-119.069748,Y=-10.358358,Z=0.861275),LeaveTangent=(X=-119.069748,Y=-10.358358,Z=0.861275),InterpMode=CIM_CurveAuto),(InVal=81.500000,OutVal=(X=6209.342285,Y=-347.053955,Z=49.628510),ArriveTangent=(X=-106.104942,Y=-14.127197,Z=1.890465),LeaveTangent=(X=-106.104942,Y=-14.127197,Z=1.890465),InterpMode=CIM_CurveAuto),(InVal=84.000000,OutVal=(X=5892.778320,Y=-849.284180,Z=55.332184),ArriveTangent=(X=-172.861008,Y=-71.632484,Z=5.597141),LeaveTangent=(X=-172.861008,Y=-71.632484,Z=5.597141),InterpMode=CIM_CurveAuto),(InVal=86.000000,OutVal=(X=5431.467773,Y=-669.400146,Z=74.815643),ArriveTangent=(X=-220.138840,Y=173.703461,Z=-54.695457),LeaveTangent=(X=-220.138840,Y=173.703461,Z=-54.695457),InterpMode=CIM_CurveAuto),(InVal=90.000000,OutVal=(X=4571.945313,Y=192.936462,Z=-272.840546),ArriveTangent=(X=-178.446945,Y=136.437119,Z=-58.498512),LeaveTangent=(X=-178.446945,Y=136.437119,Z=-58.498512),InterpMode=CIM_CurveAuto),(InVal=92.000000,OutVal=(X=4360.786133,Y=149.222534,Z=-276.175415),ArriveTangent=(X=-14.145399,Y=-105.947548,Z=7.308987),LeaveTangent=(X=-14.145399,Y=-105.947548,Z=7.308987),InterpMode=CIM_CurveAuto),(InVal=94.500000,OutVal=(X=4508.291016,Y=-283.827515,Z=-239.950104),ArriveTangent=(X=126.462631,Y=-174.279144,Z=1.226440),LeaveTangent=(X=126.462631,Y=-174.279144,Z=1.226440),InterpMode=CIM_CurveAuto),(InVal=97.500000,OutVal=(X=5056.330566,Y=-809.312744,Z=-269.429993),ArriveTangent=(X=210.887482,Y=68.352074,Z=-1.496486),LeaveTangent=(X=210.887482,Y=68.352074,Z=-1.496486),InterpMode=CIM_CurveAuto),(InVal=101.000000,OutVal=(X=5879.059570,Y=160.460938,Z=-249.677261),ArriveTangent=(X=173.685822,Y=233.144455,Z=2.399004),LeaveTangent=(X=173.685822,Y=233.144455,Z=2.399004),InterpMode=CIM_CurveAuto),(InVal=103.000000,OutVal=(X=6011.602539,Y=472.981628,Z=-256.235474),ArriveTangent=(X=93.531006,Y=133.946213,Z=38.040977),LeaveTangent=(X=93.531006,Y=133.946213,Z=38.040977),InterpMode=CIM_CurveAuto),(InVal=105.000000,OutVal=(X=6253.183594,Y=696.245789,Z=-97.513351),ArriveTangent=(X=-60.639648,Y=162.878372,Z=34.290100),LeaveTangent=(X=-60.639648,Y=162.878372,Z=34.290100),InterpMode=CIM_CurveAuto),(InVal=109.000000,OutVal=(X=5647.764648,Y=1450.251831,Z=-50.494884),ArriveTangent=(X=-10.561899,Y=148.257645,Z=10.199203),LeaveTangent=(X=-10.561899,Y=148.257645,Z=10.199203),InterpMode=CIM_CurveAuto),(InVal=111.500000,OutVal=(X=6184.531250,Y=1659.920410,Z=-31.218529),ArriveTangent=(X=238.403625,Y=-82.557335,Z=9.456320),LeaveTangent=(X=238.403625,Y=-82.557335,Z=9.456320),InterpMode=CIM_CurveAuto),(InVal=115.500000,OutVal=(X=7197.388184,Y=913.629150,Z=10.971191),ArriveTangent=(X=132.357132,Y=-208.063538,Z=15.550243),LeaveTangent=(X=132.357132,Y=-208.063538,Z=15.550243),InterpMode=CIM_CurveAuto),(InVal=118.000000,OutVal=(X=7044.852539,Y=307.507446,Z=69.858047),ArriveTangent=(X=-89.179016,Y=-248.430679,Z=7.839987),LeaveTangent=(X=-89.179016,Y=-248.430679,Z=7.839987),InterpMode=CIM_CurveAuto),(InVal=122.000000,OutVal=(X=6617.724609,Y=-701.170166,Z=61.931107),ArriveTangent=(X=-170.370758,Y=-124.889389,Z=-5.258097),LeaveTangent=(X=-170.370758,Y=-124.889389,Z=-5.258097),InterpMode=CIM_CurveAuto),(InVal=125.000000,OutVal=(X=5852.257324,Y=-566.718262,Z=33.051369),ArriveTangent=(X=-206.226654,Y=83.472618,Z=46.078655),LeaveTangent=(X=-206.226654,Y=83.472618,Z=46.078655),InterpMode=CIM_CurveAuto),(InVal=128.000000,OutVal=(X=5380.364746,Y=-200.334473,Z=338.403015),ArriveTangent=(X=-127.026726,Y=146.789871,Z=63.479233),LeaveTangent=(X=-127.026726,Y=146.789871,Z=63.479233),InterpMode=CIM_CurveAuto),(InVal=130.500000,OutVal=(X=5153.610352,Y=240.625977,Z=382.187134),ArriveTangent=(X=-90.016815,Y=158.428040,Z=0.773756),LeaveTangent=(X=-90.016815,Y=158.428040,Z=0.773756),InterpMode=CIM_CurveAuto),(InVal=135.000000,OutVal=(X=4750.247070,Y=908.661743,Z=343.819305),ArriveTangent=(X=-103.269539,Y=65.789795,Z=-5.824067),LeaveTangent=(X=-103.269539,Y=65.789795,Z=-5.824067),InterpMode=CIM_CurveAuto),(InVal=137.500000,OutVal=(X=4430.723633,Y=701.154541,Z=341.418671),ArriveTangent=(X=-81.851402,Y=-116.586426,Z=1.537730),LeaveTangent=(X=-81.851402,Y=-116.586426,Z=1.537730),InterpMode=CIM_CurveAuto),(InVal=141.000000,OutVal=(X=4259.138672,Y=209.143188,Z=353.045685),ArriveTangent=(X=8.384033,Y=-150.339325,Z=6.569748),LeaveTangent=(X=8.384033,Y=-150.339325,Z=6.569748),InterpMode=CIM_CurveAuto),(InVal=143.500000,OutVal=(X=4481.027832,Y=-200.881348,Z=380.837158),ArriveTangent=(X=161.987030,Y=-149.326004,Z=-1.321019),LeaveTangent=(X=161.987030,Y=-149.326004,Z=-1.321019),InterpMode=CIM_CurveAuto),(InVal=148.000000,OutVal=(X=5393.047852,Y=-836.138794,Z=343.798553),ArriveTangent=(X=113.020447,Y=-138.606842,Z=-4.457881),LeaveTangent=(X=113.020447,Y=-138.606842,Z=-4.457881),InterpMode=CIM_CurveAuto),(InVal=150.500000,OutVal=(X=5272.170898,Y=-1171.129150,Z=349.631989),ArriveTangent=(X=-108.871498,Y=-133.724365,Z=0.443454),LeaveTangent=(X=-108.871498,Y=-133.724365,Z=0.443454),InterpMode=CIM_CurveUser),(InVal=153.000000,OutVal=(X=5013.720703,Y=-1502.422119,Z=346.237549),ArriveTangent=(X=15.892090,Y=-145.077194,Z=8.461054),LeaveTangent=(X=15.892090,Y=-145.077194,Z=8.461054),InterpMode=CIM_CurveAuto),(InVal=155.500000,OutVal=(X=5351.631348,Y=-1896.515137,Z=391.937256),ArriveTangent=(X=175.052444,Y=17.287266,Z=5.082730),LeaveTangent=(X=175.052444,Y=17.287266,Z=5.082730),InterpMode=CIM_CurveUser),(InVal=160.000000,OutVal=(X=6349.633301,Y=-1001.771240,Z=374.192566),ArriveTangent=(X=195.180054,Y=192.815155,Z=-3.601635),LeaveTangent=(X=195.180054,Y=192.815155,Z=-3.601635),InterpMode=CIM_CurveAuto),(InVal=163.500000,OutVal=(X=6913.071777,Y=-353.993896,Z=363.124176),ArriveTangent=(X=25.790283,Y=146.182236,Z=-3.763926),LeaveTangent=(X=25.790283,Y=146.182236,Z=-3.763926),InterpMode=CIM_CurveAuto),(InVal=166.000000,OutVal=(X=6504.375000,Y=-124.677856,Z=351.609009),ArriveTangent=(X=-190.665405,Y=87.543823,Z=-4.498735),LeaveTangent=(X=-190.665405,Y=87.543823,Z=-4.498735),InterpMode=CIM_CurveAuto),(InVal=169.000000,OutVal=(X=5864.412109,Y=127.497131,Z=338.381134),ArriveTangent=(X=-126.950821,Y=142.898758,Z=0.837841),LeaveTangent=(X=-126.950821,Y=142.898758,Z=0.837841),InterpMode=CIM_CurveAuto),(InVal=171.500000,OutVal=(X=5806.145508,Y=661.265320,Z=356.217133),ArriveTangent=(X=14.162327,Y=224.019470,Z=-7.227118),LeaveTangent=(X=14.162327,Y=224.019470,Z=-7.227118),InterpMode=CIM_CurveAuto),(InVal=173.500000,OutVal=(X=5928.142578,Y=1135.584717,Z=305.859100),ArriveTangent=(X=-60.130535,Y=257.399963,Z=-60.737728),LeaveTangent=(X=-60.130535,Y=257.399963,Z=-60.737728),InterpMode=CIM_CurveAuto),(InVal=177.500000,OutVal=(X=5445.362305,Y=2205.665039,Z=-8.209236),ArriveTangent=(X=-26.017189,Y=282.482269,Z=-40.527607),LeaveTangent=(X=-26.017189,Y=282.482269,Z=-40.527607),InterpMode=CIM_CurveAuto),(InVal=181.000000,OutVal=(X=5733.013672,Y=3254.201660,Z=1.902054),ArriveTangent=(X=127.348312,Y=323.073975,Z=6.972053),LeaveTangent=(X=127.348312,Y=323.073975,Z=6.972053),InterpMode=CIM_CurveAuto),(InVal=183.500000,OutVal=(X=6209.452148,Y=4144.108887,Z=33.623077),ArriveTangent=(X=-155.761597,Y=313.607513,Z=0.176250),LeaveTangent=(X=-155.761597,Y=313.607513,Z=0.176250),InterpMode=CIM_CurveAuto),(InVal=188.500000,OutVal=(X=4564.801758,Y=5606.257813,Z=3.223930),ArriveTangent=(X=-214.583115,Y=-40.055122,Z=-5.699315),LeaveTangent=(X=-214.583115,Y=-40.055122,Z=-5.699315),InterpMode=CIM_CurveUser),(InVal=196.000000,OutVal=(X=2715.660156,Y=3788.149902,Z=-20.520439),ArriveTangent=(X=-137.587357,Y=-235.007187,Z=-1.689686),LeaveTangent=(X=-137.587357,Y=-235.007187,Z=-1.689686),InterpMode=CIM_CurveAuto),(InVal=199.000000,OutVal=(X=3120.134521,Y=3138.682373,Z=-14.517776),ArriveTangent=(X=223.592850,Y=-90.486366,Z=0.367231),LeaveTangent=(X=223.592850,Y=-90.486366,Z=0.367231),InterpMode=CIM_CurveAuto),(InVal=202.500000,OutVal=(X=4169.013672,Y=3199.988525,Z=-18.133438),ArriveTangent=(X=210.143982,Y=146.340118,Z=7.071290),LeaveTangent=(X=210.143982,Y=146.340118,Z=7.071290),InterpMode=CIM_CurveAuto),(InVal=205.500000,OutVal=(X=4486.070313,Y=4089.893066,Z=31.445610),ArriveTangent=(X=79.210320,Y=269.983276,Z=8.288653),LeaveTangent=(X=79.210320,Y=269.983276,Z=8.288653),InterpMode=CIM_CurveAuto),(InVal=208.000000,OutVal=(X=4604.670410,Y=4684.896484,Z=27.454155),ArriveTangent=(X=110.496582,Y=-48.605633,Z=41.344204),LeaveTangent=(X=110.496582,Y=-48.605633,Z=41.344204),InterpMode=CIM_CurveAuto),(InVal=211.500000,OutVal=(X=5149.049805,Y=3798.259277,Z=279.510834),ArriveTangent=(X=-227.189697,Y=-237.577423,Z=43.608452),LeaveTangent=(X=-227.189697,Y=-237.577423,Z=43.608452),InterpMode=CIM_CurveUser),(InVal=215.500000,OutVal=(X=4228.618164,Y=4107.908203,Z=310.909088),ArriveTangent=(X=-270.066650,Y=-7.757708,Z=2.092791),LeaveTangent=(X=-270.066650,Y=-7.757708,Z=2.092791),InterpMode=CIM_CurveAuto),(InVal=218.500000,OutVal=(X=3258.583252,Y=3743.955322,Z=294.160370),ArriveTangent=(X=-42.815636,Y=-142.172729,Z=-40.334286),LeaveTangent=(X=-42.815636,Y=-142.172729,Z=-40.334286),InterpMode=CIM_CurveAuto),(InVal=221.500000,OutVal=(X=3971.724365,Y=3254.871826,Z=68.903389),ArriveTangent=(X=250.276520,Y=-59.762890,Z=-67.925087),LeaveTangent=(X=250.276520,Y=-59.762890,Z=-67.925087),InterpMode=CIM_CurveAuto),(InVal=223.500000,OutVal=(X=4509.965820,Y=3445.140869,Z=-45.465050),ArriveTangent=(X=232.085342,Y=-34.760147,Z=-21.698828),LeaveTangent=(X=232.085342,Y=-34.760147,Z=-21.698828),InterpMode=CIM_CurveAuto),(InVal=226.000000,OutVal=(X=5016.108398,Y=3098.451172,Z=-28.741333),ArriveTangent=(X=57.899220,Y=-241.634567,Z=4.694527),LeaveTangent=(X=57.899220,Y=-241.634567,Z=4.694527),InterpMode=CIM_CurveAuto),(InVal=228.500000,OutVal=(X=4799.461914,Y=2236.968018,Z=-21.992416),ArriveTangent=(X=-222.142212,Y=-217.279022,Z=5.510887),LeaveTangent=(X=-222.142212,Y=-217.279022,Z=5.510887),InterpMode=CIM_CurveAuto),(InVal=232.000000,OutVal=(X=3683.255127,Y=1794.777100,Z=4.323990),ArriveTangent=(X=-364.874634,Y=14.044890,Z=5.820522),LeaveTangent=(X=-364.874634,Y=14.044890,Z=5.820522),InterpMode=CIM_CurveAuto),(InVal=236.000000,OutVal=(X=2062.902344,Y=2342.304688,Z=21.661499),ArriveTangent=(X=-392.443024,Y=25.853956,Z=1.641920),LeaveTangent=(X=-392.443024,Y=25.853956,Z=1.641920),InterpMode=CIM_CurveAuto),(InVal=239.500000,OutVal=(X=739.932617,Y=1988.681763,Z=16.638390),ArriveTangent=(X=-206.145782,Y=-141.785873,Z=-0.802204),LeaveTangent=(X=-206.145782,Y=-141.785873,Z=-0.802204),InterpMode=CIM_CurveAuto),(InVal=242.500000,OutVal=(X=722.954834,Y=1420.696533,Z=16.447174),InterpMode=CIM_CurveAuto)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAuto),(InVal=3.500000,OutVal=(X=0.527344,Y=-0.087891,Z=15.974121),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.002651),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.002651),InterpMode=CIM_CurveAuto),(InVal=7.000000,OutVal=(X=0.000000,Y=0.000000,Z=14.018555),ArriveTangent=(X=-0.081130,Y=-0.098032,Z=3.644081),LeaveTangent=(X=-0.081130,Y=-0.098032,Z=3.644081),InterpMode=CIM_CurveAuto),(InVal=10.000000,OutVal=(X=0.000000,Y=-0.725098,Z=39.660645),ArriveTangent=(X=0.000000,Y=-0.148738,Z=-0.358323),LeaveTangent=(X=0.000000,Y=-0.148738,Z=-0.358323),InterpMode=CIM_CurveAuto),(InVal=13.500000,OutVal=(X=0.000000,Y=-0.966797,Z=11.689453),ArriveTangent=(X=-0.223389,Y=-0.205078,Z=-15.355225),LeaveTangent=(X=-0.223389,Y=-0.205078,Z=-15.355225),InterpMode=CIM_CurveAuto),(InVal=16.000000,OutVal=(X=-1.340332,Y=-1.955566,Z=-52.470703),ArriveTangent=(X=0.000000,Y=-0.329590,Z=-21.678223),LeaveTangent=(X=0.000000,Y=-0.329590,Z=-21.678223),InterpMode=CIM_CurveAuto),(InVal=18.500000,OutVal=(X=0.000000,Y=-2.614746,Z=-96.701660),ArriveTangent=(X=0.335083,Y=-0.390015,Z=-17.336426),LeaveTangent=(X=0.335083,Y=-0.390015,Z=-17.336426),InterpMode=CIM_CurveAuto),(InVal=20.000000,OutVal=(X=0.000000,Y=-3.515625,Z=-121.816406),ArriveTangent=(X=-0.386719,Y=0.180176,Z=4.390137),LeaveTangent=(X=-0.386719,Y=0.180176,Z=4.390137),InterpMode=CIM_CurveAuto),(InVal=23.500000,OutVal=(X=-1.933594,Y=-1.713867,Z=-74.750977),ArriveTangent=(X=0.000000,Y=-0.388747,Z=11.067458),LeaveTangent=(X=0.000000,Y=-0.388747,Z=11.067458),InterpMode=CIM_CurveAuto),(InVal=26.500000,OutVal=(X=0.000000,Y=-6.042480,Z=-49.877930),ArriveTangent=(X=0.322266,Y=0.377197,Z=-4.156494),LeaveTangent=(X=0.322266,Y=0.377197,Z=-4.156494),InterpMode=CIM_CurveAuto),(InVal=29.500000,OutVal=(X=0.000000,Y=0.549316,Z=-99.689941),ArriveTangent=(X=0.000000,Y=1.059082,Z=-1.393066),LeaveTangent=(X=0.000000,Y=1.059082,Z=-1.393066),InterpMode=CIM_CurveAuto),(InVal=31.500000,OutVal=(X=0.000000,Y=-0.747070,Z=-56.843262),ArriveTangent=(X=0.000000,Y=-0.371094,Z=9.897461),LeaveTangent=(X=0.000000,Y=-0.371094,Z=9.897461),InterpMode=CIM_CurveAuto),(InVal=34.000000,OutVal=(X=0.000000,Y=-1.120605,Z=-55.151367),ArriveTangent=(X=0.000000,Y=-0.870117,Z=-8.507813),LeaveTangent=(X=0.000000,Y=-0.870117,Z=-8.507813),InterpMode=CIM_CurveAuto),(InVal=36.500000,OutVal=(X=0.000000,Y=-5.097656,Z=-99.382324),ArriveTangent=(X=0.267334,Y=-0.230713,Z=20.533447),LeaveTangent=(X=0.267334,Y=-0.230713,Z=20.533447),InterpMode=CIM_CurveAuto),(InVal=40.000000,OutVal=(X=1.604004,Y=-2.504883,Z=68.049316),ArriveTangent=(X=0.000000,Y=0.082721,Z=23.849380),LeaveTangent=(X=0.000000,Y=0.082721,Z=23.849380),InterpMode=CIM_CurveUser),(InVal=44.000000,OutVal=(X=0.000000,Y=-4.394531,Z=103.337402),ArriveTangent=(X=-0.168843,Y=-0.233604,Z=0.272924),LeaveTangent=(X=-0.168843,Y=-0.233604,Z=0.272924),InterpMode=CIM_CurveAuto),(InVal=49.500000,OutVal=(X=0.000000,Y=-4.724121,Z=70.642090),ArriveTangent=(X=0.000000,Y=-0.462582,Z=-5.324322),LeaveTangent=(X=0.000000,Y=-0.462582,Z=-5.324322),InterpMode=CIM_CurveAuto),(InVal=53.500000,OutVal=(X=0.000000,Y=-8.789063,Z=52.756348),ArriveTangent=(X=0.030762,Y=-0.410889,Z=9.301025),LeaveTangent=(X=0.030762,Y=-0.410889,Z=9.301025),InterpMode=CIM_CurveAuto),(InVal=59.500000,OutVal=(X=0.307617,Y=-8.833008,Z=163.652344),ArriveTangent=(X=0.000000,Y=0.138114,Z=12.020089),LeaveTangent=(X=0.000000,Y=0.138114,Z=12.020089),InterpMode=CIM_CurveAuto),(InVal=64.000000,OutVal=(X=0.000000,Y=-7.338867,Z=178.967285),ArriveTangent=(X=-0.043945,Y=0.467704,Z=9.667969),LeaveTangent=(X=-0.043945,Y=0.467704,Z=9.667969),InterpMode=CIM_CurveAuto),(InVal=66.500000,OutVal=(X=0.000000,Y=-5.559082,Z=231.328125),ArriveTangent=(X=0.000000,Y=0.666504,Z=7.932129),LeaveTangent=(X=0.000000,Y=0.666504,Z=7.932129),InterpMode=CIM_CurveAuto),(InVal=73.000000,OutVal=(X=0.000000,Y=-1.340332,Z=250.356445),ArriveTangent=(X=0.000000,Y=0.676270,Z=1.345215),LeaveTangent=(X=0.000000,Y=0.676270,Z=1.345215),InterpMode=CIM_CurveAuto),(InVal=75.500000,OutVal=(X=0.000000,Y=0.527344,Z=243.435059),ArriveTangent=(X=0.043945,Y=-0.962802,Z=-15.876244),LeaveTangent=(X=0.043945,Y=-0.962802,Z=-15.876244),InterpMode=CIM_CurveAuto),(InVal=78.500000,OutVal=(X=0.241699,Y=-6.635742,Z=163.037109),ArriveTangent=(X=0.000000,Y=-1.021729,Z=-21.536865),LeaveTangent=(X=0.000000,Y=-1.021729,Z=-21.536865),InterpMode=CIM_CurveAuto),(InVal=81.500000,OutVal=(X=0.000000,Y=-5.603027,Z=114.213867),ArriveTangent=(X=-0.043945,Y=0.019975,Z=0.922852),LeaveTangent=(X=-0.043945,Y=0.019975,Z=0.922852),InterpMode=CIM_CurveAuto),(InVal=84.000000,OutVal=(X=0.000000,Y=-6.525879,Z=168.112793),ArriveTangent=(X=0.000000,Y=-1.259766,Z=4.462891),LeaveTangent=(X=0.000000,Y=-1.259766,Z=4.462891),InterpMode=CIM_CurveAuto),(InVal=86.000000,OutVal=(X=0.000000,Y=-11.271973,Z=134.296875),ArriveTangent=(X=0.000000,Y=-1.622314,Z=2.347412),LeaveTangent=(X=0.000000,Y=-1.622314,Z=2.347412),InterpMode=CIM_CurveAuto),(InVal=90.000000,OutVal=(X=0.000000,Y=-16.259766,Z=182.197266),ArriveTangent=(X=0.000000,Y=1.311035,Z=25.429688),LeaveTangent=(X=0.000000,Y=1.311035,Z=25.429688),InterpMode=CIM_CurveAuto),(InVal=92.000000,OutVal=(X=0.000000,Y=-3.405762,Z=286.875000),ArriveTangent=(X=0.000000,Y=2.675781,Z=31.103516),LeaveTangent=(X=0.000000,Y=2.675781,Z=31.103516),InterpMode=CIM_CurveAuto),(InVal=94.500000,OutVal=(X=0.000000,Y=-4.218750,Z=322.163086),ArriveTangent=(X=0.251687,Y=-0.319602,Z=26.211382),LeaveTangent=(X=0.251687,Y=-0.319602,Z=26.211382),InterpMode=CIM_CurveAuto),(InVal=97.500000,OutVal=(X=1.384277,Y=-5.163574,Z=431.037598),ArriveTangent=(X=0.000000,Y=-0.351563,Z=32.945465),LeaveTangent=(X=0.000000,Y=-0.351563,Z=32.945465),InterpMode=CIM_CurveAuto),(InVal=101.000000,OutVal=(X=0.000000,Y=-6.503906,Z=536.308594),ArriveTangent=(X=-0.251687,Y=2.600764,Z=-2.804510),LeaveTangent=(X=-0.251687,Y=2.600764,Z=-2.804510),InterpMode=CIM_CurveAuto),(InVal=103.000000,OutVal=(X=0.000000,Y=9.140625,Z=415.612793),ArriveTangent=(X=0.192261,Y=-0.203247,Z=-9.398804),LeaveTangent=(X=0.192261,Y=-0.203247,Z=-9.398804),InterpMode=CIM_CurveAuto),(InVal=105.000000,OutVal=(X=0.769043,Y=-7.316895,Z=498.713379),ArriveTangent=(X=0.000000,Y=-2.746582,Z=-2.944336),LeaveTangent=(X=0.000000,Y=-2.746582,Z=-2.944336),InterpMode=CIM_CurveAuto),(InVal=109.000000,OutVal=(X=0.000000,Y=-7.338867,Z=397.946777),ArriveTangent=(X=-0.118314,Y=-0.233248,Z=-24.521484),LeaveTangent=(X=-0.118314,Y=-0.233248,Z=-24.521484),InterpMode=CIM_CurveAuto),(InVal=111.500000,OutVal=(X=0.000000,Y=-8.833008,Z=339.323730),ArriveTangent=(X=0.000000,Y=-0.446214,Z=-17.750526),LeaveTangent=(X=0.000000,Y=-0.446214,Z=-17.750526),InterpMode=CIM_CurveAuto),(InVal=115.500000,OutVal=(X=0.000000,Y=-10.239258,Z=282.568359),ArriveTangent=(X=0.000000,Y=-0.331280,Z=-13.792068),LeaveTangent=(X=0.000000,Y=-0.331280,Z=-13.792068),InterpMode=CIM_CurveAuto),(InVal=118.000000,OutVal=(X=0.000000,Y=-10.986328,Z=249.675293),ArriveTangent=(X=0.000000,Y=-0.300856,Z=-13.156551),LeaveTangent=(X=0.000000,Y=-0.300856,Z=-13.156551),InterpMode=CIM_CurveAuto),(InVal=122.000000,OutVal=(X=0.000000,Y=-12.194824,Z=197.050781),ArriveTangent=(X=0.000000,Y=1.855120,Z=-15.390277),LeaveTangent=(X=0.000000,Y=1.855120,Z=-15.390277),InterpMode=CIM_CurveAuto),(InVal=125.000000,OutVal=(X=0.000000,Y=1.999512,Z=141.943359),ArriveTangent=(X=0.000000,Y=1.146240,Z=-9.770508),LeaveTangent=(X=0.000000,Y=1.146240,Z=-9.770508),InterpMode=CIM_CurveAuto),(InVal=128.000000,OutVal=(X=0.000000,Y=-5.317383,Z=138.427734),ArriveTangent=(X=0.000000,Y=-1.186523,Z=-4.833984),LeaveTangent=(X=0.000000,Y=-1.186523,Z=-4.833984),InterpMode=CIM_CurveAuto),(InVal=130.500000,OutVal=(X=0.000000,Y=-4.526367,Z=115.356445),ArriveTangent=(X=-0.373535,Y=0.056501,Z=19.668667),LeaveTangent=(X=-0.373535,Y=0.056501,Z=19.668667),InterpMode=CIM_CurveAuto),(InVal=135.000000,OutVal=(X=-2.614746,Y=-4.921875,Z=276.108398),ArriveTangent=(X=0.000000,Y=-0.558733,Z=18.529228),LeaveTangent=(X=0.000000,Y=-0.558733,Z=18.529228),InterpMode=CIM_CurveAuto),(InVal=137.500000,OutVal=(X=0.000000,Y=-8.437500,Z=245.061035),ArriveTangent=(X=0.435791,Y=0.596924,Z=2.882080),LeaveTangent=(X=0.435791,Y=0.596924,Z=2.882080),InterpMode=CIM_CurveAuto),(InVal=141.000000,OutVal=(X=0.000000,Y=-1.340332,Z=293.400879),ArriveTangent=(X=0.000000,Y=0.937500,Z=16.424561),LeaveTangent=(X=0.000000,Y=0.937500,Z=16.424561),InterpMode=CIM_CurveAuto),(InVal=143.500000,OutVal=(X=0.000000,Y=-2.812500,Z=343.608398),ArriveTangent=(X=0.000000,Y=-0.185198,Z=7.345145),LeaveTangent=(X=0.000000,Y=-0.185198,Z=7.345145),InterpMode=CIM_CurveAuto),(InVal=148.000000,OutVal=(X=0.000000,Y=-2.636719,Z=344.816895),ArriveTangent=(X=0.000000,Y=-0.935407,Z=-15.744978),LeaveTangent=(X=0.000000,Y=-0.935407,Z=-15.744978),InterpMode=CIM_CurveAuto),(InVal=150.500000,OutVal=(X=0.000000,Y=-9.360352,Z=233.393555),ArriveTangent=(X=-0.423473,Y=0.367543,Z=-7.227006),LeaveTangent=(X=-0.423473,Y=0.367543,Z=-7.227006),InterpMode=CIM_CurveUser),(InVal=153.000000,OutVal=(X=-2.329102,Y=-0.615234,Z=305.068359),ArriveTangent=(X=0.000000,Y=1.516113,Z=27.259277),LeaveTangent=(X=0.000000,Y=1.516113,Z=27.259277),InterpMode=CIM_CurveAuto),(InVal=155.500000,OutVal=(X=0.000000,Y=-1.779785,Z=369.689941),ArriveTangent=(X=0.423473,Y=-0.327592,Z=18.732689),LeaveTangent=(X=0.423473,Y=-0.327592,Z=18.732689),InterpMode=CIM_CurveUser),(InVal=160.000000,OutVal=(X=0.000000,Y=-2.416992,Z=408.098145),ArriveTangent=(X=0.000000,Y=-0.351563,Z=10.678711),LeaveTangent=(X=0.000000,Y=-0.351563,Z=10.678711),InterpMode=CIM_CurveAuto),(InVal=163.500000,OutVal=(X=0.000000,Y=-4.592285,Z=455.119629),ArriveTangent=(X=0.000000,Y=-0.648193,Z=24.067383),LeaveTangent=(X=0.000000,Y=-0.648193,Z=24.067383),InterpMode=CIM_CurveAuto),(InVal=166.000000,OutVal=(X=0.000000,Y=-6.306152,Z=552.502441),ArriveTangent=(X=0.071911,Y=-0.247692,Z=8.537376),LeaveTangent=(X=0.071911,Y=-0.247692,Z=8.537376),InterpMode=CIM_CurveAuto),(InVal=169.000000,OutVal=(X=0.395508,Y=-5.954590,Z=502.075195),ArriveTangent=(X=0.000000,Y=0.427468,Z=-21.321466),LeaveTangent=(X=0.000000,Y=0.427468,Z=-21.321466),InterpMode=CIM_CurveAuto),(InVal=171.500000,OutVal=(X=0.000000,Y=-3.955078,Z=435.234375),ArriveTangent=(X=-0.087891,Y=0.117188,Z=-4.975586),LeaveTangent=(X=-0.087891,Y=0.117188,Z=-4.975586),InterpMode=CIM_CurveAuto),(InVal=173.500000,OutVal=(X=0.000000,Y=-5.427246,Z=479.685059),ArriveTangent=(X=0.000000,Y=-0.904541,Z=6.738281),LeaveTangent=(X=0.000000,Y=-0.904541,Z=6.738281),InterpMode=CIM_CurveAuto),(InVal=177.500000,OutVal=(X=0.000000,Y=-9.382324,Z=475.664063),ArriveTangent=(X=0.000000,Y=-0.395508,Z=-4.593750),LeaveTangent=(X=0.000000,Y=-0.395508,Z=-4.593750),InterpMode=CIM_CurveAuto),(InVal=181.000000,OutVal=(X=0.000000,Y=-8.393555,Z=445.231934),ArriveTangent=(X=-0.161133,Y=0.871582,Z=11.059570),LeaveTangent=(X=-0.161133,Y=0.871582,Z=11.059570),InterpMode=CIM_CurveAuto),(InVal=183.500000,OutVal=(X=-0.966797,Y=-4.152832,Z=542.021484),ArriveTangent=(X=0.000000,Y=0.076172,Z=21.931643),LeaveTangent=(X=0.000000,Y=0.076172,Z=21.931643),InterpMode=CIM_CurveAuto),(InVal=188.500000,OutVal=(X=0.000000,Y=-7.822266,Z=609.719238),ArriveTangent=(X=0.101768,Y=0.626799,Z=12.024825),LeaveTangent=(X=0.101768,Y=0.626799,Z=12.024825),InterpMode=CIM_CurveUser),(InVal=196.000000,OutVal=(X=0.000000,Y=1.801758,Z=656.257324),ArriveTangent=(X=0.000000,Y=0.161133,Z=10.153460),LeaveTangent=(X=0.000000,Y=0.161133,Z=10.153460),InterpMode=CIM_CurveAuto),(InVal=199.000000,OutVal=(X=0.000000,Y=-6.130371,Z=716.330566),ArriveTangent=(X=0.000000,Y=-1.254132,Z=13.873198),LeaveTangent=(X=0.000000,Y=-1.254132,Z=13.873198),InterpMode=CIM_CurveAuto),(InVal=202.500000,OutVal=(X=0.000000,Y=-6.350098,Z=746.433105),ArriveTangent=(X=0.000000,Y=-0.358323,Z=12.882738),LeaveTangent=(X=0.000000,Y=-0.358323,Z=12.882738),InterpMode=CIM_CurveAuto),(InVal=205.500000,OutVal=(X=0.000000,Y=-8.459473,Z=800.068359),ArriveTangent=(X=0.000000,Y=-0.159801,Z=41.320580),LeaveTangent=(X=0.000000,Y=-0.159801,Z=41.320580),InterpMode=CIM_CurveAuto),(InVal=208.000000,OutVal=(X=0.000000,Y=-7.229004,Z=973.696289),ArriveTangent=(X=-0.194092,Y=0.000000,Z=17.475586),LeaveTangent=(X=-0.194092,Y=0.000000,Z=17.475586),InterpMode=CIM_CurveAuto),(InVal=211.500000,OutVal=(X=-1.164551,Y=-8.459473,Z=904.921875),ArriveTangent=(X=0.000000,Y=-0.101412,Z=-13.731220),LeaveTangent=(X=0.000000,Y=-0.101412,Z=-13.731220),InterpMode=CIM_CurveUser),(InVal=215.500000,OutVal=(X=0.000000,Y=-7.888184,Z=884.443359),ArriveTangent=(X=0.166364,Y=0.568150,Z=-27.399904),LeaveTangent=(X=0.166364,Y=0.568150,Z=-27.399904),InterpMode=CIM_CurveAuto),(InVal=218.500000,OutVal=(X=0.000000,Y=-4.482422,Z=713.122559),ArriveTangent=(X=0.000000,Y=0.563965,Z=-28.352051),LeaveTangent=(X=0.000000,Y=0.563965,Z=-28.352051),InterpMode=CIM_CurveAuto),(InVal=221.500000,OutVal=(X=0.000000,Y=-4.504395,Z=714.331055),ArriveTangent=(X=0.000000,Y=-0.109863,Z=-7.119141),LeaveTangent=(X=0.000000,Y=-0.109863,Z=-7.119141),InterpMode=CIM_CurveAuto),(InVal=223.500000,OutVal=(X=0.000000,Y=-5.031738,Z=677.526855),ArriveTangent=(X=-0.639648,Y=-0.576172,Z=-24.179688),LeaveTangent=(X=-0.639648,Y=-0.576172,Z=-24.179688),InterpMode=CIM_CurveAuto),(InVal=226.000000,OutVal=(X=-2.878418,Y=-7.097168,Z=605.522461),ArriveTangent=(X=0.000000,Y=-0.496582,Z=-22.091309),LeaveTangent=(X=0.000000,Y=-0.496582,Z=-22.091309),InterpMode=CIM_CurveAuto),(InVal=228.500000,OutVal=(X=0.000000,Y=-7.514648,Z=567.070313),ArriveTangent=(X=0.479736,Y=-0.106201,Z=-10.704346),LeaveTangent=(X=0.479736,Y=-0.106201,Z=-10.704346),InterpMode=CIM_CurveAuto),(InVal=232.000000,OutVal=(X=0.000000,Y=-7.734375,Z=541.296387),ArriveTangent=(X=-0.257813,Y=-0.032227,Z=-0.451172),LeaveTangent=(X=-0.257813,Y=-0.032227,Z=-0.451172),InterpMode=CIM_CurveAuto),(InVal=236.000000,OutVal=(X=-1.933594,Y=-7.756348,Z=563.686523),ArriveTangent=(X=0.000000,Y=0.574219,Z=20.065432),LeaveTangent=(X=0.000000,Y=0.574219,Z=20.065432),InterpMode=CIM_CurveAuto),(InVal=239.500000,OutVal=(X=0.000000,Y=-3.427734,Z=691.787109),ArriveTangent=(X=0.297476,Y=0.534105,Z=25.424055),LeaveTangent=(X=0.297476,Y=0.534105,Z=25.424055),InterpMode=CIM_CurveAuto),(InVal=242.500000,OutVal=(X=0.000000,Y=-4.284668,Z=728.942871),InterpMode=CIM_CurveAuto)))
         LookupTrack=(Points=(,(Time=3.500000),(Time=7.000000),(Time=10.000000),(Time=13.500000),(Time=16.000000),(Time=18.500000),(Time=20.000000),(Time=23.500000),(Time=26.500000),(Time=29.500000),(Time=31.500000),(Time=34.000000),(Time=36.500000),(Time=40.000000),(Time=44.000000),(Time=49.500000),(Time=53.500000),(Time=59.500000),(Time=64.000000),(Time=66.500000),(Time=73.000000),(Time=75.500000),(Time=78.500000),(Time=81.500000),(Time=84.000000),(Time=86.000000),(Time=90.000000),(Time=92.000000),(Time=94.500000),(Time=97.500000),(Time=101.000000),(Time=103.000000),(Time=105.000000),(Time=109.000000),(Time=111.500000),(Time=115.500000),(Time=118.000000),(Time=122.000000),(Time=125.000000),(Time=128.000000),(Time=130.500000),(Time=135.000000),(Time=137.500000),(Time=141.000000),(Time=143.500000),(Time=148.000000),(Time=150.500000),(Time=153.000000),(Time=155.500000),(Time=160.000000),(Time=163.500000),(Time=166.000000),(Time=169.000000),(Time=171.500000),(Time=173.500000),(Time=177.500000),(Time=181.000000),(Time=183.500000),(Time=188.500000),(Time=196.000000),(Time=199.000000),(Time=202.500000),(Time=205.500000),(Time=208.000000),(Time=211.500000),(Time=215.500000),(Time=218.500000),(Time=221.500000),(Time=223.500000),(Time=226.000000),(Time=228.500000),(Time=232.000000),(Time=236.000000),(Time=239.500000),(Time=242.500000)))
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
      InterpTracks(0)=InterpTrackMove'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="FlythroughCamera"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Tabs(0)=(ViewStartInput=-98.331886,ViewEndInput=417.701294,ViewStartOutput=2.694098,ViewEndOutput=6.216508)
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=242.500000
   InterpGroups(0)=InterpGroup'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=242.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=168
   ObjPosY=1592
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   InputLinks(0)=(DrawY=1422,OverrideDelta=15)
   InputLinks(1)=(DrawY=1444,OverrideDelta=37)
   InputLinks(2)=(DrawY=1466,OverrideDelta=59)
   InputLinks(3)=(DrawY=1488,OverrideDelta=81)
   InputLinks(4)=(DrawY=1510,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=1438,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1494,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=217,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="FlythroughCamera",MinVars=0,DrawX=284,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=184
   ObjPosY=1384
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=StaticMeshActor'KF-FARMHOUSE.TheWorld:PersistentLevel.StaticMeshActor_957'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3688
   ObjPosY=472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=646
   SizeY=355
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3272
   ObjPosY=240
   ObjComment="Zed_NoGo_01"
   DrawWidth=646
   DrawHeight=355
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=StaticMeshActor'KF-FARMHOUSE.TheWorld:PersistentLevel.StaticMeshActor_958'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=665
   SizeY=284
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3264
   ObjPosY=696
   ObjComment="Zed_NoGo_02"
   DrawWidth=665
   DrawHeight=284
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=StaticMeshActor'KF-FARMHOUSE.TheWorld:PersistentLevel.StaticMeshActor_954'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3720
   ObjPosY=1248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=673
   SizeY=284
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=1056
   ObjComment="Zed_NoGo_03"
   DrawWidth=673
   DrawHeight=284
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=StaticMeshActor'KF-FARMHOUSE.TheWorld:PersistentLevel.StaticMeshActor_956'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3726
   ObjPosY=1561
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=681
   SizeY=261
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=1392
   ObjComment="Zed_NoGo_04"
   DrawWidth=681
   DrawHeight=261
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=2373,OverrideDelta=14)
   InputLinks(1)=(DrawY=2394,OverrideDelta=35)
   InputLinks(2)=(DrawY=2415,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2394,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=2758,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2809,OverrideDelta=76)
   EventLinks(0)=(DrawX=2858,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2720
   ObjPosY=2336
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=2480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2768
   ObjPosY=2480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2600
   ObjPosY=2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2704
   ObjPosY=2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2800
   ObjPosY=2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2600
   ObjPosY=2624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2696
   ObjPosY=2624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2800
   ObjPosY=2624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=2789,OverrideDelta=14)
   InputLinks(1)=(DrawY=2810,OverrideDelta=35)
   InputLinks(2)=(DrawY=2831,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2810,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=2750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2801,OverrideDelta=76)
   EventLinks(0)=(DrawX=2850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2712
   ObjPosY=2752
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2568
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2768
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2864
   ObjPosY=2928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2568
   ObjPosY=3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2768
   ObjPosY=3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2864
   ObjPosY=3016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=2013,OverrideDelta=14)
   InputLinks(1)=(DrawY=2034,OverrideDelta=35)
   InputLinks(2)=(DrawY=2055,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2034,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=2750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2801,OverrideDelta=76)
   EventLinks(0)=(DrawX=2850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2712
   ObjPosY=1976
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=2128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2720
   ObjPosY=2128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=2128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=2208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2720
   ObjPosY=2208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2824
   ObjPosY=2208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=3221,OverrideDelta=14)
   InputLinks(1)=(DrawY=3242,OverrideDelta=35)
   InputLinks(2)=(DrawY=3263,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3242,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=2726,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2777,OverrideDelta=76)
   EventLinks(0)=(DrawX=2826,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2688
   ObjPosY=3184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2712
   ObjPosY=3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=3392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=3392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2688
   ObjPosY=3392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2792
   ObjPosY=3392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=3392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=2573,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2594,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7',InputLinkIdx=1)),DrawY=2615,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=744
   ObjPosY=2504
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=2536,OverrideDelta=25)
   InputLinks(1)=(DrawY=2580,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=2525,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),LinkDesc="Link 2",DrawY=2547,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),LinkDesc="Link 3",DrawY=2569,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),LinkDesc="Link 4",DrawY=2591,OverrideDelta=80)
   VariableLinks(0)=(DrawX=1140,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=2488
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=1941,OverrideDelta=14)
   InputLinks(1)=(DrawY=1962,OverrideDelta=35)
   InputLinks(2)=(DrawY=1983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),ActivateDelay=1.000000,DrawY=1962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70',SeqVar_Object'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=1822,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1873,OverrideDelta=76)
   EventLinks(0)=(DrawX=1922,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1784
   ObjPosY=1904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1664
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1864
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1960
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2064
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2160
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2264
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2360
   ObjPosY=2056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1336
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1632
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1736
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1936
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2136
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2432
   ObjPosY=2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1464
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1560
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1664
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1864
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1960
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2064
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2160
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2264
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=KFPlayerStart'KF-FARMHOUSE.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-FARMHOUSE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2360
   ObjPosY=2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
