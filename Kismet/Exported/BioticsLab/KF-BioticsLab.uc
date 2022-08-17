Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=1484
   SizeY=1299
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3536
   ObjPosY=744
   ObjComment="Wall Portal Entry Spawns"
   DrawWidth=1484
   DrawHeight=1299
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=1389
   SizeY=1626
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3512
   ObjPosY=-1120
   ObjComment="Floor Portal Entry Spawns"
   DrawWidth=1389
   DrawHeight=1626
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bLooping=True
   InputLinks(0)=(DrawY=1526,OverrideDelta=15)
   InputLinks(1)=(DrawY=1548,OverrideDelta=37)
   InputLinks(2)=(DrawY=1570,OverrideDelta=59)
   InputLinks(3)=(DrawY=1592,OverrideDelta=81)
   InputLinks(4)=(DrawY=1614,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1542,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1598,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=655,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="BrokenDoor_Left",MinVars=0,DrawX=719,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="BrokenDoor_Right",MinVars=0,DrawX=802,OverrideDelta=143)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=1488
   DrawWidth=230
   DrawHeight=173
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.490195,OutVal=(X=0.000977,Y=99.994141,Z=0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=4.001625,OutVal=(X=0.000977,Y=-0.005859,Z=0.000004),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.490195,InterpMode=CIM_CurveAutoClamped),(InVal=4.001625,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.490195),(Time=4.001625)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_2
         AkEvents(0)=(Event=AkEvent'WW_ENV_BioticsLab.ENV_Door_Broken_Elevator')
         Name="InterpTrackAkEvent_2"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2.InterpTrackAkEvent_2'
      GroupName="BrokenDoor_Right"
      GroupColor=(B=229,G=0,R=58,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.003249,OutVal=(X=-0.000977,Y=100.005859,Z=0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=4.001625,OutVal=(X=-0.000977,Y=0.005859,Z=0.000004),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.003249,InterpMode=CIM_CurveAutoClamped),(InVal=4.001625,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.003249),(Time=4.001625)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_1.InterpTrackMove_1'
      GroupName="BrokenDoor_Left"
      GroupColor=(B=214,G=0,R=105,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=5.994314
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_1'
   InterpGroups(1)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=1688
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=InterpActor'KF-BioticsLab.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=728
   ObjPosY=1696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=InterpActor'KF-BioticsLab.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=840
   ObjPosY=1696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(DrawY=1525,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1546,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1567,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=1456
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=572
   SizeY=364
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=360
   ObjPosY=1424
   ObjComment="Broken Elevator Doors"
   DrawWidth=572
   DrawHeight=364
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=CameraActor'KF-BioticsLab.TheWorld:PersistentLevel.CameraActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=1568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6'),(LinkedOp=SeqAct_ConsoleCommand'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=1458,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2095,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=1392
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=755
   SizeY=560
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1976
   ObjPosY=1360
   ObjComment="Benchmark"
   DrawWidth=755
   DrawHeight=560
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   InputLinks(0)=(DrawY=1414,OverrideDelta=15)
   InputLinks(1)=(DrawY=1436,OverrideDelta=37)
   InputLinks(2)=(DrawY=1458,OverrideDelta=59)
   InputLinks(3)=(DrawY=1480,OverrideDelta=81)
   InputLinks(4)=(DrawY=1502,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=1430,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1486,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=2271,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=2341,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2240
   ObjPosY=1376
   DrawWidth=156
   DrawHeight=173
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=0,G=203,R=126,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=667.828613,Y=-4897.532227,Z=632.612305),InterpMode=CIM_CurveAutoClamped),(InVal=7.992126,OutVal=(X=-10.871582,Y=-5576.238281,Z=650.650940),ArriveTangent=(X=-137.357574,Y=-54.175110,Z=0.000000),LeaveTangent=(X=-137.357574,Y=-54.175110,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.842524,OutVal=(X=-1371.271729,Y=-5803.566406,Z=517.863708),ArriveTangent=(X=-180.617569,Y=-63.298706,Z=0.000000),LeaveTangent=(X=-180.617569,Y=-63.298706,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.692919,OutVal=(X=-2485.475342,Y=-6725.445801,Z=545.964600),ArriveTangent=(X=-142.644440,Y=-123.735237,Z=9.506094),LeaveTangent=(X=-142.644440,Y=-123.735237,Z=9.506094),InterpMode=CIM_CurveAutoClamped),(InVal=26.716549,OutVal=(X=-3065.035400,Y=-7272.801758,Z=721.147949),ArriveTangent=(X=-84.671486,Y=-73.327225,Z=3.260695),LeaveTangent=(X=-84.671486,Y=-73.327225,Z=3.260695),InterpMode=CIM_CurveAutoClamped),(InVal=31.133945,OutVal=(X=-3313.892334,Y=-7476.408203,Z=727.406372),ArriveTangent=(X=-105.457191,Y=-91.871719,Z=3.450474),LeaveTangent=(X=-105.457191,Y=-91.871719,Z=3.450474),InterpMode=CIM_CurveAutoClamped),(InVal=35.362167,OutVal=(X=-4193.212891,Y=-8402.718750,Z=911.179688),ArriveTangent=(X=-184.730637,Y=0.000000,Z=45.052200),LeaveTangent=(X=-184.730637,Y=0.000000,Z=45.052200),InterpMode=CIM_CurveAutoClamped),(InVal=38.939442,OutVal=(X=-4755.806641,Y=-8061.978516,Z=1079.061157),ArriveTangent=(X=0.000000,Y=145.180435,Z=0.000000),LeaveTangent=(X=0.000000,Y=145.180435,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=44.172371,OutVal=(X=-4077.103760,Y=-6930.742676,Z=1057.463867),ArriveTangent=(X=0.000000,Y=167.459488,Z=0.000000),LeaveTangent=(X=0.000000,Y=167.459488,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=49.088165,OutVal=(X=-4636.704102,Y=-6362.478516,Z=1383.533081),ArriveTangent=(X=-150.742676,Y=0.000000,Z=10.823713),LeaveTangent=(X=-150.742676,Y=0.000000,Z=10.823713),InterpMode=CIM_CurveAutoClamped),(InVal=54.638252,OutVal=(X=-5654.758789,Y=-7154.266602,Z=1408.811401),ArriveTangent=(X=0.000000,Y=-208.550064,Z=0.000000),LeaveTangent=(X=0.000000,Y=-208.550064,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=59.395473,OutVal=(X=-4297.348633,Y=-8512.068359,Z=1394.088257),ArriveTangent=(X=0.000000,Y=-107.846062,Z=0.000000),LeaveTangent=(X=0.000000,Y=-107.846062,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=63.518394,OutVal=(X=-4523.583984,Y=-8738.308594,Z=1400.101196),ArriveTangent=(X=-87.815536,Y=0.000000,Z=0.000000),LeaveTangent=(X=-87.815536,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=68.592781,OutVal=(X=-5208.276367,Y=-8061.926758,Z=1087.528931),ArriveTangent=(X=-119.461868,Y=0.000000,Z=0.000000),LeaveTangent=(X=-119.461868,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=73.984314,OutVal=(X=-5773.862305,Y=-8174.979004,Z=1099.002319),ArriveTangent=(X=-135.856766,Y=-44.109367,Z=0.000000),LeaveTangent=(X=-135.856766,Y=-44.109367,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=80.168686,OutVal=(X=-6780.941406,Y=-9212.530273,Z=805.942139),ArriveTangent=(X=-148.644516,Y=-148.320114,Z=0.000000),LeaveTangent=(X=-148.644516,Y=-148.320114,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=84.678505,OutVal=(X=-7363.495117,Y=-9761.142578,Z=821.158447),ArriveTangent=(X=0.000000,Y=-103.519325,Z=0.000000),LeaveTangent=(X=0.000000,Y=-103.519325,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.550720,OutVal=(X=-6984.552734,Y=-10287.271484,Z=818.204834),ArriveTangent=(X=99.589417,Y=-124.097588,Z=0.000000),LeaveTangent=(X=99.589417,Y=-124.097588,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=98.075027,OutVal=(X=-5891.472656,Y=-11457.736328,Z=886.971069),ArriveTangent=(X=0.000000,Y=-156.439774,Z=18.057144),LeaveTangent=(X=0.000000,Y=-156.439774,Z=18.057144),InterpMode=CIM_CurveAutoClamped),(InVal=103.086082,OutVal=(X=-6680.299805,Y=-12248.300781,Z=1067.983154),ArriveTangent=(X=0.000000,Y=-46.612194,Z=0.000000),LeaveTangent=(X=0.000000,Y=-46.612194,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=108.329796,OutVal=(X=-6340.950195,Y=-12361.486328,Z=1062.522949),ArriveTangent=(X=72.811508,Y=0.000000,Z=0.000000),LeaveTangent=(X=72.811508,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=113.981537,OutVal=(X=-5886.985352,Y=-12134.660156,Z=1132.260498),ArriveTangent=(X=110.269836,Y=0.000000,Z=0.000000),LeaveTangent=(X=110.269836,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=117.575768,OutVal=(X=-5321.398438,Y=-12700.412109,Z=1126.125977),ArriveTangent=(X=0.000946,Y=-153.866974,Z=0.000000),LeaveTangent=(X=0.000946,Y=-153.866974,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=123.540588,OutVal=(X=-5321.396484,Y=-13605.482422,Z=1133.244019),ArriveTangent=(X=0.000862,Y=-155.192535,Z=0.000000),LeaveTangent=(X=0.000862,Y=-155.192535,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=128.511353,OutVal=(X=-4529.574219,Y=-14397.533203,Z=1124.655518),ArriveTangent=(X=164.075745,Y=0.000000,Z=0.000000),LeaveTangent=(X=164.075745,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=133.711563,OutVal=(X=-3652.586182,Y=-13908.675781,Z=1424.465576),ArriveTangent=(X=190.057709,Y=149.825943,Z=0.000000),LeaveTangent=(X=190.057709,Y=149.825943,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=138.988129,OutVal=(X=-2538.382080,Y=-12760.535156,Z=1394.585449),ArriveTangent=(X=157.744766,Y=173.262054,Z=-4.314535),LeaveTangent=(X=157.744766,Y=173.262054,Z=-4.314535),InterpMode=CIM_CurveAutoClamped),(InVal=144.647186,OutVal=(X=-1927.548828,Y=-12013.947266,Z=1377.283447),ArriveTangent=(X=96.715202,Y=130.854584,Z=-2.838953),LeaveTangent=(X=96.715202,Y=130.854584,Z=-2.838953),InterpMode=CIM_CurveAutoClamped),(InVal=150.917938,OutVal=(X=-1384.588135,Y=-11199.464844,Z=1360.717285),ArriveTangent=(X=116.929398,Y=0.000000,Z=-6.223410),LeaveTangent=(X=116.929398,Y=0.000000,Z=-6.223410),InterpMode=CIM_CurveAutoClamped),(InVal=156.278717,OutVal=(X=-567.480957,Y=-11568.529297,Z=1188.296021),ArriveTangent=(X=170.488831,Y=0.000000,Z=-32.785168),LeaveTangent=(X=170.488831,Y=0.000000,Z=-32.785168),InterpMode=CIM_CurveAutoClamped),(InVal=161.664505,OutVal=(X=447.581543,Y=-11456.802734,Z=1008.389282),ArriveTangent=(X=151.456345,Y=45.146751,Z=-8.325766),LeaveTangent=(X=151.456345,Y=45.146751,Z=-8.325766),InterpMode=CIM_CurveAutoClamped),(InVal=167.461914,OutVal=(X=1126.285156,Y=-10325.569336,Z=986.791992),ArriveTangent=(X=0.000000,Y=206.157166,Z=-0.195964),LeaveTangent=(X=0.000000,Y=206.157166,Z=-0.195964),InterpMode=CIM_CurveAutoClamped),(InVal=172.639786,OutVal=(X=673.815430,Y=-9194.169922,Z=986.361694),ArriveTangent=(X=-79.874138,Y=114.028397,Z=0.000000),LeaveTangent=(X=-79.874138,Y=114.028397,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=175.959076,OutVal=(X=447.581665,Y=-8967.872070,Z=988.815674),ArriveTangent=(X=-99.980568,Y=0.000000,Z=1.371960),LeaveTangent=(X=-99.980568,Y=0.000000,Z=1.371960),InterpMode=CIM_CurveAutoClamped),(InVal=180.163193,OutVal=(X=-118.003174,Y=-9307.193359,Z=1002.068604),ArriveTangent=(X=-117.452415,Y=-96.401314,Z=6.257113),LeaveTangent=(X=-117.452415,Y=-96.401314,Z=6.257113),InterpMode=CIM_CurveAutoClamped),(InVal=187.465164,OutVal=(X=-903.836182,Y=-10096.499023,Z=1343.047852),ArriveTangent=(X=-77.138878,Y=0.000000,Z=1.933516),LeaveTangent=(X=-77.138878,Y=0.000000,Z=1.933516),InterpMode=CIM_CurveAutoClamped),(InVal=194.236374,OutVal=(X=-1243.188721,Y=-9983.320313,Z=1348.508545),ArriveTangent=(X=-77.717033,Y=35.488152,Z=0.978862),LeaveTangent=(X=-77.717033,Y=35.488152,Z=0.978862),InterpMode=CIM_CurveAutoClamped),(InVal=200.564697,OutVal=(X=-1921.893066,Y=-9304.423828,Z=1355.870483),ArriveTangent=(X=-97.740715,Y=0.000000,Z=1.751479),LeaveTangent=(X=-97.740715,Y=0.000000,Z=1.751479),InterpMode=CIM_CurveAutoClamped),(InVal=206.966888,OutVal=(X=-2487.478271,Y=-9870.012695,Z=1370.902710),ArriveTangent=(X=-112.765907,Y=0.000000,Z=1.905458),LeaveTangent=(X=-112.765907,Y=0.000000,Z=1.905458),InterpMode=CIM_CurveAutoClamped),(InVal=213.605209,OutVal=(X=-3392.418213,Y=-8964.814453,Z=1380.718628),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.439453,Y=1.076660,Z=-135.000000),InterpMode=CIM_CurveAutoClamped),(InVal=7.992126,OutVal=(X=0.499878,Y=28.493042,Z=-134.412231),InterpMode=CIM_CurveAutoClamped),(InVal=14.842524,OutVal=(X=0.439453,Y=1.076660,Z=-135.000000),InterpMode=CIM_CurveAutoClamped),(InVal=21.692919,OutVal=(X=0.439453,Y=1.076660,Z=-135.000000),InterpMode=CIM_CurveAutoClamped),(InVal=26.716549,OutVal=(X=0.439453,Y=1.076660,Z=-135.000000),InterpMode=CIM_CurveAutoClamped),(InVal=31.133945,OutVal=(X=0.439453,Y=1.076660,Z=-135.000000),InterpMode=CIM_CurveAutoClamped),(InVal=35.362167,OutVal=(X=-1.076660,Y=0.439453,Z=-225.010986),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.029174),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.029174),InterpMode=CIM_CurveAutoClamped),(InVal=38.939442,OutVal=(X=-1.076660,Y=0.439453,Z=-225.054932),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.009976),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.009976),InterpMode=CIM_CurveAutoClamped),(InVal=44.172371,OutVal=(X=-1.076660,Y=0.439453,Z=-225.098877),InterpMode=CIM_CurveAutoClamped),(InVal=49.088165,OutVal=(X=0.439453,Y=1.076660,Z=-135.131836),InterpMode=CIM_CurveAutoClamped),(InVal=54.638252,OutVal=(X=0.439453,Y=1.076660,Z=-135.131836),InterpMode=CIM_CurveAutoClamped),(InVal=59.395473,OutVal=(X=0.439453,Y=1.076660,Z=-135.131836),InterpMode=CIM_CurveAutoClamped),(InVal=63.518394,OutVal=(X=-0.812988,Y=0.823975,Z=-197.083740),ArriveTangent=(X=-0.131930,Y=-0.081824,Z=-9.536847),LeaveTangent=(X=-0.131930,Y=-0.081824,Z=-9.536847),InterpMode=CIM_CurveAutoClamped),(InVal=68.592781,OutVal=(X=-1.142578,Y=0.324097,Z=-225.247192),InterpMode=CIM_CurveAutoClamped),(InVal=73.984314,OutVal=(X=0.368042,Y=0.922852,Z=-135.285645),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.119851),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.119851),InterpMode=CIM_CurveAutoClamped),(InVal=80.168686,OutVal=(X=0.285645,Y=0.922852,Z=-135.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.125960),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.125960),InterpMode=CIM_CurveAutoClamped),(InVal=84.678505,OutVal=(X=0.878906,Y=-0.593262,Z=-45.010986),ArriveTangent=(X=0.065594,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.065594,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=90.550720,OutVal=(X=1.076660,Y=-0.439453,Z=-45.032959),ArriveTangent=(X=0.000000,Y=0.053426,Z=-0.008665),LeaveTangent=(X=0.000000,Y=0.053426,Z=-0.008665),InterpMode=CIM_CurveAutoClamped),(InVal=98.075027,OutVal=(X=0.439453,Y=1.076660,Z=-135.043945),InterpMode=CIM_CurveAutoClamped),(InVal=103.086082,OutVal=(X=0.439453,Y=1.076660,Z=-135.043945),InterpMode=CIM_CurveAutoClamped),(InVal=108.329796,OutVal=(X=-0.439453,Y=-1.076660,Z=44.956055),InterpMode=CIM_CurveAutoClamped),(InVal=113.981537,OutVal=(X=1.076660,Y=-0.439453,Z=-45.054932),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.039710),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.039710),InterpMode=CIM_CurveAutoClamped),(InVal=117.575768,OutVal=(X=1.076660,Y=-0.439453,Z=-45.120850),InterpMode=CIM_CurveAutoClamped),(InVal=123.540588,OutVal=(X=-0.433960,Y=-1.098633,Z=44.846191),ArriveTangent=(X=-0.002602,Y=0.000000,Z=0.073022),LeaveTangent=(X=-0.002602,Y=0.000000,Z=0.073022),InterpMode=CIM_CurveAutoClamped),(InVal=128.511353,OutVal=(X=-0.439453,Y=-1.076660,Z=45.000000),InterpMode=CIM_CurveAutoClamped),(InVal=133.711563,OutVal=(X=-0.439453,Y=-1.076660,Z=45.000000),InterpMode=CIM_CurveAutoClamped),(InVal=138.988129,OutVal=(X=-0.439453,Y=-1.076660,Z=45.000000),InterpMode=CIM_CurveAutoClamped),(InVal=144.647186,OutVal=(X=-0.494385,Y=1.027222,Z=179.950562),InterpMode=CIM_CurveAutoClamped),(InVal=150.917938,OutVal=(X=-0.483398,Y=-1.120605,Z=44.956055),InterpMode=CIM_CurveAutoClamped),(InVal=156.278717,OutVal=(X=-1.005249,Y=-0.697632,Z=78.706055),InterpMode=CIM_CurveAutoClamped),(InVal=161.664505,OutVal=(X=-0.219727,Y=-1.142578,Z=33.706055),InterpMode=CIM_CurveAutoClamped),(InVal=167.461914,OutVal=(X=-1.109619,Y=-0.346069,Z=95.581055),ArriveTangent=(X=0.000000,Y=0.149650,Z=9.737291),LeaveTangent=(X=0.000000,Y=0.149650,Z=9.737291),InterpMode=CIM_CurveAutoClamped),(InVal=172.639786,OutVal=(X=-1.071167,Y=0.499878,Z=140.575562),ArriveTangent=(X=0.020429,Y=0.167436,Z=15.230844),LeaveTangent=(X=0.020429,Y=0.167436,Z=15.230844),InterpMode=CIM_CurveAutoClamped),(InVal=175.959076,OutVal=(X=0.351563,Y=1.076660,Z=225.000000),ArriveTangent=(X=0.284756,Y=0.000000,Z=17.202902),LeaveTangent=(X=0.284756,Y=0.000000,Z=17.202902),InterpMode=CIM_CurveAutoClamped),(InVal=180.163193,OutVal=(X=1.071167,Y=0.450439,Z=270.000000),ArriveTangent=(X=0.000000,Y=-0.016303,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.016303,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=187.465164,OutVal=(X=1.027222,Y=0.406494,Z=270.000000),ArriveTangent=(X=-0.015026,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.015026,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=194.236374,OutVal=(X=-1.076660,Y=0.439453,Z=134.967041),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.017012),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.017012),InterpMode=CIM_CurveAutoClamped),(InVal=200.564697,OutVal=(X=-1.076660,Y=0.439453,Z=134.923096),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.017301),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.017301),InterpMode=CIM_CurveAutoClamped),(InVal=206.966888,OutVal=(X=-0.439453,Y=-1.076660,Z=44.890137),InterpMode=CIM_CurveAutoClamped),(InVal=213.605209,OutVal=(X=-0.439453,Y=-1.076660,Z=44.890137),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=7.992126),(Time=14.842524),(Time=21.692919),(Time=26.716549),(Time=31.133945),(Time=35.362167),(Time=38.939442),(Time=44.172371),(Time=49.088165),(Time=54.638252),(Time=59.395473),(Time=63.518394),(Time=68.592781),(Time=73.984314),(Time=80.168686),(Time=84.678505),(Time=90.550720),(Time=98.075027),(Time=103.086082),(Time=108.329796),(Time=113.981537),(Time=117.575768),(Time=123.540588),(Time=128.511353),(Time=133.711563),(Time=138.988129),(Time=144.647186),(Time=150.917938),(Time=156.278717),(Time=161.664505),(Time=167.461914),(Time=172.639786),(Time=175.959076),(Time=180.163193),(Time=187.465164),(Time=194.236374),(Time=200.564697),(Time=206.966888),(Time=213.605209)))
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
      InterpTracks(0)=InterpTrackMove'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="NewCameraGroup"
      GroupColor=(B=51,G=0,R=229,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=215.099564
   InterpGroups(0)=InterpGroupDirector'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=9.988663
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=1584
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=1840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3608
   ObjPosY=-1048
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3608
   ObjPosY=-952
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3760
   ObjPosY=-1040
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3888
   ObjPosY=-1032
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3888
   ObjPosY=-944
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3968
   ObjPosY=-1024
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4008
   ObjPosY=-944
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4008
   ObjPosY=-848
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3888
   ObjPosY=-856
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4128
   ObjPosY=-1024
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3992
   ObjPosY=928
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4136
   ObjPosY=936
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3992
   ObjPosY=1016
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-987,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-966,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-945,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4362,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4280
   ObjPosY=-1056
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-1019,OverrideDelta=14)
   InputLinks(1)=(DrawY=-998,OverrideDelta=35)
   InputLinks(2)=(DrawY=-977,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-998,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=4542,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4593,OverrideDelta=76)
   EventLinks(0)=(DrawX=4642,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4504
   ObjPosY=-1056
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4512
   ObjPosY=-888
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-715,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-694,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-673,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4382,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4296
   ObjPosY=-784
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4512
   ObjPosY=-616
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-705,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=4558,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4609,OverrideDelta=76)
   EventLinks(0)=(DrawX=4658,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4520
   ObjPosY=-784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-427,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-406,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-385,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4410,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4328
   ObjPosY=-496
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=-320
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-417,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-438,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=4582,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4633,OverrideDelta=76)
   EventLinks(0)=(DrawX=4682,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4544
   ObjPosY=-496
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-131,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-110,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-89,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4434,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4352
   ObjPosY=-200
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-163,OverrideDelta=14)
   InputLinks(1)=(DrawY=-142,OverrideDelta=35)
   InputLinks(2)=(DrawY=-121,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-142,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=4582,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4633,OverrideDelta=76)
   EventLinks(0)=(DrawX=4682,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4544
   ObjPosY=-200
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4560
   ObjPosY=-40
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=197,OverrideDelta=14)
   OutputLinks(1)=(DrawY=218,OverrideDelta=35)
   OutputLinks(2)=(DrawY=239,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4418,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=128
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=165,OverrideDelta=14)
   InputLinks(1)=(DrawY=186,OverrideDelta=35)
   InputLinks(2)=(DrawY=207,OverrideDelta=56)
   OutputLinks(0)=(DrawY=186,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=4574,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4625,OverrideDelta=76)
   EventLinks(0)=(DrawX=4674,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=296
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=925,OverrideDelta=14)
   OutputLinks(1)=(DrawY=946,OverrideDelta=35)
   OutputLinks(2)=(DrawY=967,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4474,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4392
   ObjPosY=856
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=893,OverrideDelta=14)
   InputLinks(1)=(DrawY=914,OverrideDelta=35)
   InputLinks(2)=(DrawY=935,OverrideDelta=56)
   OutputLinks(0)=(DrawY=914,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=4630,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4681,OverrideDelta=76)
   EventLinks(0)=(DrawX=4730,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4592
   ObjPosY=856
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4600
   ObjPosY=1016
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(DrawY=1213,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1234,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1255,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4490,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4408
   ObjPosY=1144
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=1173,OverrideDelta=14)
   InputLinks(1)=(DrawY=1194,OverrideDelta=35)
   InputLinks(2)=(DrawY=1215,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1194,OverrideDelta=35)
   VariableLinks(0)=(DrawX=4646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4751,OverrideDelta=130)
   EventLinks(0)=(DrawX=4703,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4608
   ObjPosY=1136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4608
   ObjPosY=1288
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3600
   ObjPosY=-832
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=720
   SizeY=480
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=-1104
   ObjComment="Map Actor References"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3840
   ObjPosY=1096
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3832
   ObjPosY=936
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3840
   ObjPosY=1016
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3840
   ObjPosY=1184
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3664
   ObjPosY=936
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=664
   SizeY=440
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3600
   ObjPosY=864
   ObjComment="Map Actor References"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=1485,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1506,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1527,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4494,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4408
   ObjPosY=1416
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1429,OverrideDelta=14)
   InputLinks(1)=(DrawY=1450,OverrideDelta=35)
   InputLinks(2)=(DrawY=1471,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1450,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=4678,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4729,OverrideDelta=76)
   EventLinks(0)=(DrawX=4778,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=1392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=1576
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=1789,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1810,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1831,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4474,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4392
   ObjPosY=1720
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=1741,OverrideDelta=14)
   InputLinks(1)=(DrawY=1762,OverrideDelta=35)
   InputLinks(2)=(DrawY=1783,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1762,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=4678,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4729,OverrideDelta=76)
   EventLinks(0)=(DrawX=4778,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=1704
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4648
   ObjPosY=1848
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=1765,OverrideDelta=14)
   InputLinks(1)=(DrawY=1786,OverrideDelta=35)
   InputLinks(2)=(DrawY=1807,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1786,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=3966,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4017,OverrideDelta=76)
   EventLinks(0)=(DrawX=4066,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3928
   ObjPosY=1728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=1813,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1834,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1855,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3762,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3680
   ObjPosY=1744
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=1872
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=KFSpawner'KF-BioticsLab.TheWorld:PersistentLevel.KFSpawner_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4144
   ObjPosY=1184
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=637,OverrideDelta=14)
   OutputLinks(1)=(DrawY=658,OverrideDelta=35)
   OutputLinks(2)=(DrawY=679,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2072
   ObjPosY=568
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=630,OverrideDelta=15)
   InputLinks(1)=(DrawY=652,OverrideDelta=37)
   InputLinks(2)=(DrawY=674,OverrideDelta=59)
   InputLinks(3)=(DrawY=696,OverrideDelta=81)
   InputLinks(4)=(DrawY=718,OverrideDelta=103)
   OutputLinks(0)=(DrawY=646,OverrideDelta=31)
   OutputLinks(1)=(DrawY=702,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=2330,OverrideDelta=19)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Centrifuge",MinVars=0,DrawX=2396,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=592
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RotatingAnim",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackAnimControl_0'
      GroupName="Centrifuge"
      GroupColor=(B=151,G=186,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Centrifuge_Rotator_ANIM'
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Centrifuge_Rotator_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=792
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2408
   ObjPosY=792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=1418,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1418,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=2600,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=1384
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=1698,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1698,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=2096,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=1664
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=1013,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1034,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1055,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=486,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=944
   ObjName="TriggerVolume_12 Touch"
   DrawWidth=187
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-BioticsLab.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=717,OverrideDelta=14)
   OutputLinks(1)=(DrawY=738,OverrideDelta=35)
   OutputLinks(2)=(DrawY=759,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=486,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=648
   ObjName="TriggerVolume_13 Touch"
   DrawWidth=187
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=460
   SizeY=348
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=544
   ObjComment="Centrifuge rotator"
   DrawWidth=460
   DrawHeight=348
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_16
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-3282,OverrideDelta=23)
   InputLinks(1)=(DrawY=-3246,OverrideDelta=59)
   InputLinks(2)=(DrawY=-3210,OverrideDelta=95)
   InputLinks(3)=(DrawY=-3174,OverrideDelta=131)
   InputLinks(4)=(DrawY=-3138,OverrideDelta=167)
   OutputLinks(0)=(DrawY=-3290,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-3244,OverrideDelta=61)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),LinkDesc="spray_1",DrawY=-3267,OverrideDelta=38)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),LinkDesc="spray_2",DrawY=-3221,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19'),(LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1')),LinkDesc="shock_1_ON",DrawY=-3198,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_0')),LinkDesc="shock_1_OFF",DrawY=-3175,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_3'),(LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),LinkDesc="shock_2_ON",DrawY=-3152,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_2')),LinkDesc="shock_2_OFF",DrawY=-3129,OverrideDelta=176)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16'),DrawX=6935,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),LinkDesc="Track_1",MinVars=0,DrawX=6993,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),LinkDesc="Clot_Hook_1",MinVars=0,DrawX=7060,OverrideDelta=132)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61'),LinkDesc="Clot_Hook_2",MinVars=0,DrawX=7124,OverrideDelta=196)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),LinkDesc="Shocking_Station",MinVars=0,DrawX=7197,OverrideDelta=260)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),LinkDesc="Injection_Station",MinVars=0,DrawX=7280,OverrideDelta=343)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Track_1_Spray",MinVars=0,DrawX=7359,OverrideDelta=425)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_Shock_1",MinVars=0,DrawX=7434,OverrideDelta=502)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_Shock_2",MinVars=0,DrawX=7506,OverrideDelta=574)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6904
   ObjPosY=-3328
   DrawWidth=646
   DrawHeight=245
   Name="SeqAct_Interp_16"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_16
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_6
         AnimSeqs(0)=(StartTime=11.799921,AnimSeqName="Injection_Station",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=30.270376,AnimSeqName="Injection_Station",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_6"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_11
         AkEvents(0)=(Time=11.799921,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Needle_Arm')
         AkEvents(1)=(Time=30.270376,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Needle_Arm')
         TrackTitle="Ak_Needle_Arm"
         Name="InterpTrackAkEvent_11"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_6.InterpTrackAnimControl_6'
      InterpTracks(1)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_6.InterpTrackAkEvent_11'
      GroupName="Injection_Station"
      GroupColor=(B=0,G=203,R=126,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Injection_Station_ANIM'
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_5
         AnimSeqs(0)=(StartTime=5.289837,AnimSeqName="Shocking_Station",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=25.180023,AnimSeqName="Shocking_Station",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_5"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_25
         AkEvents(0)=(Time=5.289837,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Down')
         AkEvents(1)=(Time=7.670698,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Up')
         AkEvents(2)=(Time=25.180023,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Down')
         AkEvents(3)=(Time=27.614513,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Up')
         TrackTitle="Ak_Shock_Arm"
         Name="InterpTrackAkEvent_25"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_23
         AkEvents(0)=(Time=6.624694,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock')
         AkEvents(1)=(Time=26.545265,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock')
         TrackTitle="Ak_Shock"
         Name="InterpTrackAkEvent_23"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5.InterpTrackAnimControl_5'
      InterpTracks(1)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5.InterpTrackAkEvent_23'
      InterpTracks(2)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5.InterpTrackAkEvent_25'
      GroupName="Shocking_Station"
      GroupColor=(B=136,G=197,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Shocking_Station_ANIM'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_4
         AnimSeqs(0)=(AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=3.999803,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=5.290338,AnimSeqName="Shocking",AnimPlayRate=1.000000)
         AnimSeqs(3)=(StartTime=8.290697,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(4)=(StartTime=11.799658,AnimSeqName="Injection",AnimPlayRate=1.000000)
         AnimSeqs(5)=(StartTime=14.799820,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(6)=(StartTime=18.800312,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(7)=(StartTime=22.800005,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(8)=(StartTime=26.800478,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(9)=(StartTime=30.800777,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(10)=(StartTime=34.801231,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(11)=(StartTime=38.801441,AnimSeqName="Idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_4"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_4.InterpTrackAnimControl_4'
      GroupName="Clot_Hook_2"
      GroupColor=(B=214,G=0,R=105,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_1
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ZED_UndevelopedClot_MAT.ZED_UndevelopedClot_GORE_MAT',AffectedMaterialRefs=((Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_7.SkeletalMeshComponent_2'),(Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_8.SkeletalMeshComponent_2'),(Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_4.SkeletalMeshComponent_2'),(Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_1.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_2.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_3.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_4.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_0.SkeletalMeshComponent_0')))
         ParamName="Scalar_EMP"
         FloatTrack=(Points=((InVal=26.513489,InterpMode=CIM_CurveAutoClamped),(InVal=27.559015,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_1"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_3
         AnimSeqs(0)=(AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=4.000168,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=7.999798,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(3)=(StartTime=11.999965,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(4)=(StartTime=15.999664,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(5)=(StartTime=19.999989,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(6)=(StartTime=24.000454,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(7)=(StartTime=25.180300,AnimSeqName="Shocking",AnimPlayRate=1.000000)
         AnimSeqs(8)=(StartTime=28.180418,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(9)=(StartTime=30.269579,AnimSeqName="Injection",AnimPlayRate=1.000000)
         AnimSeqs(10)=(StartTime=33.270027,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(11)=(StartTime=37.270454,AnimSeqName="Idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_3"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3.InterpTrackAnimControl_3'
      InterpTracks(1)=InterpTrackFloatMaterialParam'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3.InterpTrackFloatMaterialParam_1'
      GroupName="Clot_Hook_1"
      GroupColor=(B=222,G=0,R=84,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM'
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_22
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_4
         EventTrack(0)=(Time=26.545265,EventName="shock_1_ON")
         EventTrack(1)=(Time=27.614513,EventName="shock_1_OFF")
         Name="InterpTrackEvent_4"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_22.InterpTrackEvent_4'
      GroupName="Clot_Shock_2"
      GroupColor=(B=126,G=203,R=0,A=255)
      Name="InterpGroup_22"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_21
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_3
         EventTrack(0)=(Time=6.624694,EventName="shock_2_ON")
         EventTrack(1)=(Time=7.670698,EventName="shock_2_OFF")
         Name="InterpTrackEvent_3"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_21.InterpTrackEvent_3'
      GroupName="Clot_Shock_1"
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroup_21"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_10
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=0.720581,EventName="Spray_1")
         EventTrack(1)=(Time=20.455196,EventName="Spray_2")
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_10.InterpTrackEvent_1'
      GroupName="Track_1_Spray"
      GroupColor=(B=0,G=213,R=105,A=255)
      Name="InterpGroup_10"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Track1_Anim",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Track_1"
      GroupColor=(B=70,G=0,R=225,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Track1_ANIM'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(ViewStartInput=2.788074,ViewEndInput=41.955105,ViewStartOutput=-0.564286,ViewEndOutput=1.435715)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=39.167049
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3'
   InterpGroups(2)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_4'
   InterpGroups(3)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5'
   InterpGroups(4)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_6'
   InterpGroups(5)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_10'
   InterpGroups(6)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_21'
   InterpGroups(7)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_22'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=39.167049
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Track1_ANIM")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Clot_ANIM")
   BakeAndPruneStatus(2)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM")
   BakeAndPruneStatus(3)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Shocking_Station_ANIM")
   BakeAndPruneStatus(4)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Injection_Station_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6864
   ObjPosY=-3040
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_16"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6952
   ObjPosY=-3032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7184
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7264
   ObjPosY=-3032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-3315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3273,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3294,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67'),DrawX=8070,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8121,OverrideDelta=76)
   EventLinks(0)=(DrawX=8170,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8032
   ObjPosY=-3352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-3267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3225,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67'),DrawX=8318,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8369,OverrideDelta=76)
   EventLinks(0)=(DrawX=8418,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8280
   ObjPosY=-3304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=1521
   SizeY=788
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6480
   ObjPosY=-3352
   ObjComment="Tank Track 1"
   DrawWidth=1521
   DrawHeight=788
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-2355,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2334,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2313,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2334,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=8206,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8257,OverrideDelta=76)
   EventLinks(0)=(DrawX=8306,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8168
   ObjPosY=-2392
   ObjComment="Toggle_spray_1"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-2459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2417,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2438,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=8414,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8465,OverrideDelta=76)
   EventLinks(0)=(DrawX=8514,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8376
   ObjPosY=-2496
   ObjComment="Toggle_spray_2"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-2571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2550,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2529,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=8614,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8665,OverrideDelta=76)
   EventLinks(0)=(DrawX=8714,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8576
   ObjPosY=-2608
   ObjComment="Toggle_spray_3"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_6
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16'),(LinkedOp=SeqAct_Interp'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17')),DrawY=-2851,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2830,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2809,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5880
   ObjPosY=-2920
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_6"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_17
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-2388,OverrideDelta=29)
   InputLinks(1)=(DrawY=-2337,OverrideDelta=80)
   InputLinks(2)=(DrawY=-2286,OverrideDelta=131)
   InputLinks(3)=(DrawY=-2235,OverrideDelta=182)
   InputLinks(4)=(DrawY=-2184,OverrideDelta=233)
   OutputLinks(0)=(DrawY=-2401,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-2332,OverrideDelta=85)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),LinkDesc="spray_1",DrawY=-2378,OverrideDelta=39)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),LinkDesc="spray_2",DrawY=-2355,OverrideDelta=62)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),LinkDesc="spray_3",DrawY=-2309,OverrideDelta=108)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_5'),(LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),LinkDesc="Clot_3_Shock_ON",DrawY=-2286,OverrideDelta=131)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_4')),LinkDesc="Clot_3_Shock_OFF",DrawY=-2263,OverrideDelta=154)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_6'),(LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),LinkDesc="Clot_1_Shock_ON",DrawY=-2240,OverrideDelta=177)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_7')),LinkDesc="Clot_1_Shock_OFF",DrawY=-2217,OverrideDelta=200)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_9'),(LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),LinkDesc="Clot_2_Shock_ON",DrawY=-2194,OverrideDelta=223)
   OutputLinks(10)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_8')),LinkDesc="Clot_2_Shock_OFF",DrawY=-2171,OverrideDelta=246)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17'),DrawX=6703,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),LinkDesc="Track_2",MinVars=0,DrawX=6761,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),LinkDesc="Track_2_Clot_1",MinVars=0,DrawX=6834,OverrideDelta=132)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),LinkDesc="Track_2_Clot_2",MinVars=0,DrawX=6911,OverrideDelta=209)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="Track_2_Clot_3",MinVars=0,DrawX=6988,OverrideDelta=286)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),LinkDesc="Track_2_Injection",MinVars=0,DrawX=7065,OverrideDelta=363)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),LinkDesc="Track_2_Shock",MinVars=0,DrawX=7142,OverrideDelta=440)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Track_2_Spray",MinVars=0,DrawX=7219,OverrideDelta=517)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_1_Shock",MinVars=0,DrawX=7291,OverrideDelta=594)
   VariableLinks(9)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_2_Shock",MinVars=0,DrawX=7357,OverrideDelta=660)
   VariableLinks(10)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_3_Shock",MinVars=0,DrawX=7423,OverrideDelta=726)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6672
   ObjPosY=-2440
   DrawWidth=792
   DrawHeight=317
   Name="SeqAct_Interp_17"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_17
   Begin Object Class=InterpGroup Name=InterpGroup_25
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_7
         EventTrack(0)=(Time=14.427267,EventName="Clot_3_Shock_ON")
         EventTrack(1)=(Time=15.584534,EventName="Clot_3_Shock_OFF")
         Name="InterpTrackEvent_7"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_25.InterpTrackEvent_7'
      GroupName="Clot_3_Shock"
      GroupColor=(B=206,G=0,R=123,A=255)
      Name="InterpGroup_25"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_24
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_6
         EventTrack(0)=(Time=40.555794,EventName="Clot_2_Shock_ON")
         EventTrack(1)=(Time=41.661629,EventName="Clot_2_Shock_OFF")
         Name="InterpTrackEvent_6"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_24.InterpTrackEvent_6'
      GroupName="Clot_2_Shock"
      GroupColor=(B=191,G=145,R=0,A=255)
      Name="InterpGroup_24"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_23
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_5
         EventTrack(0)=(Time=29.574610,EventName="Clot_1_Shock_ON")
         EventTrack(1)=(Time=30.783312,EventName="Clot_1_Shock_OFF")
         Name="InterpTrackEvent_5"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_23.InterpTrackEvent_5'
      GroupName="Clot_1_Shock"
      GroupColor=(B=182,G=0,R=157,A=255)
      Name="InterpGroup_23"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_17
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_2
         EventTrack(0)=(Time=4.952572,EventName="Spray_1")
         EventTrack(1)=(Time=19.713131,EventName="Spray_2")
         EventTrack(2)=(Time=31.521580,EventName="Spray_3")
         Name="InterpTrackEvent_2"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_17.InterpTrackEvent_2'
      GroupName="Track_2_Spray"
      GroupColor=(B=0,G=30,R=231,A=255)
      Name="InterpGroup_17"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_16
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_12
         AnimSeqs(0)=(StartTime=13.180027,AnimSeqName="Shocking_Station",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=28.400040,AnimSeqName="Shocking_Station",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=39.269688,AnimSeqName="Shocking_Station",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_12"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_21
         AkEvents(0)=(Time=13.180027,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Down')
         AkEvents(1)=(Time=15.584534,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Up')
         AkEvents(2)=(Time=28.400040,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Down')
         AkEvents(3)=(Time=30.783312,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Up')
         AkEvents(4)=(Time=39.269688,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Down')
         AkEvents(5)=(Time=41.661629,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock_Arm_Up')
         TrackTitle="Ak_Shock_Arms"
         Name="InterpTrackAkEvent_21"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_19
         AkEvents(0)=(Time=14.427267,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock')
         AkEvents(1)=(Time=29.574610,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock')
         AkEvents(2)=(Time=40.555794,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Shock')
         TrackTitle="Ak_Shock"
         Name="InterpTrackAkEvent_19"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16.InterpTrackAnimControl_12'
      InterpTracks(1)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16.InterpTrackAkEvent_19'
      InterpTracks(2)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16.InterpTrackAkEvent_21'
      GroupName="Track_2_Shock"
      GroupColor=(B=92,G=0,R=218,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Shocking_Station_ANIM'
      Name="InterpGroup_16"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_15
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_11
         AnimSeqs(0)=(StartTime=9.099836,AnimSeqName="Injection_Station",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=23.169613,AnimSeqName="Injection_Station",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=35.100002,AnimSeqName="Injection_Station",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_11"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_17
         AkEvents(0)=(Time=9.099836,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Needle_Arm')
         AkEvents(1)=(Time=23.169613,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Needle_Arm')
         AkEvents(2)=(Time=35.100002,Event=AkEvent'WW_ENV_BioticsLab.BioticsLab_MAT_Needle_Arm')
         TrackTitle="Ak_Needle_Arms"
         Name="InterpTrackAkEvent_17"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_15.InterpTrackAnimControl_11'
      InterpTracks(1)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_15.InterpTrackAkEvent_17'
      GroupName="Track_2_Injection"
      GroupColor=(B=186,G=151,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Injection_Station_ANIM'
      Name="InterpGroup_15"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_14
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_10
         AnimSeqs(0)=(AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=4.000406,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=8.000206,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(3)=(StartTime=9.099727,AnimSeqName="Injection",AnimPlayRate=1.000000)
         AnimSeqs(4)=(StartTime=12.100121,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(5)=(StartTime=13.179780,AnimSeqName="Shocking",AnimPlayRate=1.000000)
         AnimSeqs(6)=(StartTime=16.179865,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(7)=(StartTime=20.180422,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(8)=(StartTime=24.180614,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(9)=(StartTime=28.181057,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(10)=(StartTime=32.181622,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(11)=(StartTime=36.181957,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(12)=(StartTime=40.182365,AnimSeqName="Idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_10"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_14.InterpTrackAnimControl_10'
      GroupName="Track_2_Clot_3"
      GroupColor=(B=188,G=149,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM'
      Name="InterpGroup_14"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_13
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_9
         AnimSeqs(0)=(AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=4.000149,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=8.000115,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(3)=(StartTime=12.000270,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(4)=(StartTime=15.999757,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(5)=(StartTime=19.999899,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(6)=(StartTime=24.000414,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(7)=(StartTime=27.999725,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(8)=(StartTime=31.999743,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(9)=(StartTime=35.099529,AnimSeqName="Injection",AnimPlayRate=1.000000)
         AnimSeqs(10)=(StartTime=38.100117,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(11)=(StartTime=39.269932,AnimSeqName="Shocking",AnimPlayRate=1.000000)
         AnimSeqs(12)=(StartTime=42.270283,AnimSeqName="Idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_9"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_13.InterpTrackAnimControl_9'
      GroupName="Track_2_Clot_2"
      GroupColor=(B=229,G=0,R=58,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM'
      Name="InterpGroup_13"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_12
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_8
         AnimSeqs(0)=(AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=3.999643,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(2)=(StartTime=8.000217,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(3)=(StartTime=11.999575,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(4)=(StartTime=16.000195,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(5)=(StartTime=19.999830,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(6)=(StartTime=23.169559,AnimSeqName="Injection",AnimPlayRate=1.000000)
         AnimSeqs(7)=(StartTime=26.170004,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(8)=(StartTime=28.400400,AnimSeqName="Shocking",AnimPlayRate=1.000000)
         AnimSeqs(9)=(StartTime=31.400507,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(10)=(StartTime=35.400528,AnimSeqName="Idle",AnimPlayRate=1.000000)
         AnimSeqs(11)=(StartTime=39.400776,AnimSeqName="Idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_8"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_12.InterpTrackAnimControl_8'
      GroupName="Track_2_Clot_1"
      GroupColor=(B=0,G=217,R=95,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM'
      Name="InterpGroup_12"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_11
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_7
         AnimSeqs(0)=(AnimSeqName="Track2_Anim",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_7"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_11.InterpTrackAnimControl_7'
      GroupName="Track_2"
      GroupColor=(B=0,G=79,R=222,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Track2_ANIM'
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=43.333233
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_11'
   InterpGroups(1)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_12'
   InterpGroups(2)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_13'
   InterpGroups(3)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_14'
   InterpGroups(4)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_15'
   InterpGroups(5)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16'
   InterpGroups(6)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_17'
   InterpGroups(7)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_23'
   InterpGroups(8)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_24'
   InterpGroups(9)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_25'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=43.333233
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Track2_ANIM")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM")
   BakeAndPruneStatus(2)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Injection_Station_ANIM")
   BakeAndPruneStatus(3)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Shocking_Station_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6624
   ObjPosY=-2080
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_17"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6712
   ObjPosY=-2072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7024
   ObjPosY=-2064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7112
   ObjPosY=-2080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=1673
   SizeY=836
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6320
   ObjPosY=-2464
   ObjComment="Tank Track 2"
   DrawWidth=1673
   DrawHeight=836
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-3150,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3150,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=7853,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7808
   ObjPosY=-3184
   ObjComment="shock_1_on"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-3062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=7845,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7800
   ObjPosY=-3096
   ObjComment="shock_1_off"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-2862,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2862,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=7893,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7848
   ObjPosY=-2896
   ObjComment="shock_2_on"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_3"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-2774,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2774,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=7885,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7840
   ObjPosY=-2808
   ObjComment="shock_2_off"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_2"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_6
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-2198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=7813,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7768
   ObjPosY=-2232
   ObjComment="Clot_Shock_1_ON"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_6"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_7
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),DrawX=7909,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7864
   ObjPosY=-2160
   ObjComment="Clot_Shock_1_Off"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_7"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-1862,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1862,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=7893,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7848
   ObjPosY=-1896
   ObjComment="Clot_Shock_2_OFF"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_8"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-1934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1934,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=7789,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7744
   ObjPosY=-1968
   ObjComment="Clot_Shock_2_On"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_9"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-1694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=7797,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7752
   ObjPosY=-1728
   ObjComment="Clot_Shock_3_ON"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_5"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-1686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=7925,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7880
   ObjPosY=-1720
   ObjComment="Clot_Shock_3_OFF"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_4"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-2771,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2750,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2729,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2750,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=7406,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7457,OverrideDelta=76)
   EventLinks(0)=(DrawX=7506,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7368
   ObjPosY=-2808
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-1755,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1734,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1713,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1734,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=7462,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7513,OverrideDelta=76)
   EventLinks(0)=(DrawX=7562,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7424
   ObjPosY=-1792
   ObjComment="Toggle_Shock"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2560
   ObjPosY=-3608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_6
         AnimSeqs(0)=(AnimSeqName="Cell_Cyst_Door_Pound",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_6"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_5
         Name="InterpTrackAkEvent_5"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_6.InterpTrackAnimControl_6'
      InterpTracks(1)=InterpTrackAkEvent'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_6.InterpTrackAkEvent_5'
      GroupName="Cyst_c101"
      GroupColor=(B=0,G=189,R=147,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM'
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=25.000151
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=25.000151
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=-3584
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-3762,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3740,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3718,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3696,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3674,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3746,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3690,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=2481,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Cyst_c101",MinVars=0,DrawX=2548,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=-3800
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_12
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_7
         AnimSeqs(0)=(AnimSeqName="Cell_Cyst_Feed",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_7"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_7.InterpTrackAnimControl_7'
      GroupName="Cyst_c102"
      GroupColor=(B=202,G=128,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM'
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=33.800076
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_7'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=33.800076
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-3304
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-3474,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3452,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3430,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3408,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3386,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3458,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3402,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=2497,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Cyst_c102",MinVars=0,DrawX=2564,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-3512
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-3304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_10
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_5
         AnimSeqs(0)=(AnimSeqName="Cell_Cyst_idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_5"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_5.InterpTrackAnimControl_5'
      GroupName="Cyst_c103"
      GroupColor=(B=0,G=58,R=228,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=16.649635
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_5'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=16.649635
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=-2984
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-2992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-3178,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3156,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3134,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3112,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3090,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3162,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3106,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=2497,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Cyst_c103",MinVars=0,DrawX=2564,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-3216
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_4
         AnimSeqs(0)=(AnimSeqName="Cell_Alpha_Feed",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_4"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_4.InterpTrackAnimControl_4'
      GroupName="Alpha_c104"
      GroupColor=(B=171,G=169,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=15.899997
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.899997
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-2810,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2788,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2766,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2744,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2722,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2794,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2738,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=2479,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Alpha_c104",MinVars=0,DrawX=2549,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=-2848
   DrawWidth=155
   DrawHeight=157
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Cell_Alpha_Pound",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackAnimControl_1'
      GroupName="Alpha_c05"
      GroupColor=(B=112,G=0,R=210,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM'
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=24.000772
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=24.000772
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2560
   ObjPosY=-2320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-2482,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2460,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2438,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2416,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2394,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2466,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2410,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=2498,OverrideDelta=19)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Alpha_c05",MinVars=0,DrawX=2564,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-2520
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_3
         AnimSeqs(0)=(AnimSeqName="Cell_Alpha_Quad",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_3"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackAnimControl_3'
      GroupName="Alpha_c106"
      GroupColor=(B=198,G=0,R=136,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM'
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=12.000796
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=12.000796
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-1992
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2560
   ObjPosY=-1992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-2162,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2140,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2118,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2096,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2074,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2146,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2090,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=2495,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Alpha_c106",MinVars=0,DrawX=2565,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-2200
   DrawWidth=155
   DrawHeight=157
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_13
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Cell_Slasher_Lay",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Slasher_c107"
      GroupColor=(B=147,G=189,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=22.400436
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=22.400436
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-1680
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_13"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=-1680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-1842,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1820,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1798,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1776,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1754,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1826,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1770,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_13'),DrawX=2495,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Slasher_c107",MinVars=0,DrawX=2571,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-1880
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_14
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Cell_Slasher_Door",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1.InterpTrackAnimControl_1'
      GroupName="Slasher_c108"
      GroupColor=(B=126,G=203,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM'
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=18.400118
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=18.400118
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-1352
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-1344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_15
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="Cell_Slasher_Feed",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_2.InterpTrackAnimControl_2'
      GroupName="Slasher_c109"
      GroupColor=(B=0,G=149,R=188,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM'
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=23.650366
   InterpGroups(0)=InterpGroup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=23.650366
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=-1048
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_15"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=SkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.SkeletalMeshActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=-1048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-1530,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1508,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1486,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1464,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1442,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1514,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1458,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=2495,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Slasher_c108",MinVars=0,DrawX=2571,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-1568
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_13
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=-1218,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1196,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1174,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1152,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1130,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1202,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1146,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.InterpData_15'),DrawX=2487,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Slasher_c109",MinVars=0,DrawX=2563,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-1256
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_13"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=-2451,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2430,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2409,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-2520
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=1216
   SizeY=2768
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1768
   ObjPosY=-3792
   ObjComment="Containment Cells"
   DrawWidth=1216
   DrawHeight=2768
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7016
   ObjPosY=-2984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7840
   ObjPosY=-2992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7104
   ObjPosY=-2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7896
   ObjPosY=-2720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFEmitter'KF-BioticsLab.TheWorld:PersistentLevel.KFEmitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7384
   ObjPosY=-2648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFEmitter'KF-BioticsLab.TheWorld:PersistentLevel.KFEmitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8144
   ObjPosY=-3128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=KFEmitter'KF-BioticsLab.TheWorld:PersistentLevel.KFEmitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8240
   ObjPosY=-3128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=KFEmitter'KF-BioticsLab.TheWorld:PersistentLevel.KFEmitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8392
   ObjPosY=-2184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=KFEmitter'KF-BioticsLab.TheWorld:PersistentLevel.KFEmitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8504
   ObjPosY=-2176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6944
   ObjPosY=-2048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7832
   ObjPosY=-1608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7816
   ObjPosY=-1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7832
   ObjPosY=-2080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6872
   ObjPosY=-2048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=KFSkeletalMeshActor'KF-BioticsLab.TheWorld:PersistentLevel.KFSkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6792
   ObjPosY=-2064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=KFEmitter'KF-BioticsLab.TheWorld:PersistentLevel.KFEmitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7424
   ObjPosY=-1632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=433
   SizeY=276
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4376
   ObjPosY=1104
   ObjComment="Disabled"
   DrawWidth=433
   DrawHeight=276
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="MetalDetectorRightActivated"
   InputLinks(0)=(DrawY=714,OverrideDelta=11)
   OutputLinks(0)=(DrawY=714,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=776,OverrideDelta=152)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=680
   DrawWidth=369
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="MetalDetectorLeftActivated"
   InputLinks(0)=(DrawY=1018,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1018,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=789,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=984
   DrawWidth=362
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=686
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=912
   ObjComment="Metal Detector Alarm - Left"
   DrawWidth=686
   DrawHeight=236
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=677
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=616
   ObjComment="Metal Detector Alarm - Right"
   DrawWidth=677
   DrawHeight=236
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-747,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-726,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-705,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5632
   ObjPosY=-816
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-633,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-654,OverrideDelta=35)
   VariableLinks(0)=(DrawX=5918,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5969,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_0'),DrawX=6018,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5880
   ObjPosY=-712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_10
   SizeX=680
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6064
   ObjPosY=-232
   ObjComment="Initial Spawns"
   Name="SequenceFrameWrapped_10"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=688
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6496
   ObjPosY=-440
   ObjComment="Lobby Spawn Points"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-571,OverrideDelta=14)
   InputLinks(1)=(DrawY=-550,ActivateDelay=20.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=-529,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-550,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=6278,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6329,OverrideDelta=76)
   EventLinks(0)=(DrawX=6378,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6240
   ObjPosY=-608
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_0
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1)),DrawY=-438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5888,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5958,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5840
   ObjPosY=-504
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_0"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-627,OverrideDelta=14)
   InputLinks(1)=(DrawY=-606,OverrideDelta=35)
   InputLinks(2)=(DrawY=-585,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-606,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96'),DrawX=6774,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6825,OverrideDelta=76)
   EventLinks(0)=(DrawX=6874,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6736
   ObjPosY=-664
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6216
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6312
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6416
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6512
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6264
   ObjPosY=-120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6360
   ObjPosY=-120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6464
   ObjPosY=-120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6560
   ObjPosY=-120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6536
   ObjPosY=-400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6632
   ObjPosY=-400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6736
   ObjPosY=-400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6832
   ObjPosY=-400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6576
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6672
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6776
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=KFPlayerStart'KF-BioticsLab.TheWorld:PersistentLevel.KFPlayerStart_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6872
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFVersusNoGoVolume'KF-BioticsLab.TheWorld:PersistentLevel.KFVersusNoGoVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4584
   ObjPosY=-3616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=124
   SizeY=124
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=-3640
   ObjComment="Zed_NoGo_01"
   DrawWidth=124
   DrawHeight=124
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object
