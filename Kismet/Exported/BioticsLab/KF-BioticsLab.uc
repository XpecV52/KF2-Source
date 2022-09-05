Begin Object Class=SequenceFrame Name=SequenceFrame_37
   SizeX=319
   SizeY=696
   BorderWidth=5
   bDrawBox=True
   FillColor=(B=255,G=251,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8256
   ObjPosY=-8224
   ObjComment="Objectives"
   DrawWidth=319
   DrawHeight=696
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=1484
   SizeY=1299
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3760
   ObjPosY=5360
   ObjComment="Wall Portal Entry Spawns"
   DrawWidth=1484
   DrawHeight=1299
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=1389
   SizeY=1626
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3736
   ObjPosY=3496
   ObjComment="Floor Portal Entry Spawns"
   DrawWidth=1389
   DrawHeight=1626
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bLooping=True
   InputLinks(0)=(DrawY=6142,OverrideDelta=15)
   InputLinks(1)=(DrawY=6164,OverrideDelta=37)
   InputLinks(2)=(DrawY=6186,OverrideDelta=59)
   InputLinks(3)=(DrawY=6208,OverrideDelta=81)
   InputLinks(4)=(DrawY=6230,OverrideDelta=103)
   OutputLinks(0)=(DrawY=6158,OverrideDelta=31)
   OutputLinks(1)=(DrawY=6214,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=879,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),LinkDesc="BrokenDoor_Left",MinVars=0,DrawX=943,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="BrokenDoor_Right",MinVars=0,DrawX=1026,OverrideDelta=143)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=6104
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
      InterpTracks(0)=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2.InterpTrackAkEvent_2'
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
      InterpTracks(0)=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_1.InterpTrackMove_1'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_1'
   InterpGroups(1)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=848
   ObjPosY=6304
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=952
   ObjPosY=6312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1064
   ObjPosY=6312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(DrawY=6141,OverrideDelta=14)
   OutputLinks(1)=(DrawY=6162,OverrideDelta=35)
   OutputLinks(2)=(DrawY=6183,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=6072
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=572
   SizeY=364
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=584
   ObjPosY=6040
   ObjComment="Broken Elevator Doors"
   DrawWidth=572
   DrawHeight=364
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=CameraActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.CameraActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2560
   ObjPosY=6184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6'),(LinkedOp=SeqAct_ConsoleCommand'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=6074,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2319,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2224
   ObjPosY=6008
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=755
   SizeY=560
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2200
   ObjPosY=5976
   ObjComment="Benchmark"
   DrawWidth=755
   DrawHeight=560
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   InputLinks(0)=(DrawY=6030,OverrideDelta=15)
   InputLinks(1)=(DrawY=6052,OverrideDelta=37)
   InputLinks(2)=(DrawY=6074,OverrideDelta=59)
   InputLinks(3)=(DrawY=6096,OverrideDelta=81)
   InputLinks(4)=(DrawY=6118,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=6046,OverrideDelta=31)
   OutputLinks(1)=(DrawY=6102,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=2495,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=2565,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=5992
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
      InterpTracks(0)=InterpTrackDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_0.InterpTrackDirector_0'
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
      InterpTracks(0)=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackFloatProp_0'
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
   InterpGroups(0)=InterpGroupDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=9.988663
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=6200
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2520
   ObjPosY=6456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3832
   ObjPosY=3568
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3832
   ObjPosY=3664
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3984
   ObjPosY=3576
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=3584
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=3672
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_185
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4192
   ObjPosY=3592
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_185"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4232
   ObjPosY=3672
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4232
   ObjPosY=3768
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=3760
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4352
   ObjPosY=3592
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4216
   ObjPosY=5544
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4360
   ObjPosY=5552
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4216
   ObjPosY=5632
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=3629,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3650,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3671,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4586,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4504
   ObjPosY=3560
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=3597,OverrideDelta=14)
   InputLinks(1)=(DrawY=3618,OverrideDelta=35)
   InputLinks(2)=(DrawY=3639,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3618,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=4766,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4817,OverrideDelta=76)
   EventLinks(0)=(DrawX=4866,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=3560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4736
   ObjPosY=3728
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=3901,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3922,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3943,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4606,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4520
   ObjPosY=3832
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4736
   ObjPosY=4000
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=3869,OverrideDelta=14)
   InputLinks(1)=(DrawY=3890,OverrideDelta=35)
   InputLinks(2)=(DrawY=3911,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3890,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=4782,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4833,OverrideDelta=76)
   EventLinks(0)=(DrawX=4882,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4744
   ObjPosY=3832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=4189,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4210,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4231,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4634,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=4120
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4776
   ObjPosY=4296
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=4157,OverrideDelta=14)
   InputLinks(1)=(DrawY=4178,OverrideDelta=35)
   InputLinks(2)=(DrawY=4199,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4178,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=4806,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4857,OverrideDelta=76)
   EventLinks(0)=(DrawX=4906,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4768
   ObjPosY=4120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=4485,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4506,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4527,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4658,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=4416
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=4453,OverrideDelta=14)
   InputLinks(1)=(DrawY=4474,OverrideDelta=35)
   InputLinks(2)=(DrawY=4495,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4474,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=4806,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4857,OverrideDelta=76)
   EventLinks(0)=(DrawX=4906,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4768
   ObjPosY=4416
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4784
   ObjPosY=4576
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=4813,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4834,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4855,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4642,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4560
   ObjPosY=4744
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=4781,OverrideDelta=14)
   InputLinks(1)=(DrawY=4802,OverrideDelta=35)
   InputLinks(2)=(DrawY=4823,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4802,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=4798,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4849,OverrideDelta=76)
   EventLinks(0)=(DrawX=4898,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4760
   ObjPosY=4744
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4776
   ObjPosY=4912
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=5541,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5562,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5583,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4698,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=5472
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=5509,OverrideDelta=14)
   InputLinks(1)=(DrawY=5530,OverrideDelta=35)
   InputLinks(2)=(DrawY=5551,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5530,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=4854,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4905,OverrideDelta=76)
   EventLinks(0)=(DrawX=4954,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4816
   ObjPosY=5472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=5632
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(DrawY=5829,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5850,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5871,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4714,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=5760
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=5789,OverrideDelta=14)
   InputLinks(1)=(DrawY=5810,OverrideDelta=35)
   InputLinks(2)=(DrawY=5831,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5810,OverrideDelta=35)
   VariableLinks(0)=(DrawX=4870,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4975,OverrideDelta=130)
   EventLinks(0)=(DrawX=4927,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4832
   ObjPosY=5752
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4832
   ObjPosY=5904
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3824
   ObjPosY=3784
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=720
   SizeY=480
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3752
   ObjPosY=3512
   ObjComment="Map Actor References"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4064
   ObjPosY=5712
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4056
   ObjPosY=5552
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4064
   ObjPosY=5632
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_190
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4064
   ObjPosY=5800
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_190"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_189
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3888
   ObjPosY=5552
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_189"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=664
   SizeY=440
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3840
   ObjPosY=5480
   ObjComment="Map Actor References"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=6101,OverrideDelta=14)
   OutputLinks(1)=(DrawY=6122,OverrideDelta=35)
   OutputLinks(2)=(DrawY=6143,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4718,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=6032
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=6045,OverrideDelta=14)
   InputLinks(1)=(DrawY=6066,OverrideDelta=35)
   InputLinks(2)=(DrawY=6087,OverrideDelta=56)
   OutputLinks(0)=(DrawY=6066,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150'),DrawX=4902,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4953,OverrideDelta=76)
   EventLinks(0)=(DrawX=5002,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4864
   ObjPosY=6008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4856
   ObjPosY=6192
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34')),DrawY=6405,OverrideDelta=14)
   OutputLinks(1)=(DrawY=6426,OverrideDelta=35)
   OutputLinks(2)=(DrawY=6447,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4698,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=6336
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=6357,OverrideDelta=14)
   InputLinks(1)=(DrawY=6378,OverrideDelta=35)
   InputLinks(2)=(DrawY=6399,OverrideDelta=56)
   OutputLinks(0)=(DrawY=6378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=4902,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4953,OverrideDelta=76)
   EventLinks(0)=(DrawX=5002,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4864
   ObjPosY=6320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4872
   ObjPosY=6464
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=6381,OverrideDelta=14)
   InputLinks(1)=(DrawY=6402,OverrideDelta=35)
   InputLinks(2)=(DrawY=6423,OverrideDelta=56)
   OutputLinks(0)=(DrawY=6402,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=4190,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4241,OverrideDelta=76)
   EventLinks(0)=(DrawX=4290,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4152
   ObjPosY=6344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=6429,OverrideDelta=14)
   OutputLinks(1)=(DrawY=6450,OverrideDelta=35)
   OutputLinks(2)=(DrawY=6471,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3986,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3904
   ObjPosY=6360
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4160
   ObjPosY=6488
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=KFSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSpawner_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4368
   ObjPosY=5800
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=5253,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5274,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5295,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=5184
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   PlayRate=0.500000
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=5246,OverrideDelta=15)
   InputLinks(1)=(DrawY=5268,OverrideDelta=37)
   InputLinks(2)=(DrawY=5290,OverrideDelta=59)
   InputLinks(3)=(DrawY=5312,OverrideDelta=81)
   InputLinks(4)=(DrawY=5334,OverrideDelta=103)
   OutputLinks(0)=(DrawY=5262,OverrideDelta=31)
   OutputLinks(1)=(DrawY=5318,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=2554,OverrideDelta=19)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="Centrifuge",MinVars=0,DrawX=2620,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2520
   ObjPosY=5208
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="RotatingAnim",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackAnimControl_0'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Centrifuge_Rotator_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2520
   ObjPosY=5408
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=6034,OverrideDelta=11)
   OutputLinks(0)=(DrawY=6034,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=2824,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2760
   ObjPosY=6000
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=6314,OverrideDelta=11)
   OutputLinks(0)=(DrawY=6314,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=2320,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2256
   ObjPosY=6280
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=5629,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5650,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5671,OverrideDelta=56)
   VariableLinks(0)=(DrawX=706,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=5560
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=5333,OverrideDelta=14)
   OutputLinks(1)=(DrawY=5354,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5375,OverrideDelta=56)
   VariableLinks(0)=(DrawX=710,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=5264
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
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2264
   ObjPosY=5160
   ObjComment="Centrifuge rotator"
   DrawWidth=460
   DrawHeight=348
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_16
   bLooping=True
   InputLinks(0)=(DrawY=-2722,OverrideDelta=23)
   InputLinks(1)=(DrawY=-2686,OverrideDelta=59)
   InputLinks(2)=(DrawY=-2650,OverrideDelta=95)
   InputLinks(3)=(DrawY=-2614,OverrideDelta=131)
   InputLinks(4)=(DrawY=-2578,OverrideDelta=167)
   OutputLinks(0)=(DrawY=-2730,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-2684,OverrideDelta=61)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),LinkDesc="spray_1",DrawY=-2707,OverrideDelta=38)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),LinkDesc="spray_2",DrawY=-2661,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6'),(LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_20')),LinkDesc="shock_1_ON",DrawY=-2638,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_15')),LinkDesc="shock_1_OFF",DrawY=-2615,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_0'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),LinkDesc="shock_2_ON",DrawY=-2592,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_22')),LinkDesc="shock_2_OFF",DrawY=-2569,OverrideDelta=176)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16'),DrawX=-7729,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218'),LinkDesc="Track_1",MinVars=0,DrawX=-7671,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="Clot_Hook_1",MinVars=0,DrawX=-7604,OverrideDelta=132)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_183'),LinkDesc="Clot_Hook_2",MinVars=0,DrawX=-7540,OverrideDelta=196)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),LinkDesc="Shocking_Station",MinVars=0,DrawX=-7467,OverrideDelta=260)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),LinkDesc="Injection_Station",MinVars=0,DrawX=-7384,OverrideDelta=343)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Track_1_Spray",MinVars=0,DrawX=-7305,OverrideDelta=425)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_Shock_1",MinVars=0,DrawX=-7230,OverrideDelta=502)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_Shock_2",MinVars=0,DrawX=-7158,OverrideDelta=574)
   VariableLinks(9)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_1'),LinkDesc="PlayRate",PropertyName="PlayRate",MinVars=0,DrawX=-7099,OverrideDelta=646)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=-2768
   DrawWidth=692
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_6.InterpTrackAnimControl_6'
      InterpTracks(1)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_6.InterpTrackAkEvent_11'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5.InterpTrackAnimControl_5'
      InterpTracks(1)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5.InterpTrackAkEvent_23'
      InterpTracks(2)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5.InterpTrackAkEvent_25'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_4.InterpTrackAnimControl_4'
      GroupName="Clot_Hook_2"
      GroupColor=(B=214,G=0,R=105,A=255)
      GroupAnimSets(0)=AnimSet'ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_1
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ZED_UndevelopedClot_MAT.ZED_UndevelopedClot_GORE_MAT',AffectedMaterialRefs=((Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_7.SkeletalMeshComponent_2'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_8.SkeletalMeshComponent_2'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_4.SkeletalMeshComponent_2'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_10.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_11.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_12.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_14.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_1.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_2.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_3.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_4.SkeletalMeshComponent_0'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_0.SkeletalMeshComponent_0')))
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3.InterpTrackAnimControl_3'
      InterpTracks(1)=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3.InterpTrackFloatMaterialParam_1'
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
      InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_22.InterpTrackEvent_4'
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
      InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_21.InterpTrackEvent_3'
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
      InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_10.InterpTrackEvent_1'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0.InterpTrackAnimControl_0'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3'
   InterpGroups(2)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_4'
   InterpGroups(3)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5'
   InterpGroups(4)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_6'
   InterpGroups(5)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_10'
   InterpGroups(6)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_21'
   InterpGroups(7)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_22'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=39.167049
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Track1_ANIM")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Clot_ANIM")
   BakeAndPruneStatus(2)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM")
   BakeAndPruneStatus(3)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Shocking_Station_ANIM")
   BakeAndPruneStatus(4)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Injection_Station_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7800
   ObjPosY=-2480
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_16"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7712
   ObjPosY=-2472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7480
   ObjPosY=-2448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-2472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-2843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2801,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),DrawX=-6146,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6095,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6046,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6184
   ObjPosY=-2880
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-2795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),DrawX=-5898,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5847,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5798,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5936
   ObjPosY=-2832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=2501
   SizeY=912
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-2936
   ObjComment="Tank Track 1"
   DrawWidth=2501
   DrawHeight=912
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-1515,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1494,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1473,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1494,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=-6322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-1552
   ObjComment="Toggle_spray_1"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-1619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1598,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1577,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1598,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=-6114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6152
   ObjPosY=-1656
   ObjComment="Toggle_spray_2"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=-1731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1689,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=-5890,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5839,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5790,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-1768
   ObjComment="Toggle_spray_3"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_6
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17'),(LinkedOp=SeqAct_SetFloat'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_0')),DrawY=-1787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-1766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-1745,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-1856
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_6"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_17
   bLooping=True
   InputLinks(0)=(DrawY=-1420,OverrideDelta=29)
   InputLinks(1)=(DrawY=-1369,OverrideDelta=80)
   InputLinks(2)=(DrawY=-1318,OverrideDelta=131)
   InputLinks(3)=(DrawY=-1267,OverrideDelta=182)
   InputLinks(4)=(DrawY=-1216,OverrideDelta=233)
   OutputLinks(0)=(DrawY=-1433,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-1364,OverrideDelta=85)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),LinkDesc="spray_1",DrawY=-1410,OverrideDelta=39)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),LinkDesc="spray_2",DrawY=-1387,OverrideDelta=62)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),LinkDesc="spray_3",DrawY=-1341,OverrideDelta=108)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_21'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),LinkDesc="Clot_3_Shock_ON",DrawY=-1318,OverrideDelta=131)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_4')),LinkDesc="Clot_3_Shock_OFF",DrawY=-1295,OverrideDelta=154)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_16'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),LinkDesc="Clot_1_Shock_ON",DrawY=-1272,OverrideDelta=177)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_23')),LinkDesc="Clot_1_Shock_OFF",DrawY=-1249,OverrideDelta=200)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_18'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),LinkDesc="Clot_2_Shock_ON",DrawY=-1226,OverrideDelta=223)
   OutputLinks(10)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_13')),LinkDesc="Clot_2_Shock_OFF",DrawY=-1203,OverrideDelta=246)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17'),DrawX=-7865,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),LinkDesc="Track_2",MinVars=0,DrawX=-7807,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),LinkDesc="Track_2_Clot_1",MinVars=0,DrawX=-7734,OverrideDelta=132)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137'),LinkDesc="Track_2_Clot_2",MinVars=0,DrawX=-7657,OverrideDelta=209)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),LinkDesc="Track_2_Clot_3",MinVars=0,DrawX=-7580,OverrideDelta=286)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),LinkDesc="Track_2_Injection",MinVars=0,DrawX=-7503,OverrideDelta=363)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),LinkDesc="Track_2_Shock",MinVars=0,DrawX=-7426,OverrideDelta=440)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Track_2_Spray",MinVars=0,DrawX=-7349,OverrideDelta=517)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_1_Shock",MinVars=0,DrawX=-7277,OverrideDelta=594)
   VariableLinks(9)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_2_Shock",MinVars=0,DrawX=-7211,OverrideDelta=660)
   VariableLinks(10)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Clot_3_Shock",MinVars=0,DrawX=-7145,OverrideDelta=726)
   VariableLinks(11)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_10'),LinkDesc="PlayRate",PropertyName="PlayRate",MinVars=0,DrawX=-7089,OverrideDelta=792)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7896
   ObjPosY=-1472
   DrawWidth=838
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
      InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_25.InterpTrackEvent_7'
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
      InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_24.InterpTrackEvent_6'
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
      InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_23.InterpTrackEvent_5'
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
      InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_17.InterpTrackEvent_2'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16.InterpTrackAnimControl_12'
      InterpTracks(1)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16.InterpTrackAkEvent_19'
      InterpTracks(2)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16.InterpTrackAkEvent_21'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_15.InterpTrackAnimControl_11'
      InterpTracks(1)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_15.InterpTrackAkEvent_17'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_14.InterpTrackAnimControl_10'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_13.InterpTrackAnimControl_9'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_12.InterpTrackAnimControl_8'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_11.InterpTrackAnimControl_7'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_11'
   InterpGroups(1)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_12'
   InterpGroups(2)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_13'
   InterpGroups(3)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_14'
   InterpGroups(4)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_15'
   InterpGroups(5)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_16'
   InterpGroups(6)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_17'
   InterpGroups(7)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_23'
   InterpGroups(8)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_24'
   InterpGroups(9)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_25'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=43.333233
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Track2_ANIM")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_U_Clot_ANIM")
   BakeAndPruneStatus(2)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Injection_Station_ANIM")
   BakeAndPruneStatus(3)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.ENV_BioticsLab_Shocking_Station_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7944
   ObjPosY=-1120
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_17"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7856
   ObjPosY=-1112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7544
   ObjPosY=-1104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-1120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=2580
   SizeY=1180
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8248
   ObjPosY=-1824
   ObjComment="Tank Track 2"
   DrawWidth=2580
   DrawHeight=1180
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_20
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-2702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216'),DrawX=-6227,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6272
   ObjPosY=-2736
   ObjComment="shock_1_on"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_20"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_15
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-2614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216'),DrawX=-6235,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6280
   ObjPosY=-2648
   ObjComment="shock_1_off"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_15"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-2534,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2534,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-6355,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6400
   ObjPosY=-2568
   ObjComment="shock_2_on"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_22
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-2446,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=-6363,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6408
   ObjPosY=-2480
   ObjComment="shock_2_off"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_22"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-1350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-6563,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6608
   ObjPosY=-1384
   ObjComment="Clot_Shock_1_ON"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_16"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_23
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-1286,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1286,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-6467,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-1320
   ObjComment="Clot_Shock_1_Off"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_23"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-1086,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1086,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=-6315,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-1120
   ObjComment="Clot_Shock_2_OFF"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_13"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_18
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-1158,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1158,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=-6419,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6464
   ObjPosY=-1192
   ObjComment="Clot_Shock_2_On"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_18"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_21
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_02_MIC'
   InputLinks(0)=(DrawY=-918,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-918,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-6411,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-952
   ObjComment="Clot_Shock_3_ON"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_21"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_ANIM_MAT.ENV_Biotics_UClot_Tank_MIC'
   InputLinks(0)=(DrawY=-910,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-910,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-6283,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6328
   ObjPosY=-944
   ObjComment="Clot_Shock_3_OFF"
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_4"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-2251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2209,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_184'),DrawX=-6482,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6431,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6382,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=-2288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-955,OverrideDelta=14)
   InputLinks(1)=(DrawY=-934,OverrideDelta=35)
   InputLinks(2)=(DrawY=-913,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-934,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-6826,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6775,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6726,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-992
   ObjComment="Toggle_Shock"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=1984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_9
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_6.InterpTrackAnimControl_6'
      InterpTracks(1)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_6.InterpTrackAkEvent_5'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=25.000151
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=2008
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_15
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=1830,OverrideDelta=15)
   InputLinks(1)=(DrawY=1852,OverrideDelta=37)
   InputLinks(2)=(DrawY=1874,OverrideDelta=59)
   InputLinks(3)=(DrawY=1896,OverrideDelta=81)
   InputLinks(4)=(DrawY=1918,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1846,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1902,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=2569,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220'),LinkDesc="Cyst_c101",MinVars=0,DrawX=2636,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=1792
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_15"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_12
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_7
         AnimSeqs(0)=(AnimSeqName="Cell_Cyst_Feed",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_7"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_7.InterpTrackAnimControl_7'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_7'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=33.800076
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=2288
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=2118,OverrideDelta=15)
   InputLinks(1)=(DrawY=2140,OverrideDelta=37)
   InputLinks(2)=(DrawY=2162,OverrideDelta=59)
   InputLinks(3)=(DrawY=2184,OverrideDelta=81)
   InputLinks(4)=(DrawY=2206,OverrideDelta=103)
   OutputLinks(0)=(DrawY=2134,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2190,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=2585,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Cyst_c102",MinVars=0,DrawX=2652,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=2080
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=2288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_10
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_5
         AnimSeqs(0)=(AnimSeqName="Cell_Cyst_idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_5"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_5.InterpTrackAnimControl_5'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_5'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=16.649635
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Cyst_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=2608
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=2600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=2414,OverrideDelta=15)
   InputLinks(1)=(DrawY=2436,OverrideDelta=37)
   InputLinks(2)=(DrawY=2458,OverrideDelta=59)
   InputLinks(3)=(DrawY=2480,OverrideDelta=81)
   InputLinks(4)=(DrawY=2502,OverrideDelta=103)
   OutputLinks(0)=(DrawY=2430,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2486,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=2585,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Cyst_c103",MinVars=0,DrawX=2652,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=2376
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_4
         AnimSeqs(0)=(AnimSeqName="Cell_Alpha_Feed",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_4"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_4.InterpTrackAnimControl_4'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=15.899997
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=2960
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=2960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=2782,OverrideDelta=15)
   InputLinks(1)=(DrawY=2804,OverrideDelta=37)
   InputLinks(2)=(DrawY=2826,OverrideDelta=59)
   InputLinks(3)=(DrawY=2848,OverrideDelta=81)
   InputLinks(4)=(DrawY=2870,OverrideDelta=103)
   OutputLinks(0)=(DrawY=2798,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2854,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=2567,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Alpha_c104",MinVars=0,DrawX=2637,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=2744
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackAnimControl_1'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=24.000772
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=3280
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=3272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=3110,OverrideDelta=15)
   InputLinks(1)=(DrawY=3132,OverrideDelta=37)
   InputLinks(2)=(DrawY=3154,OverrideDelta=59)
   InputLinks(3)=(DrawY=3176,OverrideDelta=81)
   InputLinks(4)=(DrawY=3198,OverrideDelta=103)
   OutputLinks(0)=(DrawY=3126,OverrideDelta=31)
   OutputLinks(1)=(DrawY=3182,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=2586,OverrideDelta=19)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Alpha_c05",MinVars=0,DrawX=2652,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=3072
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackAnimControl_3'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=12.000796
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.AlphaClot_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=3430,OverrideDelta=15)
   InputLinks(1)=(DrawY=3452,OverrideDelta=37)
   InputLinks(2)=(DrawY=3474,OverrideDelta=59)
   InputLinks(3)=(DrawY=3496,OverrideDelta=81)
   InputLinks(4)=(DrawY=3518,OverrideDelta=103)
   OutputLinks(0)=(DrawY=3446,OverrideDelta=31)
   OutputLinks(1)=(DrawY=3502,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=2583,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Alpha_c106",MinVars=0,DrawX=2653,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=3392
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_0.InterpTrackAnimControl_0'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=22.400436
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=3912
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_13"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_217
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=3912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_217"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=3750,OverrideDelta=15)
   InputLinks(1)=(DrawY=3772,OverrideDelta=37)
   InputLinks(2)=(DrawY=3794,OverrideDelta=59)
   InputLinks(3)=(DrawY=3816,OverrideDelta=81)
   InputLinks(4)=(DrawY=3838,OverrideDelta=103)
   OutputLinks(0)=(DrawY=3766,OverrideDelta=31)
   OutputLinks(1)=(DrawY=3822,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_13'),DrawX=2583,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Slasher_c107",MinVars=0,DrawX=2659,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=3712
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
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1.InterpTrackAnimControl_1'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=18.400118
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=4240
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=4248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_15
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="Cell_Slasher_Feed",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_2.InterpTrackAnimControl_2'
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
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=23.650366
   BakeAndPruneStatus(0)=(AnimSetName="ENV_BioticsLab_ANIM_ANIM.Slasher_Cell_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=4544
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_15"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=4544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=4062,OverrideDelta=15)
   InputLinks(1)=(DrawY=4084,OverrideDelta=37)
   InputLinks(2)=(DrawY=4106,OverrideDelta=59)
   InputLinks(3)=(DrawY=4128,OverrideDelta=81)
   InputLinks(4)=(DrawY=4150,OverrideDelta=103)
   OutputLinks(0)=(DrawY=4078,OverrideDelta=31)
   OutputLinks(1)=(DrawY=4134,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=2583,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Slasher_c108",MinVars=0,DrawX=2659,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=4024
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_13
   bLooping=True
   bClientSideOnly=True
   bSkipUpdateIfNotVisible=True
   InputLinks(0)=(DrawY=4374,OverrideDelta=15)
   InputLinks(1)=(DrawY=4396,OverrideDelta=37)
   InputLinks(2)=(DrawY=4418,OverrideDelta=59)
   InputLinks(3)=(DrawY=4440,OverrideDelta=81)
   InputLinks(4)=(DrawY=4462,OverrideDelta=103)
   OutputLinks(0)=(DrawY=4390,OverrideDelta=31)
   OutputLinks(1)=(DrawY=4446,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_15'),DrawX=2575,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Slasher_c109",MinVars=0,DrawX=2651,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=4336
   DrawWidth=167
   DrawHeight=157
   Name="SeqAct_Interp_13"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_5
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=3141,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3162,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3183,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=3072
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_5"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=1256
   SizeY=2928
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1784
   ObjPosY=1744
   ObjComment="Containment Cells"
   DrawWidth=1256
   DrawHeight=2928
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7648
   ObjPosY=-2424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-2392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=-2392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_184
   ObjValue=KFEmitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFEmitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6504
   ObjPosY=-2128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_184"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=KFEmitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFEmitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-2656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=KFEmitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFEmitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-2656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=KFEmitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFEmitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6136
   ObjPosY=-1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=KFEmitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFEmitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=-1344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=KFEmitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFEmitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-832
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
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4600
   ObjPosY=5720
   ObjComment="Disabled"
   DrawWidth=433
   DrawHeight=276
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="MetalDetectorRightActivated"
   InputLinks(0)=(DrawY=5330,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5330,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1000,OverrideDelta=152)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=5296
   DrawWidth=369
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="MetalDetectorLeftActivated"
   InputLinks(0)=(DrawY=5634,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5634,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1013,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=5600
   DrawWidth=362
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=686
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=5528
   ObjComment="Metal Detector Alarm - Left"
   DrawWidth=686
   DrawHeight=236
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=677
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=5232
   ObjComment="Metal Detector Alarm - Right"
   DrawWidth=677
   DrawHeight=236
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_7
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),DrawY=3869,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3890,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3911,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5856
   ObjPosY=3800
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_7"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(DrawX=6142,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6193,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_1'),DrawX=6242,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6104
   ObjPosY=3904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_10
   SizeX=680
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6288
   ObjPosY=4384
   ObjComment="Initial Spawns"
   Name="SequenceFrameWrapped_10"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=688
   SizeY=184
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6696
   ObjPosY=4184
   ObjComment="Lobby Spawn Points"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=4045,OverrideDelta=14)
   InputLinks(1)=(DrawY=4066,ActivateDelay=20.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=4087,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36')),DrawY=4066,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_182',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),DrawX=6502,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6553,OverrideDelta=76)
   EventLinks(0)=(DrawX=6602,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6464
   ObjPosY=4008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_1
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28',InputLinkIdx=1)),DrawY=4178,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6112,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6182,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6064
   ObjPosY=4112
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_1"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=3989,OverrideDelta=14)
   InputLinks(1)=(DrawY=4010,OverrideDelta=35)
   InputLinks(2)=(DrawY=4031,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4010,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_193',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146'),DrawX=6998,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7049,OverrideDelta=76)
   EventLinks(0)=(DrawX=7098,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6960
   ObjPosY=3952
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6440
   ObjPosY=4408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6536
   ObjPosY=4408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6640
   ObjPosY=4408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6736
   ObjPosY=4408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_182
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6488
   ObjPosY=4496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_182"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6584
   ObjPosY=4496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6688
   ObjPosY=4496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6784
   ObjPosY=4496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6760
   ObjPosY=4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6856
   ObjPosY=4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6960
   ObjPosY=4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_193
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7056
   ObjPosY=4216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_193"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6800
   ObjPosY=4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6896
   ObjPosY=4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7000
   ObjPosY=4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7096
   ObjPosY=4288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_178
   ObjValue=KFVersusNoGoVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFVersusNoGoVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6336
   ObjPosY=3208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_178"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=124
   SizeY=124
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6304
   ObjPosY=3184
   ObjComment="Zed_NoGo_01"
   DrawWidth=124
   DrawHeight=124
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=2461,OverrideDelta=14)
   InputLinks(1)=(DrawY=2482,OverrideDelta=35)
   InputLinks(2)=(DrawY=2503,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2482,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_175',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_191',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_173',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_234'),DrawX=5438,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5489,OverrideDelta=76)
   EventLinks(0)=(DrawX=5538,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=2424
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5296
   ObjPosY=2648
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5392
   ObjPosY=2648
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5496
   ObjPosY=2648
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_191
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5592
   ObjPosY=2648
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_191"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5288
   ObjPosY=2728
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5384
   ObjPosY=2728
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_173
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5488
   ObjPosY=2728
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_173"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_234
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5584
   ObjPosY=2728
   ObjComment="DNA Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_234"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=2101,OverrideDelta=14)
   InputLinks(1)=(DrawY=2122,OverrideDelta=35)
   InputLinks(2)=(DrawY=2143,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2122,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),DrawX=5438,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5489,OverrideDelta=76)
   EventLinks(0)=(DrawX=5538,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=2064
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5296
   ObjPosY=2232
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5392
   ObjPosY=2232
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5496
   ObjPosY=2232
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5592
   ObjPosY=2232
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5304
   ObjPosY=2312
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=2312
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5504
   ObjPosY=2312
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5600
   ObjPosY=2312
   ObjComment="Tank Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=1749,OverrideDelta=14)
   InputLinks(1)=(DrawY=1770,OverrideDelta=35)
   InputLinks(2)=(DrawY=1791,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1770,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=5462,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5513,OverrideDelta=76)
   EventLinks(0)=(DrawX=5562,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5424
   ObjPosY=1712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5296
   ObjPosY=1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5496
   ObjPosY=1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5600
   ObjPosY=1888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5240
   ObjPosY=1968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5344
   ObjPosY=1968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5440
   ObjPosY=1968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5544
   ObjPosY=1968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5640
   ObjPosY=1968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=2109,OverrideDelta=14)
   InputLinks(1)=(DrawY=2130,OverrideDelta=35)
   InputLinks(2)=(DrawY=2151,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=4862,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4913,OverrideDelta=76)
   EventLinks(0)=(DrawX=4962,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=2072
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4704
   ObjPosY=2280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4800
   ObjPosY=2280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=2280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5000
   ObjPosY=2280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4704
   ObjPosY=2376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4800
   ObjPosY=2376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=2376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFPlayerStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPlayerStart_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5000
   ObjPosY=2376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=2253,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2274,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=2295,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3784
   ObjPosY=2184
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=4
   InputLinks(0)=(DrawY=2280,OverrideDelta=25)
   InputLinks(1)=(DrawY=2324,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=2269,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33')),LinkDesc="Link 2",DrawY=2291,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),LinkDesc="Link 3",DrawY=2313,OverrideDelta=58)
   OutputLinks(3)=(LinkDesc="Link 4",DrawY=2335,OverrideDelta=80)
   VariableLinks(0)=(DrawX=4508,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4464
   ObjPosY=2232
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7616
   ObjPosY=-1096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=-1096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7696
   ObjPosY=-1096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6664
   ObjPosY=-1264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6400
   ObjPosY=-808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-1064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_0
   MaxTriggerCount=0
   MaxWidth=216
   OutputLinks(0)=(DrawY=-9338,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9315,OverrideDelta=38)
   OutputLinks(2)=(DrawY=-9292,OverrideDelta=61)
   OutputLinks(3)=(DrawY=-9269,OverrideDelta=84)
   OutputLinks(4)=(DrawY=-9246,OverrideDelta=107)
   OutputLinks(5)=(DrawY=-9223,OverrideDelta=130)
   OutputLinks(6)=(DrawY=-9200,OverrideDelta=153)
   OutputLinks(7)=(DrawY=-9177,OverrideDelta=176)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2')),DrawY=-9154,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9536
   ObjPosY=-9408
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_0"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=675
   SizeY=670
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9608
   ObjPosY=-9600
   ObjComment="Are we in Objective Mode?"
   DrawWidth=675
   DrawHeight=670
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_2
   MaxTriggerCount=0
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2')),ActivateDelay=0.500000,DrawY=-9298,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9275,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46',InputLinkIdx=1)),DrawY=-9252,OverrideDelta=61)
   OutputLinks(3)=(DrawY=-9229,OverrideDelta=84)
   OutputLinks(4)=(DrawY=-9206,OverrideDelta=107)
   OutputLinks(5)=(DrawY=-9183,OverrideDelta=130)
   OutputLinks(6)=(DrawY=-9160,OverrideDelta=153)
   OutputLinks(7)=(DrawY=-9137,OverrideDelta=176)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2')),DrawY=-9114,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-456
   ObjPosY=-9368
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_2"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_6
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-9072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_6"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-9072
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=-9150,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9150,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=-9166,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_0'),DrawX=-9110,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-9184
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   VarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_78
   SizeX=3278
   SizeY=2077
   BorderWidth=5
   bDrawBox=True
   FillColor=(B=71,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-696
   ObjPosY=-9656
   ObjComment="Initial Setup"
   DrawWidth=3278
   DrawHeight=2077
   Name="SequenceFrame_78"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
   InputLinks(0)=(DrawY=-9395,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9374,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9353,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9374,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_200',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_205',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_206',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_349',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=326,OverrideDelta=16)
   VariableLinks(1)=(DrawX=377,OverrideDelta=76)
   EventLinks(0)=(DrawX=426,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=288
   ObjPosY=-9432
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_46"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_2
   InputLinks(0)=(DrawY=-8867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8825,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0',InputLinkIdx=1)),DrawY=-8846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_194'),DrawX=94,OverrideDelta=16)
   VariableLinks(1)=(DrawX=145,OverrideDelta=76)
   EventLinks(0)=(DrawX=194,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=56
   ObjPosY=-8904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_2"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_194
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=40
   ObjPosY=-8744
   ObjComment="Animated Clot"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_194"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_4
   InputLinks(0)=(DrawY=-7146,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-7156,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-7136,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_7'),DrawX=-5859,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_12'),DrawX=-5809,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5888
   ObjPosY=-7192
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_4"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_12
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5816
   ObjPosY=-7064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_12"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="AllPlayersDead"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5904
   ObjPosY=-7064
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_7"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_10
   VarName="AllPlayersDead"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5864
   ObjPosY=-6928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_10"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="StopCloningMachines"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17',InputLinkIdx=2)),DrawY=-2230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8760,OverrideDelta=96)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8888
   ObjPosY=-2296
   ObjComment="StopCloningMachines"
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_75
   SizeX=2725
   SizeY=4163
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-7336
   ObjComment="End Cinematic"
   DrawWidth=2725
   DrawHeight=4163
   Name="SequenceFrame_75"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=-9160
   ObjComment="Data Pad"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=416
   ObjPosY=-9160
   ObjComment="Data Pad"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=512
   ObjPosY=-9160
   ObjComment="Data Pad"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=504
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_205
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_205"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_206
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=800
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_206"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_207
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_207"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_208
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1000
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_208"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=-9008
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1200
   ObjPosY=-9000
   ObjComment="Repair Bots"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=-9112
   ObjComment="Cold Room"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=168
   ObjPosY=-9064
   ObjComment="Clot Mother"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=264
   ObjPosY=-9048
   ObjComment="Clot Mother"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-9256
   ObjComment="Escort Button"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_PlayerDied Name=KFSeqEvent_PlayerDied_0
   MaxWidth=120
   OutputLinks(0)=(DrawY=-7116,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5')),DrawY=-7096,OverrideDelta=33)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6400
   ObjPosY=-7184
   DrawWidth=121
   Name="KFSeqEvent_PlayerDied_0"
   ObjectArchetype=KFSeqEvent_PlayerDied'KFGame.Default__KFSeqEvent_PlayerDied'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_13
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6168
   ObjPosY=-7048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_13"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="AllPlayersDead"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-7048
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_8"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=-7126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_13'),DrawX=-6118,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_8'),DrawX=-6062,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6152
   ObjPosY=-7160
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="AllPlayersDead"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-6912
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-6904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_6
   InputLinks(0)=(DrawY=-6994,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-7004,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),DrawY=-6984,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_2'),DrawX=-7187,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=-7137,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-7040
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_6"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="FinalCinematic"
   InputLinks(0)=(DrawY=-6990,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6856,OverrideDelta=104)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6992
   ObjPosY=-7024
   ObjComment="FinalCinematic"
   DrawWidth=272
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_8
   Originator=KFMapObjective_ExterminateWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_0'
   MaxWidth=424
   OutputLinks(0)=(DrawY=-7012,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_2',InputLinkIdx=1)),DrawY=-6992,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-7764,OverrideDelta=180)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7976
   ObjPosY=-7080
   ObjName="KFMapObjective_ExterminateWave_0 Map Objective Activated"
   DrawWidth=260
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_8"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_2')),ActivateDelay=0.200000,DrawY=-6764,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_2')),ActivateDelay=0.200000,DrawY=-6744,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-7869,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7808,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-7727,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-6832
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_0"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqAct_Gate Name=SeqAct_Gate_2
   bOpen=False
   InputLinks(0)=(DrawY=-6899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6877,OverrideDelta=36)
   InputLinks(2)=(DrawY=-6855,OverrideDelta=58)
   InputLinks(3)=(DrawY=-6833,OverrideDelta=80)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_6')),DrawY=-6866,OverrideDelta=47)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7496
   ObjPosY=-6936
   DrawWidth=82
   DrawHeight=117
   Name="SeqAct_Gate_2"
   ObjectArchetype=SeqAct_Gate'Engine.Default__SeqAct_Gate'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_13
   ConsoleEventName="Final"
   MaxWidth=149
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),DrawY=-6510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8094,OverrideDelta=42)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-6576
   DrawWidth=94
   DrawHeight=128
   Name="SeqEvent_Console_13"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="FinalCinematic"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraFade'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraFade_1'),(LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0'),(LinkedOp=SeqAct_ToggleHidden'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3'),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19'),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2'),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_21'),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14'),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_22'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1'),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_20'),(LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_1'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27')),DrawY=-5926,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7567,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7672
   ObjPosY=-5992
   ObjComment="FinalCinematic"
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_CameraFade Name=SeqAct_CameraFade_1
   FadeTime=4.000000
   InputLinks(0)=(DrawY=-5962,ActivateDelay=10.000000,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-5972,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5952,OverrideDelta=33)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-6008
   ObjComment="Fade Out"
   DrawWidth=80
   DrawHeight=69
   Name="SeqAct_CameraFade_1"
   ObjectArchetype=SeqAct_CameraFade'Engine.Default__SeqAct_CameraFade'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_2
   FloatValue=1.000000
   VarName="MatneeSpeed"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7888
   ObjPosY=-2872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_2"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_1
   InputLinks(0)=(DrawY=-1718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_5'),DrawX=-4878,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_14'),DrawX=-4822,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4912
   ObjPosY=-1752
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_1"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_5
   FloatValue=2.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4920
   ObjPosY=-1640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_5"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="SpeedUpCloningMachines"
   MaxWidth=283
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-1494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5307,OverrideDelta=109)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5448
   ObjPosY=-1560
   ObjComment="SpeedUpCloningMachines"
   DrawWidth=161
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_16
   EventName="FinalCinematic"
   InputLinks(0)=(DrawY=-6526,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7824,OverrideDelta=104)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-6560
   ObjComment="FinalCinematic"
   DrawWidth=272
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_16"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_0
   InputLinks(0)=(DrawY=-8819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8798,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8777,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_2')),DrawY=-8798,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245'),DrawX=406,OverrideDelta=16)
   VariableLinks(1)=(DrawX=457,OverrideDelta=76)
   EventLinks(0)=(DrawX=506,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=368
   ObjPosY=-8856
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_0"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=360
   ObjPosY=-8704
   ObjComment="Data Terminal"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=144
   ObjPosY=-9200
   ObjComment="Data Delivery"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=592
   ObjPosY=-9208
   ObjComment="Data Terminal"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=-8608
   ObjComment="Clot Mother Computers"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-8576
   ObjComment="Clot Mother Computers"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=-8536
   ObjComment="Clot Mother Computers"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-8496
   ObjComment="Clot Mother Computers"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_2
   CollisionType=COLLIDE_BlockAll
   InputLinks(0)=(DrawY=-8790,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8790,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245'),DrawX=754,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=696
   ObjPosY=-8824
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_2"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=2254,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=2244,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=2264,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_3'),DrawX=4165,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=4215,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4136
   ObjPosY=2208
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4208
   ObjPosY=2336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=2336
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Ending_Outro'
   InputLinks(0)=(DrawY=-6230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6464,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-6264
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="MatneeSpeed"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-2464
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_1"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="MatneeSpeed"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-1656
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_14"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="MatneeSpeed"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-1128
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_10"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="MatneeSpeed"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8752
   ObjPosY=-1768
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_4
   FloatValue=1.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8840
   ObjPosY=-1752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_4"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_0
   InputLinks(0)=(DrawY=-1830,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16')),DrawY=-1830,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_4'),DrawX=-8798,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_13'),DrawX=-8742,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8832
   ObjPosY=-1864
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_0"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=Sequence Name=WaveController
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
      ObjValue=KFTraderTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTraderTrigger_6'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8448
      ObjPosY=-5664
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_97"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
      ObjValue=KFTraderTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTraderTrigger_1'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8448
      ObjPosY=-5880
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_197"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
      ObjValue=KFTraderTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTraderTrigger_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8456
      ObjPosY=-6448
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_179"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
      ObjValue=KFTraderTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTraderTrigger_2'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8456
      ObjPosY=-6640
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_177"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
      ObjValue=KFTraderTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTraderTrigger_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8464
      ObjPosY=-6064
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_130"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
      ObjValue=KFTraderTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTraderTrigger_5'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8464
      ObjPosY=-6256
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_112"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
      ExpectedType=Class'Engine.SeqVar_Bool'
      FindVarName="objective"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8984
      ObjPosY=-6448
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_0"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_0
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-9320
      ObjPosY=-6384
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_0"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
      bValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8896
      ObjPosY=-6448
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_0"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_66
      SizeX=1834
      SizeY=1461
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-9424
      ObjPosY=-6808
      ObjComment="Wave Controller"
      DrawWidth=1834
      DrawHeight=1461
      Name="SequenceFrame_66"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
      InputLinks(0)=(DrawY=-6530,OverrideDelta=23)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqAct_Switch_8')),DrawY=-6540,OverrideDelta=13)
      OutputLinks(1)=(DrawY=-6520,OverrideDelta=33)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Named_0'),DrawX=-8939,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Bool_0'),DrawX=-8889,OverrideDelta=59)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8968
      ObjPosY=-6576
      DrawWidth=115
      DrawHeight=85
      Name="SeqCond_CompareBool_0"
      ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
   End Object
   Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_8
      LinkCount=8
      InputLinks(0)=(DrawY=-6482,OverrideDelta=95)
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_1')),DrawY=-6562,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_2')),LinkDesc="Link 2",DrawY=-6539,OverrideDelta=38)
      OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_6')),LinkDesc="Link 3",DrawY=-6516,OverrideDelta=61)
      OutputLinks(3)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_5')),LinkDesc="Link 4",DrawY=-6493,OverrideDelta=84)
      OutputLinks(4)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_0')),LinkDesc="Link 5",DrawY=-6470,OverrideDelta=107)
      OutputLinks(5)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_3')),LinkDesc="Link 6",DrawY=-6447,OverrideDelta=130)
      OutputLinks(6)=(LinkDesc="Link 7",DrawY=-6424,OverrideDelta=153)
      OutputLinks(7)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqAct_ActivateRemoteEvent_80')),LinkDesc="Link 8",DrawY=-6401,OverrideDelta=176)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Int_0'),DrawX=-8742,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8776
      ObjPosY=-6600
      DrawWidth=68
      DrawHeight=229
      Name="SeqAct_Switch_8"
      ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_80
      EventName="OBJ_StartBossWave"
      InputLinks(0)=(DrawY=-5494,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5494,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8333,OverrideDelta=123)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8488
      ObjPosY=-5528
      DrawWidth=311
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_80"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
      EventName="OBJ_EnableWave_5"
      InputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8111,OverrideDelta=121)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8264
      ObjPosY=-5976
      DrawWidth=306
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_2"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
      MaxTriggerCount=0
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqCond_CompareBool_0')),DrawY=-6548,OverrideDelta=13)
      OutputLinks(1)=(DrawY=-6528,OverrideDelta=33)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Int_0'),DrawX=-9325,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-9264,OverrideDelta=86)
      VariableLinks(2)=(DrawX=-9183,OverrideDelta=139)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-9368
      ObjPosY=-6616
      DrawWidth=175
      DrawHeight=168
      Name="KFSeqEvent_WaveStart_0"
      ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
   End Object
   Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_6
      InputLinks(0)=(DrawY=-6340,OverrideDelta=13)
      InputLinks(1)=(DrawY=-6320,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-6330,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_112'),DrawX=-8431,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8472
      ObjPosY=-6376
      DrawWidth=83
      DrawHeight=101
      Name="KFSeqAct_SetTrader_6"
      ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
   End Object
   Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_5
      InputLinks(0)=(DrawY=-6140,OverrideDelta=13)
      InputLinks(1)=(DrawY=-6120,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-6130,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_130'),DrawX=-8431,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8472
      ObjPosY=-6176
      DrawWidth=83
      DrawHeight=101
      Name="KFSeqAct_SetTrader_5"
      ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
   End Object
   Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_3
      InputLinks(0)=(DrawY=-5764,OverrideDelta=13)
      InputLinks(1)=(DrawY=-5744,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-5754,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_97'),DrawX=-8423,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8464
      ObjPosY=-5800
      DrawWidth=83
      DrawHeight=101
      Name="KFSeqAct_SetTrader_3"
      ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
   End Object
   Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_2
      InputLinks(0)=(DrawY=-6524,OverrideDelta=13)
      InputLinks(1)=(DrawY=-6504,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-6514,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_179'),DrawX=-8431,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8472
      ObjPosY=-6560
      DrawWidth=83
      DrawHeight=101
      Name="KFSeqAct_SetTrader_2"
      ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
   End Object
   Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_1
      InputLinks(0)=(DrawY=-6724,OverrideDelta=13)
      InputLinks(1)=(DrawY=-6704,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-6714,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_177'),DrawX=-8431,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8472
      ObjPosY=-6760
      DrawWidth=83
      DrawHeight=101
      Name="KFSeqAct_SetTrader_1"
      ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
   End Object
   Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_0
      InputLinks(0)=(DrawY=-5956,OverrideDelta=13)
      InputLinks(1)=(DrawY=-5936,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqAct_ActivateRemoteEvent_2')),DrawY=-5946,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_197'),DrawX=-8415,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController'
      ObjPosX=-8456
      ObjPosY=-5992
      DrawWidth=83
      DrawHeight=101
      Name="KFSeqAct_SetTrader_0"
      ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
   End Object
   SequenceObjects(0)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqAct_ActivateRemoteEvent_2'
   SequenceObjects(1)=SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Int_0'
   SequenceObjects(2)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_130'
   SequenceObjects(3)=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_5'
   SequenceObjects(4)=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_3'
   SequenceObjects(5)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_97'
   SequenceObjects(6)=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_6'
   SequenceObjects(7)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_112'
   SequenceObjects(8)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_179'
   SequenceObjects(9)=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_2'
   SequenceObjects(10)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_177'
   SequenceObjects(11)=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_1'
   SequenceObjects(12)=KFSeqEvent_WaveStart'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqEvent_WaveStart_0'
   SequenceObjects(13)=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqAct_Switch_8'
   SequenceObjects(14)=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqCond_CompareBool_0'
   SequenceObjects(15)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Bool_0'
   SequenceObjects(16)=SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Named_0'
   SequenceObjects(17)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SequenceFrame_66'
   SequenceObjects(18)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqVar_Object_197'
   SequenceObjects(19)=KFSeqAct_SetTrader'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.KFSeqAct_SetTrader_0'
   SequenceObjects(20)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.WaveController.SeqAct_ActivateRemoteEvent_80'
   DefaultViewX=8888
   DefaultViewY=6086
   DefaultViewZoom=0.900000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-8184
   ObjName="WaveController"
   DrawWidth=110
   DrawHeight=29
   Name="WaveController"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_1_TimedHold
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_16'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8912
      ObjPosY=-6376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_232"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_38'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8816
      ObjPosY=-6376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_134"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_38
      SizeX=781
      SizeY=489
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8568
      ObjPosY=-6592
      ObjComment="VO"
      DrawWidth=781
      DrawHeight=489
      Name="SequenceFrame_38"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_30
      SizeX=1829
      SizeY=783
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-9536
      ObjPosY=-6720
      ObjComment="Obj 1 - Timed Hold"
      DrawWidth=1829
      DrawHeight=783
      Name="SequenceFrame_30"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_29
      SizeX=781
      SizeY=404
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-9456
      ObjPosY=-6640
      ObjComment="Ammo Toggle"
      DrawWidth=781
      DrawHeight=404
      Name="SequenceFrame_29"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
      InputLinks(0)=(DrawY=-6491,OverrideDelta=14)
      InputLinks(1)=(DrawY=-6470,OverrideDelta=35)
      InputLinks(2)=(DrawY=-6449,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-6470,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqVar_Object_232',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqVar_Object_134'),DrawX=-8858,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8807,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8758,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8896
      ObjPosY=-6528
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_0"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_55
      EventName="PlayHold_1_VO_75"
      InputLinks(0)=(DrawY=-6294,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6294,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8010,OverrideDelta=118)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8160
      ObjPosY=-6328
      DrawWidth=300
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_55"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_54
      EventName="PlayHold_1_VO_50"
      InputLinks(0)=(DrawY=-6422,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6422,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8018,OverrideDelta=118)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8168
      ObjPosY=-6456
      DrawWidth=300
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_54"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_53
      EventName="PlayHold_1_VO_25"
      InputLinks(0)=(DrawY=-6534,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6534,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8034,OverrideDelta=118)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8184
      ObjPosY=-6568
      DrawWidth=300
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_53"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_52
      EventName="PlayHold_1_VO_Complete"
      InputLinks(0)=(DrawY=-6166,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6166,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7996,OverrideDelta=140)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8168
      ObjPosY=-6200
      DrawWidth=345
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_52"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_1
      Originator=KFMapObjective_HoldZone'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_HoldZone_3'
      MaxWidth=370
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_Toggle_0')),DrawY=-6516,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_Toggle_0',InputLinkIdx=1)),DrawY=-6496,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-9183,OverrideDelta=153)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-9368
      ObjPosY=-6584
      ObjName="KFMapObjective_HoldZone_3 Map Objective Activated"
      DrawWidth=233
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_1"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_HoldZoneProgress Name=KFSeqEvent_HoldZoneProgress_2
      ProgressThresholds(0)=0.250000
      ProgressThresholds(1)=0.500000
      ProgressThresholds(2)=0.750000
      ProgressThresholds(3)=1.000000
      Originator=KFMapObjective_HoldZone'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_HoldZone_3'
      MaxWidth=333
      OutputLinks(0)=(DrawY=-6481,OverrideDelta=16)
      OutputLinks(1)=(DrawY=-6459,OverrideDelta=38)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_53')),LinkDesc="Progress Pct: 0.25",DrawY=-6437,OverrideDelta=60)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_54')),LinkDesc="Progress Pct: 0.50",DrawY=-6415,OverrideDelta=82)
      OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_55')),LinkDesc="Progress Pct: 0.75",DrawY=-6393,OverrideDelta=104)
      OutputLinks(5)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_52')),LinkDesc="Progress Pct: 1.00",DrawY=-6371,OverrideDelta=126)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold'
      ObjPosX=-8544
      ObjPosY=-6552
      ObjName="KFMapObjective_HoldZone_3 Hold Zone Progress"
      DrawWidth=236
      Name="KFSeqEvent_HoldZoneProgress_2"
      ObjectArchetype=KFSeqEvent_HoldZoneProgress'kfgamecontent.Default__KFSeqEvent_HoldZoneProgress'
   End Object
   SequenceObjects(0)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SequenceFrame_38'
   SequenceObjects(1)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_52'
   SequenceObjects(2)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_55'
   SequenceObjects(3)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_54'
   SequenceObjects(4)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_ActivateRemoteEvent_53'
   SequenceObjects(5)=KFSeqEvent_HoldZoneProgress'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.KFSeqEvent_HoldZoneProgress_2'
   SequenceObjects(6)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SequenceFrame_29'
   SequenceObjects(7)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqAct_Toggle_0'
   SequenceObjects(8)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqVar_Object_232'
   SequenceObjects(9)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SeqVar_Object_134'
   SequenceObjects(10)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.KFSeqEvent_MapObjectiveActivated_1'
   SequenceObjects(11)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_1_TimedHold.SequenceFrame_30'
   DefaultViewX=3489
   DefaultViewY=3381
   DefaultViewZoom=0.600000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-8040
   ObjName="Obj_1_TimedHold"
   DrawWidth=123
   DrawHeight=29
   Name="Obj_1_TimedHold"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_2_Transport
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_25'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7688
      ObjPosY=-5664
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_3"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_253
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_17'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8688
      ObjPosY=-6256
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_253"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8784
      ObjPosY=-5240
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_248"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_1'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8760
      ObjPosY=-4696
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_247"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_7'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8808
      ObjPosY=-5880
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_246"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_20'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7632
      ObjPosY=-6272
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_235"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_42'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7968
      ObjPosY=-6240
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_233"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_37'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7520
      ObjPosY=-5664
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_2"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
      ObjValue=SkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_1'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8896
      ObjPosY=-6392
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_123"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_36'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7608
      ObjPosY=-5664
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_1"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_26'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7768
      ObjPosY=-5752
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_0"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_44
      SizeX=2501
      SizeY=2256
      BorderWidth=5
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9560
      ObjPosY=-6672
      ObjComment="Obj 2 - Transport"
      DrawWidth=2501
      DrawHeight=2256
      Name="SequenceFrame_44"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_34
      SizeX=897
      SizeY=501
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8296
      ObjPosY=-6040
      ObjComment="Ammo Toggle"
      DrawWidth=897
      DrawHeight=501
      Name="SequenceFrame_34"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_32
      SizeX=1006
      SizeY=356
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8296
      ObjPosY=-6496
      ObjComment="Pod"
      DrawWidth=1006
      DrawHeight=356
      Name="SequenceFrame_32"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_27
      SizeX=923
      SizeY=445
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9360
      ObjPosY=-4896
      ObjComment="Key 3"
      DrawWidth=923
      DrawHeight=445
      Name="SequenceFrame_27"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_26
      SizeX=846
      SizeY=377
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9368
      ObjPosY=-5424
      ObjComment="Key 2"
      DrawWidth=846
      DrawHeight=377
      Name="SequenceFrame_26"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_25
      SizeX=878
      SizeY=401
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9416
      ObjPosY=-6072
      ObjComment="Key 1"
      DrawWidth=878
      DrawHeight=401
      Name="SequenceFrame_25"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_0
      SizeX=929
      SizeY=332
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9416
      ObjPosY=-6488
      ObjComment="INT set Pod Material"
      DrawWidth=929
      DrawHeight=332
      Name="SequenceFrame_0"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_13
      EventName="ObjectDelivered"
      MaxWidth=221
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_61')),DrawY=-6382,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8162,OverrideDelta=78)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8272
      ObjPosY=-6448
      ObjComment="ObjectDelivered"
      DrawWidth=130
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_13"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_82
      InputLinks(0)=(DrawY=-4811,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4790,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4769,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4790,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_247'),DrawX=-8714,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8663,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8614,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8752
      ObjPosY=-4848
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_82"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
      InputLinks(0)=(DrawY=-5363,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5342,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5321,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5342,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_248'),DrawX=-8762,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8711,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8662,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8800
      ObjPosY=-5400
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_81"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
      InputLinks(0)=(DrawY=-6011,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5990,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5969,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5990,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_246'),DrawX=-8778,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8727,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8678,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8816
      ObjPosY=-6048
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_80"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_61
      InputLinks(0)=(DrawY=-6371,OverrideDelta=14)
      InputLinks(1)=(DrawY=-6350,OverrideDelta=35)
      InputLinks(2)=(DrawY=-6329,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_60')),ActivateDelay=1.000000,DrawY=-6350,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_233'),DrawX=-7930,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-7879,OverrideDelta=76)
      EventLinks(0)=(DrawX=-7830,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7968
      ObjPosY=-6408
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_61"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_60
      InputLinks(0)=(DrawY=-6395,OverrideDelta=14)
      InputLinks(1)=(DrawY=-6374,ActivateDelay=5.500000,OverrideDelta=35)
      InputLinks(2)=(DrawY=-6353,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_60',InputLinkIdx=1)),DrawY=-6374,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_235'),DrawX=-7594,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-7543,OverrideDelta=76)
      EventLinks(0)=(DrawX=-7494,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7632
      ObjPosY=-6432
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_60"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
      InputLinks(0)=(DrawY=-6387,OverrideDelta=14)
      InputLinks(1)=(DrawY=-6366,ActivateDelay=12.000000,OverrideDelta=35)
      InputLinks(2)=(DrawY=-6345,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-6366,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_253'),DrawX=-8658,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8607,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8558,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8696
      ObjPosY=-6424
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_44"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
      InputLinks(0)=(DrawY=-5883,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5862,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5841,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5862,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_0',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_1',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_2',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_3'),DrawX=-7650,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-7599,OverrideDelta=76)
      EventLinks(0)=(DrawX=-7550,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-7688
      ObjPosY=-5920
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_2"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
      NewMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.ENV_DataTerminal_01_Obj_Highlight_INST'
      InputLinks(0)=(DrawY=-6430,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_44')),DrawY=-6430,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_123'),DrawX=-8859,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8904
      ObjPosY=-6464
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_9"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
      NewMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.ENV_DataTerminal_01_MIC'
      InputLinks(0)=(DrawY=-6286,ActivateDelay=12.000000,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_44',InputLinkIdx=1)),DrawY=-6286,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_123'),DrawX=-8859,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8904
      ObjPosY=-6320
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_5"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_37
      EventName="ObjectDelivered"
      InputLinks(0)=(DrawY=-5110,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5110,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8699,OverrideDelta=109)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8840
      ObjPosY=-5144
      ObjComment="ObjectDelivered"
      DrawWidth=282
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_37"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_34
      EventName="ObjectDelivered"
      InputLinks(0)=(DrawY=-5734,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5734,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8715,OverrideDelta=109)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8856
      ObjPosY=-5768
      ObjComment="ObjectDelivered"
      DrawWidth=282
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_34"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_33
      EventName="ObjectDelivered"
      InputLinks(0)=(DrawY=-4542,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4542,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8667,OverrideDelta=109)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8808
      ObjPosY=-4576
      ObjComment="ObjectDelivered"
      DrawWidth=282
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_33"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_5
      Originator=KFMapObjective_CollectActors'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_CollectActors_0'
      MaxWidth=397
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_2')),DrawY=-5884,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_2',InputLinkIdx=1)),DrawY=-5864,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-8026,OverrideDelta=166)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-8224
      ObjPosY=-5952
      ObjName="KFMapObjective_CollectActors_0 Map Objective Activated"
      DrawWidth=246
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_5"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_0
      Originator=KFMapObjective_CollectActors'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_CollectActors_0'
      MaxWidth=397
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_SetMaterial_9')),DrawY=-6372,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_SetMaterial_5')),DrawY=-6352,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-9194,OverrideDelta=166)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9392
      ObjPosY=-6440
      ObjName="KFMapObjective_CollectActors_0 Map Objective Activated"
      DrawWidth=246
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_0"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_4
      Originator=KFObjectiveCollectActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFObjectiveCollectActor_1'
      MaxWidth=330
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_82')),DrawY=-4683,OverrideDelta=14)
      OutputLinks(1)=(DrawY=-4661,OverrideDelta=36)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_82',InputLinkIdx=1)),DrawY=-4639,OverrideDelta=58)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_ActivateRemoteEvent_33')),DrawY=-4617,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9344
      ObjPosY=-4752
      ObjName="KFObjectiveCollectActor_1 Collect Trigger Event"
      DrawWidth=229
      Name="KFSeqEvent_CollectTrigger_4"
      ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
   End Object
   Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_3
      Originator=KFObjectiveCollectActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFObjectiveCollectActor_0'
      MaxWidth=330
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_81')),DrawY=-5251,OverrideDelta=14)
      OutputLinks(1)=(DrawY=-5229,OverrideDelta=36)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_81',InputLinkIdx=1)),DrawY=-5207,OverrideDelta=58)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_ActivateRemoteEvent_37')),DrawY=-5185,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9344
      ObjPosY=-5320
      ObjName="KFObjectiveCollectActor_0 Collect Trigger Event"
      DrawWidth=229
      Name="KFSeqEvent_CollectTrigger_3"
      ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
   End Object
   Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_2
      Originator=KFObjectiveCollectActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFObjectiveCollectActor_14'
      MaxWidth=338
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_80')),DrawY=-5907,OverrideDelta=14)
      OutputLinks(1)=(DrawY=-5885,OverrideDelta=36)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_80',InputLinkIdx=1)),DrawY=-5863,OverrideDelta=58)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_ActivateRemoteEvent_34')),DrawY=-5841,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport'
      ObjPosX=-9392
      ObjPosY=-5976
      ObjName="KFObjectiveCollectActor_14 Collect Trigger Event"
      DrawWidth=233
      Name="KFSeqEvent_CollectTrigger_2"
      ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
   End Object
   SequenceObjects(0)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SequenceFrame_0'
   SequenceObjects(1)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SequenceFrame_32'
   SequenceObjects(2)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SequenceFrame_27'
   SequenceObjects(3)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SequenceFrame_26'
   SequenceObjects(4)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SequenceFrame_25'
   SequenceObjects(5)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.KFSeqEvent_MapObjectiveActivated_0'
   SequenceObjects(6)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_123'
   SequenceObjects(7)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_SetMaterial_5'
   SequenceObjects(8)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_SetMaterial_9'
   SequenceObjects(9)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_253'
   SequenceObjects(10)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_44'
   SequenceObjects(11)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_ActivateRemoteEvent_33'
   SequenceObjects(12)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_ActivateRemoteEvent_37'
   SequenceObjects(13)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_235'
   SequenceObjects(14)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_60'
   SequenceObjects(15)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_ActivateRemoteEvent_34'
   SequenceObjects(16)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqEvent_RemoteEvent_13'
   SequenceObjects(17)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_233'
   SequenceObjects(18)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_61'
   SequenceObjects(19)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_248'
   SequenceObjects(20)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_247'
   SequenceObjects(21)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_82'
   SequenceObjects(22)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_81'
   SequenceObjects(23)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_246'
   SequenceObjects(24)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_80'
   SequenceObjects(25)=KFSeqEvent_CollectTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.KFSeqEvent_CollectTrigger_4'
   SequenceObjects(26)=KFSeqEvent_CollectTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.KFSeqEvent_CollectTrigger_3'
   SequenceObjects(27)=KFSeqEvent_CollectTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.KFSeqEvent_CollectTrigger_2'
   SequenceObjects(28)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SequenceFrame_44'
   SequenceObjects(29)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.KFSeqEvent_MapObjectiveActivated_5'
   SequenceObjects(30)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqAct_Toggle_2'
   SequenceObjects(31)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_0'
   SequenceObjects(32)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SequenceFrame_34'
   SequenceObjects(33)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_1'
   SequenceObjects(34)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_2'
   SequenceObjects(35)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_2_Transport.SeqVar_Object_3'
   DefaultViewX=4192
   DefaultViewY=2876
   DefaultViewZoom=0.400000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-7976
   ObjName="Obj_2_Transport"
   DrawWidth=120
   DrawHeight=29
   Name="Obj_2_Transport"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_3_Exterminate
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_30'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-7792
      ObjPosY=-5840
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_12"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_29'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-7864
      ObjPosY=-5840
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_11"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
      ExpectedType=Class'Engine.SeqVar_Bool'
      FindVarName="AllPlayersDead"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8944
      ObjPosY=-6264
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_6"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
      bValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8856
      ObjPosY=-6264
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_11"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_39
      SizeX=1007
      SizeY=433
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-9528
      ObjPosY=-6112
      ObjComment="VO"
      DrawWidth=1007
      DrawHeight=433
      Name="SequenceFrame_39"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_1
      SizeX=2062
      SizeY=1014
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-9608
      ObjPosY=-6640
      ObjComment="Obj 3 - Exterminate"
      DrawWidth=2062
      DrawHeight=1014
      Name="SequenceFrame_1"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_0
      SizeX=795
      SizeY=388
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8416
      ObjPosY=-6080
      ObjComment="Ammo Toggle"
      DrawWidth=795
      DrawHeight=388
      Name="SequenceFrame_0"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_6
      ConsoleEventName="Rage"
      MaxWidth=151
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetMonsterProperties'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqAct_SetMonsterProperties_0')),DrawY=-6518,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8261,OverrideDelta=43)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8336
      ObjPosY=-6584
      DrawWidth=95
      DrawHeight=128
      Name="SeqEvent_Console_6"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
      ConsoleEventName="NoRage"
      MaxWidth=168
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetMonsterProperties'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqAct_SetMonsterProperties_0',InputLinkIdx=1)),DrawY=-6254,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8252,OverrideDelta=52)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8336
      ObjPosY=-6320
      DrawWidth=104
      DrawHeight=128
      Name="SeqEvent_Console_4"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_5
      InputLinks(0)=(DrawY=-6346,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-6356,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_9')),DrawY=-6336,OverrideDelta=33)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Named_6'),DrawX=-8899,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Bool_11'),DrawX=-8849,OverrideDelta=59)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8928
      ObjPosY=-6392
      DrawWidth=115
      DrawHeight=85
      Name="SeqCond_CompareBool_5"
      ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
      InputLinks(0)=(DrawY=-5987,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5966,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5945,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5966,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Object_11',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Object_12'),DrawX=-7794,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-7743,OverrideDelta=76)
      EventLinks(0)=(DrawX=-7694,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-7832
      ObjPosY=-6024
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_5"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
      EventName="StopCloningMachines"
      InputLinks(0)=(DrawY=-6334,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetMonsterProperties'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqAct_SetMonsterProperties_0',InputLinkIdx=1)),DrawY=-6334,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8562,OverrideDelta=126)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8720
      ObjPosY=-6368
      ObjComment="StopCloningMachines"
      DrawWidth=317
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_9"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_8
      EventName="SpeedUpCloningMachines"
      InputLinks(0)=(DrawY=-6454,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetMonsterProperties'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqAct_SetMonsterProperties_0')),DrawY=-6454,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8556,OverrideDelta=140)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8728
      ObjPosY=-6488
      ObjComment="SpeedUpCloningMachines"
      DrawWidth=344
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_8"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_51
      EventName="PlayExterminateVO_75"
      InputLinks(0)=(DrawY=-5854,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5854,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8781,OverrideDelta=131)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8944
      ObjPosY=-5888
      DrawWidth=326
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_51"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_50
      EventName="PlayExterminateVO_50"
      InputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8781,OverrideDelta=131)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8944
      ObjPosY=-5976
      DrawWidth=326
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_50"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_49
      EventName="PlayExterminateVO_25"
      InputLinks(0)=(DrawY=-6022,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6022,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8773,OverrideDelta=131)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8936
      ObjPosY=-6056
      DrawWidth=326
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_49"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_48
      EventName="PlayExterminateVO_Complete"
      InputLinks(0)=(DrawY=-5750,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5750,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8751,OverrideDelta=153)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8936
      ObjPosY=-5784
      DrawWidth=371
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_48"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_2
      Originator=KFMapObjective_ExterminateWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_1'
      MaxWidth=424
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_Toggle_5')),DrawY=-5988,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_Toggle_5',InputLinkIdx=1)),DrawY=-5968,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-8180,OverrideDelta=180)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8392
      ObjPosY=-6056
      ObjName="KFMapObjective_ExterminateWave_1 Map Objective Activated"
      DrawWidth=260
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_2"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_1
      Originator=KFMapObjective_ExterminateWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_1'
      MaxWidth=424
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_8')),DrawY=-6460,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqCond_CompareBool_5')),DrawY=-6440,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-9308,OverrideDelta=180)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-9520
      ObjPosY=-6528
      ObjName="KFMapObjective_ExterminateWave_1 Map Objective Activated"
      DrawWidth=260
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_1"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_ExterminateWavePct Name=KFSeqEvent_ExterminateWavePct_0
      ProgressThresholds(0)=0.250000
      ProgressThresholds(1)=0.500000
      ProgressThresholds(2)=0.750000
      ProgressThresholds(3)=1.000000
      Originator=KFMapObjective_ExterminateWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_1'
      MaxWidth=484
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_49')),LinkDesc="Wave Completion Percent: 0.25",DrawY=-6019,OverrideDelta=14)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_50')),LinkDesc="Wave Completion Percent: 0.50",DrawY=-5997,OverrideDelta=36)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_51')),LinkDesc="Wave Completion Percent: 0.75",DrawY=-5975,OverrideDelta=58)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_48')),LinkDesc="Wave Completion Percent: 1.00",DrawY=-5953,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-9504
      ObjPosY=-6088
      ObjName="KFMapObjective_ExterminateWave_1 Exterminate Wave Completion Pct"
      DrawWidth=355
      Name="KFSeqEvent_ExterminateWavePct_0"
      ObjectArchetype=KFSeqEvent_ExterminateWavePct'kfgamecontent.Default__KFSeqEvent_ExterminateWavePct'
   End Object
   Begin Object Class=KFSeqAct_SetMonsterProperties Name=KFSeqAct_SetMonsterProperties_0
      MonsterProperties(0)=(Type=EMonsterProperties_Sprinting,bFutureZeds=True,bCurrentZeds=True)
      InputLinks(0)=(DrawY=-6404,OverrideDelta=13)
      InputLinks(1)=(DrawY=-6384,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-6394,OverrideDelta=23)
      VariableLinks(0)=(DrawX=-8015,OverrideDelta=59)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate'
      ObjPosX=-8096
      ObjPosY=-6440
      DrawWidth=162
      DrawHeight=85
      Name="KFSeqAct_SetMonsterProperties_0"
      ObjectArchetype=KFSeqAct_SetMonsterProperties'KFGame.Default__KFSeqAct_SetMonsterProperties'
   End Object
   SequenceObjects(0)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SequenceFrame_39'
   SequenceObjects(1)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_48'
   SequenceObjects(2)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_51'
   SequenceObjects(3)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_50'
   SequenceObjects(4)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_49'
   SequenceObjects(5)=KFSeqEvent_ExterminateWavePct'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqEvent_ExterminateWavePct_0'
   SequenceObjects(6)=SeqEvent_Console'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqEvent_Console_4'
   SequenceObjects(7)=SeqEvent_Console'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqEvent_Console_6'
   SequenceObjects(8)=KFSeqAct_SetMonsterProperties'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqAct_SetMonsterProperties_0'
   SequenceObjects(9)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_8'
   SequenceObjects(10)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_ActivateRemoteEvent_9'
   SequenceObjects(11)=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqCond_CompareBool_5'
   SequenceObjects(12)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Bool_11'
   SequenceObjects(13)=SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Named_6'
   SequenceObjects(14)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqEvent_MapObjectiveActivated_1'
   SequenceObjects(15)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SequenceFrame_1'
   SequenceObjects(16)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqAct_Toggle_5'
   SequenceObjects(17)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.KFSeqEvent_MapObjectiveActivated_2'
   SequenceObjects(18)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Object_11'
   SequenceObjects(19)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SequenceFrame_0'
   SequenceObjects(20)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_3_Exterminate.SeqVar_Object_12'
   DefaultViewX=4053
   DefaultViewY=2834
   DefaultViewZoom=0.400000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-7912
   ObjName="Obj_3_Exterminate"
   DrawWidth=134
   DrawHeight=29
   Name="Obj_3_Exterminate"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=OBJ_4_OperateAndControl
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_35'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6792
      ObjPosY=-6216
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_96"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
      ObjValue=KFTrigger_ObjectiveLever'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_1'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7920
      ObjPosY=-6224
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_80"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_35'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5808
      ObjPosY=-5144
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_79"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_36'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5896
      ObjPosY=-5144
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_78"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_33'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6000
      ObjPosY=-5144
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_77"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_34'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6096
      ObjPosY=-5144
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_76"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_11'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6200
      ObjPosY=-5144
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_71"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
      ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_11'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6016
      ObjPosY=-5272
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_60"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
      ObjValue=KFMGVolume_SwingHit'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMGVolume_SwingHit_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5992
      ObjPosY=-4848
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_30"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
      ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_2'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7544
      ObjPosY=-5008
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_238"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_13'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7360
      ObjPosY=-4848
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_237"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_236
      ObjValue=TargetPoint'KF-BIOTICSLAB.TheWorld:PersistentLevel.TargetPoint_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8472
      ObjPosY=-5096
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_236"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_23'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6888
      ObjPosY=-6216
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_121"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
      ExpectedType=Class'Engine.SeqVar_Bool'
      FindVarName="Lever1Active"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7824
      ObjPosY=-4608
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_9"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
      ExpectedType=Class'Engine.SeqVar_Bool'
      FindVarName="Lever1Active"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8168
      ObjPosY=-5240
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_11"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
      ExpectedType=Class'Engine.SeqVar_Bool'
      FindVarName="Lever1Active"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7952
      ObjPosY=-5424
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_1"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
      bValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7864
      ObjPosY=-5424
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_8"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_5
      VarName="Lever1Active"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8488
      ObjPosY=-4944
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_5"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
      bValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8256
      ObjPosY=-5240
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_4"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7912
      ObjPosY=-4608
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_14"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_7
      SizeX=1609
      SizeY=1236
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8744
      ObjPosY=-5672
      ObjComment="Button"
      DrawWidth=1609
      DrawHeight=1236
      Name="SequenceFrame_7"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_6
      SizeX=1138
      SizeY=729
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6416
      ObjPosY=-6504
      ObjComment="Zone Status"
      DrawWidth=1138
      DrawHeight=729
      Name="SequenceFrame_6"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_5
      SizeX=1509
      SizeY=1015
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6912
      ObjPosY=-5584
      ObjComment="Freeze"
      DrawWidth=1509
      DrawHeight=1015
      Name="SequenceFrame_5"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_3
      SizeX=4462
      SizeY=3147
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-9208
      ObjPosY=-7152
      ObjComment="Obj 4 - Operate and Control"
      DrawWidth=4462
      DrawHeight=3147
      Name="SequenceFrame_3"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_22
      SizeX=1015
      SizeY=571
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8728
      ObjPosY=-6512
      ObjComment="Setup"
      DrawWidth=1015
      DrawHeight=571
      Name="SequenceFrame_22"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_21
      SizeX=1080
      SizeY=541
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7608
      ObjPosY=-6496
      ObjComment="Ammo Toggle"
      DrawWidth=1080
      DrawHeight=541
      Name="SequenceFrame_21"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_27
      EventName="LeverPulled1"
      MaxWidth=199
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetBool_1')),DrawY=-4582,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8157,OverrideDelta=67)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8256
      ObjPosY=-4648
      ObjComment="LeverPulled1"
      DrawWidth=119
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_27"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_18
      EventName="LeverReady1"
      MaxWidth=201
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Switch_2'),(LinkedOp=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetBool_3')),DrawY=-5294,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8420,OverrideDelta=68)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8520
      ObjPosY=-5360
      ObjComment="LeverReady1"
      DrawWidth=120
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_18"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_17
      EventName="Obj3Deactivated"
      MaxWidth=227
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetMaterial_34'),(LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Gate_3',InputLinkIdx=2)),ActivateDelay=0.100000,DrawY=-5038,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8151,OverrideDelta=81)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8264
      ObjPosY=-5104
      ObjComment="Obj3Deactivated"
      DrawWidth=133
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_17"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_16
      EventName="ZoneEnabled1"
      MaxWidth=209
      OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqCond_CompareBool_0'),(LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Gate_3',InputLinkIdx=1)),DrawY=-5550,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8208,OverrideDelta=72)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8312
      ObjPosY=-5616
      ObjComment="ZoneEnabled1"
      DrawWidth=124
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_16"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_14
      EventName="ZoneDisabled1"
      MaxWidth=212
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Gate_3',InputLinkIdx=2),(LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetMaterial_34')),DrawY=-4846,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8046,OverrideDelta=74)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8152
      ObjPosY=-4912
      ObjComment="ZoneDisabled1"
      DrawWidth=126
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_14"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
      EventName="LeverPulled1"
      MaxWidth=199
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_62'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_6')),DrawY=-5142,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-6565,OverrideDelta=67)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6664
      ObjPosY=-5208
      ObjComment="LeverPulled1"
      DrawWidth=119
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_0"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
      ConsoleEventName="cold"
      MaxWidth=146
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_62')),DrawY=-4854,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-6647,OverrideDelta=41)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6720
      ObjPosY=-4920
      DrawWidth=93
      DrawHeight=128
      Name="SeqEvent_Console_3"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
      InputLinks(0)=(DrawY=-5498,OverrideDelta=23)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetMaterial_35')),DrawY=-5508,OverrideDelta=13)
      OutputLinks(1)=(DrawY=-5488,OverrideDelta=33)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Named_1'),DrawX=-7899,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Bool_8'),DrawX=-7849,OverrideDelta=59)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7928
      ObjPosY=-5544
      DrawWidth=115
      DrawHeight=85
      Name="SeqCond_CompareBool_0"
      ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
      InputLinks(0)=(DrawY=-4971,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4950,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4929,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4950,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_237'),DrawX=-7346,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-7295,OverrideDelta=76)
      EventLinks(0)=(DrawX=-7246,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7384
      ObjPosY=-5008
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_63"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_62
      InputLinks(0)=(DrawY=-4995,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4974,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4953,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Delay_7')),DrawY=-4974,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_30'),DrawX=-6234,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-6183,OverrideDelta=76)
      EventLinks(0)=(DrawX=-6134,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6272
      ObjPosY=-5032
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_62"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
      InputLinks(0)=(DrawY=-5387,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5366,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5345,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Delay_2')),DrawY=-5366,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_71',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_76',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_77',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_78',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_79',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_60'),DrawX=-6266,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-6215,OverrideDelta=76)
      EventLinks(0)=(DrawX=-6166,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6304
      ObjPosY=-5424
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_6"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_56
      InputLinks(0)=(DrawY=-6347,OverrideDelta=14)
      InputLinks(1)=(DrawY=-6326,OverrideDelta=35)
      InputLinks(2)=(DrawY=-6305,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-6326,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_121',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_96'),DrawX=-6818,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-6767,OverrideDelta=76)
      EventLinks(0)=(DrawX=-6718,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6856
      ObjPosY=-6384
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_56"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
      InputLinks(0)=(DrawY=-4995,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4974,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4953,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4974,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_30'),DrawX=-5722,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-5671,OverrideDelta=76)
      EventLinks(0)=(DrawX=-5622,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5760
      ObjPosY=-5032
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_45"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
      InputLinks(0)=(DrawY=-5387,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5366,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5345,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5366,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_71',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_76',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_77',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_78',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_79',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_60'),DrawX=-5754,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-5703,OverrideDelta=76)
      EventLinks(0)=(DrawX=-5654,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5792
      ObjPosY=-5424
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_22"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_2
      LinkCount=4
      bAutoDisableLinks=True
      InputLinks(0)=(DrawY=-5090,OverrideDelta=47)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_AkPostEvent_18')),DrawY=-5123,OverrideDelta=14)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_AkPostEvent_18')),LinkDesc="Link 2",DrawY=-5101,OverrideDelta=36)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_AkPostEvent_18')),LinkDesc="Link 3",DrawY=-5079,OverrideDelta=58)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_AkPostEvent_18')),LinkDesc="Link 4",DrawY=-5057,OverrideDelta=80)
      VariableLinks(0)=(DrawX=-8598,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8632
      ObjPosY=-5160
      DrawWidth=68
      DrawHeight=133
      Name="SeqAct_Switch_2"
      ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_35
      NewMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.ENV_BioticsLab_ComputerConsole_Screens_Green_MIC'
      InputLinks(0)=(DrawY=-5110,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_63')),DrawY=-5110,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_238'),DrawX=-7515,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7560
      ObjPosY=-5144
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_35"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_34
      NewMaterial=Material'ENV_OBJ_MAT.ENV_OutpostOBJ_ScreenStatic_MIC'
      InputLinks(0)=(DrawY=-4822,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_63',InputLinkIdx=1)),DrawY=-4822,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_238'),DrawX=-7523,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7568
      ObjPosY=-4856
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_34"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_3
      InputLinks(0)=(DrawY=-5318,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Gate_3')),DrawY=-5318,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Bool_4'),DrawX=-8206,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Named_11'),DrawX=-8150,OverrideDelta=68)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8240
      ObjPosY=-5352
      DrawWidth=128
      DrawHeight=61
      Name="SeqAct_SetBool_3"
      ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
   End Object
   Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
      InputLinks(0)=(DrawY=-4686,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetMaterial_34')),DrawY=-4686,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Bool_14'),DrawX=-7862,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Named_9'),DrawX=-7806,OverrideDelta=68)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7896
      ObjPosY=-4720
      DrawWidth=128
      DrawHeight=61
      Name="SeqAct_SetBool_1"
      ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
   End Object
   Begin Object Class=SeqAct_Gate Name=SeqAct_Gate_3
      InputLinks(0)=(DrawY=-5163,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5141,OverrideDelta=36)
      InputLinks(2)=(DrawY=-5119,OverrideDelta=58)
      InputLinks(3)=(DrawY=-5097,OverrideDelta=80)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetMaterial_35')),DrawY=-5130,OverrideDelta=47)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7784
      ObjPosY=-5200
      DrawWidth=82
      DrawHeight=117
      Name="SeqAct_Gate_3"
      ObjectArchetype=SeqAct_Gate'Engine.Default__SeqAct_Gate'
   End Object
   Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
      Duration=7.000000
      InputLinks(0)=(DrawY=-4987,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4966,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4945,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_45',InputLinkIdx=1)),DrawY=-4982,OverrideDelta=19)
      OutputLinks(1)=(DrawY=-4950,OverrideDelta=51)
      VariableLinks(0)=(DrawX=-5956,OverrideDelta=25)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6008
      ObjPosY=-5024
      DrawWidth=106
      DrawHeight=109
      Name="SeqAct_Delay_7"
      ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
   End Object
   Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
      Duration=3.000000
      InputLinks(0)=(DrawY=-5379,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5358,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5337,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_22',InputLinkIdx=1)),DrawY=-5374,OverrideDelta=19)
      OutputLinks(1)=(DrawY=-5342,OverrideDelta=51)
      VariableLinks(0)=(DrawX=-5948,OverrideDelta=25)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6000
      ObjPosY=-5416
      DrawWidth=106
      DrawHeight=109
      Name="SeqAct_Delay_2"
      ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_8
      CollisionType=COLLIDE_TouchAllButWeapons
      InputLinks(0)=(DrawY=-6294,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6294,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_80'),DrawX=-7894,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7952
      ObjPosY=-6328
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_8"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_7
      CollisionType=COLLIDE_NoCollision
      InputLinks(0)=(DrawY=-6086,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6086,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_80'),DrawX=-7878,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7936
      ObjPosY=-6120
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_7"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
      bReplicateToClients=True
      Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Console_Ready'
      InputLinks(0)=(DrawY=-5150,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5150,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_236'),DrawX=-8432,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8480
      ObjPosY=-5184
      ObjComment="Lever Ready"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_18"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
      EventName="Obj3Deactivated"
      InputLinks(0)=(DrawY=-6422,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6422,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7960,OverrideDelta=112)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8104
      ObjPosY=-6456
      ObjComment="Obj3Deactivated"
      DrawWidth=288
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_4"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_27
      EventName="LeverPulled1"
      InputLinks(0)=(DrawY=-6350,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6350,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5638,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5768
      ObjPosY=-6384
      ObjComment="LeverPulled1"
      DrawWidth=260
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_27"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_26
      EventName="LeverReady1"
      InputLinks(0)=(DrawY=-6238,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6238,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5637,OverrideDelta=99)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5768
      ObjPosY=-6272
      ObjComment="LeverReady1"
      DrawWidth=262
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_26"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_25
      EventName="ZoneDisabled1"
      InputLinks(0)=(DrawY=-5958,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5958,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5616,OverrideDelta=104)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5752
      ObjPosY=-5992
      ObjComment="ZoneDisabled1"
      DrawWidth=273
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_25"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_20
      EventName="ZoneEnabled1"
      InputLinks(0)=(DrawY=-6110,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6110,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5617,OverrideDelta=103)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-5752
      ObjPosY=-6144
      ObjComment="ZoneEnabled1"
      DrawWidth=270
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_20"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_6
      Originator=KFMapObjective_ActivateTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ActivateTrigger_0'
      MaxWidth=411
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_56')),DrawY=-6348,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_56',InputLinkIdx=1)),DrawY=-6328,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-7299,OverrideDelta=173)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-7504
      ObjPosY=-6416
      ObjName="KFMapObjective_ActivateTrigger_0 Map Objective Activated"
      DrawWidth=253
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_6"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_2
      Originator=KFMapObjective_ActivateTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ActivateTrigger_0'
      MaxWidth=411
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ChangeCollision_8')),DrawY=-6300,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ChangeCollision_7'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_4')),DrawY=-6280,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-8427,OverrideDelta=173)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-8632
      ObjPosY=-6368
      ObjName="KFMapObjective_ActivateTrigger_0 Map Objective Activated"
      DrawWidth=253
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_2"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_ActivateTriggerProgress Name=KFSeqEvent_ActivateTriggerProgress_3
      Originator=KFMapObjective_ActivateTrigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ActivateTrigger_0'
      MaxWidth=415
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_27')),DrawY=-6211,OverrideDelta=14)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_26')),DrawY=-6189,OverrideDelta=36)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_20')),DrawY=-6167,OverrideDelta=58)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_25')),DrawY=-6145,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl'
      ObjPosX=-6344
      ObjPosY=-6280
      ObjName="KFMapObjective_ActivateTrigger_0 Activate Trigger Progress"
      DrawWidth=261
      Name="KFSeqEvent_ActivateTriggerProgress_3"
      ObjectArchetype=KFSeqEvent_ActivateTriggerProgress'KFGame.Default__KFSeqEvent_ActivateTriggerProgress'
   End Object
   SequenceObjects(0)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_96'
   SequenceObjects(1)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_121'
   SequenceObjects(2)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_56'
   SequenceObjects(3)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SequenceFrame_22'
   SequenceObjects(4)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SequenceFrame_6'
   SequenceObjects(5)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SequenceFrame_7'
   SequenceObjects(6)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SequenceFrame_5'
   SequenceObjects(7)=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Switch_2'
   SequenceObjects(8)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqEvent_RemoteEvent_27'
   SequenceObjects(9)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqEvent_RemoteEvent_18'
   SequenceObjects(10)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqEvent_RemoteEvent_17'
   SequenceObjects(11)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqEvent_RemoteEvent_16'
   SequenceObjects(12)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqEvent_RemoteEvent_14'
   SequenceObjects(13)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetMaterial_35'
   SequenceObjects(14)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_238'
   SequenceObjects(15)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetMaterial_34'
   SequenceObjects(16)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_237'
   SequenceObjects(17)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_63'
   SequenceObjects(18)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_AkPostEvent_18'
   SequenceObjects(19)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_236'
   SequenceObjects(20)=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Gate_3'
   SequenceObjects(21)=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqCond_CompareBool_0'
   SequenceObjects(22)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Bool_8'
   SequenceObjects(23)=SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Named_1'
   SequenceObjects(24)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Bool_5'
   SequenceObjects(25)=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetBool_3'
   SequenceObjects(26)=SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Named_11'
   SequenceObjects(27)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Bool_4'
   SequenceObjects(28)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Bool_14'
   SequenceObjects(29)=SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Named_9'
   SequenceObjects(30)=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_SetBool_1'
   SequenceObjects(31)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_6'
   SequenceObjects(32)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_22'
   SequenceObjects(33)=SeqAct_Delay'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Delay_2'
   SequenceObjects(34)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_79'
   SequenceObjects(35)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_78'
   SequenceObjects(36)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_77'
   SequenceObjects(37)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_76'
   SequenceObjects(38)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_71'
   SequenceObjects(39)=SeqEvent_Console'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqEvent_Console_3'
   SequenceObjects(40)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_30'
   SequenceObjects(41)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_45'
   SequenceObjects(42)=SeqAct_Delay'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Delay_7'
   SequenceObjects(43)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_Toggle_62'
   SequenceObjects(44)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqEvent_RemoteEvent_0'
   SequenceObjects(45)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_4'
   SequenceObjects(46)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ChangeCollision_7'
   SequenceObjects(47)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_80'
   SequenceObjects(48)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ChangeCollision_8'
   SequenceObjects(49)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_26'
   SequenceObjects(50)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_27'
   SequenceObjects(51)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_20'
   SequenceObjects(52)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqAct_ActivateRemoteEvent_25'
   SequenceObjects(53)=KFSeqEvent_ActivateTriggerProgress'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.KFSeqEvent_ActivateTriggerProgress_3'
   SequenceObjects(54)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.KFSeqEvent_MapObjectiveActivated_2'
   SequenceObjects(55)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SequenceFrame_3'
   SequenceObjects(56)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.KFSeqEvent_MapObjectiveActivated_6'
   SequenceObjects(57)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SequenceFrame_21'
   SequenceObjects(58)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.OBJ_4_OperateAndControl.SeqVar_Object_60'
   DefaultViewX=5490
   DefaultViewY=4120
   DefaultViewZoom=0.600000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-7848
   ObjName="OBJ_4_OperateAndControl"
   DrawWidth=183
   DrawHeight=29
   Name="OBJ_4_OperateAndControl"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_5_Escort
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_55'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6456
      ObjPosY=-5872
      ObjComment="Drone Explode 2"
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_99"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_31'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6986
      ObjPosY=-4887
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_97"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
      ObjValue=KFTrigger_MinigameButton'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9000
      ObjPosY=-5640
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_9"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
      ObjValue=KFScriptedPawnSpawner'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFScriptedPawnSpawner_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7992
      ObjPosY=-5304
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_85"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_51'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6768
      ObjPosY=-5880
      ObjComment="Drone Explode 1"
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_70"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_15'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8784
      ObjPosY=-5720
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_61"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
      ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8856
      ObjPosY=-4784
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_59"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
      ObjValue=KFTrigger_MinigameButton'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8992
      ObjPosY=-5928
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_39"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_260
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_69'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-4952
      ObjPosY=-5456
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_260"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_259
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_66'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5096
      ObjPosY=-5456
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_259"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_257
      ObjValue=KFTrigger_MinigameButton'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9032
      ObjPosY=-5392
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_257"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_256
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_65'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5088
      ObjPosY=-5376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_256"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_255
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_64'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5184
      ObjPosY=-5376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_255"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_254
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_89'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5360
      ObjPosY=-5248
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_254"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_252
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_67'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5456
      ObjPosY=-5248
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_252"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_130'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5192
      ObjPosY=-5456
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_251"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_68'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5344
      ObjPosY=-5456
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_250"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_37'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5440
      ObjPosY=-5456
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_249"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
      ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_24'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8520
      ObjPosY=-5720
      ObjComment="Button Panel"
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_229"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_37'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5904
      ObjPosY=-5528
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_221"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
      ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_10'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8224
      ObjPosY=-4784
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_195"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_124'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5344
      ObjPosY=-5376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_192"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_21'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6680
      ObjPosY=-4800
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_156"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_34'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6776
      ObjPosY=-4800
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_152"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_33'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6888
      ObjPosY=-4800
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_150"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_32'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6984
      ObjPosY=-4808
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_149"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
      ObjValue=TargetPoint'KF-BIOTICSLAB.TheWorld:PersistentLevel.TargetPoint_18'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6600
      ObjPosY=-5248
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_131"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
      ObjValue=TargetPoint'KF-BIOTICSLAB.TheWorld:PersistentLevel.TargetPoint_4'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6472
      ObjPosY=-5320
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_130"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
      ObjValue=TargetPoint'KF-BIOTICSLAB.TheWorld:PersistentLevel.TargetPoint_17'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6640
      ObjPosY=-5456
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_129"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_63'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5440
      ObjPosY=-5376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_117"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
      ObjValue=MaterialInstanceActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.MaterialInstanceActor_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5984
      ObjPosY=-5520
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_115"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_43'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6152
      ObjPosY=-5856
      ObjComment="Drone Explode 3"
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_113"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Float Name=SeqVar_Float_2
      FloatValue=400.000000
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7696
      ObjPosY=-5320
      ObjComment="Health"
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Float_2"
      ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
   End Object
   Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
      FloatValue=400.000000
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7856
      ObjPosY=-5320
      ObjComment="Health"
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Float_0"
      ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_36
      SizeX=2316
      SizeY=940
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7168
      ObjPosY=-6088
      ObjComment="Explode Drone"
      DrawWidth=2316
      DrawHeight=940
      Name="SequenceFrame_36"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_35
      SizeX=1982
      SizeY=844
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9472
      ObjPosY=-6064
      ObjComment="Enable Trigger, Then Spawn Drone"
      DrawWidth=1982
      DrawHeight=844
      Name="SequenceFrame_35"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_33
      SizeX=4796
      SizeY=1788
      BorderWidth=5
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9488
      ObjPosY=-6336
      ObjComment="Obj 5 - Escort"
      DrawWidth=4796
      DrawHeight=1788
      Name="SequenceFrame_33"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_2
      SizeX=914
      SizeY=412
      bDrawBox=True
      BorderColor=(B=255,G=94,R=0,A=255)
      FillColor=(B=255,G=173,R=0,A=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7152
      ObjPosY=-5576
      ObjComment="Obj 5 - Escort (Drone Explosions)"
      DrawWidth=914
      DrawHeight=412
      Name="SequenceFrame_2"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_1
      SizeX=1401
      SizeY=585
      BorderWidth=5
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9432
      ObjPosY=-5160
      ObjComment="Escort Door 1"
      DrawWidth=1401
      DrawHeight=585
      Name="SequenceFrame_1"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
      ClassProximityTypes(0)=Class'KFGame.KFPawn_Scripted'
      ClassProximityTypes(1)=()
      Originator=Trigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.Trigger_3'
      MaxWidth=118
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_AkPostEvent_31'),(LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_AkPostEvent_34'),(LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_AkPostEvent_25')),DrawY=-5459,OverrideDelta=14)
      OutputLinks(1)=(DrawY=-5438,OverrideDelta=35)
      OutputLinks(2)=(DrawY=-5417,OverrideDelta=56)
      VariableLinks(0)=(DrawX=-7045,OverrideDelta=27)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7104
      ObjPosY=-5528
      ObjName="Trigger_3 Touch"
      DrawWidth=104
      DrawHeight=176
      Name="SeqEvent_Touch_7"
      ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
   End Object
   Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
      ClassProximityTypes(0)=Class'KFGame.KFPawn_Scripted'
      Originator=Trigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.Trigger_0'
      MaxTriggerCount=0
      MaxWidth=118
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_3')),DrawY=-4963,OverrideDelta=14)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_3',InputLinkIdx=1)),DrawY=-4942,OverrideDelta=35)
      OutputLinks(2)=(DrawY=-4921,OverrideDelta=56)
      VariableLinks(0)=(DrawX=-8533,OverrideDelta=27)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8592
      ObjPosY=-5032
      ObjName="Trigger_0 Touch"
      DrawWidth=104
      DrawHeight=176
      Name="SeqEvent_Touch_4"
      ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
   End Object
   Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
      ClassProximityTypes(0)=Class'KFGame.KFPawn_Scripted'
      ClassProximityTypes(1)=()
      Originator=Trigger'KF-BIOTICSLAB.TheWorld:PersistentLevel.Trigger_3'
      MaxWidth=118
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_41'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ActivateRemoteEvent_45')),DrawY=-5979,OverrideDelta=14)
      OutputLinks(1)=(DrawY=-5958,OverrideDelta=35)
      OutputLinks(2)=(DrawY=-5937,OverrideDelta=56)
      VariableLinks(0)=(DrawX=-7085,OverrideDelta=27)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7144
      ObjPosY=-6048
      ObjName="Trigger_3 Touch"
      DrawWidth=104
      DrawHeight=176
      Name="SeqEvent_Touch_0"
      ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
      EventName="OBJ_Escort_OpenDoor1"
      MaxWidth=271
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_21')),DrawY=-4958,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-9201,OverrideDelta=103)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9336
      ObjPosY=-5024
      DrawWidth=155
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_4"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
      EventName="OBJ_EnableWave_5"
      MaxWidth=245
      OutputLinks(0)=(DrawY=-6190,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-9294,OverrideDelta=90)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9416
      ObjPosY=-6256
      DrawWidth=142
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_1"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_64
      InputLinks(0)=(DrawY=-5603,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5582,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5561,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5582,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_249',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_250',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_117',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_192',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_251',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_255',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_256',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_259',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_260',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_252',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_254'),DrawX=-5226,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-5175,OverrideDelta=76)
      EventLinks(0)=(DrawX=-5126,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5264
      ObjPosY=-5640
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_64"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
      InputLinks(0)=(DrawY=-6011,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5990,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5969,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_23')),ActivateDelay=0.300000,DrawY=-5990,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_99'),DrawX=-6418,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-6367,OverrideDelta=76)
      EventLinks(0)=(DrawX=-6318,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6456
      ObjPosY=-6048
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_55"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
      InputLinks(0)=(DrawY=-6027,OverrideDelta=14)
      InputLinks(1)=(DrawY=-6006,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5985,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_55')),ActivateDelay=0.400000,DrawY=-6006,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_70'),DrawX=-6722,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-6671,OverrideDelta=76)
      EventLinks(0)=(DrawX=-6622,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6760
      ObjPosY=-6064
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_41"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
      InputLinks(0)=(DrawY=-5451,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5430,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5409,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_SetMaterial_30')),DrawY=-5430,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_61'),DrawX=-8802,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8751,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8702,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8840
      ObjPosY=-5488
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_33"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
      InputLinks(0)=(DrawY=-4979,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4958,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4937,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4958,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_97',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_149',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_150',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_152',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_156'),DrawX=-6954,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-6849,OverrideDelta=130)
      EventLinks(0)=(DrawX=-6897,OverrideDelta=76)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6992
      ObjPosY=-5016
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_32"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
      InputLinks(0)=(DrawY=-5963,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5942,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5921,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_SetMaterial_31')),DrawY=-5942,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_61'),DrawX=-8738,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8687,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8638,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8776
      ObjPosY=-6000
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_27"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
      InputLinks(0)=(DrawY=-5995,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5974,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5953,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5974,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_113'),DrawX=-6122,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-6071,OverrideDelta=76)
      EventLinks(0)=(DrawX=-6022,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6160
      ObjPosY=-6032
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_23"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_31
      NewMaterial=MaterialInstanceConstant'KF-BIOTICSLAB.ENV_BioticsLab_LargeMicroscope_Obj_Highlight'
      InputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_229'),DrawX=-8451,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8496
      ObjPosY=-5976
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_31"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_30
      NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_MAT.lab.ENV_BioticsLab_LargeMicroscope_MIC'
      InputLinks(0)=(DrawY=-5430,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ActivateRemoteEvent_5')),DrawY=-5430,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_229'),DrawX=-8531,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8576
      ObjPosY=-5464
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_30"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
      PlayRate=2.000000
      InputLinks(0)=(DrawY=-4962,OverrideDelta=15)
      InputLinks(1)=(DrawY=-4940,OverrideDelta=37)
      InputLinks(2)=(DrawY=-4918,OverrideDelta=59)
      InputLinks(3)=(DrawY=-4896,OverrideDelta=81)
      InputLinks(4)=(DrawY=-4874,OverrideDelta=103)
      OutputLinks(0)=(DrawY=-4946,OverrideDelta=31)
      OutputLinks(1)=(DrawY=-4890,OverrideDelta=87)
      VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_21'),DrawX=-8287,OverrideDelta=34)
      VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_195'),LinkDesc="Door1",MinVars=0,DrawX=-8236,OverrideDelta=81)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8336
      ObjPosY=-5000
      DrawWidth=154
      DrawHeight=157
      Name="SeqAct_Interp_3"
      ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
   End Object
   Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_21
      PlayRate=2.000000
      InputLinks(0)=(DrawY=-4962,OverrideDelta=15)
      InputLinks(1)=(DrawY=-4940,OverrideDelta=37)
      InputLinks(2)=(DrawY=-4918,OverrideDelta=59)
      InputLinks(3)=(DrawY=-4896,OverrideDelta=81)
      InputLinks(4)=(DrawY=-4874,OverrideDelta=103)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_21',InputLinkIdx=1)),ActivateDelay=5.000000,DrawY=-4946,OverrideDelta=31)
      OutputLinks(1)=(DrawY=-4890,OverrideDelta=87)
      VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_1'),DrawX=-8919,OverrideDelta=34)
      VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_59'),LinkDesc="Door1",MinVars=0,DrawX=-8868,OverrideDelta=81)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8968
      ObjPosY=-5000
      DrawWidth=154
      DrawHeight=157
      Name="SeqAct_Interp_21"
      ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
   End Object
   Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_19
      InputLinks(0)=(DrawY=-5674,OverrideDelta=15)
      InputLinks(1)=(DrawY=-5652,OverrideDelta=37)
      InputLinks(2)=(DrawY=-5630,OverrideDelta=59)
      InputLinks(3)=(DrawY=-5608,OverrideDelta=81)
      InputLinks(4)=(DrawY=-5586,OverrideDelta=103)
      OutputLinks(0)=(DrawY=-5667,OverrideDelta=22)
      OutputLinks(1)=(DrawY=-5630,OverrideDelta=59)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ActivateRemoteEvent_47')),LinkDesc="SwapParticlesToPoison",DrawY=-5593,OverrideDelta=96)
      VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19'),DrawX=-6007,OverrideDelta=42)
      VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_115'),LinkDesc="Blood_Color",MinVars=0,DrawX=-5954,OverrideDelta=89)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_221'),LinkDesc="Events",MinVars=0,DrawX=-5894,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6064
      ObjPosY=-5712
      DrawWidth=236
      DrawHeight=173
      Name="SeqAct_Interp_19"
      ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_3
      CollisionType=COLLIDE_NoCollision
      InputLinks(0)=(DrawY=-5430,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_33',InputLinkIdx=1)),DrawY=-5430,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_257'),DrawX=-8998,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9056
      ObjPosY=-5464
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_3"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_0
      CollisionType=COLLIDE_TouchAllButWeapons
      InputLinks(0)=(DrawY=-5966,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_27')),DrawY=-5966,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_39'),DrawX=-8958,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9016
      ObjPosY=-6000
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_0"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_34
      bReplicateToClients=True
      Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Drone_Explode'
      InputLinks(0)=(DrawY=-5366,ActivateDelay=0.400000,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5366,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_130'),DrawX=-6440,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6488
      ObjPosY=-5400
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_34"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_31
      bReplicateToClients=True
      Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Drone_Explode'
      InputLinks(0)=(DrawY=-5502,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5502,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_129'),DrawX=-6607,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6655
      ObjPosY=-5536
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_31"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
      bReplicateToClients=True
      Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Drone_Explode'
      InputLinks(0)=(DrawY=-5294,ActivateDelay=0.700000,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5294,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_131'),DrawX=-6568,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6616
      ObjPosY=-5328
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_25"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
      EventName="OBJ_Escort_OpenDoor1"
      InputLinks(0)=(DrawY=-5438,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_StartScriptedPawn'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqAct_StartScriptedPawn_0')),DrawY=-5438,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8242,OverrideDelta=134)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8408
      ObjPosY=-5472
      DrawWidth=332
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_5"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_47
      EventName="RemoveBloodSprayFX"
      InputLinks(0)=(DrawY=-5590,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_64')),DrawY=-5590,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5553,OverrideDelta=127)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-5712
      ObjPosY=-5624
      DrawWidth=319
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_47"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_45
      EventName="RemoveBloodFX"
      InputLinks(0)=(DrawY=-5670,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_19')),DrawY=-5670,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-6316,OverrideDelta=108)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6456
      ObjPosY=-5704
      DrawWidth=281
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_45"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_0
      Originator=KFTrigger_MinigameButton'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_MinigameButton_0'
      MaxWidth=337
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqAct_ShowPath_3',InputLinkIdx=1)),DrawY=-5467,OverrideDelta=14)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ChangeCollision_3')),DrawY=-5445,OverrideDelta=36)
      OutputLinks(2)=(DrawY=-5423,OverrideDelta=58)
      OutputLinks(3)=(DrawY=-5401,OverrideDelta=80)
      VariableLinks(0)=(DrawX=-9264,OverrideDelta=136)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9432
      ObjPosY=-5536
      ObjName="KFTrigger_MinigameButton_0 Minigame Activation"
      DrawWidth=238
      DrawHeight=200
      Name="KFSeqEvent_MinigameActivated_0"
      ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_9
      Originator=KFMapObjective_EscortPawns'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_EscortPawns_3'
      MaxWidth=393
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_32')),DrawY=-4972,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_32',InputLinkIdx=1)),DrawY=-4952,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-7284,OverrideDelta=164)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-7480
      ObjPosY=-5040
      ObjName="KFMapObjective_EscortPawns_3 Map Objective Activated"
      DrawWidth=244
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_9"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_0
      Originator=KFMapObjective_EscortPawns'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_EscortPawns_3'
      MaxWidth=393
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ChangeCollision_0'),(LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqAct_ShowPath_3')),DrawY=-5972,OverrideDelta=13)
      OutputLinks(1)=(DrawY=-5952,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-9252,OverrideDelta=164)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9448
      ObjPosY=-6040
      ObjName="KFMapObjective_EscortPawns_3 Map Objective Activated"
      DrawWidth=244
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_0"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqAct_StartScriptedPawn Name=KFSeqAct_StartScriptedPawn_0
      bSpawnInactivePawn=True
      InputLinks(0)=(DrawY=-5442,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-5452,OverrideDelta=13)
      OutputLinks(1)=(DrawY=-5432,OverrideDelta=33)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_85'),DrawX=-7957,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Float_0'),DrawX=-7830,OverrideDelta=134)
      VariableLinks(2)=(LinkedVariables=(SeqVar_Float'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Float_2'),DrawX=-7683,OverrideDelta=270)
      VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Targets",PropertyName="Targets",MinVars=0,DrawX=-7570,OverrideDelta=429)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8024
      ObjPosY=-5488
      DrawWidth=496
      DrawHeight=101
      Name="KFSeqAct_StartScriptedPawn_0"
      ObjectArchetype=KFSeqAct_StartScriptedPawn'KFGame.Default__KFSeqAct_StartScriptedPawn'
   End Object
   Begin Object Class=KFSeqAct_ShowPath Name=KFSeqAct_ShowPath_3
      TrailParticleSystem=ParticleSystem'FX_Gameplay_EMIT.FX_Objective_White_Trail'
      InputLinks(0)=(DrawY=-5748,OverrideDelta=13)
      InputLinks(1)=(DrawY=-5728,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-5738,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_9'),DrawX=-8979,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8903,OverrideDelta=106)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-9032
      ObjPosY=-5784
      DrawWidth=169
      DrawHeight=101
      Name="KFSeqAct_ShowPath_3"
      ObjectArchetype=KFSeqAct_ShowPath'KFGame.Default__KFSeqAct_ShowPath'
   End Object
   Begin Object Class=InterpData Name=InterpData_21
      Begin Object Class=InterpGroup Name=InterpGroup_0
         Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
            PosTrack=(Points=((OutVal=(X=0.000000,Y=-0.000488,Z=-0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=-0.000977,Z=239.999908),InterpMode=CIM_CurveAutoClamped)))
            EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped)))
            LookupTrack=(Points=(,(Time=2.000000)))
            MoveFrame=IMF_RelativeToInitial
            Name="InterpTrackMove_0"
            ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
         End Object
         InterpTracks(0)=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_21.InterpGroup_0.InterpTrackMove_0'
         GroupName="Door1"
         GroupColor=(B=140,G=194,R=0,A=255)
         Name="InterpGroup_0"
         ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
      End Object
      Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
         Name="InterpCurveEdSetup_0"
         ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
      End Object
      InterpLength=2.000000
      InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_21.InterpGroup_0'
      CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_21.InterpCurveEdSetup_0'
      SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
      EdSectionEnd=2.000000
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8336
      ObjPosY=-4800
      DrawWidth=32
      DrawHeight=32
      Name="InterpData_21"
      ObjectArchetype=InterpData'Engine.Default__InterpData'
   End Object
   Begin Object Class=InterpData Name=InterpData_19
      Begin Object Class=InterpGroup Name=InterpGroup_1
         Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
            EventTrack(0)=(Time=3.000000,EventName="SwapParticlesToPoison")
            Name="InterpTrackEvent_0"
            ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
         End Object
         InterpTracks(0)=InterpTrackEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19.InterpGroup_1.InterpTrackEvent_0'
         GroupName="Events"
         GroupColor=(B=0,G=92,R=218,A=255)
         Name="InterpGroup_1"
         ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
      End Object
      Begin Object Class=InterpGroup Name=InterpGroup_0
         Begin Object Class=InterpTrackVectorMaterialParam Name=InterpTrackVectorMaterialParam_0
            Materials(1)=(AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_3977.StaticMeshComponent_408',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_3861.StaticMeshComponent_418',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4026.StaticMeshComponent_427',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4028.StaticMeshComponent_428',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4030.StaticMeshComponent_429',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4114.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_3881.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4116.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4117.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4118.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4119.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4112.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4121.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4108.StaticMeshComponent_440',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2591.StaticMeshComponent_123'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6579.StaticMeshComponent_8'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_3912.StaticMeshComponent_23',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_3761.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_5973.StaticMeshComponent_36',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_3824.StaticMeshComponent_39',MaterialIndex=2),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6214.StaticMeshComponent_35'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_14.StaticMeshComponent_796'),(Primitive=SkeletalMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.SkeletalMeshActor_17.SkeletalMeshComponent_6'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_27.StaticMeshComponent_70'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_28.StaticMeshComponent_71')))
            ParamName="Scalar_Liquid_Glow"
            VectorTrack=(Points=((OutVal=(X=0.203301,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.041142,Y=0.084520,Z=-0.000075),InterpMode=CIM_CurveAutoClamped)))
            Name="InterpTrackVectorMaterialParam_0"
            ObjectArchetype=InterpTrackVectorMaterialParam'Engine.Default__InterpTrackVectorMaterialParam'
         End Object
         InterpTracks(0)=InterpTrackVectorMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19.InterpGroup_0.InterpTrackVectorMaterialParam_0'
         GroupName="Blood_Color"
         GroupColor=(B=0,G=155,R=183,A=255)
         Name="InterpGroup_0"
         ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
      End Object
      Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
         Tabs(0)=(Curves=((CurveObject=InterpTrackVectorMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19.InterpGroup_0.InterpTrackVectorMaterialParam_0',CurveColor=(B=0,G=155,R=183,A=255),CurveName="Blood_Color_Vector Material Param")),ViewStartInput=-0.500000,ViewEndInput=5.500000,ViewStartOutput=-0.020413,ViewEndOutput=0.223639)
         Name="InterpCurveEdSetup_0"
         ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
      End Object
      InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19.InterpGroup_0'
      InterpGroups(1)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19.InterpGroup_1'
      CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19.InterpCurveEdSetup_0'
      SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
      EdSectionEnd=5.000000
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-6064
      ObjPosY=-5512
      DrawWidth=32
      DrawHeight=32
      Name="InterpData_19"
      ObjectArchetype=InterpData'Engine.Default__InterpData'
   End Object
   Begin Object Class=InterpData Name=InterpData_1
      Begin Object Class=InterpGroup Name=InterpGroup_0
         Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
            PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=-160.000488,Z=-0.000061),InterpMode=CIM_CurveAutoClamped)))
            EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped)))
            LookupTrack=(Points=(,(Time=2.000000)))
            MoveFrame=IMF_RelativeToInitial
            Name="InterpTrackMove_0"
            ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
         End Object
         InterpTracks(0)=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_1.InterpGroup_0.InterpTrackMove_0'
         GroupName="Door1"
         GroupColor=(B=140,G=194,R=0,A=255)
         Name="InterpGroup_0"
         ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
      End Object
      Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
         Name="InterpCurveEdSetup_1"
         ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
      End Object
      InterpLength=2.000000
      InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_1.InterpGroup_0'
      CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_1.InterpCurveEdSetup_1'
      SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
      EdSectionEnd=2.000000
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort'
      ObjPosX=-8968
      ObjPosY=-4800
      DrawWidth=32
      DrawHeight=32
      Name="InterpData_1"
      ObjectArchetype=InterpData'Engine.Default__InterpData'
   End Object
   SequenceObjects(0)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SequenceFrame_36'
   SequenceObjects(1)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SequenceFrame_35'
   SequenceObjects(2)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ActivateRemoteEvent_5'
   SequenceObjects(3)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqEvent_RemoteEvent_4'
   SequenceObjects(4)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ChangeCollision_3'
   SequenceObjects(5)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_257'
   SequenceObjects(6)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqEvent_RemoteEvent_1'
   SequenceObjects(7)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_254'
   SequenceObjects(8)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_252'
   SequenceObjects(9)=SeqEvent_Touch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqEvent_Touch_0'
   SequenceObjects(10)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_260'
   SequenceObjects(11)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_259'
   SequenceObjects(12)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_256'
   SequenceObjects(13)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_255'
   SequenceObjects(14)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_251'
   SequenceObjects(15)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_192'
   SequenceObjects(16)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_117'
   SequenceObjects(17)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ActivateRemoteEvent_45'
   SequenceObjects(18)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_64'
   SequenceObjects(19)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_250'
   SequenceObjects(20)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_249'
   SequenceObjects(21)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_221'
   SequenceObjects(22)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ActivateRemoteEvent_47'
   SequenceObjects(23)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_115'
   SequenceObjects(24)=InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_19'
   SequenceObjects(25)=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_19'
   SequenceObjects(26)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_113'
   SequenceObjects(27)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_99'
   SequenceObjects(28)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_23'
   SequenceObjects(29)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_55'
   SequenceObjects(30)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_70'
   SequenceObjects(31)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_41'
   SequenceObjects(32)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_SetMaterial_30'
   SequenceObjects(33)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_229'
   SequenceObjects(34)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_SetMaterial_31'
   SequenceObjects(35)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_33'
   SequenceObjects(36)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_61'
   SequenceObjects(37)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_27'
   SequenceObjects(38)=SeqEvent_Touch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqEvent_Touch_4'
   SequenceObjects(39)=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_3'
   SequenceObjects(40)=InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_21'
   SequenceObjects(41)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_195'
   SequenceObjects(42)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_59'
   SequenceObjects(43)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SequenceFrame_1'
   SequenceObjects(44)=InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.InterpData_1'
   SequenceObjects(45)=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Interp_21'
   SequenceObjects(46)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqEvent_MapObjectiveActivated_0'
   SequenceObjects(47)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_39'
   SequenceObjects(48)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_ChangeCollision_0'
   SequenceObjects(49)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_9'
   SequenceObjects(50)=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqAct_ShowPath_3'
   SequenceObjects(51)=KFSeqEvent_MinigameActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqEvent_MinigameActivated_0'
   SequenceObjects(52)=SeqVar_Float'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Float_0'
   SequenceObjects(53)=KFSeqAct_StartScriptedPawn'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqAct_StartScriptedPawn_0'
   SequenceObjects(54)=SeqVar_Float'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Float_2'
   SequenceObjects(55)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_85'
   SequenceObjects(56)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SequenceFrame_33'
   SequenceObjects(57)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.KFSeqEvent_MapObjectiveActivated_9'
   SequenceObjects(58)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_Toggle_32'
   SequenceObjects(59)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_97'
   SequenceObjects(60)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_149'
   SequenceObjects(61)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_150'
   SequenceObjects(62)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_152'
   SequenceObjects(63)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_156'
   SequenceObjects(64)=SeqEvent_Touch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqEvent_Touch_7'
   SequenceObjects(65)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SequenceFrame_2'
   SequenceObjects(66)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_AkPostEvent_31'
   SequenceObjects(67)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_AkPostEvent_34'
   SequenceObjects(68)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqAct_AkPostEvent_25'
   SequenceObjects(69)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_129'
   SequenceObjects(70)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_130'
   SequenceObjects(71)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_5_Escort.SeqVar_Object_131'
   DefaultViewX=9451
   DefaultViewY=6041
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-7784
   ObjName="Obj_5_Escort"
   DrawWidth=98
   DrawHeight=29
   Name="Obj_5_Escort"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_6_WeldAndRepair
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_6'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9160
      ObjPosY=-3872
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_56"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_4'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9208
      ObjPosY=-5136
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_55"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_2'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8336
      ObjPosY=-5208
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_53"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_8'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8352
      ObjPosY=-5720
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_50"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_3'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9168
      ObjPosY=-5720
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_49"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_262
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_9'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8472
      ObjPosY=-4224
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_262"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_5'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9216
      ObjPosY=-4288
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_226"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_10'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8456
      ObjPosY=-4680
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_222"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_12'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9168
      ObjPosY=-4712
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_125"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_39'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8720
      ObjPosY=-3416
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_1"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_24'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8824
      ObjPosY=-3416
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_0"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_50
      SizeX=513
      SizeY=308
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8792
      ObjPosY=-4432
      ObjComment="Actor 9"
      DrawWidth=513
      DrawHeight=308
      Name="SequenceFrame_50"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_5
      SizeX=2857
      SizeY=3120
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9568
      ObjPosY=-6264
      ObjComment="Obj 6 - Weld and Repair"
      DrawWidth=2857
      DrawHeight=3120
      Name="SequenceFrame_5"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_49
      SizeX=521
      SizeY=316
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8784
      ObjPosY=-4896
      ObjComment="Actor 8"
      DrawWidth=521
      DrawHeight=316
      Name="SequenceFrame_49"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_48
      SizeX=593
      SizeY=308
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8736
      ObjPosY=-5416
      ObjComment="Actor 7"
      DrawWidth=593
      DrawHeight=308
      Name="SequenceFrame_48"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_47
      SizeX=553
      SizeY=308
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8712
      ObjPosY=-5928
      ObjComment="Actor 6"
      DrawWidth=553
      DrawHeight=308
      Name="SequenceFrame_47"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_45
      SizeX=569
      SizeY=308
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9536
      ObjPosY=-4080
      ObjComment="Actor 5"
      DrawWidth=569
      DrawHeight=308
      Name="SequenceFrame_45"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_43
      SizeX=513
      SizeY=324
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9536
      ObjPosY=-4512
      ObjComment="Actor 4"
      DrawWidth=513
      DrawHeight=324
      Name="SequenceFrame_43"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_42
      SizeX=561
      SizeY=316
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9536
      ObjPosY=-4928
      ObjComment="Actor 3"
      DrawWidth=561
      DrawHeight=316
      Name="SequenceFrame_42"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_41
      SizeX=536
      SizeY=317
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9536
      ObjPosY=-5360
      ObjComment="Actor 2"
      DrawWidth=536
      DrawHeight=317
      Name="SequenceFrame_41"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_40
      SizeX=574
      SizeY=328
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9504
      ObjPosY=-5936
      ObjComment="Actor 1"
      DrawWidth=574
      DrawHeight=328
      Name="SequenceFrame_40"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_4
      SizeX=973
      SizeY=463
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9504
      ObjPosY=-3696
      ObjComment="Ammo Toggle"
      DrawWidth=973
      DrawHeight=463
      Name="SequenceFrame_4"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_24
      SizeX=1070
      SizeY=2723
      bDrawBox=True
      BorderColor=(B=255,G=94,R=0,A=255)
      FillColor=(B=255,G=173,R=0,A=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7976
      ObjPosY=-6024
      ObjComment="Audio"
      DrawWidth=1070
      DrawHeight=2723
      Name="SequenceFrame_24"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_94
      InputLinks(0)=(DrawY=-4347,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4326,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4305,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4326,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_262'),DrawX=-8450,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8399,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8350,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8488
      ObjPosY=-4384
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_94"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
      InputLinks(0)=(DrawY=-4411,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4390,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4369,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4390,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_226'),DrawX=-9194,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-9143,OverrideDelta=76)
      EventLinks(0)=(DrawX=-9094,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9232
      ObjPosY=-4448
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_40"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
      InputLinks(0)=(DrawY=-4835,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4814,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4793,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4814,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_125'),DrawX=-9146,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-9095,OverrideDelta=76)
      EventLinks(0)=(DrawX=-9046,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9184
      ObjPosY=-4872
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_39"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
      InputLinks(0)=(DrawY=-4803,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4782,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4761,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-4782,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_222'),DrawX=-8434,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8383,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8334,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8472
      ObjPosY=-4840
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_38"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
      InputLinks(0)=(DrawY=-5331,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5310,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5289,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5310,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_53'),DrawX=-8314,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8263,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8214,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8352
      ObjPosY=-5368
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_34"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
      InputLinks(0)=(DrawY=-3995,OverrideDelta=14)
      InputLinks(1)=(DrawY=-3974,OverrideDelta=35)
      InputLinks(2)=(DrawY=-3953,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-3974,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_56'),DrawX=-9138,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-9087,OverrideDelta=76)
      EventLinks(0)=(DrawX=-9038,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9176
      ObjPosY=-4032
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_30"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
      InputLinks(0)=(DrawY=-5843,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5822,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5801,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5822,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_50'),DrawX=-8330,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8279,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8230,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8368
      ObjPosY=-5880
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_29"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
      InputLinks(0)=(DrawY=-5843,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5822,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5801,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5822,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_49'),DrawX=-9146,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-9095,OverrideDelta=76)
      EventLinks(0)=(DrawX=-9046,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9184
      ObjPosY=-5880
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_28"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
      InputLinks(0)=(DrawY=-5259,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5238,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5217,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5238,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_55'),DrawX=-9186,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-9135,OverrideDelta=76)
      EventLinks(0)=(DrawX=-9086,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9224
      ObjPosY=-5296
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_27"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
      InputLinks(0)=(DrawY=-3515,OverrideDelta=14)
      InputLinks(1)=(DrawY=-3494,OverrideDelta=35)
      InputLinks(2)=(DrawY=-3473,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-3494,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_0',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_1'),DrawX=-8794,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8743,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8694,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8832
      ObjPosY=-3552
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_0"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_44
      EventName="Repair5_Play"
      InputLinks(0)=(DrawY=-5918,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5918,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7150,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7280
      ObjPosY=-5952
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_44"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_43
      EventName="Repair8_Play"
      InputLinks(0)=(DrawY=-3902,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-3902,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7158,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7288
      ObjPosY=-3936
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_43"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_42
      EventName="Repair8_Stop"
      InputLinks(0)=(DrawY=-3782,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-3782,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7148,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7280
      ObjPosY=-3816
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_42"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_41
      EventName="Repair0_Stop"
      InputLinks(0)=(DrawY=-4054,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4054,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7140,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7272
      ObjPosY=-4088
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_41"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_40
      EventName="Repair0_Play"
      InputLinks(0)=(DrawY=-4174,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4174,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7150,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7280
      ObjPosY=-4208
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_40"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_39
      EventName="Repair6_Play"
      InputLinks(0)=(DrawY=-4486,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4486,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7150,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7280
      ObjPosY=-4520
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_39"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_38
      EventName="Repair6_Stop"
      InputLinks(0)=(DrawY=-4366,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4366,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7140,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7272
      ObjPosY=-4400
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_38"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_36
      EventName="Repair4_Stop"
      InputLinks(0)=(DrawY=-4662,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4662,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7132,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7264
      ObjPosY=-4696
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_36"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_35
      EventName="Repair4_Play"
      InputLinks(0)=(DrawY=-4782,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4782,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7142,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7272
      ObjPosY=-4816
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_35"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_32
      EventName="Repair3_Play"
      InputLinks(0)=(DrawY=-5094,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5094,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7142,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7272
      ObjPosY=-5128
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_32"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_31
      EventName="Repair3_Stop"
      InputLinks(0)=(DrawY=-4974,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4974,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7132,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7264
      ObjPosY=-5008
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_31"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_30
      EventName="Repair9_Stop"
      InputLinks(0)=(DrawY=-5262,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5262,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7132,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7264
      ObjPosY=-5296
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_30"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_29
      EventName="Repair9_Play"
      InputLinks(0)=(DrawY=-5382,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5382,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7142,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7272
      ObjPosY=-5416
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_29"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_28
      EventName="Repair2_Play"
      InputLinks(0)=(DrawY=-5646,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5646,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7142,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7272
      ObjPosY=-5680
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_28"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_18
      EventName="Repair2_Stop"
      InputLinks(0)=(DrawY=-5526,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5526,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7132,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7264
      ObjPosY=-5560
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_18"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_17
      EventName="Repair5_Stop"
      InputLinks(0)=(DrawY=-5798,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5798,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7140,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7272
      ObjPosY=-5832
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_17"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_14
      EventName="Repair7_Play"
      InputLinks(0)=(DrawY=-3598,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-3598,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7158,OverrideDelta=98)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7288
      ObjPosY=-3632
      DrawWidth=261
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_14"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
      EventName="Repair7_Stop"
      InputLinks(0)=(DrawY=-3478,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-3478,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7148,OverrideDelta=100)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7280
      ObjPosY=-3512
      DrawWidth=265
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_13"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_9
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_9'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_29')),DrawY=-5332,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_30')),DrawY=-5312,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7896
      ObjPosY=-5400
      ObjName="KFRepairableActor_9 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_9"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_8
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_4'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_30')),DrawY=-3988,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_30',InputLinkIdx=1)),DrawY=-3968,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9512
      ObjPosY=-4056
      ObjName="KFRepairableActor_4 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_8"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_7
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_2'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_27')),DrawY=-5268,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_27',InputLinkIdx=1)),DrawY=-5248,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9512
      ObjPosY=-5336
      ObjName="KFRepairableActor_2 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_7"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_6
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_0'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_34')),DrawY=-5324,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_34',InputLinkIdx=1)),DrawY=-5304,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8712
      ObjPosY=-5392
      ObjName="KFRepairableActor_0 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_6"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_5
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_6'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_29')),DrawY=-5836,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_29',InputLinkIdx=1)),DrawY=-5816,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8688
      ObjPosY=-5904
      ObjName="KFRepairableActor_6 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_5"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_4
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_2'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_28')),DrawY=-5604,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_18')),DrawY=-5584,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7904
      ObjPosY=-5672
      ObjName="KFRepairableActor_2 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_4"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_3
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_5'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_44')),DrawY=-5868,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_17')),DrawY=-5848,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7896
      ObjPosY=-5936
      ObjName="KFRepairableActor_5 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_3"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_2
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_8'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_38')),DrawY=-4804,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_38',InputLinkIdx=1)),DrawY=-4784,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8760
      ObjPosY=-4872
      ObjName="KFRepairableActor_8 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_2"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_17
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_8'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_43')),DrawY=-3852,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_42')),DrawY=-3832,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7912
      ObjPosY=-3920
      ObjName="KFRepairableActor_8 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_17"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_16
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_0'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_40')),DrawY=-4132,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_41')),DrawY=-4112,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7912
      ObjPosY=-4200
      ObjName="KFRepairableActor_0 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_16"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_15
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_6'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_39')),DrawY=-4428,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_38')),DrawY=-4408,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7912
      ObjPosY=-4496
      ObjName="KFRepairableActor_6 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_15"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_14
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_9'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_39')),DrawY=-4836,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_39',InputLinkIdx=1)),DrawY=-4816,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9512
      ObjPosY=-4904
      ObjName="KFRepairableActor_9 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_14"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_13
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_3'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_40')),DrawY=-4420,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_40',InputLinkIdx=1)),DrawY=-4400,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9512
      ObjPosY=-4488
      ObjName="KFRepairableActor_3 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_13"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_12
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_5'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_28')),DrawY=-5844,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_28',InputLinkIdx=1)),DrawY=-5824,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9488
      ObjPosY=-5912
      ObjName="KFRepairableActor_5 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_12"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_11
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_4'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_35')),DrawY=-4732,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_36')),DrawY=-4712,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7904
      ObjPosY=-4800
      ObjName="KFRepairableActor_4 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_11"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_10
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_3'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_32')),DrawY=-5028,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_31')),DrawY=-5008,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7928
      ObjPosY=-5096
      ObjName="KFRepairableActor_3 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_10"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_1
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_7'
      MaxWidth=308
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_94')),DrawY=-4340,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_94',InputLinkIdx=1)),DrawY=-4320,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-8768
      ObjPosY=-4408
      ObjName="KFRepairableActor_7 Repairable Actor Events"
      DrawWidth=194
      Name="KFSeqEvent_RepairableActor_1"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_0
      Originator=KFRepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFRepairableActor_7'
      bClientSideOnly=True
      MaxWidth=419
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_14')),DrawY=-3540,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_13')),DrawY=-3520,OverrideDelta=33)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-7912
      ObjPosY=-3608
      ObjName="KFRepairableActor_7 Repairable Actor Events"
      DrawWidth=249
      Name="KFSeqEvent_RepairableActor_0"
      ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_7
      Originator=KFMapObjective_RepairActors'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_RepairActors_0'
      MaxWidth=392
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_0')),DrawY=-3516,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_0',InputLinkIdx=1)),DrawY=-3496,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-9204,OverrideDelta=164)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair'
      ObjPosX=-9400
      ObjPosY=-3584
      ObjName="KFMapObjective_RepairActors_0 Map Objective Activated"
      DrawWidth=244
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_7"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   SequenceObjects(0)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_50'
   SequenceObjects(1)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_49'
   SequenceObjects(2)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_48'
   SequenceObjects(3)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_47'
   SequenceObjects(4)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_45'
   SequenceObjects(5)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_43'
   SequenceObjects(6)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_42'
   SequenceObjects(7)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_41'
   SequenceObjects(8)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_40'
   SequenceObjects(9)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_24'
   SequenceObjects(10)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_13'
   SequenceObjects(11)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_14'
   SequenceObjects(12)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_43'
   SequenceObjects(13)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_42'
   SequenceObjects(14)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_41'
   SequenceObjects(15)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_40'
   SequenceObjects(16)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_39'
   SequenceObjects(17)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_38'
   SequenceObjects(18)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_36'
   SequenceObjects(19)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_35'
   SequenceObjects(20)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_32'
   SequenceObjects(21)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_31'
   SequenceObjects(22)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_30'
   SequenceObjects(23)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_29'
   SequenceObjects(24)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_28'
   SequenceObjects(25)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_18'
   SequenceObjects(26)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_17'
   SequenceObjects(27)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_ActivateRemoteEvent_44'
   SequenceObjects(28)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_3'
   SequenceObjects(29)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_4'
   SequenceObjects(30)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_9'
   SequenceObjects(31)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_10'
   SequenceObjects(32)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_11'
   SequenceObjects(33)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_15'
   SequenceObjects(34)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_16'
   SequenceObjects(35)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_17'
   SequenceObjects(36)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_0'
   SequenceObjects(37)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_8'
   SequenceObjects(38)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_30'
   SequenceObjects(39)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_56'
   SequenceObjects(40)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_1'
   SequenceObjects(41)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_94'
   SequenceObjects(42)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_262'
   SequenceObjects(43)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_226'
   SequenceObjects(44)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_40'
   SequenceObjects(45)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_13'
   SequenceObjects(46)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_49'
   SequenceObjects(47)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_28'
   SequenceObjects(48)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_12'
   SequenceObjects(49)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_5'
   SequenceObjects(50)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_29'
   SequenceObjects(51)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_50'
   SequenceObjects(52)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_55'
   SequenceObjects(53)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_27'
   SequenceObjects(54)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_7'
   SequenceObjects(55)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_14'
   SequenceObjects(56)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_39'
   SequenceObjects(57)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_125'
   SequenceObjects(58)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_222'
   SequenceObjects(59)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_38'
   SequenceObjects(60)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_2'
   SequenceObjects(61)=KFSeqEvent_RepairableActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_RepairableActor_6'
   SequenceObjects(62)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_34'
   SequenceObjects(63)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_53'
   SequenceObjects(64)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.KFSeqEvent_MapObjectiveActivated_7'
   SequenceObjects(65)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_5'
   SequenceObjects(66)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqAct_Toggle_0'
   SequenceObjects(67)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_0'
   SequenceObjects(68)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SeqVar_Object_1'
   SequenceObjects(69)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_6_WeldAndRepair.SequenceFrame_4'
   DefaultViewX=4240
   DefaultViewY=1765
   DefaultViewZoom=0.400000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-7728
   ObjName="Obj_6_WeldAndRepair"
   DrawWidth=153
   DrawHeight=29
   Name="Obj_6_WeldAndRepair"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_7_Timedhold_2
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_22'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8848
      ObjPosY=-5648
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_97"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
      ObjValue=KFPickupFactory_Ammo'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPickupFactory_Ammo_18'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8760
      ObjPosY=-5648
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_96"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_41
      bValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8840
      ObjPosY=-5904
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_41"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_38
      VarName="LastWave"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8760
      ObjPosY=-5912
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_38"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_23
      SizeX=1089
      SizeY=903
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-9376
      ObjPosY=-6248
      ObjComment="Setup"
      DrawWidth=1089
      DrawHeight=903
      Name="SequenceFrame_23"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_0
      SizeX=2240
      SizeY=1208
      BorderWidth=5
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-9560
      ObjPosY=-6424
      ObjComment="Obj 7 - Timed Hold"
      DrawWidth=2240
      DrawHeight=1208
      Name="SequenceFrame_0"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_54
      InputLinks(0)=(DrawY=-5763,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5742,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5721,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5742,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Object_97',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Object_96'),DrawX=-8794,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8743,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8694,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8832
      ObjPosY=-5800
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_54"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
      InputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5942,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Bool_41'),DrawX=-8798,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Bool_38'),DrawX=-8742,OverrideDelta=68)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8832
      ObjPosY=-5976
      DrawWidth=128
      DrawHeight=61
      Name="SeqAct_SetBool_0"
      ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
   End Object
   Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_3
      DisplayTimeSeconds=16.000000
      DrawTextInfo=(MessageText="DEFEND THE BLOOD BLENDER AREA",MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageOffset=(X=0.000000,Y=-120.000000))
      InputLinks(0)=(DrawY=-6108,OverrideDelta=13)
      InputLinks(1)=(DrawY=-6088,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-6098,OverrideDelta=23)
      VariableLinks(0)=(DrawX=-8777,OverrideDelta=17)
      VariableLinks(1)=()
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8816
      ObjPosY=-6144
      DrawWidth=78
      DrawHeight=85
      Name="SeqAct_DrawText_3"
      ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold2_50done'
      InputLinks(0)=(DrawY=-6062,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6062,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7704,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-7752
      ObjPosY=-6096
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_20"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold2_25done'
      InputLinks(0)=(DrawY=-6174,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6174,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7704,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-7752
      ObjPosY=-6208
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_19"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold2_80done'
      InputLinks(0)=(DrawY=-5934,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5934,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7704,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-7752
      ObjPosY=-5968
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_18"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Hold2_Completed'
      InputLinks(0)=(DrawY=-5822,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5822,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7704,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-7752
      ObjPosY=-5856
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_0"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_10
      Originator=KFMapObjective_HoldZone'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_HoldZone_2'
      MaxWidth=370
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_SetBool_0'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_Toggle_54')),DrawY=-5956,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_Toggle_54',InputLinkIdx=1)),DrawY=-5936,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-9127,OverrideDelta=153)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-9312
      ObjPosY=-6024
      ObjName="KFMapObjective_HoldZone_2 Map Objective Activated"
      DrawWidth=233
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_10"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_HoldZoneProgress Name=KFSeqEvent_HoldZoneProgress_1
      ProgressThresholds(0)=0.250000
      ProgressThresholds(1)=0.500000
      ProgressThresholds(2)=0.750000
      ProgressThresholds(3)=1.000000
      Originator=KFMapObjective_HoldZone'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_HoldZone_2'
      MaxWidth=333
      OutputLinks(0)=(DrawY=-6057,OverrideDelta=16)
      OutputLinks(1)=(DrawY=-6035,OverrideDelta=38)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_19')),LinkDesc="Progress Pct: 0.25",DrawY=-6013,OverrideDelta=60)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_20')),LinkDesc="Progress Pct: 0.50",DrawY=-5991,OverrideDelta=82)
      OutputLinks(4)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_18')),LinkDesc="Progress Pct: 0.75",DrawY=-5969,OverrideDelta=104)
      OutputLinks(5)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_0')),LinkDesc="Progress Pct: 1.00",DrawY=-5947,OverrideDelta=126)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2'
      ObjPosX=-8208
      ObjPosY=-6128
      ObjName="KFMapObjective_HoldZone_2 Hold Zone Progress"
      DrawWidth=236
      Name="KFSeqEvent_HoldZoneProgress_1"
      ObjectArchetype=KFSeqEvent_HoldZoneProgress'kfgamecontent.Default__KFSeqEvent_HoldZoneProgress'
   End Object
   SequenceObjects(0)=KFSeqEvent_HoldZoneProgress'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.KFSeqEvent_HoldZoneProgress_1'
   SequenceObjects(1)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_19'
   SequenceObjects(2)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_20'
   SequenceObjects(3)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_0'
   SequenceObjects(4)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_AkPostEvent_18'
   SequenceObjects(5)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SequenceFrame_23'
   SequenceObjects(6)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_Toggle_54'
   SequenceObjects(7)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Object_97'
   SequenceObjects(8)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Object_96'
   SequenceObjects(9)=SeqAct_DrawText'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_DrawText_3'
   SequenceObjects(10)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Bool_41'
   SequenceObjects(11)=SeqAct_SetBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqAct_SetBool_0'
   SequenceObjects(12)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SeqVar_Bool_38'
   SequenceObjects(13)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.KFSeqEvent_MapObjectiveActivated_10'
   SequenceObjects(14)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_7_Timedhold_2.SequenceFrame_0'
   DefaultViewX=1726
   DefaultViewY=985
   DefaultViewZoom=0.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-7656
   ObjName="Obj_7_Timedhold_2"
   DrawWidth=138
   DrawHeight=29
   Name="Obj_7_Timedhold_2"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_8_Boss
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
      ObjValue=KFTrigger_ObjectiveLever'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8928
      ObjPosY=-4400
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_86"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
      ObjValue=KFTrigger_ObjectiveLever'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_2'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8120
      ObjPosY=-5752
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_80"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
      ObjValue=KFMapObjective_ExterminateWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7312
      ObjPosY=-4424
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_8"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_91'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8720
      ObjPosY=-4368
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_7"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
      ObjValue=KFTrigger_ObjectiveLever'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_0'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8120
      ObjPosY=-6016
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_64"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_16'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8408
      ObjPosY=-4360
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_63"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_14'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8464
      ObjPosY=-3944
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_62"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_92'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8768
      ObjPosY=-3944
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_55"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
      ObjValue=KFPathnode'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPathnode_59'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8472
      ObjPosY=-5736
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_5"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
      ObjValue=KFPathnode'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPathnode_61'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8456
      ObjPosY=-6008
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_4"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_16'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8504
      ObjPosY=-5440
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_31"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
      ObjValue=KFTrigger_ObjectiveLever'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_2'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8992
      ObjPosY=-3976
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_28"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
      ObjValue=PointLightToggleable'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLightToggleable_14'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8416
      ObjPosY=-5432
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_23"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
      ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_3'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8192
      ObjPosY=-3952
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_226"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
      ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_75'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7400
      ObjPosY=-3872
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_2"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
      ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_21'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8144
      ObjPosY=-4384
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_117"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
      ObjValue=TargetPoint'KF-BIOTICSLAB.TheWorld:PersistentLevel.TargetPoint_2'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9024
      ObjPosY=-4168
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_1"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
      ObjValue=TargetPoint'KF-BIOTICSLAB.TheWorld:PersistentLevel.TargetPoint_15'
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8984
      ObjPosY=-4584
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Object_0"
      ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_5
      ExpectedType=Class'Engine.SeqVar_Bool'
      FindVarName="objective"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9320
      ObjPosY=-6200
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_5"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_3
      IntValue=7
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9078
      ObjPosY=-6079
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_3"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_2
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9624
      ObjPosY=-6096
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_2"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
      bValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9232
      ObjPosY=-6200
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Bool_3"
      ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_31
      SizeX=2777
      SizeY=1416
      BorderWidth=5
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9576
      ObjPosY=-4856
      ObjComment="Poison Clot Mother"
      DrawWidth=2777
      DrawHeight=1416
      Name="SequenceFrame_31"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_1
      SizeX=3078
      SizeY=3168
      BorderWidth=5
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9720
      ObjPosY=-6448
      ObjComment="Obj 8 - Boss"
      DrawWidth=3078
      DrawHeight=3168
      Name="SequenceFrame_1"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
      EventName="ConsolePath02"
      MaxWidth=214
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_4',InputLinkIdx=1)),DrawY=-5766,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8781,OverrideDelta=75)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8888
      ObjPosY=-5832
      DrawWidth=127
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_31"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_30
      EventName="ConsolePath01"
      MaxWidth=214
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_2',InputLinkIdx=1)),DrawY=-6094,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8765,OverrideDelta=75)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8872
      ObjPosY=-6160
      DrawWidth=127
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_30"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_0
      InputLinks(0)=(DrawY=-6174,OverrideDelta=59)
      OutputLinks(0)=(DrawY=-6218,OverrideDelta=15)
      OutputLinks(1)=(DrawY=-6196,OverrideDelta=37)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_1'),(LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_2'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_3'),(LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_4')),DrawY=-6174,OverrideDelta=59)
      OutputLinks(3)=(DrawY=-6152,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-6130,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Int_2'),DrawX=-9071,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Int_3'),DrawX=-9046,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9104
      ObjPosY=-6256
      DrawWidth=91
      DrawHeight=157
      Name="SeqCond_CompareInt_0"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
      InputLinks(0)=(DrawY=-6282,OverrideDelta=23)
      OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqCond_CompareInt_0')),DrawY=-6292,OverrideDelta=13)
      OutputLinks(1)=(DrawY=-6272,OverrideDelta=33)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Named_5'),DrawX=-9275,OverrideDelta=16)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Bool_3'),DrawX=-9225,OverrideDelta=59)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9304
      ObjPosY=-6328
      DrawWidth=115
      DrawHeight=85
      Name="SeqCond_CompareBool_1"
      ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
      InputLinks(0)=(DrawY=-4067,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4046,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4025,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_0',InputLinkIdx=1)),DrawY=-4046,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_55'),DrawX=-8738,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8687,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8638,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8776
      ObjPosY=-4104
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_6"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
      InputLinks(0)=(DrawY=-4483,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4462,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4441,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_SetMaterial_19')),DrawY=-4462,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_63'),DrawX=-8370,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8319,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8270,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8408
      ObjPosY=-4520
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_5"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
      InputLinks(0)=(DrawY=-5563,OverrideDelta=14)
      InputLinks(1)=(DrawY=-5542,OverrideDelta=35)
      InputLinks(2)=(DrawY=-5521,OverrideDelta=56)
      OutputLinks(0)=(DrawY=-5542,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_31',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_23'),DrawX=-8466,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8415,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8366,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8504
      ObjPosY=-5600
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_3"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
      InputLinks(0)=(DrawY=-4483,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4462,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4441,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_5',InputLinkIdx=1)),DrawY=-4462,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_7'),DrawX=-8682,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8631,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8582,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8720
      ObjPosY=-4520
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_21"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
      InputLinks(0)=(DrawY=-3995,OverrideDelta=14)
      InputLinks(1)=(DrawY=-3974,OverrideDelta=35)
      InputLinks(2)=(DrawY=-3953,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_0')),DrawY=-3974,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_2'),DrawX=-7370,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-7319,OverrideDelta=76)
      EventLinks(0)=(DrawX=-7270,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7408
      ObjPosY=-4032
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_2"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
      InputLinks(0)=(DrawY=-4067,OverrideDelta=14)
      InputLinks(1)=(DrawY=-4046,OverrideDelta=35)
      InputLinks(2)=(DrawY=-4025,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_SetMaterial_14')),DrawY=-4046,OverrideDelta=35)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_62'),DrawX=-8426,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8375,OverrideDelta=76)
      EventLinks(0)=(DrawX=-8326,OverrideDelta=119)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8464
      ObjPosY=-4104
      DrawWidth=173
      DrawHeight=109
      Name="SeqAct_Toggle_0"
      ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
   End Object
   Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
      LinkCount=2
      InputLinks(0)=(DrawY=-3626,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-3636,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Interp_20')),LinkDesc="Link 2",DrawY=-3616,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-8966,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9000
      ObjPosY=-3672
      DrawWidth=68
      DrawHeight=85
      Name="SeqAct_Switch_1"
      ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
   End Object
   Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
      LinkCount=2
      InputLinks(0)=(DrawY=-4250,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-4260,OverrideDelta=13)
      OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_StartObjectiveWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_StartObjectiveWave_0'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_2')),LinkDesc="Link 2",DrawY=-4240,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-7534,OverrideDelta=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7568
      ObjPosY=-4296
      DrawWidth=68
      DrawHeight=85
      Name="SeqAct_Switch_0"
      ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_19
      NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_MAT.lab.ENV_BioticsLab_ComputerConsole_Screens_MIC'
      InputLinks(0)=(DrawY=-4462,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_2')),DrawY=-4462,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_117'),DrawX=-8099,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8144
      ObjPosY=-4496
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_19"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_14
      NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_MAT.lab.ENV_BioticsLab_ComputerConsole_Screens_MIC'
      InputLinks(0)=(DrawY=-4046,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_1')),DrawY=-4046,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_226'),DrawX=-8155,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8200
      ObjPosY=-4080
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_14"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_20
      InputLinks(0)=(DrawY=-3746,OverrideDelta=15)
      InputLinks(1)=(DrawY=-3724,OverrideDelta=37)
      InputLinks(2)=(DrawY=-3702,OverrideDelta=59)
      InputLinks(3)=(DrawY=-3680,OverrideDelta=81)
      InputLinks(4)=(DrawY=-3658,OverrideDelta=103)
      OutputLinks(0)=(DrawY=-3730,OverrideDelta=31)
      OutputLinks(1)=(DrawY=-3674,OverrideDelta=87)
      VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20'),DrawX=-8749,OverrideDelta=36)
      VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Glass",MinVars=0,DrawX=-8700,OverrideDelta=83)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8800
      ObjPosY=-3784
      ObjComment="Increase opacity"
      DrawWidth=154
      DrawHeight=157
      Name="SeqAct_Interp_20"
      ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_5
      CollisionType=COLLIDE_NoCollision
      InputLinks(0)=(DrawY=-4054,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_6')),DrawY=-4054,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_28'),DrawX=-8950,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9008
      ObjPosY=-4088
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_5"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_4
      CollisionType=COLLIDE_NoCollision
      InputLinks(0)=(DrawY=-4470,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_21')),DrawY=-4470,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_86'),DrawX=-8894,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8952
      ObjPosY=-4504
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_4"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_1
      CollisionType=COLLIDE_TouchAllButWeapons
      InputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_80'),DrawX=-8086,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8144
      ObjPosY=-5880
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_1"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_0
      CollisionType=COLLIDE_TouchAllButWeapons
      InputLinks(0)=(DrawY=-6094,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6094,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_64'),DrawX=-8078,OverrideDelta=36)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8136
      ObjPosY=-6128
      DrawWidth=116
      DrawHeight=61
      Name="SeqAct_ChangeCollision_0"
      ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate2_50ZedDead'
      InputLinks(0)=(DrawY=-5230,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5230,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8856,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8904
      ObjPosY=-5264
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_20"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate2_80ZedDead'
      InputLinks(0)=(DrawY=-5334,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5334,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8864,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8912
      ObjPosY=-5368
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_16"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
      bReplicateToClients=True
      Event=AkEvent'WW_ENV_BioticsLab.Play_ENV_Biotics_OBJ_Button_Poison_Release_OS'
      InputLinks(0)=(DrawY=-4238,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4238,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_1'),DrawX=-9000,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9048
      ObjPosY=-4272
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_13"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
      bReplicateToClients=True
      Event=AkEvent'WW_ENV_BioticsLab.Play_ENV_Biotics_OBJ_Button_Poison_Release_OS'
      InputLinks(0)=(DrawY=-4654,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4654,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_0'),DrawX=-8960,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9008
      ObjPosY=-4688
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_11"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate2_Completed'
      InputLinks(0)=(DrawY=-5422,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5422,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8872,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8920
      ObjPosY=-5456
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_10"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate2_Start'
      InputLinks(0)=(DrawY=-6230,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-6230,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8424,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8472
      ObjPosY=-6264
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_1"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
      bReplicateToClients=True
      Event=AkEvent'WW_VOX_OBJ_Biotics.Play_VOX_OBJ_Biotics_Exterminate2_25ZedDead'
      InputLinks(0)=(DrawY=-5118,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-5118,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-8840,OverrideDelta=26)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8888
      ObjPosY=-5152
      ObjComment="VO"
      DrawWidth=96
      DrawHeight=61
      Name="SeqAct_AkPostEvent_0"
      ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
      EventName="Poison"
      InputLinks(0)=(DrawY=-4614,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-4614,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7058,OverrideDelta=78)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7168
      ObjPosY=-4648
      ObjComment="Poison"
      DrawWidth=220
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_3"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
      EventName="ConsolePath01"
      InputLinks(0)=(DrawY=-4454,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Switch_0')),DrawY=-4454,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7815,OverrideDelta=105)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7952
      ObjPosY=-4488
      DrawWidth=275
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_2"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
      EventName="ConsolePath02"
      InputLinks(0)=(DrawY=-4038,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Switch_0')),DrawY=-4038,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7871,OverrideDelta=105)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8008
      ObjPosY=-4072
      DrawWidth=275
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_1"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
      EventName="ClotMotherPoisoned"
      InputLinks(0)=(DrawY=-3974,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-3974,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-6998,OverrideDelta=122)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7152
      ObjPosY=-4008
      DrawWidth=308
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_0"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_TraderClosed Name=KFSeqEvent_TraderClosed_2
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqCond_CompareBool_1')),DrawY=-6238,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Int_2'),DrawX=-9597,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-9536,OverrideDelta=86)
      VariableLinks(2)=(DrawX=-9455,OverrideDelta=139)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9640
      ObjPosY=-6304
      DrawWidth=144
      DrawHeight=144
      Name="KFSeqEvent_TraderClosed_2"
      ObjectArchetype=KFSeqEvent_TraderClosed'KFGame.Default__KFSeqEvent_TraderClosed'
   End Object
   Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_2
      Originator=KFTrigger_ObjectiveLever'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_2'
      ReTriggerDelay=0.500000
      MaxWidth=332
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_13'),(LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_5'),(LinkedOp=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Switch_1')),DrawY=-4059,OverrideDelta=14)
      OutputLinks(1)=(DrawY=-4037,OverrideDelta=36)
      OutputLinks(2)=(DrawY=-4015,OverrideDelta=58)
      OutputLinks(3)=(DrawY=-3993,OverrideDelta=80)
      VariableLinks(0)=(DrawX=-9274,OverrideDelta=134)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9440
      ObjPosY=-4128
      ObjName="KFTrigger_ObjectiveLever_2 Minigame Activation"
      DrawWidth=236
      DrawHeight=200
      Name="KFSeqEvent_MinigameActivated_2"
      ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
   End Object
   Begin Object Class=KFSeqEvent_MinigameActivated Name=KFSeqEvent_MinigameActivated_1
      Originator=KFTrigger_ObjectiveLever'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_0'
      ReTriggerDelay=0.500000
      MaxWidth=332
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_4'),(LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_11'),(LinkedOp=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Switch_1')),DrawY=-4483,OverrideDelta=14)
      OutputLinks(1)=(DrawY=-4461,OverrideDelta=36)
      OutputLinks(2)=(DrawY=-4439,OverrideDelta=58)
      OutputLinks(3)=(DrawY=-4417,OverrideDelta=80)
      VariableLinks(0)=(DrawX=-9250,OverrideDelta=134)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9416
      ObjPosY=-4552
      ObjName="KFTrigger_ObjectiveLever_0 Minigame Activation"
      DrawWidth=236
      DrawHeight=200
      Name="KFSeqEvent_MinigameActivated_1"
      ObjectArchetype=KFSeqEvent_MinigameActivated'KFGame.Default__KFSeqEvent_MinigameActivated'
   End Object
   Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_4
      Originator=KFMapObjective_ExterminateWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_0'
      MaxWidth=424
      OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_2',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_3',InputLinkIdx=1),(LinkedOp=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_4',InputLinkIdx=1)),DrawY=-5820,OverrideDelta=13)
      OutputLinks(1)=(DrawY=-5800,OverrideDelta=33)
      VariableLinks(0)=(DrawX=-9196,OverrideDelta=180)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9408
      ObjPosY=-5888
      ObjName="KFMapObjective_ExterminateWave_0 Map Objective Activated"
      DrawWidth=260
      DrawHeight=152
      Name="KFSeqEvent_MapObjectiveActivated_4"
      ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
   End Object
   Begin Object Class=KFSeqEvent_ExterminateBossHealthPct Name=KFSeqEvent_ExterminateBossHealthPct_2
      ProgressThresholds(0)=0.750000
      ProgressThresholds(1)=0.500000
      ProgressThresholds(2)=0.250000
      ProgressThresholds(3)=0.000000
      Originator=KFMapObjective_ExterminateWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_0'
      MaxWidth=447
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_0')),LinkDesc="Boss Health Percent: 0.75",DrawY=-5185,OverrideDelta=80)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_20')),LinkDesc="Boss Health Percent: 0.50",DrawY=-5207,OverrideDelta=58)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_16')),LinkDesc="Boss Health Percent: 0.25",DrawY=-5229,OverrideDelta=36)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_10')),LinkDesc="Boss Health Percent: 0.00",DrawY=-5251,OverrideDelta=14)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-9336
      ObjPosY=-5320
      ObjName="KFMapObjective_ExterminateWave_0 Exterminate Boss Health Pct"
      DrawWidth=318
      Name="KFSeqEvent_ExterminateBossHealthPct_2"
      ObjectArchetype=KFSeqEvent_ExterminateBossHealthPct'kfgamecontent.Default__KFSeqEvent_ExterminateBossHealthPct'
   End Object
   Begin Object Class=KFSeqAct_StartObjectiveWave Name=KFSeqAct_StartObjectiveWave_0
      InputLinks(0)=(DrawY=-4486,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_3')),DrawY=-4486,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_8'),DrawX=-7307,OverrideDelta=55)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-7384
      ObjPosY=-4520
      DrawWidth=154
      DrawHeight=61
      Name="KFSeqAct_StartObjectiveWave_0"
      ObjectArchetype=KFSeqAct_StartObjectiveWave'kfgamecontent.Default__KFSeqAct_StartObjectiveWave'
   End Object
   Begin Object Class=KFSeqAct_ShowPath Name=KFSeqAct_ShowPath_4
      TrailParticleSystem=ParticleSystem'FX_Gameplay_EMIT.FX_Objective_White_Trail'
      InputLinks(0)=(DrawY=-5860,OverrideDelta=13)
      InputLinks(1)=(DrawY=-5840,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_1')),DrawY=-5850,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_5'),DrawX=-8443,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8367,OverrideDelta=106)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8496
      ObjPosY=-5896
      DrawWidth=169
      DrawHeight=101
      Name="KFSeqAct_ShowPath_4"
      ObjectArchetype=KFSeqAct_ShowPath'KFGame.Default__KFSeqAct_ShowPath'
   End Object
   Begin Object Class=KFSeqAct_ShowPath Name=KFSeqAct_ShowPath_2
      TrailParticleSystem=ParticleSystem'FX_Gameplay_EMIT.FX_Objective_White_Trail'
      InputLinks(0)=(DrawY=-6108,OverrideDelta=13)
      InputLinks(1)=(DrawY=-6088,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_0')),DrawY=-6098,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_4'),DrawX=-8435,OverrideDelta=16)
      VariableLinks(1)=(DrawX=-8359,OverrideDelta=106)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8488
      ObjPosY=-6144
      DrawWidth=169
      DrawHeight=101
      Name="KFSeqAct_ShowPath_2"
      ObjectArchetype=KFSeqAct_ShowPath'KFGame.Default__KFSeqAct_ShowPath'
   End Object
   Begin Object Class=InterpData Name=InterpData_20
      Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
         Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
            CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
            Name="InterpTrackDirector_0"
            ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
         End Object
         InterpTracks(0)=InterpTrackDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20.InterpGroupDirector_0.InterpTrackDirector_0'
         GroupColor=(B=84,G=221,R=0,A=255)
         Name="InterpGroupDirector_0"
         ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
      End Object
      Begin Object Class=InterpGroup Name=InterpGroup_9
         Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_1
            Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_Material_Types_MAT.Glass.Env_TankGlass_Obj_PM',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1481.StaticMeshComponent_13'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1531.StaticMeshComponent_14'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_439.StaticMeshComponent_15'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_622.StaticMeshComponent_16'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2449.StaticMeshComponent_17'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2585.StaticMeshComponent_18'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4937.StaticMeshComponent_3'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1747.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1775.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1860.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1865.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1463.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1490.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2018.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1231.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6634.StaticMeshComponent_9'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1578.StaticMeshComponent_12'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2530.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2525.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2543.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2545.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2544.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_5120.StaticMeshComponent_91'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6608.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2659.StaticMeshComponent_9'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6407.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6402.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6406.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6399.StaticMeshComponent_83')))
            ParamName="Scalar_FogDepth"
            FloatTrack=(Points=((OutVal=38200.652344,InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=3511.507080,InterpMode=CIM_CurveAutoClamped)))
            CurveTension=8000.000000
            TrackTitle="Fog_Depth"
            Name="InterpTrackFloatMaterialParam_1"
            ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
         End Object
         InterpTracks(0)=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20.InterpGroup_9.InterpTrackFloatMaterialParam_1'
         GroupName="Glass"
         GroupColor=(B=0,G=184,R=153,A=255)
         Name="InterpGroup_9"
         ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
      End Object
      Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
         Tabs(0)=(Curves=((CurveObject=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20.InterpGroup_9.InterpTrackFloatMaterialParam_1',CurveColor=(B=0,G=184,R=153,A=255),CurveName="Glass_Fog_Depth")),ViewStartInput=0.026350,ViewEndInput=14.826350,ViewStartOutput=1030.645142,ViewEndOutput=3775.061768)
         Name="InterpCurveEdSetup_1"
         ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
      End Object
      InterpGroups(0)=InterpGroupDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20.InterpGroupDirector_0'
      InterpGroups(1)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20.InterpGroup_9'
      CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20.InterpCurveEdSetup_1'
      SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
      EdSectionEnd=5.000000
      BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations",bReferencedButUnused=True)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss'
      ObjPosX=-8808
      ObjPosY=-3576
      DrawWidth=32
      DrawHeight=32
      Name="InterpData_20"
      ObjectArchetype=InterpData'Engine.Default__InterpData'
   End Object
   SequenceObjects(0)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_226'
   SequenceObjects(1)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_117'
   SequenceObjects(2)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_SetMaterial_14'
   SequenceObjects(3)=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_SetMaterial_19'
   SequenceObjects(4)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_1'
   SequenceObjects(5)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_10'
   SequenceObjects(6)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SequenceFrame_31'
   SequenceObjects(7)=KFSeqAct_StartObjectiveWave'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_StartObjectiveWave_0'
   SequenceObjects(8)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_28'
   SequenceObjects(9)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_5'
   SequenceObjects(10)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_4'
   SequenceObjects(11)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_86'
   SequenceObjects(12)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_3'
   SequenceObjects(13)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_3'
   SequenceObjects(14)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_23'
   SequenceObjects(15)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_31'
   SequenceObjects(16)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_8'
   SequenceObjects(17)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_80'
   SequenceObjects(18)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_64'
   SequenceObjects(19)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_0'
   SequenceObjects(20)=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Switch_0'
   SequenceObjects(21)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_63'
   SequenceObjects(22)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_62'
   SequenceObjects(23)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_0'
   SequenceObjects(24)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_5'
   SequenceObjects(25)=KFSeqEvent_MinigameActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqEvent_MinigameActivated_2'
   SequenceObjects(26)=KFSeqEvent_MinigameActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqEvent_MinigameActivated_1'
   SequenceObjects(27)=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_2'
   SequenceObjects(28)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_4'
   SequenceObjects(29)=KFSeqEvent_ExterminateBossHealthPct'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqEvent_ExterminateBossHealthPct_2'
   SequenceObjects(30)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_16'
   SequenceObjects(31)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_20'
   SequenceObjects(32)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_0'
   SequenceObjects(33)=KFSeqEvent_MapObjectiveActivated'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqEvent_MapObjectiveActivated_4'
   SequenceObjects(34)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SequenceFrame_1'
   SequenceObjects(35)=SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Int_2'
   SequenceObjects(36)=SeqCond_CompareInt'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqCond_CompareInt_0'
   SequenceObjects(37)=KFSeqEvent_TraderClosed'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqEvent_TraderClosed_2'
   SequenceObjects(38)=SeqVar_Int'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Int_3'
   SequenceObjects(39)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_11'
   SequenceObjects(40)=SeqAct_AkPostEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_AkPostEvent_13'
   SequenceObjects(41)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_0'
   SequenceObjects(42)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_1'
   SequenceObjects(43)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_2'
   SequenceObjects(44)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_2'
   SequenceObjects(45)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_0'
   SequenceObjects(46)=KFSeqAct_ShowPath'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.KFSeqAct_ShowPath_4'
   SequenceObjects(47)=SeqAct_ChangeCollision'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ChangeCollision_1'
   SequenceObjects(48)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_5'
   SequenceObjects(49)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_2'
   SequenceObjects(50)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_ActivateRemoteEvent_1'
   SequenceObjects(51)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqEvent_RemoteEvent_31'
   SequenceObjects(52)=SeqEvent_RemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqEvent_RemoteEvent_30'
   SequenceObjects(53)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_7'
   SequenceObjects(54)=SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Object_55'
   SequenceObjects(55)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_21'
   SequenceObjects(56)=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Toggle_6'
   SequenceObjects(57)=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Interp_20'
   SequenceObjects(58)=InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.InterpData_20'
   SequenceObjects(59)=SeqAct_Switch'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqAct_Switch_1'
   SequenceObjects(60)=SeqVar_Named'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Named_5'
   SequenceObjects(61)=SeqVar_Bool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqVar_Bool_3'
   SequenceObjects(62)=SeqCond_CompareBool'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_8_Boss.SeqCond_CompareBool_1'
   DefaultViewX=8946
   DefaultViewY=5773
   DefaultViewZoom=0.900000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-7592
   ObjName="Obj_8_Boss"
   DrawWidth=86
   DrawHeight=29
   Name="Obj_8_Boss"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=Obj_INT
   Begin Object Class=SequenceFrame Name=SequenceFrame_46
      SizeX=1274
      SizeY=619
      bDrawBox=True
      FillColor=(B=226,G=0,R=255,A=16)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT'
      ObjPosX=-8248
      ObjPosY=-9528
      ObjComment="Intro VO"
      DrawWidth=1274
      DrawHeight=619
      Name="SequenceFrame_46"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqAct_Gate Name=SeqAct_Gate_0
      InputLinks(0)=(DrawY=-9203,OverrideDelta=14)
      InputLinks(1)=(DrawY=-9181,OverrideDelta=36)
      InputLinks(2)=(DrawY=-9159,OverrideDelta=58)
      InputLinks(3)=(DrawY=-9137,OverrideDelta=80)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_Gate_0',InputLinkIdx=2),(LinkedOp=SeqAct_Delay'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_Delay_4')),DrawY=-9170,OverrideDelta=47)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT'
      ObjPosX=-7664
      ObjPosY=-9240
      DrawWidth=82
      DrawHeight=117
      Name="SeqAct_Gate_0"
      ObjectArchetype=SeqAct_Gate'Engine.Default__SeqAct_Gate'
   End Object
   Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
      Duration=4.000000
      InputLinks(0)=(DrawY=-9171,OverrideDelta=14)
      InputLinks(1)=(DrawY=-9150,OverrideDelta=35)
      InputLinks(2)=(DrawY=-9129,OverrideDelta=56)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_ActivateRemoteEvent_46')),DrawY=-9166,OverrideDelta=19)
      OutputLinks(1)=(DrawY=-9134,OverrideDelta=51)
      VariableLinks(0)=(DrawX=-7460,OverrideDelta=25)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT'
      ObjPosX=-7512
      ObjPosY=-9208
      DrawWidth=106
      DrawHeight=109
      Name="SeqAct_Delay_4"
      ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
   End Object
   Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_46
      EventName="PlayIntroVO"
      InputLinks(0)=(DrawY=-9166,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-9166,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-7200,OverrideDelta=96)
      ObjInstanceVersion=3
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT'
      ObjPosX=-7328
      ObjPosY=-9200
      DrawWidth=256
      DrawHeight=61
      Name="SeqAct_ActivateRemoteEvent_46"
      ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
   End Object
   Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_1
      MaxTriggerCount=0
      bClientSideOnly=True
      MaxWidth=216
      OutputLinks(0)=(DrawY=-9290,OverrideDelta=15)
      OutputLinks(1)=(DrawY=-9267,OverrideDelta=38)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_Gate_0',InputLinkIdx=1)),DrawY=-9244,OverrideDelta=61)
      OutputLinks(3)=(DrawY=-9221,OverrideDelta=84)
      OutputLinks(4)=(DrawY=-9198,OverrideDelta=107)
      OutputLinks(5)=(DrawY=-9175,OverrideDelta=130)
      OutputLinks(6)=(DrawY=-9152,OverrideDelta=153)
      OutputLinks(7)=(DrawY=-9129,OverrideDelta=176)
      OutputLinks(8)=(Links=((LinkedOp=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_Gate_0')),DrawY=-9106,OverrideDelta=199)
      ObjInstanceVersion=5
      ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT'
      ObjPosX=-8112
      ObjPosY=-9360
      DrawWidth=217
      Name="KFSeqEvent_LevelLoaded_1"
      ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
   End Object
   SequenceObjects(0)=SeqAct_ActivateRemoteEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_ActivateRemoteEvent_46'
   SequenceObjects(1)=SeqAct_Delay'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_Delay_4'
   SequenceObjects(2)=KFSeqEvent_LevelLoaded'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.KFSeqEvent_LevelLoaded_1'
   SequenceObjects(3)=SequenceFrame'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SequenceFrame_46'
   SequenceObjects(4)=SeqAct_Gate'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.Obj_INT.SeqAct_Gate_0'
   DefaultViewX=7010
   DefaultViewY=7638
   DefaultViewZoom=0.800000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-8112
   ObjName="Obj_INT"
   DrawWidth=64
   DrawHeight=29
   Name="Obj_INT"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   PlayRate=0.700000
   bLooping=True
   InputLinks(0)=(DrawY=-5682,ActivateDelay=0.200000,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5660,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5638,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5616,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5594,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5666,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5610,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-6528,OverrideDelta=33)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Whip1",MinVars=0,DrawX=-6476,OverrideDelta=80)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-5720
   ObjComment="Tentacle"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Idle_02",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Whip1"
      GroupColor=(B=155,G=183,R=0,A=255)
      GroupAnimSets(0)=None
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.640300
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.640300
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-5520
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6480
   ObjPosY=-5520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   PlayRate=0.500000
   bLooping=True
   InputLinks(0)=(DrawY=-6018,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5996,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5974,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5952,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5930,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6002,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5946,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=-6500,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),LinkDesc="Whip",MinVars=0,DrawX=-6452,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6552
   ObjPosY=-6056
   ObjComment="Tentacle"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(StartTime=-0.032641,AnimSeqName="Move_02",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_3.InterpTrackAnimControl_1'
      GroupName="Whip"
      GroupColor=(B=224,G=74,R=0,A=255)
      GroupAnimSets(0)=None
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.551473
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.551473
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-5848
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6448
   ObjPosY=-5856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_1
   InputLinks(0)=(DrawY=-6579,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6558,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6537,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6558,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=-6442,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6391,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6342,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6480
   ObjPosY=-6616
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_1"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_0')),DrawY=-6227,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6206,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6185,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7616
   ObjPosY=-6296
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_19
   PlayRate=3.000000
   bLooping=True
   InputLinks(0)=(DrawY=-5770,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5748,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5726,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5704,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5682,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5754,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5698,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_19'),DrawX=-6268,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),LinkDesc="Whip",MinVars=0,DrawX=-6220,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6320
   ObjPosY=-5808
   ObjComment="Tentacle"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_19"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_19
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_6
         AnimSeqs(0)=(AnimSeqName="Come_Out",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_6"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_4.InterpTrackAnimControl_6'
      GroupName="Whip"
      GroupColor=(B=230,G=0,R=50,A=255)
      GroupAnimSets(0)=None
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.462099
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.462099
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6320
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_19"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=-5616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=-6400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6552
   ObjPosY=-6472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-6448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
   InputLinks(0)=(DrawY=-6638,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1')),DrawY=-6638,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),DrawX=-6706,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-6672
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_0"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_75'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-6560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="ClotMotherPoisoned"
   InputLinks(0)=(DrawY=-5094,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6822,OverrideDelta=122)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6976
   ObjPosY=-5128
   DrawWidth=308
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_21
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Come_Out",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpGroup_1.InterpTrackAnimControl_1'
      GroupName="Whip"
      GroupColor=(B=0,G=217,R=95,A=255)
      GroupAnimSets(0)=None
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.462099
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_21.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.462099
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=-5288
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_21"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_21
   PlayRate=3.000000
   bLooping=True
   InputLinks(0)=(DrawY=-5434,ActivateDelay=0.100000,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5412,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5390,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5368,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5346,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5418,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5362,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_21'),DrawX=-6276,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),LinkDesc="Whip",MinVars=0,DrawX=-6228,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6328
   ObjPosY=-5472
   ObjComment="Tentacle"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_21"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-5288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6448
   ObjPosY=-6376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   PlayRate=3.000000
   bLooping=True
   InputLinks(0)=(DrawY=-5362,ActivateDelay=0.200000,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5340,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5318,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5296,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5274,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5346,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5290,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=-6516,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),LinkDesc="Whip",MinVars=0,DrawX=-6468,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-5400
   ObjComment="Tentacle"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="Come_Out",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackAnimControl_2'
      GroupName="Whip"
      GroupColor=(B=0,G=157,R=181,A=255)
      GroupAnimSets(0)=None
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.462099
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.462099
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-5216
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6472
   ObjPosY=-5216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFSkeletalMeshActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFSkeletalMeshActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6376
   ObjPosY=-6432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_22
   PlayRate=0.500000
   bLooping=True
   InputLinks(0)=(DrawY=-6114,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6092,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6070,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6048,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6026,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6098,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6042,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_22'),DrawX=-6251,OverrideDelta=30)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52'),LinkDesc="ClotMother",MinVars=0,DrawX=-6196,OverrideDelta=77)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-6152
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_22"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_22
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=0.000004),InterpMode=CIM_CurveAutoClamped),(InVal=0.250000,OutVal=(X=0.000977,Y=-0.000244,Z=0.032296),ArriveTangent=(X=0.005859,Y=0.000000,Z=0.186404),LeaveTangent=(X=0.005859,Y=0.000000,Z=0.186404),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.002930,Y=0.000000,Z=0.093206),ArriveTangent=(X=0.011719,Y=0.001710,Z=0.000000),LeaveTangent=(X=0.011719,Y=0.001710,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.750000,OutVal=(X=0.006836,Y=0.000732,Z=-0.086037),ArriveTangent=(X=0.007425,Y=0.002441,Z=0.000000),LeaveTangent=(X=0.007425,Y=0.002441,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.007813,Y=0.001221,Z=-0.026024),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.250000,OutVal=(X=1.008764,Y=1.027184,Z=-1.984225),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-0.979080,Z=2.008821),ArriveTangent=(X=-4.054501,Y=0.000000,Z=0.000000),LeaveTangent=(X=-4.054501,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.750000,OutVal=(X=-1.018486,Y=1.017462,Z=-2.004799),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.250000),(Time=0.500000),(Time=0.750000),(Time=1.000000)))
         bShowRotationOnCurveEd=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_4.InterpTrackMove_1'
      GroupName="ClotMother"
      GroupColor=(B=0,G=133,R=199,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Tabs(0)=(Curves=((CurveObject=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_4.InterpTrackMove_1',CurveColor=(B=0,G=133,R=199,A=255),CurveName="ClotMother_Movement",bHideCurve=14)),ViewStartInput=-0.100712,ViewEndInput=1.099288,ViewStartOutput=-7.726430,ViewEndOutput=8.005363)
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_22.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6312
   ObjPosY=-5944
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_22"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6192
   ObjPosY=-5936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=TargetPoint'KF-BIOTICSLAB.TheWorld:PersistentLevel.TargetPoint_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-5032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-1499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78'),DrawX=-4866,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4815,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4766,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4904
   ObjPosY=-1536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_216'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=-1016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_236'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4768
   ObjPosY=-1016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_250'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4760
   ObjPosY=-944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_300'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4688
   ObjPosY=-944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
   NewMaterial=MaterialInstanceConstant'KF-BIOTICSLAB.Env_BioticsLab_Orange_Emissive_MIC'
   InputLinks(0)=(DrawY=-1118,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18'),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23')),DrawY=-1118,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=-4955,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5000
   ObjPosY=-1152
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_5"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5056
   ObjPosY=-1048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5032
   ObjPosY=-976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4936
   ObjPosY=-1064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4952
   ObjPosY=-984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-1123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1081,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1102,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224'),DrawX=-4658,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4607,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4558,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=-1160
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_87'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-1392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-1328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_86'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4904
   ObjPosY=-1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_85'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4832
   ObjPosY=-1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-1400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_22
   EventName="SpeedUpCloningMachines"
   MaxWidth=283
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_5')),DrawY=-1118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5259,OverrideDelta=109)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5400
   ObjPosY=-1184
   ObjComment="SpeedUpCloningMachines"
   DrawWidth=161
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_22"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="StopCloningMachines"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1')),DrawY=-830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5272,OverrideDelta=96)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5400
   ObjPosY=-896
   ObjComment="StopCloningMachines"
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4960
   ObjPosY=-696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4944
   ObjPosY=-776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5040
   ObjPosY=-688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   InputLinks(0)=(DrawY=-830,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_23',InputLinkIdx=1)),DrawY=-830,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=-4963,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5008
   ObjPosY=-864
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4776
   ObjPosY=-712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_177',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_195',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_196',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223'),DrawX=-4666,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4615,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4566,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4704
   ObjPosY=-832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_310'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4616
   ObjPosY=-1016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4784
   ObjPosY=-640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4704
   ObjPosY=-672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4712
   ObjPosY=-600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_192"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4632
   ObjPosY=-688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_195"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_196
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4632
   ObjPosY=-608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_196"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4552
   ObjPosY=-696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4560
   ObjPosY=-616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4792
   ObjPosY=-552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4704
   ObjPosY=-528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_210'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4608
   ObjPosY=-944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=1596
   SizeY=1422
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-1816
   ObjComment="Track Overload"
   DrawWidth=1596
   DrawHeight=1422
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_23
   InputLinks(0)=(DrawY=-922,OverrideDelta=15)
   InputLinks(1)=(DrawY=-900,OverrideDelta=37)
   InputLinks(2)=(DrawY=-878,OverrideDelta=59)
   InputLinks(3)=(DrawY=-856,OverrideDelta=81)
   InputLinks(4)=(DrawY=-834,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-906,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-850,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_23'),DrawX=-4166,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_348'),LinkDesc="GlowTrack",MinVars=0,DrawX=-4116,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4216
   ObjPosY=-960
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_23"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_23
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'KF-BIOTICSLAB.Env_BioticsLab_Rail_Emissive_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_34.StaticMeshComponent_139',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_35.StaticMeshComponent_140',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_36.StaticMeshComponent_141',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_37.StaticMeshComponent_142',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_38.StaticMeshComponent_143',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_39.StaticMeshComponent_144',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_40.StaticMeshComponent_145',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_41.StaticMeshComponent_146',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_42.StaticMeshComponent_147',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_43.StaticMeshComponent_148',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_44.StaticMeshComponent_149',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_45.StaticMeshComponent_150',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_46.StaticMeshComponent_151',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_47.StaticMeshComponent_152',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_48.StaticMeshComponent_153',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_49.StaticMeshComponent_154',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_52.StaticMeshComponent_155',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_53.StaticMeshComponent_156',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_54.StaticMeshComponent_157',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_55.StaticMeshComponent_158',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_56.StaticMeshComponent_159',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_57.StaticMeshComponent_160',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_58.StaticMeshComponent_161',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_59.StaticMeshComponent_162',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_60.StaticMeshComponent_163',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_61.StaticMeshComponent_164',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_62.StaticMeshComponent_165',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_63.StaticMeshComponent_166',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_64.StaticMeshComponent_167',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_65.StaticMeshComponent_168',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_66.StaticMeshComponent_169',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_67.StaticMeshComponent_170',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_68.StaticMeshComponent_171',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_69.StaticMeshComponent_172',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_70.StaticMeshComponent_173',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_71.StaticMeshComponent_174',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_72.StaticMeshComponent_175',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_73.StaticMeshComponent_176',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_74.StaticMeshComponent_177',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_75.StaticMeshComponent_178',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_76.StaticMeshComponent_179',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_77.StaticMeshComponent_180',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_78.StaticMeshComponent_181',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_79.StaticMeshComponent_182',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_97.StaticMeshComponent_347',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_98.StaticMeshComponent_348',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_99.StaticMeshComponent_349',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_100.StaticMeshComponent_350',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_101.StaticMeshComponent_351',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_102.StaticMeshComponent_352',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_103.StaticMeshComponent_353',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_104.StaticMeshComponent_354',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_105.StaticMeshComponent_355',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_106.StaticMeshComponent_356',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_107.StaticMeshComponent_357',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_108.StaticMeshComponent_358',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_109.StaticMeshComponent_359',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_110.StaticMeshComponent_360',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_111.StaticMeshComponent_361',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_112.StaticMeshComponent_362',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_113.StaticMeshComponent_363',MaterialIndex=1)))
         ParamName="Emissive_Intensity"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_0"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0.InterpTrackFloatMaterialParam_0'
      GroupName="GlowTrack"
      GroupColor=(B=146,G=0,R=191,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0.InterpTrackFloatMaterialParam_0',CurveColor=(B=146,G=0,R=191,A=255),CurveName="GlowTrack_Float Material Param")),ViewStartInput=-0.100000,ViewEndInput=1.100000,ViewStartOutput=-0.500000,ViewEndOutput=5.500000)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4216
   ObjPosY=-760
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_23"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_348
   ObjValue=MaterialInstanceActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.MaterialInstanceActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4120
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_348"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_349
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_216'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=860
   ObjPosY=-9167
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_349"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_236'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=956
   ObjPosY=-9167
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_250'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1060
   ObjPosY=-9167
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_300'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1156
   ObjPosY=-9167
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=PointLight'KF-BIOTICSLAB.TheWorld:PersistentLevel.PointLight_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=-9256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=723
   SizeY=190
   bDrawBox=True
   BorderColor=(B=25,G=0,R=178,A=255)
   FillColor=(B=19,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-8640
   ObjComment="."
   DrawWidth=723
   DrawHeight=190
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_74
   SizeX=729
   SizeY=157
   bDrawBox=True
   BorderColor=(B=176,G=145,R=178,A=255)
   FillColor=(B=252,G=210,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-8872
   ObjComment="."
   DrawWidth=729
   DrawHeight=157
   Name="SequenceFrame_74"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_72
   SizeX=726
   SizeY=160
   bDrawBox=True
   BorderColor=(B=34,G=160,R=0,A=255)
   FillColor=(B=58,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6608
   ObjPosY=-9104
   ObjComment="."
   DrawWidth=726
   DrawHeight=160
   Name="SequenceFrame_72"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=729
   SizeY=141
   bDrawBox=True
   BorderColor=(B=255,G=91,R=0,A=255)
   FillColor=(B=255,G=158,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-9344
   ObjComment="."
   DrawWidth=729
   DrawHeight=141
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_70
   SizeX=765
   SizeY=150
   bDrawBox=True
   BorderColor=(B=0,G=159,R=255,A=255)
   FillColor=(B=0,G=231,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6608
   ObjPosY=-9576
   ObjComment="."
   DrawWidth=765
   DrawHeight=150
   Name="SequenceFrame_70"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=765
   SizeY=150
   bDrawBox=True
   BorderColor=(B=0,G=159,R=255,A=255)
   FillColor=(B=0,G=231,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-9584
   ObjComment="Client Side"
   DrawWidth=765
   DrawHeight=150
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=729
   SizeY=141
   bDrawBox=True
   BorderColor=(B=255,G=91,R=0,A=255)
   FillColor=(B=255,G=158,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7448
   ObjPosY=-9352
   ObjComment="Audio"
   DrawWidth=729
   DrawHeight=141
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=726
   SizeY=160
   bDrawBox=True
   BorderColor=(B=34,G=160,R=0,A=255)
   FillColor=(B=58,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-9112
   ObjComment="UI / HUD"
   DrawWidth=726
   DrawHeight=160
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=729
   SizeY=157
   bDrawBox=True
   BorderColor=(B=176,G=145,R=178,A=255)
   FillColor=(B=252,G=210,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7448
   ObjPosY=-8880
   ObjComment="Traps"
   DrawWidth=729
   DrawHeight=157
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=723
   SizeY=190
   bDrawBox=True
   BorderColor=(B=25,G=0,R=178,A=255)
   FillColor=(B=19,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7448
   ObjPosY=-8648
   ObjComment="Delete"
   DrawWidth=723
   DrawHeight=190
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_69
   SizeX=847
   SizeY=1277
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-9704
   ObjComment="L E G E N D"
   DrawWidth=847
   DrawHeight=1277
   Name="SequenceFrame_69"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7056
   ObjPosY=-4680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_83'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-4680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6832
   ObjPosY=-4680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=InterpActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.InterpActor_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6984
   ObjPosY=-4680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_20
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=84,G=221,R=0,A=255)
      bCollapsed=True
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_Material_Types_MAT.Glass.Env_TankGlass_Obj_PM',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1481.StaticMeshComponent_13'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1531.StaticMeshComponent_14'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_439.StaticMeshComponent_15'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_622.StaticMeshComponent_16'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2449.StaticMeshComponent_17'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2585.StaticMeshComponent_18'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4937.StaticMeshComponent_3'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1747.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1775.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1860.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1865.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1463.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1490.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2018.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1231.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6634.StaticMeshComponent_9'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1578.StaticMeshComponent_12'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2530.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2525.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2543.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2545.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2544.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_5120.StaticMeshComponent_91'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6608.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2659.StaticMeshComponent_9'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6407.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6402.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6406.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6399.StaticMeshComponent_83')))
         ParamName="Scalar_Blood"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=7.707836,InterpMode=CIM_CurveAutoClamped),(InVal=7.908818,OutVal=1.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="GlassBlood"
         Name="InterpTrackFloatMaterialParam_0"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_9.InterpTrackFloatMaterialParam_0'
      GroupName="Glass"
      GroupColor=(B=0,G=184,R=153,A=255)
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_0
         ToggleTrack(0)=(Time=2.000000,ToggleAction=ETTA_Trigger)
         Name="InterpTrackToggle_0"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_8.InterpTrackToggle_0'
      GroupName="Pod1_FX"
      GroupColor=(B=58,G=0,R=228,A=255)
      bIsParented=True
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackVisibility Name=InterpTrackVisibility_0
         VisibilityTrack(0)=(Action=EVTA_Show)
         VisibilityTrack(1)=(Time=1.500000)
         TrackTitle="Vis"
         Name="InterpTrackVisibility_0"
         ObjectArchetype=InterpTrackVisibility'Engine.Default__InterpTrackVisibility'
      End Object
      InterpTracks(0)=InterpTrackVisibility'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_7.InterpTrackVisibility_0'
      GroupName="Pod4"
      GroupColor=(B=0,G=228,R=58,A=255)
      bIsParented=True
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackVisibility Name=InterpTrackVisibility_0
         VisibilityTrack(0)=(Action=EVTA_Show)
         VisibilityTrack(1)=(Time=0.650000)
         TrackTitle="Vis"
         Name="InterpTrackVisibility_0"
         ObjectArchetype=InterpTrackVisibility'Engine.Default__InterpTrackVisibility'
      End Object
      InterpTracks(0)=InterpTrackVisibility'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_6.InterpTrackVisibility_0'
      GroupName="Pod3"
      GroupColor=(B=233,G=0,R=30,A=255)
      bIsParented=True
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackVisibility Name=InterpTrackVisibility_0
         VisibilityTrack(0)=(Action=EVTA_Show)
         VisibilityTrack(1)=(Time=3.000000)
         TrackTitle="Vis"
         Name="InterpTrackVisibility_0"
         ObjectArchetype=InterpTrackVisibility'Engine.Default__InterpTrackVisibility'
      End Object
      InterpTracks(0)=InterpTrackVisibility'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_5.InterpTrackVisibility_0'
      GroupName="Pod2"
      GroupColor=(B=200,G=131,R=0,A=255)
      bIsParented=True
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=7.738773,Event=AkEvent'WW_ENV_BioticsLab.Play_ENV_Biotics_OBJ_Cin_Close')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.122449,Event=AkEvent'WW_ENV_BioticsLab.Play_ENV_Biotics_OBJ_Cin_Base')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_4.InterpTrackAkEvent_0'
      InterpTracks(1)=InterpTrackAkEvent'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_4.InterpTrackAkEvent_1'
      GroupName="SFX1"
      GroupColor=(B=0,G=118,R=207,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      GroupName="Pods"
      GroupColor=(B=156,G=0,R=183,A=255)
      bCollapsed=True
      bIsFolder=True
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackVisibility Name=InterpTrackVisibility_0
         VisibilityTrack(0)=(Action=EVTA_Show)
         VisibilityTrack(1)=(Time=2.030768)
         TrackTitle="Vis"
         Name="InterpTrackVisibility_0"
         ObjectArchetype=InterpTrackVisibility'Engine.Default__InterpTrackVisibility'
      End Object
      InterpTracks(0)=InterpTrackVisibility'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_2.InterpTrackVisibility_0'
      GroupName="Pod1"
      GroupColor=(B=136,G=0,R=197,A=255)
      bIsParented=True
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_13
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_0
         ToggleTrack(0)=(Time=0.618167,ToggleAction=ETTA_Trigger)
         Name="InterpTrackToggle_0"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_13.InterpTrackToggle_0'
      GroupName="Pod4_FX"
      GroupColor=(B=213,G=0,R=109,A=255)
      bIsParented=True
      Name="InterpGroup_13"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_12
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_0
         ToggleTrack(0)=(Time=1.478923,ToggleAction=ETTA_Trigger)
         Name="InterpTrackToggle_0"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_12.InterpTrackToggle_0'
      GroupName="Pod3_FX"
      GroupColor=(B=226,G=0,R=69,A=255)
      bIsParented=True
      Name="InterpGroup_12"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_11
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_0
         ToggleTrack(0)=(Time=3.000000,ToggleAction=ETTA_Trigger)
         Name="InterpTrackToggle_0"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_11.InterpTrackToggle_0'
      GroupName="Pod2_FX"
      GroupColor=(B=112,G=0,R=210,A=255)
      bIsParented=True
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      GroupName="SFX"
      GroupColor=(B=0,G=105,R=213,A=255)
      bCollapsed=True
      bIsFolder=True
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=-0.002262,OutVal=(X=-242.372559,Y=-4.865234,Z=-10.973755),ArriveTangent=(X=0.000000,Y=-91.257477,Z=-82.338577),InterpMode=CIM_CurveAutoClamped),(InVal=6.914617,OutVal=(X=238.907715,Y=-1226.026367,Z=-579.302979),ArriveTangent=(X=0.000000,Y=0.000000,Z=-43.314552),LeaveTangent=(X=0.000000,Y=0.000000,Z=-43.314552),InterpMode=CIM_CurveAutoClamped),(InVal=13.984832,OutVal=(X=76.910645,Y=-992.942383,Z=-746.027405),LeaveTangent=(X=-1.330235,Y=0.381095,Z=-1.165833),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=-0.002262,OutVal=(X=-0.148315,Y=-0.148315,Z=-0.411987),ArriveTangent=(X=0.534628,Y=0.610404,Z=10.044848),InterpMode=CIM_CurveAutoClamped),(InVal=6.914617,OutVal=(X=3.405762,Y=7.921143,Z=66.264038),ArriveTangent=(X=0.000000,Y=0.492474,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.492474,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=13.984832,OutVal=(X=2.164307,Y=9.678955,Z=43.450928),LeaveTangent=(X=0.065374,Y=0.000000,Z=1.113050),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=-0.002262),(Time=6.914617),(Time=13.984832)))
         bUseRawActorTMforRelativeToInitial=True
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_0.InterpTrackMove_0'
      GroupName="Camera"
      GroupColor=(B=0,G=95,R=217,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Tabs(0)=(Curves=((CurveObject=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_9.InterpTrackFloatMaterialParam_0',CurveColor=(B=0,G=184,R=153,A=255),CurveName="Glass_GlassBlood",bHideCurve=1)),ViewStartInput=-0.832653,ViewEndInput=29.167339,ViewStartOutput=645.399719,ViewEndOutput=1923.385010)
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=30.000000
   InterpGroups(0)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroupDirector_0'
   InterpGroups(2)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_3'
   InterpGroups(3)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_2'
   InterpGroups(4)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_5'
   InterpGroups(5)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_6'
   InterpGroups(6)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_7'
   InterpGroups(7)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_8'
   InterpGroups(8)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_11'
   InterpGroups(9)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_12'
   InterpGroups(10)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_13'
   InterpGroups(11)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_9'
   InterpGroups(12)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_1'
   InterpGroups(13)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=30.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations",bReferencedButUnused=True)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-4672
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_20"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_20
   InputLinks(0)=(DrawY=-4914,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4892,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4870,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4848,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4826,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4898,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4842,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_20'),DrawX=-7081,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),LinkDesc="Camera",MinVars=0,DrawX=-7025,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112'),LinkDesc="Pod1",MinVars=0,DrawX=-6968,OverrideDelta=128)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),LinkDesc="Pod2",MinVars=0,DrawX=-6920,OverrideDelta=176)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),LinkDesc="Pod3",MinVars=0,DrawX=-6872,OverrideDelta=224)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),LinkDesc="Pod4",MinVars=0,DrawX=-6824,OverrideDelta=272)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),LinkDesc="Pod1_FX",MinVars=0,DrawX=-6722,OverrideDelta=370)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Glass",MinVars=0,DrawX=-6775,OverrideDelta=320)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),LinkDesc="Pod2_FX",MinVars=0,DrawX=-6666,OverrideDelta=426)
   VariableLinks(9)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),LinkDesc="Pod3_FX",MinVars=0,DrawX=-6610,OverrideDelta=482)
   VariableLinks(10)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126'),LinkDesc="Pod4_FX",MinVars=0,DrawX=-6554,OverrideDelta=538)
   VariableLinks(11)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="SFX1",MinVars=0,DrawX=-6501,OverrideDelta=594)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7112
   ObjPosY=-4952
   ObjComment="Camera"
   DrawWidth=644
   DrawHeight=173
   Name="SeqAct_Interp_20"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=615
   SizeY=251
   bDrawBox=True
   BorderColor=(B=25,G=0,R=178,A=255)
   FillColor=(B=19,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8232
   ObjPosY=-6608
   ObjComment="."
   DrawWidth=615
   DrawHeight=251
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=CameraActor'KF-BIOTICSLAB.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-4672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=211
   SizeY=150
   bDrawBox=True
   BorderColor=(B=255,G=91,R=0,A=255)
   FillColor=(B=255,G=158,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6552
   ObjPosY=-6296
   ObjComment="."
   DrawWidth=211
   DrawHeight=150
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_25
   SizeX=225
   SizeY=201
   bDrawBox=True
   BorderColor=(B=255,G=91,R=0,A=255)
   FillColor=(B=255,G=158,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=-5144
   ObjComment="."
   DrawWidth=225
   DrawHeight=201
   Name="SequenceFrame_25"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   InputLinks(0)=(DrawY=-4890,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4868,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4846,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4824,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4802,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4874,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4818,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=-7789,OverrideDelta=36)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Glass",MinVars=0,DrawX=-7740,OverrideDelta=83)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7840
   ObjPosY=-4928
   ObjComment="Change glass to normal"
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=84,G=221,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_1
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_Material_Types_MAT.Glass.Env_TankGlass_Obj_PM',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1481.StaticMeshComponent_13'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1531.StaticMeshComponent_14'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_439.StaticMeshComponent_15'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_622.StaticMeshComponent_16'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2449.StaticMeshComponent_17'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2585.StaticMeshComponent_18'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4937.StaticMeshComponent_3'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1747.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1775.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1860.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1865.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1463.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1490.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2018.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1231.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6634.StaticMeshComponent_9'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_1578.StaticMeshComponent_12'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2530.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2525.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2543.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2545.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_4.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2544.StaticMeshComponent_76'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_5120.StaticMeshComponent_91'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6608.StaticMeshComponent_10'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_2659.StaticMeshComponent_9'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6407.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6402.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6406.StaticMeshComponent_83'),(Primitive=StaticMeshComponent'KF-BIOTICSLAB.TheWorld:PersistentLevel.StaticMeshActor_6399.StaticMeshComponent_83')))
         ParamName="Scalar_FogDepth"
         FloatTrack=(Points=((InVal=0.100000,OutVal=-9.999763,InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=-10.002954,InterpMode=CIM_CurveAutoClamped)))
         CurveTension=8000.000000
         TrackTitle="Fog_Depth"
         Name="InterpTrackFloatMaterialParam_1"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_9.InterpTrackFloatMaterialParam_1'
      GroupName="Glass"
      GroupColor=(B=0,G=184,R=153,A=255)
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackFloatMaterialParam'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_9.InterpTrackFloatMaterialParam_1',CurveColor=(B=0,G=184,R=153,A=255),CurveName="Glass_Fog_Depth")),ViewStartInput=-0.434527,ViewEndInput=1.889231,ViewStartOutput=-11.021423,ViewEndOutput=-9.173601)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.700000
   InterpGroups(0)=InterpGroupDirector'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_9'
   CurveEdSetup=InterpCurveEdSetup'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.700000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_TWO_MESH.ENV_Tentacle_Animations",bReferencedButUnused=True)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-4720
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_1
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4986,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4963,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4940,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4917,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4894,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4871,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4848,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4825,OverrideDelta=176)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_Interp'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-4802,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-5056
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_1"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_803
   ObjValue=KFPathnode'KF-BIOTICSLAB.TheWorld:PersistentLevel.KFPathnode_233'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7576
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_803"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_801
   ObjValue=TriggerVolume'KF-BIOTICSLAB.TheWorld:PersistentLevel.TriggerVolume_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_801"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7720
   ObjPosY=-5312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_3"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_1
   bCheckOverlap=False
   InputLinks(0)=(DrawY=-5382,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5382,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_3'),DrawX=-7679,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_801'),DrawX=-7622,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_803'),DrawX=-7545,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7712
   ObjPosY=-5416
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_1"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6632
   ObjPosY=-4672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_135'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=-4672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_133'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6448
   ObjPosY=-4672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_132'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6720
   ObjPosY=-4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-4195,ActivateDelay=0.500000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4153,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),DrawY=-4174,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),DrawX=-7306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7344
   ObjPosY=-4232
   ObjComment="Overflow"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_137'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_136'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6504
   ObjPosY=-4240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-4059,ActivateDelay=7.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4017,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),DrawY=-4038,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=-6810,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6759,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6710,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-4096
   ObjComment="Overflow"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-3915,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3894,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3873,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3894,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157'),DrawX=-7346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7295,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-3952
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-3824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7280
   ObjPosY=-3824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-4043,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4022,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4001,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4022,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129'),DrawX=-6418,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6367,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6318,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-4080
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_19
   EventName="FinalCinematic"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25'),(LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=-3822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7767,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7872
   ObjPosY=-3888
   ObjComment="FinalCinematic"
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_19"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=-3675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3633,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),DrawY=-3654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=-7354,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7303,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7254,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-3712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7386
   ObjPosY=-3583
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-3552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=-3643,ActivateDelay=3.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3622,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3601,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3622,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-7050,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6999,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6950,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-3680
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-6248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_127'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-6248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_126'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6152
   ObjPosY=-6248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7432
   ObjPosY=-3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7328
   ObjPosY=-3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=-3435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3393,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25',InputLinkIdx=1)),ActivateDelay=6.000000,DrawY=-3414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-7386,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7335,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7286,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7424
   ObjPosY=-3472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-6099,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6078,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6057,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6078,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_167'),DrawX=-5546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5584
   ObjPosY=-6136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5928
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5832
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5728
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5632
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5528
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_129'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5432
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5328
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5232
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5128
   ObjPosY=-5984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=-6355,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6334,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6313,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27',InputLinkIdx=1)),ActivateDelay=7.000000,DrawY=-6334,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98'),DrawX=-6018,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5967,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5918,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=-6392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_131'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-3904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-3904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_125'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6472
   ObjPosY=-3928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=-3928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_123'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6672
   ObjPosY=-3904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_109'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6280
   ObjPosY=-3920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=-4427,ActivateDelay=1.500000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4385,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=-4406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-6701,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6650,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6601,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6739
   ObjPosY=-4464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=-4411,ActivateDelay=3.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4390,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4369,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4390,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147',SeqVar_Object'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-6410,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6359,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6310,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6448
   ObjPosY=-4448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=Emitter'KF-BIOTICSLAB.TheWorld:PersistentLevel.Emitter_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BIOTICSLAB.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6528
   ObjPosY=-4320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
