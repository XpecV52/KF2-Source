Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=2489
   SizeY=1620
   bDrawBox=True
   BorderColor=(B=255,G=101,R=0,A=255)
   FillColor=(B=0,G=249,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-7000
   ObjComment="No Dosh Add Idle Camera"
   DrawWidth=2489
   DrawHeight=1620
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bLooping=True
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-298,OverrideDelta=15)
   InputLinks(1)=(DrawY=-276,OverrideDelta=37)
   InputLinks(2)=(DrawY=-254,OverrideDelta=59)
   InputLinks(3)=(DrawY=-232,OverrideDelta=81)
   InputLinks(4)=(DrawY=-210,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-282,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-226,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=2911,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_160'),LinkDesc="craftcam",MinVars=0,DrawX=2972,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_161'),LinkDesc="Trader",MinVars=0,DrawX=3039,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2880
   ObjPosY=-336
   ObjComment="idle craft anim"
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="craftcam",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=0,G=99,R=216,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999756),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(StartTime=-4.067451,AnimSeqName="Open",AnimPlayRate=1.000000,bReverse=True)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=129,G=0,R=202,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Trader_ANIM.TraderPod_Anim_Master'
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=-0.664616,OutVal=(X=-1447.302856,Y=-174.711395,Z=-1646.217041),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=-1227.472900,Y=139.130859,Z=-1866.216919),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=-0.664616,OutVal=(X=0.000000,Y=0.000000,Z=33.750000),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=-0.664616),))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="craftcam"
      GroupColor=(B=222,G=79,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2832
   ObjPosY=-104
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=518,OverrideDelta=15)
   InputLinks(1)=(DrawY=540,OverrideDelta=37)
   InputLinks(2)=(DrawY=562,OverrideDelta=59)
   InputLinks(3)=(DrawY=584,OverrideDelta=81)
   InputLinks(4)=(DrawY=606,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=534,OverrideDelta=31)
   OutputLinks(1)=(DrawY=590,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=-2223,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_169'),LinkDesc="loopcam",MinVars=0,DrawX=-2164,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_168'),LinkDesc="Trader",MinVars=0,DrawX=-2100,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2254
   ObjPosY=480
   ObjComment="looping crafting animation"
   DrawWidth=192
   DrawHeight=157
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="loopcam",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroupDirector_1.InterpTrackDirector_1'
      GroupColor=(B=121,G=0,R=206,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((OutVal=(X=-879.999817,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Loop_Crafting",AnimPlayRate=2.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_5.InterpTrackMove_5'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_5.InterpTrackAnimControl_1'
      GroupName="Trader"
      GroupColor=(B=0,G=233,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="loopcam"
      GroupColor=(B=176,G=163,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.000648
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroupDirector_1'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_5'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.999748
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2286
   ObjPosY=712
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_23
   ConsoleEventName="Craft_Start"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2893,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2990
   ObjPosY=440
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_23"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="Idle"
   MaxWidth=143
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2591,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2520
   ObjPosY=-592
   ObjComment="Idle Craft Camera"
   DrawWidth=91
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=558,OverrideDelta=15)
   InputLinks(1)=(DrawY=580,OverrideDelta=37)
   InputLinks(2)=(DrawY=602,OverrideDelta=59)
   InputLinks(3)=(DrawY=624,OverrideDelta=81)
   InputLinks(4)=(DrawY=646,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=565,OverrideDelta=22)
   OutputLinks(1)=(DrawY=602,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),LinkDesc="stinger",DrawY=639,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=-1327,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_165'),LinkDesc="finishcam",MinVars=0,DrawX=-1265,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_164'),LinkDesc="Trader",MinVars=0,DrawX=-1197,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1358
   ObjPosY=520
   ObjComment="craft_finish_matinee"
   DrawWidth=199
   DrawHeight=157
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_12
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_2
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_3
         EventTrack(0)=(Time=0.574124,EventName="stinger")
         Name="InterpTrackEvent_3"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_2
         CutTrack(0)=(TargetCamGroup="finishcam",ShotNumber=10)
         Name="InterpTrackDirector_2"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroupDirector_2.InterpTrackDirector_2'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroupDirector_2.InterpTrackEvent_3'
      GroupColor=(B=75,G=0,R=224,A=255)
      Name="InterpGroupDirector_2"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_6
         PosTrack=(Points=((OutVal=(X=-879.999878,Y=-0.000000,Z=-1911.999756),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=-879.999817,Y=-0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.674790)))
         Name="InterpTrackMove_6"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="End_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_6.InterpTrackMove_6'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_6.InterpTrackAnimControl_2'
      GroupName="Trader"
      GroupColor=(B=92,G=0,R=218,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2.InterpTrackFloatProp_2'
      GroupName="finishcam"
      GroupColor=(B=103,G=0,R=214,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.493221
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroupDirector_2'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.493221
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1430
   ObjPosY=744
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=510,OverrideDelta=15)
   InputLinks(1)=(DrawY=532,OverrideDelta=37)
   InputLinks(2)=(DrawY=554,OverrideDelta=59)
   InputLinks(3)=(DrawY=576,OverrideDelta=81)
   InputLinks(4)=(DrawY=598,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7'),(LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=526,OverrideDelta=31)
   OutputLinks(1)=(DrawY=582,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=-2631,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_167'),LinkDesc="opencam",MinVars=0,DrawX=-2570,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_162'),LinkDesc="Trader",MinVars=0,DrawX=-2503,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2662
   ObjPosY=472
   ObjComment="crafting start sequence"
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_3
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_3
         CutTrack(0)=(TargetCamGroup="opencam",ShotNumber=10)
         Name="InterpTrackDirector_3"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroupDirector_3.InterpTrackDirector_3'
      GroupColor=(B=136,G=0,R=197,A=255)
      Name="InterpGroupDirector_3"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((OutVal=(X=-879.999756,Y=0.000000,Z=-1911.999512),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_4.InterpTrackMove_4'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_4.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=224,R=74,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),ArriveTangent=(X=188.755875,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000)))
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_3
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_3"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_3.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_3.InterpTrackFloatProp_3'
      GroupName="opencam"
      GroupColor=(B=133,G=199,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.499911
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroupDirector_3'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_3'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.499911
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2678
   ObjPosY=720
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_7
   ConsoleEventName="gotitem"
   MaxWidth=169
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0')),DrawY=-1494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1892,OverrideDelta=52)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-1560
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_Console_7"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
   VarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=-3920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_4"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   InputLinks(0)=(DrawY=-1494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1494,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_1'),DrawX=2066,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_104'),DrawX=2122,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=-1528
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=-1392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=566,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=556,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_8')),DrawY=576,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_109'),DrawX=-1875,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1825,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=520
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=-1174,OverrideDelta=11)
   OutputLinks(0)=(ActivateDelay=0.500000,DrawY=-1174,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_9'),DrawX=1530,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_105'),DrawX=1586,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1496
   ObjPosY=-1208
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_5
   ConsoleEventName="rarityCommon"
   MaxWidth=209
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_5')),DrawY=-2980,OverrideDelta=11)
   VariableLinks(0)=(DrawX=632,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=-3046
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_5"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_1
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.200000,Y=0.200000,Z=0.200000))
   InputLinks(0)=(DrawY=-3020,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3020,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=1070,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1128,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1032
   ObjPosY=-3054
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_1"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_2
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.100000,Y=0.200000,Z=0.200000))
   InputLinks(0)=(DrawY=-2956,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2956,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=1862,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1920,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1824
   ObjPosY=-2990
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_2"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_14
   ConsoleEventName="rarityUncommon"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_0')),DrawY=-2972,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1416,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=-3038
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_14"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_8
   ConsoleEventName="rarityRare"
   MaxWidth=183
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_4')),DrawY=-2788,OverrideDelta=11)
   VariableLinks(0)=(DrawX=603,OverrideDelta=59)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=512
   ObjPosY=-2854
   DrawWidth=111
   DrawHeight=128
   Name="SeqEvent_Console_8"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_3
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.100000,Y=0.200000,Z=0.500000))
   InputLinks(0)=(DrawY=-2788,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2788,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=1134,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1192,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=-2822
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_3"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_4
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.250000,Y=0.000000,Z=0.250000))
   InputLinks(0)=(DrawY=-2740,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2740,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=1878,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1936,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=-2774
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_4"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_12
   ConsoleEventName="rarityExceptional"
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_2')),DrawY=-2772,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1434,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1320
   ObjPosY=-2838
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_12"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_13
   ConsoleEventName="rarityMastercrafted"
   MaxWidth=247
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_3')),DrawY=-2580,OverrideDelta=11)
   VariableLinks(0)=(DrawX=619,OverrideDelta=91)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=496
   ObjPosY=-2646
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_Console_13"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_5
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.500000,Y=0.000000,Z=1.000000))
   InputLinks(0)=(DrawY=-2612,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2612,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=1054,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1112,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=-2646
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_5"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_0
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=1.000000,Y=0.500000,Z=0.000000))
   InputLinks(0)=(DrawY=-2524,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2524,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=1846,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1904,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-2558
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_0"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
   ConsoleEventName="rarityPrecious"
   MaxWidth=209
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_1')),DrawY=-2556,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1400,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1296
   ObjPosY=-2622
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_4"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="FinishCraft"
   InputLinks(0)=(DrawY=-1190,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1',InputLinkIdx=1)),DrawY=-1190,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=1288,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1224
   ObjPosY=-1224
   ObjComment="call after finishing sequences"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1256
   ObjPosY=-1144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2914,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2892,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2870,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2848,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2826,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5'),(LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),DrawY=-2912,OverrideDelta=17)
   OutputLinks(1)=(DrawY=-2884,OverrideDelta=45)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0')),LinkDesc="Shake",DrawY=-2856,OverrideDelta=73)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0',InputLinkIdx=1)),LinkDesc="endshake",DrawY=-2828,OverrideDelta=101)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-2345,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_84'),LinkDesc="cratecam",MinVars=0,DrawX=-2282,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_79'),LinkDesc="Crate",MinVars=0,DrawX=-2217,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2376
   ObjPosY=-2952
   ObjComment="open crate start"
   DrawWidth=193
   DrawHeight=157
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=0.435853,EventName="Shake")
         EventTrack(1)=(Time=0.568773,EventName="endshake")
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="cratecam",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0.InterpTrackDirector_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0.InterpTrackEvent_0'
      GroupColor=(B=231,G=30,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-877.441223,Y=207.429138,Z=-1912.469116),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_Crate",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackAnimControl_0'
      InterpTracks(1)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_0'
      GroupName="Crate"
      GroupColor=(B=0,G=207,R=118,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.Crate_AnimTest'
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-1227.472656,Y=139.130829,Z=-1866.216675),InterpMode=CIM_CurveAutoClamped),(InVal=0.700000,OutVal=(X=-967.905640,Y=206.999985,Z=-1856.215576),ArriveTangent=(X=23.136948,Y=0.000076,Z=0.000000),LeaveTangent=(X=23.136948,Y=0.000076,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.161783,OutVal=(X=-962.905701,Y=207.000000,Z=-1856.215698),ArriveTangent=(X=11.449022,Y=0.000000,Z=0.000000),LeaveTangent=(X=11.449022,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-953.021912,Y=149.235992,Z=-1824.215332),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=0.700000,OutVal=(X=0.000000,Y=-25.004883,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.161783,OutVal=(X=0.000000,Y=-24.999390,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=-36.584473,Z=34.804688),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.700000),(Time=1.161783),(Time=2.000000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="cratecam"
      GroupColor=(B=75,G=0,R=224,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=2.000555
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000555
   BakeAndPruneStatus(0)=(AnimSetName="ECON_ANIM.Test",bReferencedButUnused=True)
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.Crate_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=-2712
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_2'
   VarName="Crate_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2864
   ObjPosY=-4008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2946,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2924,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2902,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2880,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2858,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-2939,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-2902,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_3')),LinkDesc="stinger",DrawY=-2865,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=-1073,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_87'),LinkDesc="cratecam",MinVars=0,DrawX=-1010,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_83'),LinkDesc="Crate",MinVars=0,DrawX=-945,OverrideDelta=141)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61'),LinkDesc="Fanfare",MinVars=0,DrawX=-886,OverrideDelta=193)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1104
   ObjPosY=-2984
   ObjComment="open crate finish"
   DrawWidth=259
   DrawHeight=157
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=1.491976,EventName="stinger")
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="cratecam",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_1.InterpTrackDirector_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_1.InterpTrackEvent_0'
      GroupColor=(B=217,G=0,R=99,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-877.441284,Y=207.429153,Z=-1912.469238),InterpMode=CIM_CurveAutoClamped),(InVal=1.018686,OutVal=(X=-877.441101,Y=207.429108,Z=-1912.468872),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.018686,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.018686)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="End_Crate",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5.InterpTrackAnimControl_0'
      GroupName="Crate"
      GroupColor=(B=188,G=149,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.Crate_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-953.021912,Y=149.235992,Z=-1824.215332),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-944.024841,Y=206.817947,Z=-1823.215332),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-981.478638,Y=206.205612,Z=-1867.216064),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=-36.584473,Z=34.804688),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-46.252441,Z=-0.175781),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=-9.492188,Z=0.153809),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=1.500000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3.InterpTrackFloatProp_0'
      GroupName="cratecam"
      GroupColor=(B=216,G=0,R=102,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_0
         ToggleTrack(0)=(Time=1.018686,ToggleAction=ETTA_Trigger)
         Name="InterpTrackToggle_0"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackToggle_0'
      GroupName="Fanfare"
      GroupColor=(B=0,G=69,R=225,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=2.000108
   InterpGroups(0)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3'
   InterpGroups(1)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.000108
   BakeAndPruneStatus(0)=(AnimSetName="ECON_ANIM.Test")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.Crate_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1096
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=0.054642,EventName="Event0")
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="cratecam",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroupDirector_1.InterpTrackDirector_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroupDirector_1.InterpTrackEvent_1'
      GroupColor=(B=217,G=0,R=99,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=-1.015487,OutVal=(X=-877.441284,Y=207.429153,Z=-1912.469238),InterpMode=CIM_CurveAutoClamped),(InVal=0.003199,OutVal=(X=-877.441223,Y=207.429138,Z=-1912.469116),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=-1.015487,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.003199,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=-1.015487),(Time=0.003199)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Loop_Crate",AnimPlayRate=3.000000)
         AnimSeqs(1)=(StartTime=0.267131,AnimSeqName="Loop_Crate",AnimPlayRate=3.000000)
         AnimSeqs(2)=(StartTime=0.533937,AnimSeqName="Loop_Crate",AnimPlayRate=3.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_5.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_5.InterpTrackAnimControl_0'
      GroupName="Crate"
      GroupColor=(B=188,G=149,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.Crate_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=-1.015487,OutVal=(X=-975.321655,Y=171.143799,Z=-1836.216431),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=-953.021973,Y=149.236008,Z=-1824.215454),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=-1.015487,OutVal=(X=0.000000,Y=-29.531250,Z=21.071777),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=0.000000,Y=-36.584473,Z=34.804688),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=-1.015487),))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackFloatProp_0'
      GroupName="cratecam"
      GroupColor=(B=216,G=0,R=102,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=0.800076
   InterpGroups(0)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3'
   InterpGroups(1)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroupDirector_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_5'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.800076
   BakeAndPruneStatus(0)=(AnimSetName="ECON_ANIM.Test")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.Crate_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2032
   ObjPosY=-2736
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2922,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2900,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2878,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2856,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2834,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_5')),DrawY=-2915,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-2878,OverrideDelta=59)
   OutputLinks(2)=(LinkDesc="Event0",DrawY=-2841,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=-1985,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_85'),LinkDesc="cratecam",MinVars=0,DrawX=-1922,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_82'),LinkDesc="Crate",MinVars=0,DrawX=-1857,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2016
   ObjPosY=-2960
   ObjComment="open crate loop"
   DrawWidth=193
   DrawHeight=157
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_3
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_3
         CutTrack(0)=(TargetCamGroup="opencam",ShotNumber=10)
         Name="InterpTrackDirector_3"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroupDirector_3.InterpTrackDirector_3'
      GroupColor=(B=136,G=0,R=197,A=255)
      Name="InterpGroupDirector_3"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((OutVal=(X=-879.999756,Y=0.000000,Z=-1911.999512),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackMove_4'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=224,R=74,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),ArriveTangent=(X=188.755875,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000)))
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_3
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_3"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackFloatProp_3'
      GroupName="opencam"
      GroupColor=(B=133,G=199,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.498360
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroupDirector_3'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.498360
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2736
   ObjPosY=-324
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-550,OverrideDelta=15)
   InputLinks(1)=(DrawY=-528,OverrideDelta=37)
   InputLinks(2)=(DrawY=-506,OverrideDelta=59)
   InputLinks(3)=(DrawY=-484,OverrideDelta=81)
   InputLinks(4)=(DrawY=-462,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14'),(LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-534,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-478,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=-2681,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_170'),LinkDesc="opencam",MinVars=0,DrawX=-2620,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_171'),LinkDesc="Trader",MinVars=0,DrawX=-2553,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2712
   ObjPosY=-588
   ObjComment="recycle animation"
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_26
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=-286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2974,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3080
   ObjPosY=-352
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_26"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-896
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=-478,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=-488,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_12')),DrawY=-468,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_106'),DrawX=-2035,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1985,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2064
   ObjPosY=-524
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_5
   InputLinks(0)=(DrawY=-2930,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=-2940,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_10')),DrawY=-2920,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_113'),DrawX=-1691,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1641,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=-2976
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_5"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1656
   ObjPosY=-2278
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1216
   ObjPosY=-2342
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_0
   Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      OscillationDuration=1.000000
      RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
      Name="CameraShake_0"
      ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   End Object
   Shake=CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0.CameraShake_0'
   bRadialShake=True
   InputLinks(0)=(DrawY=-2604,OverrideDelta=13)
   InputLinks(1)=(DrawY=-2584,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-2594,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_86'),DrawX=-1970,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1904,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2008
   ObjPosY=-2640
   DrawWidth=148
   DrawHeight=85
   Name="SeqAct_CameraShake_0"
   ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=1865
   SizeY=1023
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=-3158
   ObjComment="Set the color of the emitter"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1452,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1430,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1408,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1386,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1364,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9'),(LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),DrawY=-1436,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1380,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=-2405,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_114'),LinkDesc="Trader",MinVars=0,DrawX=-2352,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_176'),LinkDesc="tradercam",MinVars=0,DrawX=-2281,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2436
   ObjPosY=-1490
   ObjComment="usb start"
   DrawWidth=205
   DrawHeight=157
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_10
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="tradercam",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=118,G=0,R=207,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1227.472412,Y=139.130798,Z=-1866.216431),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-1175.426514,Y=45.936668,Z=-1729.216064),ArriveTangent=(X=4.485033,Y=0.000000,Z=0.000000),LeaveTangent=(X=4.485033,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.333853,OutVal=(X=-1173.115479,Y=46.776646,Z=-1730.215820),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-5.998535),ArriveTangent=(X=0.000000,Y=-1.367247,Z=1.387540),LeaveTangent=(X=0.000000,Y=-1.367247,Z=1.387540),InterpMode=CIM_CurveAutoClamped),(InVal=2.333853,OutVal=(X=0.000000,Y=-0.703125,Z=-5.295410),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=2.333853)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1.InterpTrackFloatProp_0'
      GroupName="tradercam"
      GroupColor=(B=178,G=161,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.583832,OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.583832,OutVal=(X=0.000000,Y=0.000000,Z=-67.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.583832)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_USB",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=147,R=189,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=2.333853
   InterpGroups(0)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroupDirector_0'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=2.333853
   BakeAndPruneStatus(0)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2444
   ObjPosY=-1250
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   VarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2640
   ObjPosY=-3920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="tradercam",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=118,G=0,R=207,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1173.115479,Y=46.776646,Z=-1730.215820),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=-0.703125,Z=-5.295410),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_1.InterpTrackFloatProp_0'
      GroupName="tradercam"
      GroupColor=(B=178,G=161,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.000000,OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-67.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.000000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Loop_USB",AnimPlayRate=2.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=147,R=189,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=0.999940
   InterpGroups(0)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroupDirector_0'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.999940
   BakeAndPruneStatus(0)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2096
   ObjPosY=-1288
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1468,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1446,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1424,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1402,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1380,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-1452,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1396,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=-2029,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_116'),LinkDesc="Trader",MinVars=0,DrawX=-1976,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_177'),LinkDesc="tradercam",MinVars=0,DrawX=-1905,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2060
   ObjPosY=-1506
   ObjComment="usb loop"
   DrawWidth=205
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-1484,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=-1494,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=-1474,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_110'),DrawX=-1695,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1645,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1724
   ObjPosY=-1530
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=InterpData Name=InterpData_9
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=0.359484,EventName="stinger")
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="tradercam",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroupDirector_0.InterpTrackDirector_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroupDirector_0.InterpTrackEvent_1'
      GroupColor=(B=118,G=0,R=207,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_0
         ToggleTrack(0)=(Time=0.100000,ToggleAction=ETTA_Trigger)
         Name="InterpTrackToggle_0"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2.InterpTrackToggle_0'
      GroupName="traderparticle"
      GroupColor=(B=0,G=174,R=165,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1173.115479,Y=46.776646,Z=-1730.215820),InterpMode=CIM_CurveAutoClamped),(InVal=0.750000,OutVal=(X=-1175.426514,Y=45.936668,Z=-1729.216064),ArriveTangent=(X=-7.314659,Y=0.000000,Z=0.000000),LeaveTangent=(X=-7.314659,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-1227.472412,Y=139.130798,Z=-1866.216431),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=-0.703125,Z=-5.295410),InterpMode=CIM_CurveAutoClamped),(InVal=0.750000,OutVal=(X=0.000000,Y=0.000000,Z=-5.998535),ArriveTangent=(X=0.000000,Y=2.230247,Z=-2.266338),LeaveTangent=(X=0.000000,Y=2.230247,Z=-2.266338),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.750000),(Time=1.500000)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_1.InterpTrackFloatProp_0'
      GroupName="tradercam"
      GroupColor=(B=178,G=161,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.500000,OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.500000,OutVal=(X=0.000000,Y=0.000000,Z=-67.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.500000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="End_USB",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=147,R=189,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.499978
   InterpGroups(0)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroupDirector_0'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_1'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.499978
   BakeAndPruneStatus(0)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1220
   ObjPosY=-1346
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1500,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1478,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1456,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1434,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1412,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-1493,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-1456,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_2')),LinkDesc="stinger",DrawY=-1419,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=-1189,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_115'),LinkDesc="Trader",MinVars=0,DrawX=-1136,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_166'),LinkDesc="tradercam",MinVars=0,DrawX=-1065,OverrideDelta=122)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76'),LinkDesc="traderparticle",MinVars=0,DrawX=-971,OverrideDelta=205)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1220
   ObjPosY=-1538
   ObjComment="usb finish"
   DrawWidth=310
   DrawHeight=157
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1448
   ObjPosY=-1104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_9"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=2840
   SizeY=1029
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3096
   ObjPosY=-3144
   ObjComment="open horzine supply crates"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=2832
   SizeY=1008
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3116
   ObjPosY=-1874
   ObjComment="open weapon skin usbs"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   VarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-3920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=2386
   SizeY=895
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3094
   ObjPosY=256
   ObjComment="crafting sequence"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=2401
   SizeY=761
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3104
   ObjPosY=-716
   ObjComment="recycling sequence"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=642
   SizeY=596
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2506
   ObjPosY=-613
   ObjComment="idle sequence"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=535
   SizeY=372
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=-1616
   ObjComment="tells matinee that an item has been received and to finish what its doing"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Craft_Start"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=162,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2009,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=96
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_22
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-30,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2002,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=-96
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_22"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=613
   SizeY=930
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1864
   ObjPosY=-616
   ObjComment="doing anything cancels idle"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1989,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=-424
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_3"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=0.500000
   InputLinks(0)=(DrawY=-930,OverrideDelta=14)
   InputLinks(1)=(DrawY=-909,OverrideDelta=35)
   InputLinks(2)=(DrawY=-888,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-925,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-893,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1540,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1488
   ObjPosY=-967
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=InterpData Name=InterpData_14
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="loopcam",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroupDirector_1.InterpTrackDirector_1'
      GroupColor=(B=121,G=0,R=206,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((OutVal=(X=-879.999817,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Loop_Crafting",AnimPlayRate=2.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_5.InterpTrackMove_5'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_5.InterpTrackAnimControl_1'
      GroupName="Trader"
      GroupColor=(B=0,G=233,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="loopcam"
      GroupColor=(B=176,G=163,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000648
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroupDirector_1'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_5'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.999748
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=-300
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-494,OverrideDelta=15)
   InputLinks(1)=(DrawY=-472,OverrideDelta=37)
   InputLinks(2)=(DrawY=-450,OverrideDelta=59)
   InputLinks(3)=(DrawY=-428,OverrideDelta=81)
   InputLinks(4)=(DrawY=-406,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=-478,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-422,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=-2321,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_172'),LinkDesc="loopcam",MinVars=0,DrawX=-2262,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_173'),LinkDesc="Trader",MinVars=0,DrawX=-2198,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2352
   ObjPosY=-532
   ObjComment="looping crafting animation"
   DrawWidth=192
   DrawHeight=157
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_9
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2)),DrawY=-618,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3000,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3077
   ObjPosY=-684
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_9"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_10
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6',InputLinkIdx=2)),DrawY=-3038,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2891,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2968
   ObjPosY=-3104
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_10"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_11
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=2)),DrawY=-1719,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2960,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3037
   ObjPosY=-1785
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_11"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_21
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=2)),DrawY=682,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2897,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2974
   ObjPosY=616
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_21"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_2
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_2
         EventTrack(0)=(Time=0.115324,EventName="stinger")
         Name="InterpTrackEvent_2"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_2
         CutTrack(0)=(TargetCamGroup="finishcam",ShotNumber=10)
         Name="InterpTrackDirector_2"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroupDirector_2.InterpTrackDirector_2'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroupDirector_2.InterpTrackEvent_2'
      GroupColor=(B=75,G=0,R=224,A=255)
      Name="InterpGroupDirector_2"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_6
         PosTrack=(Points=((OutVal=(X=-879.999878,Y=-0.000000,Z=-1911.999756),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=-879.999817,Y=-0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.674790)))
         Name="InterpTrackMove_6"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="End_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_6.InterpTrackMove_6'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_6.InterpTrackAnimControl_2'
      GroupName="Trader"
      GroupColor=(B=92,G=0,R=218,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackFloatProp_2'
      GroupName="finishcam"
      GroupColor=(B=103,G=0,R=214,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.493221
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroupDirector_2'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.493221
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1440
   ObjPosY=-324
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-510,OverrideDelta=15)
   InputLinks(1)=(DrawY=-488,OverrideDelta=37)
   InputLinks(2)=(DrawY=-466,OverrideDelta=59)
   InputLinks(3)=(DrawY=-444,OverrideDelta=81)
   InputLinks(4)=(DrawY=-422,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-503,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-466,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_1')),LinkDesc="stinger",DrawY=-429,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=-1337,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_174'),LinkDesc="finishcam",MinVars=0,DrawX=-1275,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_175'),LinkDesc="Trader",MinVars=0,DrawX=-1207,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1368
   ObjPosY=-548
   ObjComment="craft_finish_matinee"
   DrawWidth=199
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=-2358
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_3
   SwitchGroup="Crate_Tier"
   Switch="Tier_3"
   InputLinks(0)=(DrawY=-2588,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_5')),DrawY=-2588,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=863,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=-2622
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_3"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_4
   SwitchGroup="Crate_Tier"
   Switch="Tier_2"
   InputLinks(0)=(DrawY=-2820,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_3')),DrawY=-2820,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=879,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=-2854
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_4"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_5
   SwitchGroup="Crate_Tier"
   Switch="Tier_1"
   InputLinks(0)=(DrawY=-2972,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_1')),DrawY=-2972,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=887,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=840
   ObjPosY=-3006
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_5"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_0
   SwitchGroup="Crate_Tier"
   Switch="Tier_1"
   InputLinks(0)=(DrawY=-2956,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_2')),DrawY=-2956,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=1695,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1648
   ObjPosY=-2990
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_0"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_2
   SwitchGroup="Crate_Tier"
   Switch="Tier_3"
   InputLinks(0)=(DrawY=-2804,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_4')),DrawY=-2804,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=1687,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1640
   ObjPosY=-2838
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_2"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_1
   SwitchGroup="Crate_Tier"
   Switch="Tier_4"
   InputLinks(0)=(DrawY=-2572,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_0')),DrawY=-2572,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=1671,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1624
   ObjPosY=-2606
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_1"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-936
   ObjPosY=-268
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-362,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-362,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-920,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-968
   ObjPosY=-396
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-980
   ObjPosY=-1330
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_5'
   VarName="Crate_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=-4008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-438,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-448,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),LinkDesc="Link 2",DrawY=-428,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-1046,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1080
   ObjPosY=-484
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_1"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-594,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-594,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=-912,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-960
   ObjPosY=-628
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-928
   ObjPosY=-500
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-484
   ObjPosY=-1498
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-1592,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1592,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=-468,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-516
   ObjPosY=-1626
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_2
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-1436,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-1446,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),LinkDesc="Link 2",DrawY=-1426,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-602,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-636
   ObjPosY=-1482
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_2"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-1360,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1360,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=-476,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-524
   ObjPosY=-1394
   bDrawLast=True
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-492
   ObjPosY=-1266
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-592
   ObjPosY=-2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-3070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3070,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=-576,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-624
   ObjPosY=-3104
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_3
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-2914,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-2924,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),LinkDesc="Link 2",DrawY=-2904,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-710,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-744
   ObjPosY=-2960
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_3"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2838,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),DrawX=-584,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-632
   ObjPosY=-2872
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-600
   ObjPosY=-2744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-910
   ObjPosY=504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=410,OverrideDelta=11)
   OutputLinks(0)=(DrawY=410,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=-894,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-942
   ObjPosY=376
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=566,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=556,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),LinkDesc="Link 2",DrawY=576,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-1028,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1062
   ObjPosY=520
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=642,OverrideDelta=11)
   OutputLinks(0)=(DrawY=642,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=-902,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-950
   ObjPosY=608
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-918
   ObjPosY=736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
   VarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2864
   ObjPosY=-3920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_14"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_10
   InputLinks(0)=(DrawY=-2818,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_3')),DrawY=-2828,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-2808,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_92'),DrawX=-1499,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1449,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1528
   ObjPosY=-2864
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_10"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_3
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-2446,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_8')),DrawY=-2446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_4'),DrawX=-984,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1048
   ObjPosY=-2480
   ObjComment="ItemExchangeTimeOut"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1016
   ObjPosY=-2376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_4"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_8
   InputLinks(0)=(DrawY=-2454,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_5')),DrawY=-2454,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_21'),DrawX=-806,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_94'),DrawX=-750,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-840
   ObjPosY=-2488
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_8"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_21
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-840
   ObjPosY=-2360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_21"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2496
   ObjPosY=-1744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_8"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=-1806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1806,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=2522,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_95'),DrawX=2578,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=-1840
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_4
   InputLinks(0)=(DrawY=-1826,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-1836,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=-1816,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_111'),DrawX=2317,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2367,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=-1872
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_4"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=-1843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_4')),DrawY=-1838,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1806,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_89'),DrawX=2140,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2088
   ObjPosY=-1880
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1072
   ObjPosY=-1680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_11"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_4
   InputLinks(0)=(DrawY=-1760,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_6')),DrawY=-1760,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=-1010,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_97'),DrawX=-954,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1044
   ObjPosY=-1794
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_4"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1260
   ObjPosY=-1666
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-1760,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_4')),DrawY=-1760,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-1212,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1276
   ObjPosY=-1794
   ObjComment="ItemExchangeTimeOut"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=-1484,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-1494,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=-1474,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_96'),DrawX=-1495,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1445,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1524
   ObjPosY=-1530
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_26
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1280
   ObjPosY=-44
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_26"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_10
   InputLinks(0)=(DrawY=-146,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_8')),DrawY=-146,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_26'),DrawX=-1246,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_98'),DrawX=-1190,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1280
   ObjPosY=-180
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_10"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1472
   ObjPosY=-52
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_7"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_7
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-146,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_10')),DrawY=-146,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_7'),DrawX=-1416,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1480
   ObjPosY=-180
   ObjComment="ItemExchangeTimeOut"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_7"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_12
   InputLinks(0)=(DrawY=-142,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_7')),DrawY=-152,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14')),DrawY=-132,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_99'),DrawX=-1675,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1625,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1704
   ObjPosY=-188
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_12"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_5
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-2454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2454,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_5'),DrawX=-576,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-640
   ObjPosY=-2488
   ObjComment="ce Idle"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_5"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-600
   ObjPosY=-2368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_5"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-812
   ObjPosY=-1690
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_6"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_6
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-1776,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1776,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_6'),DrawX=-788,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-852
   ObjPosY=-1810
   ObjComment="ce Idle"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_6"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_8
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-130,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-130,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_8'),DrawX=-1016,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1080
   ObjPosY=-164
   ObjComment="ce Idle"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_8"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=-44
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_8"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-904
   ObjPosY=1064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_3"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_4
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=978,OverrideDelta=11)
   OutputLinks(0)=(DrawY=978,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_3'),DrawX=-880,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-944
   ObjPosY=944
   ObjComment="ce Idle"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_4"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_8
   InputLinks(0)=(DrawY=678,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2'),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2)),DrawY=668,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=688,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_102'),DrawX=-1667,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1617,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1696
   ObjPosY=632
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_8"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=962,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_6')),DrawY=962,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-1280,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1344
   ObjPosY=928
   ObjComment="ItemExchangeTimeOut"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1336
   ObjPosY=1056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_6
   InputLinks(0)=(DrawY=962,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_4')),DrawY=962,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_17'),DrawX=-1110,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_101'),DrawX=-1054,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1144
   ObjPosY=928
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_6"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1144
   ObjPosY=1064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_17"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_1
   FloatValue=16.000000
   VarName="timeoutdelay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2640
   ObjPosY=-4008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_1"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_8
   SizeX=1042
   SizeY=1063
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8736
   ObjPosY=-9024
   ObjComment="Dosh Vault"
   Name="SequenceFrameWrapped_8"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6776
   ObjPosY=-9232
   ObjComment="Dosh Vault Camera"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_18
   bForceStartPos=True
   InputLinks(0)=(DrawY=-9371,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9348,bHidden=True,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9329,OverrideDelta=56)
   InputLinks(3)=(DrawY=-9350,OverrideDelta=35)
   InputLinks(4)=(DrawY=-9282,bHidden=True,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9348,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-9304,bHidden=True,OverrideDelta=81)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_14')),LinkDesc="Tier1_Check",DrawY=-9371,OverrideDelta=14)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),LinkDesc="FillPalletCall",DrawY=-9350,OverrideDelta=35)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),LinkDesc="FX_Open",DrawY=-9329,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18'),DrawX=-6785,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="VaultDoorCam",MinVars=0,DrawX=-6724,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),LinkDesc="VaultDoorAnim",MinVars=0,DrawX=-6649,OverrideDelta=137)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_63'),LinkDesc="ForceStartPosition",PropertyName="ForceStartPosition",MinVars=0,DrawX=-6560,OverrideDelta=214)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="bForceStartPos",PropertyName="bForceStartPos",bHidden=True,MinVars=0,DrawX=-6473,OverrideDelta=315)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Sound",bHidden=True,MinVars=0,DrawX=-6408,OverrideDelta=388)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=-9408
   ObjComment="Dosh Vault Camera Track"
   DrawWidth=315
   DrawHeight=125
   Name="SeqAct_Interp_18"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_18
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="VaultDoorCam",ShotNumber=2)
         CutTrack(1)=(Time=6.763227,TargetCamGroup="Camera",ShotNumber=5)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroupDirector_0.InterpTrackDirector_1'
      GroupColor=(B=171,G=0,R=169,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_14
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=-0.000061,Y=-0.000122,Z=0.000977),ArriveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),LeaveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=-0.000122,Y=-0.000244,Z=0.001953),ArriveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),LeaveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=-0.000183,Y=-0.000366,Z=0.002930),ArriveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=-0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=0.000000,Y=0.000000,Z=5.185547),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.782185),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.782185),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=0.000000,Y=0.000000,Z=4.724121),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=0.000000,Z=112.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=0.246742),(Time=0.568854),(Time=0.655053),(Time=1.074346),(Time=2.436753)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=0.500000,EventName="FX_Open")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Vault_Unlock",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_14.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_14.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_14.InterpTrackAnimControl_0'
      GroupName="VaultDoorAnim"
      GroupColor=(B=233,G=0,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM'
      Name="InterpGroup_14"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.854612,OutVal=(X=-807.243103,Y=-2122.870605,Z=-5893.039551),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-793.693848,Y=-1905.356812,Z=-5906.038086),ArriveTangent=(X=40.444466,Y=459.753052,Z=0.000000),LeaveTangent=(X=40.444466,Y=459.753052,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-724.303711,Y=-1443.484741,Z=-5771.032715),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-753.148804,Y=-1619.177002,Z=-5863.035156),ArriveTangent=(X=0.000000,Y=-18.671959,Z=-0.468983),LeaveTangent=(X=0.000000,Y=-18.671959,Z=-0.468983),InterpMode=CIM_CurveAutoClamped),(InVal=4.999429,OutVal=(X=-752.751160,Y=-1626.176270,Z=-5863.204102),InterpMode=CIM_CurveAutoClamped),(InVal=6.030845,OutVal=(X=-774.834290,Y=-1592.891602,Z=-5746.032715),ArriveTangent=(X=-12.795517,Y=0.000000,Z=0.000000),LeaveTangent=(X=-12.795517,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=6.755580,OutVal=(X=-780.552979,Y=-1656.734619,Z=-5750.031738),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.854612,OutVal=(X=0.000000,Y=6.262207,Z=91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-0.021973,Y=-0.433960,Z=89.648438),ArriveTangent=(X=-0.055010,Y=-20.707729,Z=0.000000),LeaveTangent=(X=-0.055010,Y=-20.707729,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-0.087891,Y=-40.231934,Z=122.431641),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-0.065918,Y=-9.030762,Z=91.466675),ArriveTangent=(X=0.000000,Y=0.061069,Z=-0.606546),LeaveTangent=(X=0.000000,Y=0.061069,Z=-0.606546),InterpMode=CIM_CurveAutoClamped),(InVal=4.999429,OutVal=(X=-0.076904,Y=-9.008789,Z=91.246948),ArriveTangent=(X=-0.018849,Y=0.000000,Z=-0.478305),LeaveTangent=(X=-0.018849,Y=0.000000,Z=-0.478305),InterpMode=CIM_CurveAutoClamped),(InVal=6.030845,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.191458),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.191458),InterpMode=CIM_CurveAutoClamped),(InVal=6.755580,OutVal=(X=-0.109863,Y=-16.259766,Z=88.615723),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.854612),(Time=2.395019),(Time=3.324989),(Time=3.987206),(Time=4.999429),(Time=6.030845),(Time=6.755580)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_6
         EventTrack(0)=(Time=3.320000,EventName="FillPalletCall")
         bFireEventsWhenBackwards=False
         TrackTitle="Fill_Pallet"
         Name="InterpTrackEvent_6"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=5.003623,EventName="Tier1_Check")
         bFireEventsWhenBackwards=False
         TrackTitle="Tier_1_Lights"
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1.InterpTrackEvent_6'
      GroupName="VaultDoorCam"
      GroupColor=(B=121,G=0,R=206,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.025091,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_1')
         AkEvents(1)=(Time=0.856996,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_2')
         AkEvents(2)=(Time=1.911914,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Long')
         AkEvents(3)=(Time=3.357438,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(4)=(Time=5.041234,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Sound"
      GroupColor=(B=164,G=0,R=176,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(ViewStartInput=-60.755264,ViewEndInput=104.262932,ViewStartOutput=-17.199602,ViewEndOutput=13.614445)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=6.755580
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_14'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=6.755580
   BakeAndPruneStatus(0)=(AnimSetName="ECON_emote.ECON_Emotes")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6872
   ObjPosY=-9216
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_18"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Pause Track"
   MaxWidth=198
   OutputLinks(0)=(Links=((LinkedOp=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2')),DrawY=-8126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8549,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8648
   ObjPosY=-8192
   ObjComment="Pause Track"
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_20
   Commands(0)="ActiveLightActorsForTier 1 true"
   Commands(1)="ActiveLightActorsForTier 2 true"
   Commands(2)="ActiveLightActorsForTier 3 true"
   Commands(3)="ActiveLightActorsForTier 4 true"
   Commands(4)="ActiveLightActorsForTier 5 true"
   InputLinks(0)=(DrawY=-7526,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7526,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_19'),DrawX=-6096,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6160
   ObjPosY=-7560
   ObjComment="Activate Lights for Tier 1-5"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_20"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_35
   bValue=1
   VarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6496
   ObjPosY=-6816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_35"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_62
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-9240
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_62"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_2
   VarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-6808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_2"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_63
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6544
   ObjPosY=-9208
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_63"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=419
   SizeY=173
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6568
   ObjPosY=-6872
   ObjComment="Variables"
   DrawWidth=419
   DrawHeight=173
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=-6704
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_4"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_1
   InputLinks(0)=(DrawY=-6798,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_23')),DrawY=-6798,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_8'),DrawX=-7590,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_4'),DrawX=-7534,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=-6832
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_1"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_8
   FloatValue=6.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7648
   ObjPosY=-6720
   ObjComment="Tier 1 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_8"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_15
   InputLinks(0)=(DrawY=-6182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6182,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_36'),DrawX=-8302,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_30'),DrawX=-8246,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-6216
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_15"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_30
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8248
   ObjPosY=-6072
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_30"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_36
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-6136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_36"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="PlayVault"
   MaxWidth=178
   OutputLinks(0)=(Links=((LinkedOp=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0')),DrawY=-8501,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8216,OverrideDelta=57)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8305
   ObjPosY=-8567
   ObjComment="PlayVault"
   DrawWidth=109
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="PlayVault"
   InputLinks(0)=(DrawY=-6174,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6174,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6217,OverrideDelta=87)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=-6208
   ObjComment="PlayVault"
   DrawWidth=239
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_5
   FloatValue=7.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7656
   ObjPosY=-6488
   ObjComment="Tier 2 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_5"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_3
   InputLinks(0)=(DrawY=-6566,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_24')),DrawY=-6566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_5'),DrawX=-7598,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_31'),DrawX=-7542,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-6600
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_3"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_31
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7528
   ObjPosY=-6496
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_31"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_6
   FloatValue=7.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-6288
   ObjComment="Tier 3 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_6"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_4
   InputLinks(0)=(DrawY=-6366,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_25')),DrawY=-6366,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_6'),DrawX=-7590,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=-7534,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=-6400
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_4"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_32
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7520
   ObjPosY=-6280
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_32"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_33
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7520
   ObjPosY=-6040
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_33"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_5
   InputLinks(0)=(DrawY=-6126,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_26')),DrawY=-6126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_7'),DrawX=-7590,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=-7534,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=-6160
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_5"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_7
   FloatValue=7.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=-6048
   ObjComment="Tier 4 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_7"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_23
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7512
   ObjPosY=-5808
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_23"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_0
   InputLinks(0)=(DrawY=-5894,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_22')),DrawY=-5894,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_3'),DrawX=-7582,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_23'),DrawX=-7526,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7616
   ObjPosY=-5928
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_0"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_3
   FloatValue=7.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=-5816
   ObjComment="Tier 5 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_3"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=304
   SizeY=1136
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7688
   ObjPosY=-6856
   ObjComment="Set Time for Specific Camera Idle"
   DrawWidth=304
   DrawHeight=1136
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_19
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6128
   ObjPosY=-7440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_19"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8337
   ObjPosY=-8687
   ObjComment="HasVaultDosh"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_0"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_2
   InputLinks(0)=(DrawY=-8765,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0')),DrawY=-8765,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-8279,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_13'),DrawX=-8223,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8313
   ObjPosY=-8799
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_2"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8225
   ObjPosY=-8671
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=252
   SizeY=241
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8353
   ObjPosY=-8831
   ObjComment="Player Has Dosh for Vault"
   DrawWidth=252
   DrawHeight=241
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=258
   SizeY=188
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-8216
   ObjComment="Camera Pause for Tiers"
   DrawWidth=258
   DrawHeight=188
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=1206
   SizeY=519
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4768
   ObjPosY=-8384
   ObjComment="Tell Script to Fill Pallet"
   DrawWidth=1206
   DrawHeight=519
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="Pause Track"
   InputLinks(0)=(DrawY=-8278,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-8278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4159,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4288
   ObjPosY=-8312
   ObjComment="Pause Track"
   DrawWidth=259
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_4
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-6702,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6702,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_8'),bHidden=False,DrawX=-6816,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_15'),DrawX=-6761,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-6736
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_4"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-6640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_15"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_16
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-6400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_16"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_5
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-6462,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6462,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_5'),bHidden=False,DrawX=-6816,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_16'),DrawX=-6761,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-6496
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_5"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=-6200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_17"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_6
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-6262,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6262,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_6'),bHidden=False,DrawX=-6824,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_17'),DrawX=-6769,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-6296
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_6"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_7
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-6022,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6022,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_7'),bHidden=False,DrawX=-6824,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_18'),DrawX=-6769,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-6056
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_7"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_18
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_18"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_3
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-5790,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-5790,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_3'),bHidden=False,DrawX=-6824,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_9'),DrawX=-6769,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-5824
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_3"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=-5728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_9"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_23
   InputLinks(0)=(DrawY=-6698,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_4')),DrawY=-6708,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6688,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_11'),DrawX=-7123,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7073,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-6744
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_23"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_28
   VarName="bDebuging"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=-6816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_28"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bDebuging"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-6624
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_11"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_12
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bDebuging"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-6400
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_12"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_24
   InputLinks(0)=(DrawY=-6458,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_5')),DrawY=-6468,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6448,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_12'),DrawX=-7123,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7073,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-6504
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_24"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_16
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bDebuging"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-6192
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_16"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_25
   InputLinks(0)=(DrawY=-6258,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_6')),DrawY=-6268,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6248,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_16'),DrawX=-7139,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7089,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-6304
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_25"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_17
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bDebuging"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-5912
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_17"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_26
   InputLinks(0)=(DrawY=-6018,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_7')),DrawY=-6028,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6008,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_17'),DrawX=-7139,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7089,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-6064
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_26"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bDebuging"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-5688
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_6"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_22
   InputLinks(0)=(DrawY=-5786,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_3')),DrawY=-5796,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-5776,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_6'),DrawX=-7139,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7089,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-5832
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_22"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=508
   SizeY=1180
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7192
   ObjPosY=-6768
   ObjComment="Debugging"
   DrawWidth=508
   DrawHeight=1180
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_1
   VarName="ActiveTier"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-7320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_1"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=KFSeqAction_DoshVault Name=KFSeqAction_DoshVault_0
   InputLinks(0)=(DrawY=-8278,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0'),(LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=-8278,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4520
   ObjPosY=-8312
   DrawWidth=128
   DrawHeight=45
   Name="KFSeqAction_DoshVault_0"
   ObjectArchetype=KFSeqAction_DoshVault'KFGame.Default__KFSeqAction_DoshVault'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Stack_Loop'
   InputLinks(0)=(DrawY=-7934,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7934,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4168
   ObjPosY=-7968
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Stack_Loop'
   InputLinks(0)=(DrawY=-8822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3896,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3944
   ObjPosY=-8856
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_UI_Menu.Dosh_Vault.Stop_Dosh_Vault_Stack_Loop'
   InputLinks(0)=(DrawY=-8910,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8910,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3904,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3952
   ObjPosY=-8944
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-8275,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8254,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8233,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8254,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-3754,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3703,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3654,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3792
   ObjPosY=-8312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3760
   ObjPosY=-8080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3664
   ObjPosY=-8080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3928
   ObjPosY=-9048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-9155,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9134,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9113,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9134,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=-3898,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3847,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3798,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3936
   ObjPosY=-9192
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6672
   ObjPosY=-9152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_1
   MaxWidth=177
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_24')),DrawY=-7444,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_28')),DrawY=-7424,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8621,bHidden=True,OverrideDelta=60)
   OutputLinks(3)=(DrawY=-8599,bHidden=True,OverrideDelta=82)
   OutputLinks(4)=(DrawY=-8577,bHidden=True,OverrideDelta=104)
   OutputLinks(5)=(DrawY=-8555,bHidden=True,OverrideDelta=126)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-4376,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4464
   ObjPosY=-7512
   DrawWidth=133
   DrawHeight=168
   Name="KFSeqEvent_DoshVault_1"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_2
   MaxWidth=177
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_2')),DrawY=-8664,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-8620,OverrideDelta=60)
   OutputLinks(2)=(Links=((LinkedOp=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0')),DrawY=-8642,OverrideDelta=38)
   OutputLinks(3)=(DrawY=-8576,OverrideDelta=104)
   OutputLinks(4)=(DrawY=-8554,OverrideDelta=126)
   OutputLinks(5)=(DrawY=-8598,OverrideDelta=82)
   VariableLinks(0)=(DrawX=-8633,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8721
   ObjPosY=-8735
   DrawWidth=135
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_2"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_6
   MaxWidth=177
   OutputLinks(0)=(DrawY=-6177,bHidden=True,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-6155,bHidden=True,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-8907,OverrideDelta=14)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-8885,OverrideDelta=36)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=-8863,OverrideDelta=58)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-8841,OverrideDelta=80)
   VariableLinks(0)=(bHidden=True,DrawX=-2208,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4192
   ObjPosY=-8976
   DrawWidth=135
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_6"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_7
   MaxWidth=177
   OutputLinks(0)=(DrawY=-5553,bHidden=True,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-5531,bHidden=True,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=1)),DrawY=-8118,OverrideDelta=11)
   OutputLinks(3)=(DrawY=-5487,bHidden=True,OverrideDelta=82)
   OutputLinks(4)=(DrawY=-5465,bHidden=True,OverrideDelta=104)
   OutputLinks(5)=(DrawY=-5443,bHidden=True,OverrideDelta=126)
   VariableLinks(0)=(bHidden=True,DrawX=-2336,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-8184
   DrawWidth=135
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_7"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_1
   LogMessage="DEBUG: IdleNoDosh fired"
   InputLinks(0)=(DrawY=-7358,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7358,OverrideDelta=11)
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_12'),DrawX=-3962,OverrideDelta=16)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4000
   ObjPosY=-7392
   ObjComment="DEBUG: IdleNoDosh fired"
   bOutputObjCommentToScreen=True
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Log_1"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_39
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4208
   ObjPosY=-7208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_39"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_28
   InputLinks(0)=(DrawY=-7298,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_1')),DrawY=-7308,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-7288,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_39'),DrawX=-4139,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4089,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4168
   ObjPosY=-7344
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_28"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_12
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-7272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_12"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_25
   SizeX=608
   SizeY=399
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=-9472
   ObjComment="Tier 1 Mat Track"
   DrawWidth=608
   DrawHeight=399
   Name="SequenceFrame_25"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=584
   SizeY=406
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-8984
   ObjComment="Tier 2 Mat Track"
   DrawWidth=584
   DrawHeight=406
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6656
   ObjPosY=-8672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_22
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6528
   ObjPosY=-8728
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_22"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_21
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6424
   ObjPosY=-8760
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_21"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="VaultDoorCam",ShotNumber=2)
         CutTrack(1)=(Time=6.986903,TargetCamGroup="Camera",ShotNumber=5)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_1'
      GroupColor=(B=171,G=0,R=169,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_14
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=-0.000061,Y=-0.000122,Z=0.000977),ArriveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),LeaveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=-0.000122,Y=-0.000244,Z=0.001953),ArriveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),LeaveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=-0.000183,Y=-0.000366,Z=0.002930),ArriveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=-0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=0.000000,Y=0.000000,Z=5.185547),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=0.000000,Y=0.000000,Z=4.724121),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=0.000000,Z=112.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=0.246742),(Time=0.568854),(Time=0.655053),(Time=1.074346),(Time=2.436753)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=0.500000,EventName="FX_Open")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Vault_Unlock",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_14.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_14.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_14.InterpTrackAnimControl_0'
      GroupName="VaultDoorAnim"
      GroupColor=(B=233,G=0,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM'
      Name="InterpGroup_14"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.854612,OutVal=(X=-807.243103,Y=-2122.870605,Z=-5893.039551),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-793.693848,Y=-1905.356812,Z=-5906.038086),ArriveTangent=(X=40.444447,Y=459.753052,Z=0.000000),LeaveTangent=(X=40.444447,Y=459.753052,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-724.303711,Y=-1443.484741,Z=-5771.032715),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-753.148804,Y=-1619.177002,Z=-5863.035156),ArriveTangent=(X=0.000000,Y=-29.970299,Z=-0.759514),LeaveTangent=(X=0.000000,Y=-29.970299,Z=-0.759514),InterpMode=CIM_CurveAutoClamped),(InVal=4.499918,OutVal=(X=-752.751160,Y=-1626.176270,Z=-5863.204102),InterpMode=CIM_CurveAutoClamped),(InVal=5.988138,OutVal=(X=-774.834290,Y=-1592.891602,Z=-5746.032715),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.002136),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.002136),InterpMode=CIM_CurveAutoClamped),(InVal=7.005233,OutVal=(X=-773.701355,Y=-1666.881714,Z=-5746.031738),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.854612,OutVal=(X=0.000000,Y=6.262207,Z=91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-0.021973,Y=-0.433960,Z=89.648438),ArriveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),LeaveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-0.087891,Y=-40.231934,Z=122.431641),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-0.065918,Y=-9.030762,Z=91.466675),ArriveTangent=(X=0.000000,Y=0.098928,Z=-0.981091),LeaveTangent=(X=0.000000,Y=0.098928,Z=-0.981091),InterpMode=CIM_CurveAutoClamped),(InVal=4.499918,OutVal=(X=-0.076904,Y=-9.008789,Z=91.246948),ArriveTangent=(X=-0.021829,Y=0.000000,Z=-0.636625),LeaveTangent=(X=-0.021829,Y=0.000000,Z=-0.636625),InterpMode=CIM_CurveAutoClamped),(InVal=5.988138,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),ArriveTangent=(X=-0.000001,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000001,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=7.005233,OutVal=(X=-0.109863,Y=-13.095703,Z=90.021973),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.854612),(Time=2.395019),(Time=3.324989),(Time=3.987206),(Time=4.499918),(Time=5.988138),(Time=7.005233)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_6
         EventTrack(0)=(Time=3.320000,EventName="FillPalletCall")
         bFireEventsWhenBackwards=False
         TrackTitle="Fill_Pallet"
         Name="InterpTrackEvent_6"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=4.504111,EventName="Tier_Lights")
         bFireEventsWhenBackwards=False
         TrackTitle="Tier_Lights"
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_6'
      GroupName="VaultDoorCam"
      GroupColor=(B=121,G=0,R=206,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.025091,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_1')
         AkEvents(1)=(Time=0.856996,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_2')
         AkEvents(2)=(Time=1.911914,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Long')
         AkEvents(3)=(Time=3.357438,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(4)=(Time=4.500522,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(5)=(Time=5.986823,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Sound"
      GroupColor=(B=164,G=0,R=176,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=6.971128
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_14'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=6.971128
   BakeAndPruneStatus(0)=(AnimSetName="ECON_emote.ECON_Emotes")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6856
   ObjPosY=-8736
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bForceStartPos=True
   InputLinks(0)=(DrawY=-8899,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8876,bHidden=True,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8857,OverrideDelta=56)
   InputLinks(3)=(DrawY=-8878,OverrideDelta=35)
   InputLinks(4)=(DrawY=-8810,bHidden=True,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8876,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-8832,bHidden=True,OverrideDelta=81)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_10')),LinkDesc="Tier_Lights",DrawY=-8899,OverrideDelta=14)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),LinkDesc="FillPalletCall",DrawY=-8878,OverrideDelta=35)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),LinkDesc="FX_Open",DrawY=-8857,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-6785,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),LinkDesc="VaultDoorCam",MinVars=0,DrawX=-6724,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="VaultDoorAnim",MinVars=0,DrawX=-6649,OverrideDelta=137)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_22'),LinkDesc="ForceStartPosition",PropertyName="ForceStartPosition",MinVars=0,DrawX=-6560,OverrideDelta=214)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="bForceStartPos",PropertyName="bForceStartPos",bHidden=True,MinVars=0,DrawX=-6473,OverrideDelta=315)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Sound",bHidden=True,MinVars=0,DrawX=-6408,OverrideDelta=388)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=-8936
   ObjComment="Dosh Vault Camera Track"
   DrawWidth=315
   DrawHeight=125
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=-8752
   ObjComment="Dosh Vault Camera"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=587
   SizeY=389
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-8512
   ObjComment="Tier 3 Mat Track"
   DrawWidth=587
   DrawHeight=389
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6664
   ObjPosY=-8208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_56
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=-8264
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_56"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_55
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-8296
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_55"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=InterpData Name=InterpData_13
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="VaultDoorCam",ShotNumber=2)
         CutTrack(1)=(Time=7.501995,TargetCamGroup="Camera",ShotNumber=5)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroupDirector_0.InterpTrackDirector_1'
      GroupColor=(B=171,G=0,R=169,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_14
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=-0.000061,Y=-0.000122,Z=0.000977),ArriveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),LeaveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=-0.000122,Y=-0.000244,Z=0.001953),ArriveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),LeaveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=-0.000183,Y=-0.000366,Z=0.002930),ArriveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=-0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=0.000000,Y=0.000000,Z=5.185547),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=0.000000,Y=0.000000,Z=4.724121),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=0.000000,Z=112.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=0.246742),(Time=0.568854),(Time=0.655053),(Time=1.074346),(Time=2.436753)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=0.500000,EventName="FX_Open")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Vault_Unlock",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_14.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_14.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_14.InterpTrackAnimControl_0'
      GroupName="VaultDoorAnim"
      GroupColor=(B=233,G=0,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM'
      Name="InterpGroup_14"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.854612,OutVal=(X=-807.243103,Y=-2122.870605,Z=-5893.039551),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-793.693848,Y=-1905.356812,Z=-5906.038086),ArriveTangent=(X=40.444447,Y=459.753052,Z=0.000000),LeaveTangent=(X=40.444447,Y=459.753052,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-724.303711,Y=-1443.484741,Z=-5771.032715),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-753.148804,Y=-1619.177002,Z=-5863.035156),ArriveTangent=(X=0.000000,Y=-18.625420,Z=-0.467800),LeaveTangent=(X=0.000000,Y=-18.625420,Z=-0.467800),InterpMode=CIM_CurveAutoClamped),(InVal=5.002874,OutVal=(X=-752.751160,Y=-1626.176270,Z=-5863.204102),InterpMode=CIM_CurveAutoClamped),(InVal=6.034290,OutVal=(X=-774.834290,Y=-1592.891602,Z=-5746.032715),ArriveTangent=(X=-0.008098,Y=0.338789,Z=2.397736),LeaveTangent=(X=-0.008098,Y=0.338789,Z=2.397736),InterpMode=CIM_CurveAutoClamped),(InVal=6.523235,OutVal=(X=-774.836304,Y=-1592.807007,Z=-5745.431641),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.447952),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.447952),InterpMode=CIM_CurveAutoClamped),(InVal=7.500869,OutVal=(X=-773.893188,Y=-1723.835449,Z=-5563.430664),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.854612,OutVal=(X=0.000000,Y=6.262207,Z=91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-0.021973,Y=-0.433960,Z=89.648438),ArriveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),LeaveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-0.087891,Y=-40.231934,Z=122.431641),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-0.065918,Y=-9.030762,Z=91.466675),ArriveTangent=(X=0.000000,Y=0.060915,Z=-0.605017),LeaveTangent=(X=0.000000,Y=0.060915,Z=-0.605017),InterpMode=CIM_CurveAutoClamped),(InVal=5.002874,OutVal=(X=-0.076904,Y=-9.008789,Z=91.246948),ArriveTangent=(X=-0.018812,Y=0.000000,Z=-0.477235),LeaveTangent=(X=-0.018812,Y=0.000000,Z=-0.477235),InterpMode=CIM_CurveAutoClamped),(InVal=6.034290,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=6.523235,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=7.500869,OutVal=(X=-0.109863,Y=-25.048828,Z=90.021973),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.854612),(Time=2.395019),(Time=3.324989),(Time=3.987206),(Time=5.002874),(Time=6.034290),(Time=6.523235),(Time=7.500869)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_6
         EventTrack(0)=(Time=3.320000,EventName="FillPalletCall")
         bFireEventsWhenBackwards=False
         TrackTitle="Fill_Pallet"
         Name="InterpTrackEvent_6"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=5.007067,EventName="Tier_Lights")
         bFireEventsWhenBackwards=False
         TrackTitle="Tier_Lights"
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_1.InterpTrackEvent_6'
      GroupName="VaultDoorCam"
      GroupColor=(B=121,G=0,R=206,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.025091,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_1')
         AkEvents(1)=(Time=0.856996,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_2')
         AkEvents(2)=(Time=1.911914,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Long')
         AkEvents(3)=(Time=2.394445,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(4)=(Time=5.044679,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(5)=(Time=6.485294,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Sound"
      GroupColor=(B=164,G=0,R=176,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=7.497765
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_14'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=7.497765
   BakeAndPruneStatus(0)=(AnimSetName="ECON_emote.ECON_Emotes")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6864
   ObjPosY=-8272
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_13"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_13
   bForceStartPos=True
   InputLinks(0)=(DrawY=-8427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8404,bHidden=True,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8385,OverrideDelta=56)
   InputLinks(3)=(DrawY=-8406,OverrideDelta=35)
   InputLinks(4)=(DrawY=-8338,bHidden=True,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8404,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-8360,bHidden=True,OverrideDelta=81)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_15')),LinkDesc="Tier_Lights",DrawY=-8427,OverrideDelta=14)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_12')),LinkDesc="FillPalletCall",DrawY=-8406,OverrideDelta=35)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),LinkDesc="FX_Open",DrawY=-8385,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_13'),DrawX=-6785,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="VaultDoorCam",MinVars=0,DrawX=-6724,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),LinkDesc="VaultDoorAnim",MinVars=0,DrawX=-6649,OverrideDelta=137)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_56'),LinkDesc="ForceStartPosition",PropertyName="ForceStartPosition",MinVars=0,DrawX=-6560,OverrideDelta=214)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="bForceStartPos",PropertyName="bForceStartPos",bHidden=True,MinVars=0,DrawX=-6473,OverrideDelta=315)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Sound",bHidden=True,MinVars=0,DrawX=-6408,OverrideDelta=388)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=-8464
   ObjComment="Dosh Vault Camera Track"
   DrawWidth=315
   DrawHeight=125
   Name="SeqAct_Interp_13"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-8288
   ObjComment="Dosh Vault Camera"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=573
   SizeY=358
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6904
   ObjPosY=-8032
   ObjComment="Tier 4 Mat Track"
   DrawWidth=573
   DrawHeight=358
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-7784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_64
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6520
   ObjPosY=-7784
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_64"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_65
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-7816
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_65"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=InterpData Name=InterpData_19
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="VaultDoorCam",ShotNumber=2)
         CutTrack(1)=(Time=7.500092,TargetCamGroup="Camera",ShotNumber=5)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroupDirector_0.InterpTrackDirector_1'
      GroupColor=(B=171,G=0,R=169,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_14
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=-0.000061,Y=-0.000122,Z=0.000977),ArriveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),LeaveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=-0.000122,Y=-0.000244,Z=0.001953),ArriveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),LeaveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=-0.000183,Y=-0.000366,Z=0.002930),ArriveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=-0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=0.000000,Y=0.000000,Z=5.185547),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=0.000000,Y=0.000000,Z=4.724121),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=0.000000,Z=112.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=0.246742),(Time=0.568854),(Time=0.655053),(Time=1.074346),(Time=2.436753)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=0.500000,EventName="FX_Open")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Vault_Unlock",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_14.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_14.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_14.InterpTrackAnimControl_0'
      GroupName="VaultDoorAnim"
      GroupColor=(B=233,G=0,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM'
      Name="InterpGroup_14"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.854612,OutVal=(X=-807.243103,Y=-2122.870605,Z=-5893.039551),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-793.693848,Y=-1905.356812,Z=-5906.038086),ArriveTangent=(X=40.444447,Y=459.753052,Z=0.000000),LeaveTangent=(X=40.444447,Y=459.753052,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-724.303711,Y=-1443.484741,Z=-5771.032715),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-753.148804,Y=-1619.177002,Z=-5863.035156),ArriveTangent=(X=0.000000,Y=-32.263885,Z=-0.819145),LeaveTangent=(X=0.000000,Y=-32.263885,Z=-0.819145),InterpMode=CIM_CurveAutoClamped),(InVal=4.445710,OutVal=(X=-752.751160,Y=-1626.176270,Z=-5863.204102),InterpMode=CIM_CurveAutoClamped),(InVal=5.477126,OutVal=(X=-774.834290,Y=-1592.891602,Z=-5746.032715),ArriveTangent=(X=-0.006959,Y=0.291233,Z=2.061775),LeaveTangent=(X=-0.006959,Y=0.291233,Z=2.061775),InterpMode=CIM_CurveAutoClamped),(InVal=6.090762,OutVal=(X=-774.836304,Y=-1592.807007,Z=-5745.431641),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.862450),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.862450),InterpMode=CIM_CurveAutoClamped),(InVal=7.501308,OutVal=(X=-761.092834,Y=-1868.669556,Z=-5545.429688),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.854612,OutVal=(X=0.000000,Y=6.262207,Z=91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-0.021973,Y=-0.433960,Z=89.648438),ArriveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),LeaveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-0.087891,Y=-40.231934,Z=122.431641),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-0.065918,Y=-9.030762,Z=91.466675),ArriveTangent=(X=0.000000,Y=0.106701,Z=-1.057850),LeaveTangent=(X=0.000000,Y=0.106701,Z=-1.057850),InterpMode=CIM_CurveAutoClamped),(InVal=4.445710,OutVal=(X=-0.076904,Y=-9.008789,Z=91.246948),ArriveTangent=(X=-0.028115,Y=0.000000,Z=-0.786007),LeaveTangent=(X=-0.028115,Y=0.000000,Z=-0.786007),InterpMode=CIM_CurveAutoClamped),(InVal=5.477126,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=6.090762,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=7.501308,OutVal=(X=-0.109863,Y=-20.478516,Z=89.143066),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.854612),(Time=2.395019),(Time=3.324989),(Time=3.987206),(Time=4.445710),(Time=5.477126),(Time=6.090762),(Time=7.501308)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_6
         EventTrack(0)=(Time=3.320000,EventName="FillPalletCall")
         bFireEventsWhenBackwards=False
         TrackTitle="Fill_Pallet"
         Name="InterpTrackEvent_6"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=4.449903,EventName="Tier1_Check")
         bFireEventsWhenBackwards=False
         TrackTitle="Tier_1_Lights"
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_1.InterpTrackEvent_6'
      GroupName="VaultDoorCam"
      GroupColor=(B=121,G=0,R=206,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.025091,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_1')
         AkEvents(1)=(Time=0.856996,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_2')
         AkEvents(2)=(Time=1.911914,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Long')
         AkEvents(3)=(Time=3.357438,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(4)=(Time=4.487515,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(5)=(Time=6.052820,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Sound"
      GroupColor=(B=164,G=0,R=176,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=7.495875
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_14'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=7.495875
   BakeAndPruneStatus(0)=(AnimSetName="ECON_emote.ECON_Emotes")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-7792
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_19"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_19
   bForceStartPos=True
   InputLinks(0)=(DrawY=-7947,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7924,bHidden=True,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7905,OverrideDelta=56)
   InputLinks(3)=(DrawY=-7926,OverrideDelta=35)
   InputLinks(4)=(DrawY=-7858,bHidden=True,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7924,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-7880,bHidden=True,OverrideDelta=81)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_17')),LinkDesc="Tier1_Check",DrawY=-7947,OverrideDelta=14)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_13')),LinkDesc="FillPalletCall",DrawY=-7926,OverrideDelta=35)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_18')),LinkDesc="FX_Open",DrawY=-7905,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_19'),DrawX=-6777,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="VaultDoorCam",MinVars=0,DrawX=-6716,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),LinkDesc="VaultDoorAnim",MinVars=0,DrawX=-6641,OverrideDelta=137)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_64'),LinkDesc="ForceStartPosition",PropertyName="ForceStartPosition",MinVars=0,DrawX=-6552,OverrideDelta=214)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="bForceStartPos",PropertyName="bForceStartPos",bHidden=True,MinVars=0,DrawX=-6465,OverrideDelta=315)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Sound",bHidden=True,MinVars=0,DrawX=-6400,OverrideDelta=388)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-7984
   ObjComment="Dosh Vault Camera Track"
   DrawWidth=315
   DrawHeight=125
   Name="SeqAct_Interp_19"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-7808
   ObjComment="Dosh Vault Camera"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-7352
   ObjComment="Dosh Vault Camera"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_15
   bForceStartPos=True
   InputLinks(0)=(DrawY=-7483,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7460,bHidden=True,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7441,OverrideDelta=56)
   InputLinks(3)=(DrawY=-7462,OverrideDelta=35)
   InputLinks(4)=(DrawY=-7394,bHidden=True,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7438,bHidden=True,OverrideDelta=59)
   OutputLinks(1)=(DrawY=-7394,bHidden=True,OverrideDelta=103)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_20')),LinkDesc="Tier1_Check",DrawY=-7483,OverrideDelta=14)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),LinkDesc="FillPalletCall",DrawY=-7462,OverrideDelta=35)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_14')),LinkDesc="FX_Open",DrawY=-7441,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15'),DrawX=-6769,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),LinkDesc="VaultDoorCam",MinVars=0,DrawX=-6708,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),LinkDesc="VaultDoorAnim",MinVars=0,DrawX=-6633,OverrideDelta=137)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_58'),LinkDesc="ForceStartPosition",PropertyName="ForceStartPosition",MinVars=0,DrawX=-6544,OverrideDelta=214)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="bForceStartPos",PropertyName="bForceStartPos",bHidden=True,MinVars=0,DrawX=-6457,OverrideDelta=315)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Sound",bHidden=True,MinVars=0,DrawX=-6392,OverrideDelta=388)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6800
   ObjPosY=-7520
   ObjComment="Dosh Vault Camera Track"
   DrawWidth=315
   DrawHeight=125
   Name="SeqAct_Interp_15"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_15
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="VaultDoorCam",ShotNumber=2)
         CutTrack(1)=(Time=7.500000,TargetCamGroup="Camera",ShotNumber=5)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroupDirector_0.InterpTrackDirector_1'
      GroupColor=(B=171,G=0,R=169,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_14
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=-0.000061,Y=-0.000122,Z=0.000977),ArriveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),LeaveTangent=(X=-0.000299,Y=-0.000598,Z=0.004783),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=-0.000122,Y=-0.000244,Z=0.001953),ArriveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),LeaveTangent=(X=-0.000241,Y=-0.000483,Z=0.003864),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=-0.000183,Y=-0.000366,Z=0.002930),ArriveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000351,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=-0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=0.246742,InterpMode=CIM_CurveAutoClamped),(InVal=0.568854,OutVal=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=0.655053,OutVal=(X=0.000000,Y=0.000000,Z=5.185547),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.782182),InterpMode=CIM_CurveAutoClamped),(InVal=1.074346,OutVal=(X=0.000000,Y=0.000000,Z=4.724121),InterpMode=CIM_CurveAutoClamped),(InVal=2.436753,OutVal=(X=0.000000,Y=0.000000,Z=112.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=0.246742),(Time=0.568854),(Time=0.655053),(Time=1.074346),(Time=2.436753)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=0.500000,EventName="FX_Open")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Vault_Unlock",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_14.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_14.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_14.InterpTrackAnimControl_0'
      GroupName="VaultDoorAnim"
      GroupColor=(B=233,G=0,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM'
      Name="InterpGroup_14"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.854612,OutVal=(X=-807.243103,Y=-2122.870605,Z=-5893.039551),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-793.693848,Y=-1905.356812,Z=-5906.038086),ArriveTangent=(X=40.444447,Y=459.753052,Z=0.000000),LeaveTangent=(X=40.444447,Y=459.753052,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-724.303711,Y=-1443.484741,Z=-5771.032715),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-753.148804,Y=-1619.177002,Z=-5863.035156),ArriveTangent=(X=0.000000,Y=-32.259140,Z=-0.819016),LeaveTangent=(X=0.000000,Y=-32.259140,Z=-0.819016),InterpMode=CIM_CurveAutoClamped),(InVal=4.445813,OutVal=(X=-752.751160,Y=-1626.176270,Z=-5863.204102),InterpMode=CIM_CurveAutoClamped),(InVal=5.477229,OutVal=(X=-774.834290,Y=-1592.891602,Z=-5746.032715),ArriveTangent=(X=-0.006959,Y=0.291233,Z=2.061775),LeaveTangent=(X=-0.006959,Y=0.291233,Z=2.061775),InterpMode=CIM_CurveAutoClamped),(InVal=6.090865,OutVal=(X=-774.836304,Y=-1592.807007,Z=-5745.431641),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.864845),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.864845),InterpMode=CIM_CurveAutoClamped),(InVal=7.495897,OutVal=(X=-465.880646,Y=-1871.244385,Z=-5546.430664),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.854612,OutVal=(X=0.000000,Y=6.262207,Z=91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-0.021973,Y=-0.433960,Z=89.648438),ArriveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),LeaveTangent=(X=-0.055010,Y=-20.707722,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-0.087891,Y=-40.231934,Z=122.431641),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-0.065918,Y=-9.030762,Z=91.466675),ArriveTangent=(X=0.000000,Y=0.106686,Z=-1.057692),LeaveTangent=(X=0.000000,Y=0.106686,Z=-1.057692),InterpMode=CIM_CurveAutoClamped),(InVal=4.445813,OutVal=(X=-0.076904,Y=-9.008789,Z=91.246948),ArriveTangent=(X=-0.028112,Y=0.000000,Z=-0.785900),LeaveTangent=(X=-0.028112,Y=0.000000,Z=-0.785900),InterpMode=CIM_CurveAutoClamped),(InVal=5.477229,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=6.090865,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=7.495897,OutVal=(X=-0.109863,Y=-13.974609,Z=98.811035),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.854612),(Time=2.395019),(Time=3.324989),(Time=3.987206),(Time=4.445813),(Time=5.477229),(Time=6.090865),(Time=7.495897)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_6
         EventTrack(0)=(Time=3.320000,EventName="FillPalletCall")
         bFireEventsWhenBackwards=False
         TrackTitle="Fill_Pallet"
         Name="InterpTrackEvent_6"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=4.450006,EventName="Tier1_Check")
         bFireEventsWhenBackwards=False
         TrackTitle="Tier_1_Lights"
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_1.InterpTrackEvent_6'
      GroupName="VaultDoorCam"
      GroupColor=(B=121,G=0,R=206,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.025091,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_1')
         AkEvents(1)=(Time=0.856996,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_2')
         AkEvents(2)=(Time=1.911914,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Long')
         AkEvents(3)=(Time=3.357438,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(4)=(Time=4.487617,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(5)=(Time=6.052923,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="Sound"
      GroupColor=(B=164,G=0,R=176,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=7.495897
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_14'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=7.495897
   BakeAndPruneStatus(0)=(AnimSetName="ECON_emote.ECON_Emotes")
   BakeAndPruneStatus(1)=(AnimSetName="ENV_Dosh_Vault_ANIM_ANIM.ENV_DoshVault_Door_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-7336
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_15"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_57
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6408
   ObjPosY=-7360
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_57"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_58
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6512
   ObjPosY=-7328
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_58"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6640
   ObjPosY=-7312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=588
   SizeY=328
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=-7568
   ObjComment="Tier 5 Mat Track"
   DrawWidth=588
   DrawHeight=328
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=Sequence Name=EavulateForTier_0
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_75
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5608
      ObjPosY=-5784
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_75"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_74
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5616
      ObjPosY=-5968
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_74"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_73
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5608
      ObjPosY=-6160
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_73"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_72
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5608
      ObjPosY=-6368
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_72"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_71
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5608
      ObjPosY=-6584
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_71"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_7
      IntValue=5
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5528
      ObjPosY=-5784
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_7"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_19
      IntValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5504
      ObjPosY=-6568
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_19"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_17
      IntValue=2
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5520
      ObjPosY=-6376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_17"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_15
      IntValue=3
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5536
      ObjPosY=-6168
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_15"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_13
      IntValue=4
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5536
      ObjPosY=-5952
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_13"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_28
      SizeX=258
      SizeY=1132
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5632
      ObjPosY=-6792
      ObjComment="Evaluate for Tier"
      DrawWidth=258
      DrawHeight=1132
      Name="SequenceFrame_28"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_SequenceActivated Name=SeqEvent_SequenceActivated_1
      MaxWidth=172
      OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_18')),DrawY=-6726,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5796,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5882
      ObjPosY=-6792
      DrawWidth=106
      DrawHeight=128
      Name="SeqEvent_SequenceActivated_1"
      ObjectArchetype=SeqEvent_SequenceActivated'Engine.Default__SeqEvent_SequenceActivated'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_6
      InputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-7956,bHidden=True,OverrideDelta=37)
      OutputLinks(1)=(DrawY=-7934,bHidden=True,OverrideDelta=59)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_8')),DrawY=-5846,OverrideDelta=11)
      OutputLinks(3)=(DrawY=-7912,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-7890,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_75'),DrawX=-5527,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_7'),DrawX=-5502,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5560
      ObjPosY=-5880
      DrawWidth=91
      DrawHeight=61
      Name="SeqCond_CompareInt_6"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_18
      InputLinks(0)=(DrawY=-6670,OverrideDelta=35)
      OutputLinks(0)=(DrawY=-8780,bHidden=True,OverrideDelta=37)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_16')),DrawY=-6691,OverrideDelta=14)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_7')),DrawY=-6670,OverrideDelta=35)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_12')),DrawY=-6649,OverrideDelta=56)
      OutputLinks(4)=(DrawY=-8714,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_71'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_19'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5568
      ObjPosY=-6728
      DrawWidth=91
      DrawHeight=109
      Name="SeqCond_CompareInt_18"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_16
      InputLinks(0)=(DrawY=-6442,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8522,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_14')),DrawY=-6452,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_11')),DrawY=-6432,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-8456,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-8434,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_72'),DrawX=-5511,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_17'),DrawX=-5486,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5544
      ObjPosY=-6488
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_16"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_14
      InputLinks(0)=(DrawY=-6250,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8314,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_12')),DrawY=-6260,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_10')),DrawY=-6240,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-8248,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-8226,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_73'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_15'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5568
      ObjPosY=-6296
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_14"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_12
      InputLinks(0)=(DrawY=-6050,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8044,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_6')),DrawY=-6060,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_9')),DrawY=-6040,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-7978,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-7956,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_74'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_13'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5568
      ObjPosY=-6096
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_12"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_9
      OutputLabel="Tier4"
      InputLinks(0)=(DrawY=-6038,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5328
      ObjPosY=-6072
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_9"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_8
      OutputLabel="Tier5"
      InputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5320
      ObjPosY=-5880
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_8"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_7
      OutputLabel="Tier1"
      InputLinks(0)=(DrawY=-6590,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5344
      ObjPosY=-6624
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_7"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_12
      OutputLabel="Tier0"
      InputLinks(0)=(DrawY=-6702,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5336
      ObjPosY=-6736
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_12"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_11
      OutputLabel="Tier2"
      InputLinks(0)=(DrawY=-6438,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5336
      ObjPosY=-6472
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_11"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_10
      OutputLabel="Tier3"
      InputLinks(0)=(DrawY=-6238,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0'
      ObjPosX=-5336
      ObjPosY=-6272
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_10"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   SequenceObjects(0)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_7'
   SequenceObjects(1)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_6'
   SequenceObjects(2)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_12'
   SequenceObjects(3)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_13'
   SequenceObjects(4)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_15'
   SequenceObjects(5)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_14'
   SequenceObjects(6)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_17'
   SequenceObjects(7)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_16'
   SequenceObjects(8)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Int_19'
   SequenceObjects(9)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqCond_CompareInt_18'
   SequenceObjects(10)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SequenceFrame_28'
   SequenceObjects(11)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_71'
   SequenceObjects(12)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_72'
   SequenceObjects(13)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_73'
   SequenceObjects(14)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_74'
   SequenceObjects(15)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqVar_Named_75'
   SequenceObjects(16)=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqEvent_SequenceActivated_1'
   SequenceObjects(17)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_12'
   SequenceObjects(18)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_11'
   SequenceObjects(19)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_10'
   SequenceObjects(20)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_9'
   SequenceObjects(21)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_8'
   SequenceObjects(22)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_7'
   DefaultViewX=4970
   DefaultViewY=4507
   DefaultViewZoom=0.700000
   InputLinks(0)=(LinkDesc="In",LinkedOp=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqEvent_SequenceActivated_1',DrawY=-8818,OverrideDelta=71)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18')),LinkDesc="Tier0",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_12',DrawY=-8873,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),LinkDesc="Tier2",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_11',DrawY=-8829,OverrideDelta=60)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13')),LinkDesc="Tier3",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_10',DrawY=-8807,OverrideDelta=82)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19')),LinkDesc="Tier4",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_9',DrawY=-8785,OverrideDelta=104)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15')),LinkDesc="Tier5",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_8',DrawY=-8763,OverrideDelta=126)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18')),LinkDesc="Tier1",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0.SeqAct_FinishSequence_7',DrawY=-8851,OverrideDelta=38)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7888
   ObjPosY=-8912
   ObjName="EavulateForTier_0"
   DrawWidth=129
   DrawHeight=165
   Name="EavulateForTier_0"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=Sequence Name=EavulateForTier_2
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_85
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5608
      ObjPosY=-6584
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_85"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_84
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5608
      ObjPosY=-6368
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_84"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_83
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5608
      ObjPosY=-6160
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_83"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_82
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5616
      ObjPosY=-5968
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_82"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_81
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5608
      ObjPosY=-5784
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_81"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_29
      IntValue=5
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5528
      ObjPosY=-5784
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_29"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_28
      IntValue=4
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5536
      ObjPosY=-5952
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_28"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_27
      IntValue=3
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5536
      ObjPosY=-6168
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_27"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_26
      IntValue=2
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5520
      ObjPosY=-6376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_26"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_25
      IntValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5504
      ObjPosY=-6568
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_25"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_30
      SizeX=258
      SizeY=1132
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5632
      ObjPosY=-6792
      ObjComment="Evaluate for Tier"
      DrawWidth=258
      DrawHeight=1132
      Name="SequenceFrame_30"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_SequenceActivated Name=SeqEvent_SequenceActivated_3
      MaxWidth=172
      OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_24')),DrawY=-6726,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5796,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5882
      ObjPosY=-6792
      DrawWidth=106
      DrawHeight=128
      Name="SeqEvent_SequenceActivated_3"
      ObjectArchetype=SeqEvent_SequenceActivated'Engine.Default__SeqEvent_SequenceActivated'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_28
      InputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-7956,bHidden=True,OverrideDelta=37)
      OutputLinks(1)=(DrawY=-7934,bHidden=True,OverrideDelta=59)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_23')),DrawY=-5846,OverrideDelta=11)
      OutputLinks(3)=(DrawY=-7912,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-7890,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_81'),DrawX=-5527,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_29'),DrawX=-5502,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5560
      ObjPosY=-5880
      DrawWidth=91
      DrawHeight=61
      Name="SeqCond_CompareInt_28"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_27
      InputLinks(0)=(DrawY=-6050,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8044,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_28')),DrawY=-6060,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_22')),DrawY=-6040,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-7978,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-7956,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_82'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_28'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5568
      ObjPosY=-6096
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_27"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_26
      InputLinks(0)=(DrawY=-6250,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8314,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_27')),DrawY=-6260,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_1')),DrawY=-6240,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-8248,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-8226,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_83'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_27'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5568
      ObjPosY=-6296
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_26"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_25
      InputLinks(0)=(DrawY=-6442,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8522,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_26')),DrawY=-6452,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_25')),DrawY=-6432,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-8456,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-8434,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_84'),DrawX=-5511,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_26'),DrawX=-5486,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5544
      ObjPosY=-6488
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_25"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_24
      InputLinks(0)=(DrawY=-6670,OverrideDelta=35)
      OutputLinks(0)=(DrawY=-8780,bHidden=True,OverrideDelta=37)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_25')),DrawY=-6691,OverrideDelta=14)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_24')),DrawY=-6670,OverrideDelta=35)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_19')),DrawY=-6649,OverrideDelta=56)
      OutputLinks(4)=(DrawY=-8714,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_85'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_25'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5568
      ObjPosY=-6728
      DrawWidth=91
      DrawHeight=109
      Name="SeqCond_CompareInt_24"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_25
      OutputLabel="Tier2"
      InputLinks(0)=(DrawY=-6438,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5336
      ObjPosY=-6472
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_25"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_24
      OutputLabel="Tier1"
      InputLinks(0)=(DrawY=-6590,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5344
      ObjPosY=-6624
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_24"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_23
      OutputLabel="Tier5"
      InputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5320
      ObjPosY=-5880
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_23"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_22
      OutputLabel="Tier4"
      InputLinks(0)=(DrawY=-6038,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5328
      ObjPosY=-6072
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_22"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_19
      OutputLabel="Tier0"
      InputLinks(0)=(DrawY=-6702,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5336
      ObjPosY=-6736
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_19"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_1
      OutputLabel="Tier3"
      InputLinks(0)=(DrawY=-6238,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5336
      ObjPosY=-6272
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_1"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   SequenceObjects(0)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_81'
   SequenceObjects(1)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_82'
   SequenceObjects(2)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_83'
   SequenceObjects(3)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_84'
   SequenceObjects(4)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Named_85'
   SequenceObjects(5)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SequenceFrame_30'
   SequenceObjects(6)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_24'
   SequenceObjects(7)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_25'
   SequenceObjects(8)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_25'
   SequenceObjects(9)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_26'
   SequenceObjects(10)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_26'
   SequenceObjects(11)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_27'
   SequenceObjects(12)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_28'
   SequenceObjects(13)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_27'
   SequenceObjects(14)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqCond_CompareInt_28'
   SequenceObjects(15)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqVar_Int_29'
   SequenceObjects(16)=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqEvent_SequenceActivated_3'
   SequenceObjects(17)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_19'
   SequenceObjects(18)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_25'
   SequenceObjects(19)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_1'
   SequenceObjects(20)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_22'
   SequenceObjects(21)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_23'
   SequenceObjects(22)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_24'
   DefaultViewX=5970
   DefaultViewY=7247
   InputLinks(0)=(LinkDesc="In",LinkedOp=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqEvent_SequenceActivated_3',DrawY=-8120,OverrideDelta=71)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18',InputLinkIdx=3)),LinkDesc="Tier0",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_19',DrawY=-8175,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=3)),LinkDesc="Tier2",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_25',DrawY=-8131,OverrideDelta=60)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13',InputLinkIdx=3)),LinkDesc="Tier3",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_1',DrawY=-8109,OverrideDelta=82)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19',InputLinkIdx=3)),LinkDesc="Tier4",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_22',DrawY=-8087,OverrideDelta=104)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15',InputLinkIdx=3)),LinkDesc="Tier5",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_23',DrawY=-8065,OverrideDelta=126)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18',InputLinkIdx=3)),LinkDesc="Tier1",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_24',DrawY=-8153,OverrideDelta=38)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7913
   ObjPosY=-8214
   ObjName="EavulateForTier_2"
   DrawWidth=129
   DrawHeight=165
   Name="EavulateForTier_2"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="FillPallet"
   MaxWidth=170
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAction_DoshVault'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.KFSeqAction_DoshVault_0')),DrawY=-8278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4659,OverrideDelta=53)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4744
   ObjPosY=-8344
   ObjComment="FillPallet"
   DrawWidth=105
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="FillPallet"
   InputLinks(0)=(DrawY=-9414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9414,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6077,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6192
   ObjPosY=-9448
   ObjComment="FillPallet"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="FillPallet"
   InputLinks(0)=(DrawY=-8854,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8854,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6069,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6184
   ObjPosY=-8888
   ObjComment="FillPallet"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_12
   EventName="FillPallet"
   InputLinks(0)=(DrawY=-8406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6101,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6216
   ObjPosY=-8440
   ObjComment="FillPallet"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_12"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
   EventName="FillPallet"
   InputLinks(0)=(DrawY=-7798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6045,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6160
   ObjPosY=-7832
   ObjComment="FillPallet"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_13"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="FillPallet"
   InputLinks(0)=(DrawY=-7270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5885,OverrideDelta=83)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6000
   ObjPosY=-7304
   ObjComment="FillPallet"
   DrawWidth=231
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Fill_FX"
   MaxWidth=159
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-9118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4081,OverrideDelta=47)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4160
   ObjPosY=-9184
   ObjComment="Fill_FX"
   DrawWidth=99
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_15
   EventName="Fill_FX"
   InputLinks(0)=(DrawY=-9318,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9318,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6066,OverrideDelta=78)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6176
   ObjPosY=-9352
   ObjComment="Fill_FX"
   DrawWidth=220
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_15"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_16
   EventName="Fill_FX"
   InputLinks(0)=(DrawY=-8766,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6082,OverrideDelta=78)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6192
   ObjPosY=-8800
   ObjComment="Fill_FX"
   DrawWidth=220
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_16"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_17
   EventName="Fill_FX"
   InputLinks(0)=(DrawY=-8302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8302,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6090,OverrideDelta=78)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6200
   ObjPosY=-8336
   ObjComment="Fill_FX"
   DrawWidth=220
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_17"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_18
   EventName="Fill_FX"
   InputLinks(0)=(DrawY=-7702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6050,OverrideDelta=78)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6160
   ObjPosY=-7736
   ObjComment="Fill_FX"
   DrawWidth=220
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_18"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_14
   EventName="Fill_FX"
   InputLinks(0)=(DrawY=-7198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5890,OverrideDelta=78)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6000
   ObjPosY=-7232
   ObjComment="Fill_FX"
   DrawWidth=220
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_14"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_20
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-9440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_20"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_14
   Commands(0)="ActiveLightActorsForTier 1 TRUE"
   InputLinks(0)=(DrawY=-9510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9510,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_20'),DrawX=-5896,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5960
   ObjPosY=-9544
   ObjComment="Activate Lights for Tier 1"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_14"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5840
   ObjPosY=-8752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_11"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_10
   Commands(0)="ActiveLightActorsForTier 1 TRUE"
   Commands(1)="ActiveLightActorsForTier 2 TRUE"
   InputLinks(0)=(DrawY=-8814,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8814,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_11'),DrawX=-5824,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5888
   ObjPosY=-8848
   ObjComment="Activate Lights for Tier 1 and 2"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_10"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_13
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-8432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_13"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_15
   Commands(0)="ActiveLightActorsForTier 1 true"
   Commands(1)="ActiveLightActorsForTier 2 true"
   Commands(2)="ActiveLightActorsForTier 3 true"
   InputLinks(0)=(DrawY=-8518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8518,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_13'),DrawX=-5928,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-8552
   ObjComment="Activate lights for Tier 1-3"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_15"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_14
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=-7920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_14"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_17
   Commands(0)="ActiveLightActorsForTier 1 true"
   Commands(1)="ActiveLightActorsForTier 2 true"
   Commands(2)="ActiveLightActorsForTier 3 true"
   Commands(3)="ActiveLightActorsForTier 4 true"
   InputLinks(0)=(DrawY=-7974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7974,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_14'),DrawX=-6032,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6096
   ObjPosY=-8008
   ObjComment="Activate Lights for Tier 1-4"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_17"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_24
   Commands(0)="ActiveLightActorsForTier 1 FALSE"
   Commands(1)="ActiveLightActorsForTier 2 FALSE"
   Commands(2)="ActiveLightActorsForTier 3 FALSE"
   Commands(3)="ActiveLightActorsForTier 4 FALSE"
   Commands(4)="ActiveLightActorsForTier 5 FALSE"
   InputLinks(0)=(DrawY=-7510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7510,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_10'),DrawX=-4104,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4168
   ObjPosY=-7544
   ObjComment="Turn off Tier Lights"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_24"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4128
   ObjPosY=-7440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_10"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=Sequence Name=EavulateForTier_1
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_81
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5608
      ObjPosY=-6160
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_81"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_80
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5608
      ObjPosY=-6584
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_80"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_79
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5608
      ObjPosY=-6368
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_79"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_77
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5616
      ObjPosY=-5968
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_77"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_76
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5608
      ObjPosY=-5784
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_76"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_24
      IntValue=5
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5528
      ObjPosY=-5784
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_24"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_23
      IntValue=4
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5536
      ObjPosY=-5952
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_23"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_22
      IntValue=3
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5536
      ObjPosY=-6168
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_22"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_21
      IntValue=2
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5520
      ObjPosY=-6376
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_21"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SeqVar_Int Name=SeqVar_Int_20
      IntValue=1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5504
      ObjPosY=-6568
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Int_20"
      ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_29
      SizeX=258
      SizeY=1132
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5632
      ObjPosY=-6792
      ObjComment="Evaluate for Tier"
      DrawWidth=258
      DrawHeight=1132
      Name="SequenceFrame_29"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_SequenceActivated Name=SeqEvent_SequenceActivated_2
      MaxWidth=172
      OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_19')),DrawY=-6726,OverrideDelta=11)
      VariableLinks(0)=(DrawX=-5796,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5882
      ObjPosY=-6792
      DrawWidth=106
      DrawHeight=128
      Name="SeqEvent_SequenceActivated_2"
      ObjectArchetype=SeqEvent_SequenceActivated'Engine.Default__SeqEvent_SequenceActivated'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_23
      InputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      OutputLinks(0)=(DrawY=-7956,bHidden=True,OverrideDelta=37)
      OutputLinks(1)=(DrawY=-7934,bHidden=True,OverrideDelta=59)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_17')),DrawY=-5846,OverrideDelta=11)
      OutputLinks(3)=(DrawY=-7912,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-7890,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_76'),DrawX=-5527,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_24'),DrawX=-5502,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5560
      ObjPosY=-5880
      DrawWidth=91
      DrawHeight=61
      Name="SeqCond_CompareInt_23"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_22
      InputLinks(0)=(DrawY=-6050,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8044,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_23')),DrawY=-6060,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_16')),DrawY=-6040,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-7978,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-7956,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_77'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_23'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5568
      ObjPosY=-6096
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_22"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_21
      InputLinks(0)=(DrawY=-6250,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8314,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_22')),DrawY=-6260,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_28')),DrawY=-6240,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-8248,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-8226,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_81'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_22'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5568
      ObjPosY=-6296
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_21"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_20
      InputLinks(0)=(DrawY=-6442,OverrideDelta=23)
      OutputLinks(0)=(DrawY=-8522,bHidden=True,OverrideDelta=15)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_21')),DrawY=-6452,OverrideDelta=13)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_14')),DrawY=-6432,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-8456,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-8434,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_79'),DrawX=-5511,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_21'),DrawX=-5486,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5544
      ObjPosY=-6488
      DrawWidth=91
      DrawHeight=85
      Name="SeqCond_CompareInt_20"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_19
      InputLinks(0)=(DrawY=-6670,OverrideDelta=35)
      OutputLinks(0)=(DrawY=-8780,bHidden=True,OverrideDelta=37)
      OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_20')),DrawY=-6691,OverrideDelta=14)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_18')),DrawY=-6670,OverrideDelta=35)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_42')),DrawY=-6649,OverrideDelta=56)
      OutputLinks(4)=(DrawY=-8714,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_80'),DrawX=-5535,OverrideDelta=29)
      VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_20'),DrawX=-5510,OverrideDelta=54)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5568
      ObjPosY=-6728
      DrawWidth=91
      DrawHeight=109
      Name="SeqCond_CompareInt_19"
      ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_42
      OutputLabel="Tier0"
      InputLinks(0)=(DrawY=-6702,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5336
      ObjPosY=-6736
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_42"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_28
      OutputLabel="Tier3"
      InputLinks(0)=(DrawY=-6238,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5336
      ObjPosY=-6272
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_28"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_18
      OutputLabel="Tier1"
      InputLinks(0)=(DrawY=-6590,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5344
      ObjPosY=-6624
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_18"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_17
      OutputLabel="Tier5"
      InputLinks(0)=(DrawY=-5846,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5320
      ObjPosY=-5880
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_17"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_16
      OutputLabel="Tier4"
      InputLinks(0)=(DrawY=-6038,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5328
      ObjPosY=-6072
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_16"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_14
      OutputLabel="Tier2"
      InputLinks(0)=(DrawY=-6438,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5336
      ObjPosY=-6472
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_14"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   SequenceObjects(0)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_18'
   SequenceObjects(1)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_17'
   SequenceObjects(2)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_16'
   SequenceObjects(3)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_28'
   SequenceObjects(4)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_14'
   SequenceObjects(5)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_42'
   SequenceObjects(6)=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqEvent_SequenceActivated_2'
   SequenceObjects(7)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_24'
   SequenceObjects(8)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_23'
   SequenceObjects(9)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_22'
   SequenceObjects(10)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_23'
   SequenceObjects(11)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_22'
   SequenceObjects(12)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_21'
   SequenceObjects(13)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_21'
   SequenceObjects(14)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_20'
   SequenceObjects(15)=SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Int_20'
   SequenceObjects(16)=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqCond_CompareInt_19'
   SequenceObjects(17)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SequenceFrame_29'
   SequenceObjects(18)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_80'
   SequenceObjects(19)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_79'
   SequenceObjects(20)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_81'
   SequenceObjects(21)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_77'
   SequenceObjects(22)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_76'
   DefaultViewX=5970
   DefaultViewY=7247
   InputLinks(0)=(LinkDesc="In",LinkedOp=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqEvent_SequenceActivated_2',DrawY=-6322,OverrideDelta=71)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1')),LinkDesc="Tier0",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_42',DrawY=-6377,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_3')),LinkDesc="Tier2",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_14',DrawY=-6333,OverrideDelta=60)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_4')),LinkDesc="Tier3",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_28',DrawY=-6311,OverrideDelta=82)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_5')),LinkDesc="Tier4",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_16',DrawY=-6289,OverrideDelta=104)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_0')),LinkDesc="Tier5",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_17',DrawY=-6267,OverrideDelta=126)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1')),LinkDesc="Tier1",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_18',DrawY=-6355,OverrideDelta=38)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8032
   ObjPosY=-6416
   ObjName="EavulateForTier_1"
   DrawWidth=129
   DrawHeight=165
   Name="EavulateForTier_1"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_4
   MaxWidth=177
   OutputLinks(0)=(DrawY=-5853,bHidden=True,OverrideDelta=36)
   OutputLinks(1)=(Links=((LinkedOp=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1')),DrawY=-6350,OverrideDelta=11)
   OutputLinks(2)=(DrawY=-5809,bHidden=True,OverrideDelta=80)
   OutputLinks(3)=(DrawY=-6431,bHidden=True,OverrideDelta=82)
   OutputLinks(4)=(DrawY=-6409,bHidden=True,OverrideDelta=104)
   OutputLinks(5)=(DrawY=-5875,bHidden=True,OverrideDelta=14)
   VariableLinks(0)=(bHidden=True,DrawX=-5400,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8528
   ObjPosY=-6416
   DrawWidth=133
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_4"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=Sequence Name=crates
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=384
      ObjPosY=1640
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_9"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=400
      ObjPosY=1280
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_8"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=392
      ObjPosY=3032
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_6"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_5
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=424
      ObjPosY=1960
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_5"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_41
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=392
      ObjPosY=872
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_41"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_40
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=392
      ObjPosY=664
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_40"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=360
      ObjPosY=-248
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_4"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_16
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=384
      ObjPosY=256
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_16"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=400
      ObjPosY=1072
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_11"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=384
      ObjPosY=456
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_10"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=376
      ObjPosY=-488
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_1"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Crate_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=416
      ObjPosY=3200
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_0"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_External Name=SeqVar_External_1
      ExpectedType=Class'Engine.SeqVar_Bool'
      VariableLabel="Bool"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=1976
      ObjPosY=3064
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_External_1"
      ObjectArchetype=SeqVar_External'Engine.Default__SeqVar_External'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_5
      SizeX=728
      SizeY=252
      BorderWidth=3
      bDrawBox=True
      BorderColor=(B=106,G=255,R=0,A=255)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=-48
      ObjPosY=1824
      ObjComment="NEW"
      DrawWidth=728
      DrawHeight=252
      Name="SequenceFrame_5"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_4
      SizeX=601
      SizeY=219
      BorderWidth=3
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=-32
      ObjPosY=-649
      ObjComment="Dosh Vault Debug Crate"
      DrawWidth=601
      DrawHeight=219
      Name="SequenceFrame_4"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_3
      SizeX=683
      SizeY=2276
      BorderWidth=3
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=-32
      ObjPosY=119
      ObjComment="PSN_Cosmetic_Crate"
      DrawWidth=683
      DrawHeight=2276
      Name="SequenceFrame_3"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_2
      SizeX=590
      SizeY=428
      BorderWidth=3
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosY=2872
      ObjComment="Emote Crates"
      DrawWidth=590
      DrawHeight=428
      Name="SequenceFrame_2"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_1
      SizeX=635
      SizeY=255
      BorderWidth=3
      bDrawBox=True
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=-32
      ObjPosY=-385
      ObjComment="Vault Crate"
      DrawWidth=635
      DrawHeight=255
      Name="SequenceFrame_1"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_8
      ConsoleEventName="open_psncrate_cs8"
      EventDesc="psncrate_cs8"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_23')),DrawY=1594,OverrideDelta=11)
      VariableLinks(0)=(DrawX=124,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosY=1528
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_8"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_71
      ConsoleEventName="open_psncrate_cs2"
      EventDesc="psncrate_cs2"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_37')),DrawY=410,OverrideDelta=11)
      VariableLinks(0)=(DrawX=116,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=-8
      ObjPosY=344
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_71"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_70
      ConsoleEventName="open_psncrate_cs9"
      EventDesc="psncrate_cs9"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_34')),DrawY=1914,OverrideDelta=11)
      VariableLinks(0)=(DrawX=164,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=40
      ObjPosY=1848
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_70"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
      ConsoleEventName="open_psncrate_cs7"
      EventDesc="psncrate_cs7"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_10')),DrawY=1234,OverrideDelta=11)
      VariableLinks(0)=(DrawX=132,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=8
      ObjPosY=1168
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_3"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_23
      ConsoleEventName="open_psncrate_cs5"
      EventDesc="psncrate_cs3"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_86')),DrawY=826,OverrideDelta=11)
      VariableLinks(0)=(DrawX=124,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosY=760
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_23"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_22
      ConsoleEventName="open_psncrate_cs3"
      EventDesc="psncrate_cs3"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_84')),DrawY=618,OverrideDelta=11)
      VariableLinks(0)=(DrawX=124,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosY=552
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_22"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
      ConsoleEventName="open_psncrate_cs6"
      EventDesc="psncrate_cs3"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_5')),DrawY=1026,OverrideDelta=11)
      VariableLinks(0)=(DrawX=132,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=8
      ObjPosY=960
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_2"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_115
      ConsoleEventName="open_vaultcrate_test"
      EventDesc="vault crate"
      MaxWidth=262
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_33')),DrawY=-550,OverrideDelta=11)
      VariableLinks(0)=(DrawX=123,OverrideDelta=99)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=-8
      ObjPosY=-616
      DrawWidth=151
      DrawHeight=128
      Name="SeqEvent_Console_115"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_114
      ConsoleEventName="open_vaultcrate"
      EventDesc="vault crate"
      MaxWidth=227
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_76')),DrawY=-278,OverrideDelta=11)
      VariableLinks(0)=(DrawX=89,OverrideDelta=81)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=-24
      ObjPosY=-344
      DrawWidth=133
      DrawHeight=128
      Name="SeqEvent_Console_114"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_112
      ConsoleEventName="open_psncrate_cs1"
      EventDesc="psncrate_cs1"
      MaxWidth=248
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_70')),DrawY=218,OverrideDelta=11)
      VariableLinks(0)=(DrawX=124,OverrideDelta=92)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosY=152
      DrawWidth=144
      DrawHeight=128
      Name="SeqEvent_Console_112"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
      ConsoleEventName="open_emote1"
      EventDesc="first emote crate"
      MaxWidth=208
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_4')),DrawY=2962,OverrideDelta=11)
      VariableLinks(0)=(DrawX=112,OverrideDelta=72)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=8
      ObjPosY=2896
      DrawWidth=124
      DrawHeight=128
      Name="SeqEvent_Console_1"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
      ConsoleEventName="open_emote2"
      EventDesc="first emote crate"
      MaxWidth=208
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_0')),DrawY=3146,OverrideDelta=11)
      VariableLinks(0)=(DrawX=112,OverrideDelta=72)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=8
      ObjPosY=3080
      DrawWidth=124
      DrawHeight=128
      Name="SeqEvent_Console_0"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_87
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=818,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=818,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_41'),DrawX=477,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=432
      ObjPosY=784
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_87"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_86
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Deepstrike_M'
      InputLinks(0)=(DrawY=818,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_87')),DrawY=818,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_41'),DrawX=357,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=312
      ObjPosY=784
      ObjComment="Deepstrike Cosmetic Crate"
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_86"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_85
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=610,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=610,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_40'),DrawX=477,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=432
      ObjPosY=576
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_85"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_84
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Slaughterhouse_M'
      InputLinks(0)=(DrawY=610,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_85')),DrawY=610,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_40'),DrawX=357,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=312
      ObjPosY=576
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_84"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_77
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_DoshVault_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=-326,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=-326,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_4'),DrawX=445,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=400
      ObjPosY=-360
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_77"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_76
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_DoshVault_M'
      InputLinks(0)=(DrawY=-326,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_77')),DrawY=-326,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_4'),DrawX=309,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=264
      ObjPosY=-360
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_76"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_71
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=210,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=210,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_16'),DrawX=485,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=440
      ObjPosY=176
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_71"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_70
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Crate_PSN_M'
      InputLinks(0)=(DrawY=210,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_71')),DrawY=210,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_16'),DrawX=341,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=296
      ObjPosY=176
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_70"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_DAR_M'
      InputLinks(0)=(DrawY=1018,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_1')),DrawY=1018,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_11'),DrawX=365,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=320
      ObjPosY=984
      ObjComment="DAR Cosmetic Crate"
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_5"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Emote_M'
      InputLinks(0)=(DrawY=2954,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_3')),DrawY=2954,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_6'),DrawX=357,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=312
      ObjPosY=2920
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_4"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_37
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply2_Crate_PSN_M'
      InputLinks(0)=(DrawY=402,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_36')),DrawY=402,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_10'),DrawX=349,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=304
      ObjPosY=368
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_37"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_36
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=402,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=402,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_10'),DrawX=469,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=424
      ObjPosY=368
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_36"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_35
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=1906,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=1906,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_5'),DrawX=509,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=464
      ObjPosY=1872
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_35"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_34
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Deity_M'
      InputLinks(0)=(DrawY=1906,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_35')),DrawY=1906,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_5'),DrawX=389,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=344
      ObjPosY=1872
      ObjComment="Deity Cosmetic Crate"
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_34"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_33
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_DoshVault_M'
      InputLinks(0)=(DrawY=-550,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_32')),DrawY=-550,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_1'),DrawX=341,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=296
      ObjPosY=-584
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_33"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_32
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_DoshVault_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=-550,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=-550,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_1'),DrawX=469,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=424
      ObjPosY=-584
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_32"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Emote_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=2954,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=2954,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_6'),DrawX=477,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=432
      ObjPosY=2920
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_3"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_23
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_CyberSamurai_M'
      InputLinks(0)=(DrawY=1586,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_22')),DrawY=1586,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_9'),DrawX=349,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=304
      ObjPosY=1552
      ObjComment="Cyber Samurai Cosmetic Crate"
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_23"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_22
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=1586,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=1586,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_9'),DrawX=469,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=424
      ObjPosY=1552
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_22"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Emote_02_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=3138,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=3138,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_0'),DrawX=477,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=432
      ObjPosY=3104
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_2"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=1226,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=1226,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_8'),DrawX=485,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=440
      ObjPosY=1192
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_16"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Loco_M'
      InputLinks(0)=(DrawY=1226,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_16')),DrawY=1226,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_8'),DrawX=365,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=320
      ObjPosY=1192
      ObjComment="Loco Cosmetic Crate"
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_10"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
      NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
      MaterialIndex=1
      InputLinks(0)=(DrawY=1018,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),DrawY=1018,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_11'),DrawX=485,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=440
      ObjPosY=984
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_1"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Emote_02_M'
      InputLinks(0)=(DrawY=3138,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_2')),DrawY=3138,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_0'),DrawX=357,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=312
      ObjPosY=3104
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_0"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_44
      OutputLabel="Dead Pulse"
      InputLinks(0)=(DrawY=842,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=3064
      ObjPosY=808
      DrawWidth=204
      DrawHeight=45
      Name="SeqAct_FinishSequence_44"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_43
      OutputLabel="Output"
      InputLinks(0)=(DrawY=754,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=3064
      ObjPosY=720
      DrawWidth=178
      DrawHeight=45
      Name="SeqAct_FinishSequence_43"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=Sequence Name=PSN_WeaponSkinCrate
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5392
         ObjPosY=104
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_8"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5360
         ObjPosY=2536
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_7"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5392
         ObjPosY=520
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_6"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5360
         ObjPosY=960
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_43"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5384
         ObjPosY=312
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_4"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_39
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5408
         ObjPosY=-104
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_39"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5416
         ObjPosY=1960
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_3"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_18
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5384
         ObjPosY=-376
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_18"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_15
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5376
         ObjPosY=1376
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_15"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5400
         ObjPosY=-568
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_14"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5432
         ObjPosY=-744
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_13"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5368
         ObjPosY=2296
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_11"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5368
         ObjPosY=1168
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_10"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5368
         ObjPosY=1656
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_0"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_7
         SizeX=1032
         SizeY=617
         BorderWidth=3
         bDrawBox=True
         BorderColor=(B=106,G=255,R=0,A=255)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5824
         ObjPosY=2152
         ObjComment="NEW"
         DrawWidth=1032
         DrawHeight=617
         Name="SequenceFrame_7"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_9
         ConsoleEventName="open_PSNcrate_WS13"
         MaxWidth=266
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_24')),DrawY=2258,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5643,OverrideDelta=101)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5776
         ObjPosY=2192
         ObjComment="Dragonwave"
         DrawWidth=153
         DrawHeight=128
         Name="SeqEvent_Console_9"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_77
         ConsoleEventName="open_psncrate_ws3"
         EventDesc="psncrate_mace and sheild crate"
         MaxWidth=251
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_46')),DrawY=-406,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5675,OverrideDelta=93)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5800
         ObjPosY=-472
         DrawWidth=145
         DrawHeight=128
         Name="SeqEvent_Console_77"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_76
         ConsoleEventName="open_psncrate_ws4"
         EventDesc="psn flare stoner crate"
         MaxWidth=251
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_59')),DrawY=-158,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5675,OverrideDelta=93)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5800
         ObjPosY=-224
         DrawWidth=145
         DrawHeight=128
         Name="SeqEvent_Console_76"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_72
         ConsoleEventName="open_psncrate_ws1"
         EventDesc="psncrate_ws1"
         MaxWidth=251
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_38')),DrawY=-798,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5691,OverrideDelta=93)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5816
         ObjPosY=-864
         DrawWidth=145
         DrawHeight=128
         Name="SeqEvent_Console_72"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_7
         ConsoleEventName="open_PSNcrate_WS12"
         MaxWidth=266
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_18')),DrawY=1922,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5691,OverrideDelta=101)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5824
         ObjPosY=1856
         DrawWidth=153
         DrawHeight=128
         Name="SeqEvent_Console_7"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_6
         ConsoleEventName="open_PSNcrate_WS14"
         MaxWidth=266
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_12')),DrawY=2498,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5635,OverrideDelta=101)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5768
         ObjPosY=2432
         ObjComment="Neon MKV"
         DrawWidth=153
         DrawHeight=128
         Name="SeqEvent_Console_6"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_5
         ConsoleEventName="open_psncrate_ws7"
         EventDesc="psncrate_ws5"
         MaxWidth=251
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_9')),DrawY=482,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5675,OverrideDelta=93)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5800
         ObjPosY=416
         DrawWidth=145
         DrawHeight=128
         Name="SeqEvent_Console_5"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
         ConsoleEventName="open_PSNcrate_WS9"
         EventDesc=
         MaxWidth=258
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_6')),DrawY=1130,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5647,OverrideDelta=97)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5776
         ObjPosY=1064
         DrawWidth=149
         DrawHeight=128
         Name="SeqEvent_Console_4"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
         ConsoleEventName="open_psncrate_ws6"
         EventDesc="psncrate_ws5"
         MaxWidth=251
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_8')),DrawY=274,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5667,OverrideDelta=93)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5792
         ObjPosY=208
         DrawWidth=145
         DrawHeight=128
         Name="SeqEvent_Console_3"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_25
         ConsoleEventName="open_PSNcrate_WS8"
         EventDesc="psncrate_ws5"
         MaxWidth=258
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_91')),DrawY=922,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5639,OverrideDelta=97)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5768
         ObjPosY=856
         DrawWidth=149
         DrawHeight=128
         Name="SeqEvent_Console_25"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
         ConsoleEventName="open_psncrate_ws5"
         EventDesc="psncrate_ws5"
         MaxWidth=251
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_5')),DrawY=66,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5675,OverrideDelta=93)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5800
         DrawWidth=145
         DrawHeight=128
         Name="SeqEvent_Console_2"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_15
         ConsoleEventName="open_PSNcrate_WS10"
         EventDesc="psncrate_ws5"
         MaxWidth=266
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_13')),DrawY=1338,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5651,OverrideDelta=101)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5784
         ObjPosY=1272
         DrawWidth=153
         DrawHeight=128
         Name="SeqEvent_Console_15"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_113
         ConsoleEventName="open_psncrate_ws2"
         EventDesc="psncrate_ws2"
         MaxWidth=251
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_73')),DrawY=-622,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5683,OverrideDelta=93)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5808
         ObjPosY=-688
         DrawWidth=145
         DrawHeight=128
         Name="SeqEvent_Console_113"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
         ConsoleEventName="open_PSNcrate_WS11"
         EventDesc=
         MaxWidth=266
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_0')),DrawY=1618,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-5643,OverrideDelta=101)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5776
         ObjPosY=1552
         DrawWidth=153
         DrawHeight=128
         Name="SeqEvent_Console_0"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_91
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Neon_M'
         InputLinks(0)=(DrawY=906,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_90')),DrawY=906,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_43'),DrawX=-5403,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5448
         ObjPosY=872
         ObjComment="HORZINE SUPPLY WEAPON SKIN CRATE SERIES 8"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_91"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_90
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=906,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_26')),DrawY=906,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_43'),DrawX=-5283,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5328
         ObjPosY=872
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_90"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_WepCollection_01_M'
         InputLinks(0)=(DrawY=466,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_10')),DrawY=466,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_6'),DrawX=-5435,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5480
         ObjPosY=432
         ObjComment="Weapon Collection 1"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_9"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Deepstrike_M'
         InputLinks(0)=(DrawY=258,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_7')),DrawY=258,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_4'),DrawX=-5427,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5472
         ObjPosY=224
         ObjComment="Supply Deepstrike"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_8"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_73
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply4_Crate_PSN_M'
         InputLinks(0)=(DrawY=-630,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_72')),DrawY=-630,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_14'),DrawX=-5443,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5488
         ObjPosY=-664
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_73"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_72
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=-630,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_17')),DrawY=-630,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_14'),DrawX=-5323,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5368
         ObjPosY=-664
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_72"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_7
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=258,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_2')),DrawY=258,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_4'),DrawX=-5307,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5352
         ObjPosY=224
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_7"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_60
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=-158,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_19')),DrawY=-158,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_39'),DrawX=-5323,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5368
         ObjPosY=-192
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_60"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_6
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Bluefire_M'
         InputLinks(0)=(DrawY=1114,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_3')),DrawY=1114,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_10'),DrawX=-5411,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5456
         ObjPosY=1080
         ObjComment="HORZINE SUPPLY WEAPON SKIN CRATE SERIES 9"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_6"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_59
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Spitfire_M'
         InputLinks(0)=(DrawY=-158,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_60')),DrawY=-158,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_39'),DrawX=-5459,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5504
         ObjPosY=-192
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_59"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Neon_M'
         InputLinks(0)=(DrawY=50,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_16')),DrawY=50,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_8'),DrawX=-5435,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5480
         ObjPosY=16
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_5"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_46
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply5_Crate_PSN_M'
         InputLinks(0)=(DrawY=-414,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_45')),DrawY=-414,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_18'),DrawX=-5435,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5480
         ObjPosY=-448
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_46"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_45
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=-414,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_18')),DrawY=-414,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_18'),DrawX=-5315,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5360
         ObjPosY=-448
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_45"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_39
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=-806,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_16')),DrawY=-806,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_13'),DrawX=-5331,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5376
         ObjPosY=-840
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_39"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_38
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply3_Crate_PSN_M'
         InputLinks(0)=(DrawY=-806,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_39')),DrawY=-806,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_13'),DrawX=-5451,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5496
         ObjPosY=-840
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_38"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1114,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_21')),DrawY=1114,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_10'),DrawX=-5291,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5336
         ObjPosY=1080
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_3"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_25
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=2242,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_22')),DrawY=2242,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_11'),DrawX=-5291,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5336
         ObjPosY=2208
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_25"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_24
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Dragonwave_M'
         InputLinks(0)=(DrawY=2242,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_25')),DrawY=2242,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_11'),DrawX=-5411,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5456
         ObjPosY=2208
         ObjComment="HORZINE SUPPLY WEAPON SKIN CRATE SERIES 13"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_24"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_18
         NewMaterial=MaterialInstanceConstant'ECON_MAT.Neon_MK4_Crate_M'
         InputLinks(0)=(DrawY=1906,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_15')),DrawY=1906,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_3'),DrawX=-5459,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5504
         ObjPosY=1872
         ObjComment="HORZINE SUPPLY WEAPON SKIN CRATE SERIES 12"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_18"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=50,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_0')),DrawY=50,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_8'),DrawX=-5315,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5360
         ObjPosY=16
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_16"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_15
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1906,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_20')),DrawY=1906,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_3'),DrawX=-5339,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5384
         ObjPosY=1872
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_15"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_14
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1322,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_23')),DrawY=1322,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_15'),DrawX=-5299,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5344
         ObjPosY=1288
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_14"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Tactical02_M'
         InputLinks(0)=(DrawY=1322,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_14')),DrawY=1322,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_15'),DrawX=-5419,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5464
         ObjPosY=1288
         ObjComment="HORZINE SUPPLY WEAPON SKIN CRATE SERIES 10"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_13"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_12
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Neon_MK5_M'
         InputLinks(0)=(DrawY=2482,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_11')),DrawY=2482,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_7'),DrawX=-5403,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5448
         ObjPosY=2448
         ObjComment="HORZINE SUPPLY WEAPON SKIN CRATE SERIES 14"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_12"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_11
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=2482,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_4')),DrawY=2482,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_7'),DrawX=-5283,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5328
         ObjPosY=2448
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_11"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=466,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_3')),DrawY=466,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_6'),DrawX=-5315,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5360
         ObjPosY=432
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_10"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
         NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1602,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_1')),DrawY=1602,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_0'),DrawX=-5291,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5336
         ObjPosY=1568
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_1"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Neon_MK3_M'
         InputLinks(0)=(DrawY=1602,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_1')),DrawY=1602,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_0'),DrawX=-5411,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5456
         ObjPosY=1568
         ObjComment="HORZINE SUPPLY WEAPON SKIN CRATE SERIES 11"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_0"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_4
         OutputLabel="WS14"
         InputLinks(0)=(DrawY=2482,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5024
         ObjPosY=2448
         DrawWidth=170
         DrawHeight=45
         Name="SeqAct_FinishSequence_4"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_3
         OutputLabel="WS7"
         InputLinks(0)=(DrawY=346,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5048
         ObjPosY=312
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_3"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_26
         OutputLabel="WS8"
         InputLinks(0)=(DrawY=1034,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5024
         ObjPosY=1000
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_26"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_23
         OutputLabel="WS10"
         InputLinks(0)=(DrawY=1202,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5032
         ObjPosY=1168
         DrawWidth=170
         DrawHeight=45
         Name="SeqAct_FinishSequence_23"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_22
         OutputLabel="WS13"
         InputLinks(0)=(DrawY=2242,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5032
         ObjPosY=2208
         DrawWidth=170
         DrawHeight=45
         Name="SeqAct_FinishSequence_22"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_21
         OutputLabel="WS9"
         InputLinks(0)=(DrawY=1114,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5032
         ObjPosY=1080
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_21"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_20
         OutputLabel="WS12"
         InputLinks(0)=(DrawY=1906,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5080
         ObjPosY=1872
         DrawWidth=170
         DrawHeight=45
         Name="SeqAct_FinishSequence_20"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_2
         OutputLabel="WS6"
         InputLinks(0)=(DrawY=258,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5048
         ObjPosY=224
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_2"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_19
         OutputLabel="WS4"
         InputLinks(0)=(DrawY=-414,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5048
         ObjPosY=-448
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_19"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_18
         OutputLabel="WS3"
         InputLinks(0)=(DrawY=-470,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5048
         ObjPosY=-504
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_18"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_17
         OutputLabel="WS2"
         InputLinks(0)=(DrawY=-526,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5048
         ObjPosY=-560
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_17"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_16
         OutputLabel="WS1"
         InputLinks(0)=(DrawY=-582,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5048
         ObjPosY=-616
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_16"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_1
         OutputLabel="WS11"
         InputLinks(0)=(DrawY=1602,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5032
         ObjPosY=1568
         DrawWidth=170
         DrawHeight=45
         Name="SeqAct_FinishSequence_1"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_0
         OutputLabel="WS5"
         InputLinks(0)=(DrawY=178,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
         ObjPosX=-5048
         ObjPosY=144
         DrawWidth=162
         DrawHeight=45
         Name="SeqAct_FinishSequence_0"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      SequenceObjects(0)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_38'
      SequenceObjects(1)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_72'
      SequenceObjects(2)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_39'
      SequenceObjects(3)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_72'
      SequenceObjects(4)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_113'
      SequenceObjects(5)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_73'
      SequenceObjects(6)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_46'
      SequenceObjects(7)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_77'
      SequenceObjects(8)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_45'
      SequenceObjects(9)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_59'
      SequenceObjects(10)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_60'
      SequenceObjects(11)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_76'
      SequenceObjects(12)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_5'
      SequenceObjects(13)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_2'
      SequenceObjects(14)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_16'
      SequenceObjects(15)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_8'
      SequenceObjects(16)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_13'
      SequenceObjects(17)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_14'
      SequenceObjects(18)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_18'
      SequenceObjects(19)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_39'
      SequenceObjects(20)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_16'
      SequenceObjects(21)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_17'
      SequenceObjects(22)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_18'
      SequenceObjects(23)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_19'
      SequenceObjects(24)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_0'
      SequenceObjects(25)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_2'
      SequenceObjects(26)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_4'
      SequenceObjects(27)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_7'
      SequenceObjects(28)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_3'
      SequenceObjects(29)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_8'
      SequenceObjects(30)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_9'
      SequenceObjects(31)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_5'
      SequenceObjects(32)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_10'
      SequenceObjects(33)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_6'
      SequenceObjects(34)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_3'
      SequenceObjects(35)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SequenceFrame_7'
      SequenceObjects(36)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_21'
      SequenceObjects(37)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_10'
      SequenceObjects(38)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_3'
      SequenceObjects(39)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_4'
      SequenceObjects(40)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_6'
      SequenceObjects(41)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_91'
      SequenceObjects(42)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_25'
      SequenceObjects(43)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_90'
      SequenceObjects(44)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_43'
      SequenceObjects(45)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_26'
      SequenceObjects(46)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_13'
      SequenceObjects(47)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_15'
      SequenceObjects(48)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_14'
      SequenceObjects(49)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_15'
      SequenceObjects(50)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_23'
      SequenceObjects(51)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_0'
      SequenceObjects(52)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_0'
      SequenceObjects(53)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_1'
      SequenceObjects(54)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_0'
      SequenceObjects(55)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_1'
      SequenceObjects(56)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_20'
      SequenceObjects(57)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_3'
      SequenceObjects(58)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_15'
      SequenceObjects(59)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_7'
      SequenceObjects(60)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_18'
      SequenceObjects(61)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_24'
      SequenceObjects(62)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_9'
      SequenceObjects(63)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_25'
      SequenceObjects(64)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_11'
      SequenceObjects(65)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_22'
      SequenceObjects(66)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_4'
      SequenceObjects(67)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqVar_Named_7'
      SequenceObjects(68)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_11'
      SequenceObjects(69)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqEvent_Console_6'
      SequenceObjects(70)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_SetMaterial_12'
      DefaultViewX=4667
      DefaultViewY=-1307
      DefaultViewZoom=0.700000
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS1",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_16',DrawY=-1159,OverrideDelta=18)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS2",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_17',DrawY=-1136,OverrideDelta=41)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS3",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_18',DrawY=-1113,OverrideDelta=64)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS4",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_19',DrawY=-1090,OverrideDelta=87)
      OutputLinks(4)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS5",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_0',DrawY=-1067,OverrideDelta=110)
      OutputLinks(5)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS6",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_2',DrawY=-1044,OverrideDelta=133)
      OutputLinks(6)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS7",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_3',DrawY=-1021,OverrideDelta=156)
      OutputLinks(7)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS9",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_21',DrawY=-998,OverrideDelta=179)
      OutputLinks(8)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS8",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_26',DrawY=-975,OverrideDelta=202)
      OutputLinks(9)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS10",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_23',DrawY=-952,OverrideDelta=225)
      OutputLinks(10)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS11",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_1',DrawY=-929,OverrideDelta=248)
      OutputLinks(11)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS12",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_20',DrawY=-906,OverrideDelta=271)
      OutputLinks(12)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS13",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_22',DrawY=-883,OverrideDelta=294)
      OutputLinks(13)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="WS14",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate.SeqAct_FinishSequence_4',DrawY=-860,OverrideDelta=317)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=1168
      ObjPosY=-1200
      ObjName="PSN_WeaponSkinCrate"
      DrawWidth=160
      DrawHeight=357
      Name="PSN_WeaponSkinCrate"
      ObjectArchetype=Sequence'Engine.Default__Sequence'
   End Object
   Begin Object Class=Sequence Name=HorzineSupplyCrate
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_44
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4248
         ObjPosY=3832
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_44"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_40
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4168
         ObjPosY=2928
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_40"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4200
         ObjPosY=3640
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_4"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_38
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4208
         ObjPosY=3440
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_38"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_37
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4184
         ObjPosY=2704
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_37"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_36
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4192
         ObjPosY=2512
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_36"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4128
         ObjPosY=2312
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_35"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4080
         ObjPosY=1936
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_34"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4224
         ObjPosY=4864
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_3"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_29
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4088
         ObjPosY=2104
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_29"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_28
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4104
         ObjPosY=1736
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_28"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_27
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4112
         ObjPosY=1536
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_27"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_26
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4104
         ObjPosY=1376
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_26"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_25
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4080
         ObjPosY=1240
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_25"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_24
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4072
         ObjPosY=864
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_24"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_20
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4120
         ObjPosY=1064
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_20"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4216
         ObjPosY=4560
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_13"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4240
         ObjPosY=4272
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_10"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4248
         ObjPosY=4056
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_1"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
         ExpectedType=Class'Engine.SeqVar_Object'
         FindVarName="Crate_Skel"
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4192
         ObjPosY=3200
         ObjColor=(B=255,G=0,R=255,A=255)
         DrawWidth=32
         DrawHeight=32
         Name="SeqVar_Named_0"
         ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
      End Object
      Begin Object Class=SequenceFrame Name=SequenceFrame_0
         SizeX=1213
         SizeY=296
         BorderWidth=3
         bDrawBox=True
         BorderColor=(B=106,G=255,R=0,A=255)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4688
         ObjPosY=4696
         ObjComment="NEW"
         DrawWidth=1213
         DrawHeight=296
         Name="SequenceFrame_0"
         ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_93
         ConsoleEventName="open_horzine13"
         EventDesc="insectoid cosmetic crate"
         MaxWidth=222
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_58')),DrawY=3130,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4481,OverrideDelta=79)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4592
         ObjPosY=3064
         DrawWidth=131
         DrawHeight=128
         Name="SeqEvent_Console_93"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_84
         ConsoleEventName="open_horzine11"
         EventDesc="Reaper Crate"
         MaxWidth=222
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_52')),DrawY=2658,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4489,OverrideDelta=79)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4600
         ObjPosY=2592
         DrawWidth=131
         DrawHeight=128
         Name="SeqEvent_Console_84"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_65
         ConsoleEventName="open_horzine10"
         EventDesc="Steampunk Rebel Crate"
         MaxWidth=222
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_42')),DrawY=2474,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4489,OverrideDelta=79)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4600
         ObjPosY=2408
         DrawWidth=131
         DrawHeight=128
         Name="SeqEvent_Console_65"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_64
         ConsoleEventName="open_horzine9"
         EventDesc="Psycho Crate"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_41')),DrawY=2258,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4437,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4544
         ObjPosY=2192
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_64"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_62
         ConsoleEventName="open_horzine12"
         EventDesc="deepstrike cosmetic crate"
         MaxWidth=222
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_53')),DrawY=2866,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4473,OverrideDelta=79)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4584
         ObjPosY=2800
         DrawWidth=131
         DrawHeight=128
         Name="SeqEvent_Console_62"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_55
         ConsoleEventName="open_horzine7"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_28')),DrawY=1890,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4445,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4552
         ObjPosY=1824
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_55"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_50
         ConsoleEventName="open_horzine8"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_25')),DrawY=2090,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4437,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4544
         ObjPosY=2024
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_50"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_49
         ConsoleEventName="open_horzine6"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_22')),DrawY=1714,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4437,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4544
         ObjPosY=1648
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_49"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_42
         ConsoleEventName="open_horzine5"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_16')),DrawY=1522,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4453,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4560
         ObjPosY=1456
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_42"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_41
         ConsoleEventName="open_horzine4"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_13')),DrawY=1362,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4469,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4576
         ObjPosY=1296
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_41"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
         ConsoleEventName="open_horzine2"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_3')),DrawY=1018,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4461,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4568
         ObjPosY=952
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_4"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_32
         ConsoleEventName="open_horzine1"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_4')),DrawY=834,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4445,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4552
         ObjPosY=768
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_32"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
         ConsoleEventName="open_HorzineCyberSamurai"
         EventDesc="Cyber Crate"
         MaxWidth=297
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_10')),DrawY=4530,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4476,OverrideDelta=116)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4624
         ObjPosY=4464
         DrawWidth=168
         DrawHeight=128
         Name="SeqEvent_Console_3"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_26
         ConsoleEventName="open_horzine16"
         EventDesc="slaughterhouse crate"
         MaxWidth=222
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_93')),DrawY=3818,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4497,OverrideDelta=79)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4608
         ObjPosY=3752
         DrawWidth=131
         DrawHeight=128
         Name="SeqEvent_Console_26"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
         ConsoleEventName="open_horzine3"
         MaxWidth=214
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_8')),DrawY=1218,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4469,OverrideDelta=75)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4576
         ObjPosY=1152
         DrawWidth=127
         DrawHeight=128
         Name="SeqEvent_Console_2"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_110
         ConsoleEventName="open_horzine15"
         EventDesc="Dragon crate"
         MaxWidth=222
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_68')),DrawY=3610,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4473,OverrideDelta=79)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4584
         ObjPosY=3544
         DrawWidth=131
         DrawHeight=128
         Name="SeqEvent_Console_110"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_109
         ConsoleEventName="open_HorzineDeity"
         EventDesc="Deity Crate"
         MaxWidth=241
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_75')),DrawY=4834,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4512,OverrideDelta=88)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4632
         ObjPosY=4768
         DrawWidth=140
         DrawHeight=128
         Name="SeqEvent_Console_109"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_105
         ConsoleEventName="open_horzine14"
         EventDesc="firefighter crate"
         MaxWidth=222
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_67')),DrawY=3394,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4489,OverrideDelta=79)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4600
         ObjPosY=3328
         DrawWidth=131
         DrawHeight=128
         Name="SeqEvent_Console_105"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
         ConsoleEventName="open_HorzineLoco"
         EventDesc="Loco Crate"
         MaxWidth=238
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_9')),DrawY=4234,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4481,OverrideDelta=87)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4600
         ObjPosY=4168
         DrawWidth=139
         DrawHeight=128
         Name="SeqEvent_Console_1"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
         ConsoleEventName="open_horzineDAR"
         EventDesc="DAR crate"
         MaxWidth=232
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_0')),DrawY=4018,OverrideDelta=11)
         VariableLinks(0)=(DrawX=-4492,OverrideDelta=84)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4608
         ObjPosY=3952
         DrawWidth=136
         DrawHeight=128
         Name="SeqEvent_Console_0"
         ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_93
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Slaughterhouse_M'
         InputLinks(0)=(DrawY=3770,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_92')),DrawY=3770,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_44'),DrawX=-4275,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4320
         ObjPosY=3736
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_93"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_92
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Slaughterhouse_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=3770,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_27')),DrawY=3770,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_44'),DrawX=-4139,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4184
         ObjPosY=3736
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_92"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Loco_M'
         InputLinks(0)=(DrawY=4210,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_6')),DrawY=4210,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_10'),DrawX=-4267,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4312
         ObjPosY=4176
         ObjComment="Crate"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_9"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Crate_M'
         InputLinks(0)=(DrawY=1202,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_7')),DrawY=1202,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_25'),DrawX=-4139,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4184
         ObjPosY=1168
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_8"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_75
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Deity_M'
         InputLinks(0)=(DrawY=4802,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_74')),DrawY=4802,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_3'),DrawX=-4251,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4296
         ObjPosY=4768
         ObjComment="Crate"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_75"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_74
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Deity_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=4802,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_15')),DrawY=4802,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_3'),DrawX=-4115,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4160
         ObjPosY=4768
         ObjComment="Key"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_74"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_7
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Key_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1202,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_2')),DrawY=1202,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_25'),DrawX=-4003,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4048
         ObjPosY=1168
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_7"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_69
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Dragon_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=3562,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_14')),DrawY=3562,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_4'),DrawX=-4115,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4160
         ObjPosY=3528
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_69"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_68
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Dragon_M'
         InputLinks(0)=(DrawY=3562,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_69')),DrawY=3562,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_4'),DrawX=-4251,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4296
         ObjPosY=3528
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_68"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_67
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Firefighter_M'
         InputLinks(0)=(DrawY=3346,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_66')),DrawY=3346,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_38'),DrawX=-4267,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4312
         ObjPosY=3312
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_67"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_66
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Firefighter_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=3346,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_13')),DrawY=3346,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_38'),DrawX=-4131,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4176
         ObjPosY=3312
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_66"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_6
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Loco_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=4210,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_21')),DrawY=4210,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_10'),DrawX=-4131,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4176
         ObjPosY=4176
         ObjComment="Key"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_6"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_58
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Insectoid_M'
         InputLinks(0)=(DrawY=3130,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_57')),DrawY=3130,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_0'),DrawX=-4251,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4296
         ObjPosY=3096
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_58"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_57
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Insectoid_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=3130,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_12')),DrawY=3130,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_0'),DrawX=-4115,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4160
         ObjPosY=3096
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_57"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_54
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Deepstrike_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=2858,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_11')),DrawY=2858,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_40'),DrawX=-4083,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4128
         ObjPosY=2824
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_54"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_53
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Deepstrike_M'
         InputLinks(0)=(DrawY=2858,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_54')),DrawY=2858,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_40'),DrawX=-4219,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4264
         ObjPosY=2824
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_53"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_52
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Reaper_M'
         InputLinks(0)=(DrawY=2650,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_51')),DrawY=2650,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_37'),DrawX=-4235,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4280
         ObjPosY=2616
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_52"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_51
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Reaper_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=2650,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_10')),DrawY=2650,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_37'),DrawX=-4099,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4144
         ObjPosY=2616
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_51"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply1_Key_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=810,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_0')),DrawY=810,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_24'),DrawX=-3995,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4040
         ObjPosY=776
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_5"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_43
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_SteamRebel_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=2466,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_9')),DrawY=2466,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_36'),DrawX=-4099,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4144
         ObjPosY=2432
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_43"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_42
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_SteamRebel_M'
         InputLinks(0)=(DrawY=2466,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_43')),DrawY=2466,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_36'),DrawX=-4235,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4280
         ObjPosY=2432
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_42"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_41
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Psycho_M'
         InputLinks(0)=(DrawY=2250,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_40')),DrawY=2250,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_35'),DrawX=-4179,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4224
         ObjPosY=2216
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_41"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_40
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Psycho_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=2250,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_8')),DrawY=2250,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_35'),DrawX=-4043,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4088
         ObjPosY=2216
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_40"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply1_Crate_M'
         InputLinks(0)=(DrawY=850,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_5')),DrawY=850,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_24'),DrawX=-4155,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4200
         ObjPosY=816
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_4"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Crate_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1018,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_2')),DrawY=1018,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_20'),DrawX=-4171,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4216
         ObjPosY=984
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_3"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_29
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Science_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1874,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_6')),DrawY=1874,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_34'),DrawX=-3995,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4040
         ObjPosY=1840
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_29"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_28
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Science_M'
         InputLinks(0)=(DrawY=1874,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_29')),DrawY=1874,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_34'),DrawX=-4139,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4184
         ObjPosY=1840
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_28"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_25
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Star_M'
         InputLinks(0)=(DrawY=2066,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_24')),DrawY=2066,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_29'),DrawX=-4163,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4208
         ObjPosY=2032
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_25"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_24
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Star_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=2066,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_7')),DrawY=2066,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_29'),DrawX=-3987,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4032
         ObjPosY=2032
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_24"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_23
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Key_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1698,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_5')),DrawY=1698,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_28'),DrawX=-3979,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4024
         ObjPosY=1664
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_23"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_22
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Crate_M'
         InputLinks(0)=(DrawY=1690,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_23')),DrawY=1690,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_28'),DrawX=-4155,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4200
         ObjPosY=1656
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_22"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Key_M'
         InputLinks(0)=(DrawY=1026,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_1')),DrawY=1026,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_20'),DrawX=-4011,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4056
         ObjPosY=992
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_2"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_17
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_CyberSamurai_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=4498,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_17')),DrawY=4498,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_13'),DrawX=-4107,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4152
         ObjPosY=4464
         ObjComment="Key"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_17"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Crate_M'
         InputLinks(0)=(DrawY=1498,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_15')),DrawY=1498,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_27'),DrawX=-4163,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4208
         ObjPosY=1464
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_16"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_15
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Key_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1506,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_22')),DrawY=1506,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_27'),DrawX=-4003,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4048
         ObjPosY=1472
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_15"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_14
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Key_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=1346,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_3')),DrawY=1346,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_26'),DrawX=-3987,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4032
         ObjPosY=1312
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_14"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Crate_M'
         InputLinks(0)=(DrawY=1338,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_14')),DrawY=1338,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_26'),DrawX=-4155,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4200
         ObjPosY=1304
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_13"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_CyberSamurai_M'
         InputLinks(0)=(DrawY=4498,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_17')),DrawY=4498,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_13'),DrawX=-4243,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4288
         ObjPosY=4464
         ObjComment="Crate"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_10"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_DAR_M'
         MaterialIndex=1
         InputLinks(0)=(DrawY=3994,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_16')),DrawY=3994,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_1'),DrawX=-4139,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4184
         ObjPosY=3960
         ObjComment="DAR Key"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_1"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
         NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_DAR_M'
         InputLinks(0)=(DrawY=3994,OverrideDelta=11)
         OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_1')),DrawY=3994,OverrideDelta=11)
         VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_1'),DrawX=-4275,OverrideDelta=23)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-4320
         ObjPosY=3960
         ObjComment="DAR Crate"
         DrawWidth=90
         DrawHeight=61
         Name="SeqAct_SetMaterial_0"
         ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_9
         OutputLabel="Horzine10"
         InputLinks(0)=(DrawY=2450,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3824
         ObjPosY=2416
         DrawWidth=196
         DrawHeight=45
         Name="SeqAct_FinishSequence_9"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_8
         OutputLabel="Horzine9"
         InputLinks(0)=(DrawY=2234,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3824
         ObjPosY=2200
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_8"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_7
         OutputLabel="Horzine8"
         InputLinks(0)=(DrawY=2050,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3832
         ObjPosY=2016
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_7"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_6
         OutputLabel="Horzine7"
         InputLinks(0)=(DrawY=1850,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3832
         ObjPosY=1816
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_6"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_5
         OutputLabel="Horzine6"
         InputLinks(0)=(DrawY=1674,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3824
         ObjPosY=1640
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_5"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_3
         OutputLabel="Horzine4"
         InputLinks(0)=(DrawY=1338,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3840
         ObjPosY=1304
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_3"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_27
         OutputLabel="Horzine16"
         InputLinks(0)=(DrawY=3754,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3872
         ObjPosY=3720
         DrawWidth=196
         DrawHeight=45
         Name="SeqAct_FinishSequence_27"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_22
         OutputLabel="Horzine5"
         InputLinks(0)=(DrawY=1482,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3832
         ObjPosY=1448
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_22"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_21
         OutputLabel="HorzineLoco"
         InputLinks(0)=(DrawY=4194,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3880
         ObjPosY=4160
         DrawWidth=211
         DrawHeight=45
         Name="SeqAct_FinishSequence_21"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_2
         OutputLabel="Horzine3"
         InputLinks(0)=(DrawY=1202,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3840
         ObjPosY=1168
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_2"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_17
         OutputLabel="HorzineCyberSamurai"
         InputLinks(0)=(DrawY=4482,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3856
         ObjPosY=4448
         DrawWidth=270
         DrawHeight=45
         Name="SeqAct_FinishSequence_17"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_16
         OutputLabel="HorzineDAR"
         InputLinks(0)=(DrawY=4010,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3872
         ObjPosY=3976
         DrawWidth=206
         DrawHeight=45
         Name="SeqAct_FinishSequence_16"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_15
         OutputLabel="HorzineDeity"
         InputLinks(0)=(DrawY=4786,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3864
         ObjPosY=4752
         DrawWidth=214
         DrawHeight=45
         Name="SeqAct_FinishSequence_15"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_14
         OutputLabel="Horzine15"
         InputLinks(0)=(DrawY=3562,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3856
         ObjPosY=3528
         DrawWidth=196
         DrawHeight=45
         Name="SeqAct_FinishSequence_14"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_13
         OutputLabel="Horzine14"
         InputLinks(0)=(DrawY=3338,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3864
         ObjPosY=3304
         DrawWidth=196
         DrawHeight=45
         Name="SeqAct_FinishSequence_13"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_12
         OutputLabel="Horzine13"
         InputLinks(0)=(DrawY=3114,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3840
         ObjPosY=3080
         DrawWidth=196
         DrawHeight=45
         Name="SeqAct_FinishSequence_12"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_11
         OutputLabel="Horzine12"
         InputLinks(0)=(DrawY=2842,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3840
         ObjPosY=2808
         DrawWidth=196
         DrawHeight=45
         Name="SeqAct_FinishSequence_11"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_10
         OutputLabel="Horzine11"
         InputLinks(0)=(DrawY=2626,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3832
         ObjPosY=2592
         DrawWidth=196
         DrawHeight=45
         Name="SeqAct_FinishSequence_10"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_1
         OutputLabel="Horzine2"
         InputLinks(0)=(DrawY=1010,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3840
         ObjPosY=976
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_1"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_0
         OutputLabel="Horzine1"
         InputLinks(0)=(DrawY=794,OverrideDelta=11)
         ObjInstanceVersion=1
         ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
         ObjPosX=-3848
         ObjPosY=760
         DrawWidth=188
         DrawHeight=45
         Name="SeqAct_FinishSequence_0"
         ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
      End Object
      SequenceObjects(0)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_4'
      SequenceObjects(1)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_32'
      SequenceObjects(2)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_4'
      SequenceObjects(3)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_3'
      SequenceObjects(4)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_5'
      SequenceObjects(5)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_2'
      SequenceObjects(6)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_7'
      SequenceObjects(7)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_2'
      SequenceObjects(8)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_8'
      SequenceObjects(9)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_13'
      SequenceObjects(10)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_41'
      SequenceObjects(11)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_14'
      SequenceObjects(12)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_15'
      SequenceObjects(13)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_42'
      SequenceObjects(14)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_16'
      SequenceObjects(15)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_22'
      SequenceObjects(16)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_49'
      SequenceObjects(17)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_23'
      SequenceObjects(18)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_24'
      SequenceObjects(19)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_50'
      SequenceObjects(20)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_25'
      SequenceObjects(21)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_28'
      SequenceObjects(22)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_55'
      SequenceObjects(23)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_29'
      SequenceObjects(24)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_40'
      SequenceObjects(25)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_64'
      SequenceObjects(26)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_41'
      SequenceObjects(27)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_42'
      SequenceObjects(28)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_65'
      SequenceObjects(29)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_43'
      SequenceObjects(30)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_51'
      SequenceObjects(31)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_84'
      SequenceObjects(32)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_52'
      SequenceObjects(33)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_53'
      SequenceObjects(34)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_62'
      SequenceObjects(35)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_54'
      SequenceObjects(36)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_93'
      SequenceObjects(37)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_57'
      SequenceObjects(38)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_58'
      SequenceObjects(39)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_105'
      SequenceObjects(40)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_66'
      SequenceObjects(41)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_67'
      SequenceObjects(42)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_26'
      SequenceObjects(43)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_92'
      SequenceObjects(44)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_93'
      SequenceObjects(45)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_68'
      SequenceObjects(46)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_69'
      SequenceObjects(47)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_110'
      SequenceObjects(48)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_4'
      SequenceObjects(49)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_44'
      SequenceObjects(50)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_20'
      SequenceObjects(51)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_24'
      SequenceObjects(52)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_25'
      SequenceObjects(53)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_26'
      SequenceObjects(54)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_27'
      SequenceObjects(55)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_28'
      SequenceObjects(56)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_29'
      SequenceObjects(57)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_34'
      SequenceObjects(58)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_35'
      SequenceObjects(59)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_36'
      SequenceObjects(60)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_37'
      SequenceObjects(61)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_38'
      SequenceObjects(62)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_40'
      SequenceObjects(63)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_0'
      SequenceObjects(64)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_0'
      SequenceObjects(65)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_1'
      SequenceObjects(66)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_2'
      SequenceObjects(67)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_3'
      SequenceObjects(68)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_22'
      SequenceObjects(69)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_5'
      SequenceObjects(70)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_6'
      SequenceObjects(71)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_7'
      SequenceObjects(72)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_8'
      SequenceObjects(73)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_9'
      SequenceObjects(74)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_10'
      SequenceObjects(75)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_11'
      SequenceObjects(76)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_12'
      SequenceObjects(77)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_13'
      SequenceObjects(78)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_14'
      SequenceObjects(79)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_27'
      SequenceObjects(80)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_16'
      SequenceObjects(81)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_1'
      SequenceObjects(82)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_0'
      SequenceObjects(83)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_1'
      SequenceObjects(84)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_0'
      SequenceObjects(85)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SequenceFrame_0'
      SequenceObjects(86)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_1'
      SequenceObjects(87)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_6'
      SequenceObjects(88)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_9'
      SequenceObjects(89)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_10'
      SequenceObjects(90)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_21'
      SequenceObjects(91)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_17'
      SequenceObjects(92)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_13'
      SequenceObjects(93)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_10'
      SequenceObjects(94)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_17'
      SequenceObjects(95)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_3'
      SequenceObjects(96)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqEvent_Console_109'
      SequenceObjects(97)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_74'
      SequenceObjects(98)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_SetMaterial_75'
      SequenceObjects(99)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqVar_Named_3'
      SequenceObjects(100)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_15'
      DefaultViewX=4276
      DefaultViewY=-3033
      DefaultViewZoom=0.900000
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine1",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_0',DrawY=2668,OverrideDelta=21)
      OutputLinks(1)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine2",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_1',DrawY=2691,OverrideDelta=44)
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine3",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_2',DrawY=2714,OverrideDelta=67)
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine4",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_3',DrawY=2737,OverrideDelta=90)
      OutputLinks(4)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine5",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_22',DrawY=2760,OverrideDelta=113)
      OutputLinks(5)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine6",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_5',DrawY=2783,OverrideDelta=136)
      OutputLinks(6)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine7",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_6',DrawY=2806,OverrideDelta=159)
      OutputLinks(7)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine8",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_7',DrawY=2829,OverrideDelta=182)
      OutputLinks(8)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine9",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_8',DrawY=2852,OverrideDelta=205)
      OutputLinks(9)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine10",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_9',DrawY=2875,OverrideDelta=228)
      OutputLinks(10)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine11",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_10',DrawY=2898,OverrideDelta=251)
      OutputLinks(11)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine12",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_11',DrawY=2921,OverrideDelta=274)
      OutputLinks(12)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine13",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_12',DrawY=2944,OverrideDelta=297)
      OutputLinks(13)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine14",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_13',DrawY=2967,OverrideDelta=320)
      OutputLinks(14)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine15",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_14',DrawY=2990,OverrideDelta=343)
      OutputLinks(15)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="Horzine16",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_27',DrawY=3013,OverrideDelta=366)
      OutputLinks(16)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="HorzineDAR",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_16',DrawY=3036,OverrideDelta=389)
      OutputLinks(17)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="HorzineLoco",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_21',DrawY=3059,OverrideDelta=412)
      OutputLinks(18)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="HorzineCyberSamurai",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_17',DrawY=3082,OverrideDelta=435)
      OutputLinks(19)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43')),LinkDesc="HorzineDeity",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate.SeqAct_FinishSequence_15',DrawY=3105,OverrideDelta=458)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates'
      ObjPosX=1744
      ObjPosY=2624
      ObjName="HorzineSupplyCrate"
      DrawWidth=152
      DrawHeight=501
      Name="HorzineSupplyCrate"
      ObjectArchetype=Sequence'Engine.Default__Sequence'
   End Object
   SequenceObjects(0)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_0'
   SequenceObjects(1)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_6'
   SequenceObjects(2)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_10'
   SequenceObjects(3)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_16'
   SequenceObjects(4)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_40'
   SequenceObjects(5)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_4'
   SequenceObjects(6)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_1'
   SequenceObjects(7)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SequenceFrame_4'
   SequenceObjects(8)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_33'
   SequenceObjects(9)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_32'
   SequenceObjects(10)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_115'
   SequenceObjects(11)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SequenceFrame_1'
   SequenceObjects(12)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_84'
   SequenceObjects(13)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_22'
   SequenceObjects(14)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_85'
   SequenceObjects(15)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_114'
   SequenceObjects(16)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_77'
   SequenceObjects(17)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_76'
   SequenceObjects(18)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_0'
   SequenceObjects(19)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_0'
   SequenceObjects(20)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_2'
   SequenceObjects(21)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_3'
   SequenceObjects(22)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_1'
   SequenceObjects(23)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_4'
   SequenceObjects(24)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_37'
   SequenceObjects(25)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_71'
   SequenceObjects(26)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_36'
   SequenceObjects(27)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_71'
   SequenceObjects(28)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_112'
   SequenceObjects(29)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_70'
   SequenceObjects(30)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43'
   SequenceObjects(31)=SeqVar_External'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_External_1'
   SequenceObjects(32)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_44'
   SequenceObjects(33)=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.HorzineSupplyCrate'
   SequenceObjects(34)=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.PSN_WeaponSkinCrate'
   SequenceObjects(35)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SequenceFrame_2'
   SequenceObjects(36)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SequenceFrame_3'
   SequenceObjects(37)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_87'
   SequenceObjects(38)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_23'
   SequenceObjects(39)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_86'
   SequenceObjects(40)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_41'
   SequenceObjects(41)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_1'
   SequenceObjects(42)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_2'
   SequenceObjects(43)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_5'
   SequenceObjects(44)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_11'
   SequenceObjects(45)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_8'
   SequenceObjects(46)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_10'
   SequenceObjects(47)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_3'
   SequenceObjects(48)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_16'
   SequenceObjects(49)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SequenceFrame_5'
   SequenceObjects(50)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_22'
   SequenceObjects(51)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_8'
   SequenceObjects(52)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_23'
   SequenceObjects(53)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_9'
   SequenceObjects(54)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqVar_Named_5'
   SequenceObjects(55)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_34'
   SequenceObjects(56)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqEvent_Console_70'
   SequenceObjects(57)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_SetMaterial_35'
   DefaultViewX=583
   DefaultViewY=-1455
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),LinkDesc="Output",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_43',DrawY=-2828,OverrideDelta=13)
   OutputLinks(1)=(LinkDesc="Dead Pulse",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.crates.SeqAct_FinishSequence_44',DrawY=-2808,OverrideDelta=33)
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Bool",LinkVar="SeqVar_External_1",MinVars=0,DrawX=-2934,OverrideDelta=29)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2976
   ObjPosY=-2864
   ObjName="CRATES"
   DrawWidth=86
   DrawHeight=85
   Name="crates"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="Abort_Idle_Cam"
   MaxWidth=221
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2022,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=-576
   ObjComment="Abort_Idle_Cam"
   DrawWidth=130
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="Abort_Idle_Cam"
   InputLinks(0)=(DrawY=-2822,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2667,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2808
   ObjPosY=-2856
   ObjComment="Abort_Idle_Cam"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_79
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Crate_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2224
   ObjPosY=-2728
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_79"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_82
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Crate_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1880
   ObjPosY=-2760
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_82"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_83
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Crate_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-2768
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_83"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_84
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Crate_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2312
   ObjPosY=-2728
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_84"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_85
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Crate_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1960
   ObjPosY=-2736
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_85"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_86
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Crate_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1992
   ObjPosY=-2512
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_86"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_87
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Crate_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=-2704
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_87"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_89
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="timeoutdelay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2104
   ObjPosY=-1744
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_89"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=820
   SizeY=529
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-4144
   ObjComment="Crate Variables"
   DrawWidth=820
   DrawHeight=529
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_92
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1504
   ObjPosY=-2744
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_92"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_94
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-752
   ObjPosY=-2376
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_94"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_95
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=-1752
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_95"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_96
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1524
   ObjPosY=-1410
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_96"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_97
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-972
   ObjPosY=-1682
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_97"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_98
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1200
   ObjPosY=-60
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_98"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_99
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=-76
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_99"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_101
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=1048
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_101"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_102
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1696
   ObjPosY=744
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_102"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_104
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2104
   ObjPosY=-1384
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_104"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_105
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=-1120
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_105"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_106
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-412
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_106"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_109
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1912
   ObjPosY=672
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_109"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_110
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1732
   ObjPosY=-1394
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_110"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_111
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=-1760
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_111"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_113
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1736
   ObjPosY=-2808
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_113"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_114
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2384
   ObjPosY=-1288
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_114"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_115
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1148
   ObjPosY=-1330
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_115"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_116
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2008
   ObjPosY=-1288
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_116"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=Sequence Name=usb
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1864
      ObjPosY=152
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_9"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1832
      ObjPosY=-96
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_8"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_45
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1904
      ObjPosY=-904
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_45"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1920
      ObjPosY=-624
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_4"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1816
      ObjPosY=904
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_2"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_15
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1824
      ObjPosY=664
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_15"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1848
      ObjPosY=-280
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_14"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_137
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1752
      ObjPosY=-1200
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_137"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_136
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1760
      ObjPosY=-1392
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_136"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_135
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1768
      ObjPosY=-1600
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_135"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_134
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1752
      ObjPosY=-2088
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_134"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_133
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1784
      ObjPosY=-1832
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_133"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_132
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1752
      ObjPosY=-2320
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_132"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_131
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1808
      ObjPosY=-2584
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_131"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_130
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1808
      ObjPosY=-2808
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_130"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_129
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1848
      ObjPosY=-3048
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_129"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_128
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1872
      ObjPosY=-3248
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_128"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_127
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1824
      ObjPosY=-3464
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_127"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_126
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1792
      ObjPosY=-3656
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_126"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_125
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1880
      ObjPosY=-3896
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_125"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_124
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1880
      ObjPosY=-4104
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_124"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_123
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1888
      ObjPosY=-4304
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_123"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_122
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1920
      ObjPosY=-4504
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_122"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_121
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1936
      ObjPosY=-4696
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_121"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_120
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1928
      ObjPosY=-4872
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_120"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_12
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1824
      ObjPosY=408
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_12"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_119
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1944
      ObjPosY=-5048
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_119"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_118
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1968
      ObjPosY=-5256
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_118"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_117
      ExpectedType=Class'Engine.SeqVar_Object'
      FindVarName="Trader_Skel"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1984
      ObjPosY=-5504
      ObjColor=(B=255,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_117"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_External Name=SeqVar_External_2
      ExpectedType=Class'Engine.SeqVar_Bool'
      VariableLabel="Bool"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=4936
      ObjPosY=-3536
      ObjColor=(B=0,G=0,R=255,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_External_2"
      ObjectArchetype=SeqVar_External'Engine.Default__SeqVar_External'
   End Object
   Begin Object Class=SequenceFrame Name=SequenceFrame_8
      SizeX=662
      SizeY=713
      BorderWidth=3
      bDrawBox=True
      BorderColor=(B=106,G=255,R=0,A=255)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1448
      ObjPosY=488
      ObjComment="NEW"
      DrawWidth=662
      DrawHeight=713
      Name="SequenceFrame_8"
      ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_90
      ConsoleEventName="open_maceshield"
      MaxWidth=231
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_62')),DrawY=-3718,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1667,OverrideDelta=83)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1552
      ObjPosY=-3784
      DrawWidth=135
      DrawHeight=128
      Name="SeqEvent_Console_90"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_89
      ConsoleEventName="open_highvoltage"
      EventDesc="high voltage usb"
      MaxWidth=235
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_50')),DrawY=-1470,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1621,OverrideDelta=85)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1504
      ObjPosY=-1536
      DrawWidth=137
      DrawHeight=128
      Name="SeqEvent_Console_89"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_88
      ConsoleEventName="open_Deepstrike"
      EventDesc="deepstrike usb"
      MaxWidth=228
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_55')),DrawY=-3110,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1626,OverrideDelta=82)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1512
      ObjPosY=-3176
      DrawWidth=134
      DrawHeight=128
      Name="SeqEvent_Console_88"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_83
      ConsoleEventName="open_junkyard"
      EventDesc="junkyard usb"
      MaxWidth=215
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_61')),DrawY=-3510,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1691,OverrideDelta=75)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1584
      ObjPosY=-3576
      DrawWidth=127
      DrawHeight=128
      Name="SeqEvent_Console_83"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_78
      ConsoleEventName="open_neon"
      MaxWidth=191
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_47')),DrawY=-5574,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1791,OverrideDelta=63)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1696
      ObjPosY=-5640
      DrawWidth=115
      DrawHeight=128
      Name="SeqEvent_Console_78"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_75
      ConsoleEventName="open_victorian"
      MaxWidth=216
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_44')),DrawY=-1678,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1588,OverrideDelta=76)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1480
      ObjPosY=-1744
      DrawWidth=128
      DrawHeight=128
      Name="SeqEvent_Console_75"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_7
      ConsoleEventName="open_WeaponCollector_S1"
      MaxWidth=295
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_13')),DrawY=-694,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1659,OverrideDelta=115)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1512
      ObjPosY=-760
      DrawWidth=167
      DrawHeight=128
      Name="SeqEvent_Console_7"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_60
      ConsoleEventName="open_vietnam"
      EventDesc="vietnam  usb"
      MaxWidth=211
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_56')),DrawY=-3294,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1657,OverrideDelta=73)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1552
      ObjPosY=-3360
      DrawWidth=125
      DrawHeight=128
      Name="SeqEvent_Console_60"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_59
      ConsoleEventName="open_elitemedic"
      MaxWidth=225
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_31')),DrawY=-1918,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1600,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1488
      ObjPosY=-1984
      DrawWidth=132
      DrawHeight=128
      Name="SeqEvent_Console_59"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_56
      ConsoleEventName="open_swat"
      MaxWidth=191
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_30')),DrawY=-2390,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1567,OverrideDelta=63)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1472
      ObjPosY=-2456
      DrawWidth=115
      DrawHeight=128
      Name="SeqEvent_Console_56"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_53
      ConsoleEventName="open_exhibit"
      MaxWidth=202
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_27')),DrawY=-2182,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1597,OverrideDelta=69)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1496
      ObjPosY=-2248
      DrawWidth=121
      DrawHeight=128
      Name="SeqEvent_Console_53"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_51
      ConsoleEventName="open_emergencyissue"
      MaxWidth=264
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_26')),DrawY=-2646,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1652,OverrideDelta=100)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1520
      ObjPosY=-2712
      DrawWidth=152
      DrawHeight=128
      Name="SeqEvent_Console_51"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_48
      ConsoleEventName="open_tacticalhorzine"
      MaxWidth=256
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_0')),DrawY=-2870,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1640,OverrideDelta=96)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1512
      ObjPosY=-2936
      DrawWidth=148
      DrawHeight=128
      Name="SeqEvent_Console_48"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_46
      ConsoleEventName="open_predator"
      MaxWidth=215
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_20')),DrawY=-3934,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1635,OverrideDelta=75)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1528
      ObjPosY=-4000
      DrawWidth=127
      DrawHeight=128
      Name="SeqEvent_Console_46"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_45
      ConsoleEventName="open_firstencounter"
      MaxWidth=252
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_19')),DrawY=-4150,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1646,OverrideDelta=94)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1520
      ObjPosY=-4216
      DrawWidth=146
      DrawHeight=128
      Name="SeqEvent_Console_45"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_44
      ConsoleEventName="open_streetpunks"
      MaxWidth=237
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_18')),DrawY=-4350,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1646,OverrideDelta=86)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1528
      ObjPosY=-4416
      DrawWidth=138
      DrawHeight=128
      Name="SeqEvent_Console_44"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
      ConsoleEventName="open_NeonMKIII"
      MaxWidth=226
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_21')),DrawY=98,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1649,OverrideDelta=81)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1536
      ObjPosY=32
      DrawWidth=133
      DrawHeight=128
      Name="SeqEvent_Console_4"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_36
      ConsoleEventName="open_cyberbone"
      MaxWidth=228
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_17')),DrawY=-4558,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1738,OverrideDelta=82)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1624
      ObjPosY=-4624
      DrawWidth=134
      DrawHeight=128
      Name="SeqEvent_Console_36"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_31
      ConsoleEventName="open_horzineissue"
      MaxWidth=239
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_4')),DrawY=-5334,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1799,OverrideDelta=87)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1680
      ObjPosY=-5400
      DrawWidth=139
      DrawHeight=128
      Name="SeqEvent_Console_31"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_30
      ConsoleEventName="open_dragonfire"
      MaxWidth=225
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_10')),DrawY=-5126,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1800,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1688
      ObjPosY=-5192
      DrawWidth=132
      DrawHeight=128
      Name="SeqEvent_Console_30"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_29
      ConsoleEventName="open_zedkiller"
      MaxWidth=211
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_9')),DrawY=-4942,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1777,OverrideDelta=73)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1672
      ObjPosY=-5008
      DrawWidth=125
      DrawHeight=128
      Name="SeqEvent_Console_29"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_28
      ConsoleEventName="open_sow"
      MaxWidth=185
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_8')),DrawY=-4766,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1732,OverrideDelta=60)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1640
      ObjPosY=-4832
      DrawWidth=112
      DrawHeight=128
      Name="SeqEvent_Console_28"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_27
      ConsoleEventName="open_flare"
      MaxWidth=188
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_94')),DrawY=-974,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1742,OverrideDelta=62)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1648
      ObjPosY=-1040
      DrawWidth=114
      DrawHeight=128
      Name="SeqEvent_Console_27"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_11
      ConsoleEventName="open_NeonMKV"
      MaxWidth=220
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_29')),DrawY=610,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1606,OverrideDelta=78)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1496
      ObjPosY=544
      DrawWidth=130
      DrawHeight=128
      Name="SeqEvent_Console_11"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_106
      ConsoleEventName="open_tacticalhorzineII"
      MaxWidth=266
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_65')),DrawY=-1262,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1597,OverrideDelta=101)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1464
      ObjPosY=-1328
      DrawWidth=153
      DrawHeight=128
      Name="SeqEvent_Console_106"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_103
      ConsoleEventName="open_Bluefire"
      EventDesc="first emote crate"
      MaxWidth=207
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_1')),DrawY=-150,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1623,OverrideDelta=71)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1520
      ObjPosY=-216
      DrawWidth=123
      DrawHeight=128
      Name="SeqEvent_Console_103"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_102
      ConsoleEventName="open_dragonwave"
      MaxWidth=239
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_63')),DrawY=850,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1600,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1488
      ObjPosY=784
      DrawWidth=139
      DrawHeight=128
      Name="SeqEvent_Console_102"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_10
      ConsoleEventName="open_NeonMKIV"
      MaxWidth=225
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_28')),DrawY=354,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1608,OverrideDelta=80)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1496
      ObjPosY=288
      DrawWidth=132
      DrawHeight=128
      Name="SeqEvent_Console_10"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
      ConsoleEventName="open_NeonMKII"
      MaxWidth=221
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_2')),DrawY=-334,OverrideDelta=11)
      VariableLinks(0)=(DrawX=1630,OverrideDelta=78)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1520
      ObjPosY=-400
      DrawWidth=130
      DrawHeight=128
      Name="SeqEvent_Console_1"
      ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_94
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Spitfire_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-982,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-982,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_45'),DrawX=1933,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1888
      ObjPosY=-1016
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_94"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
      NewMaterial=MaterialInstanceConstant'ECON_MAT.ZedKiller_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-4942,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-4942,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_120'),DrawX=1957,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1912
      ObjPosY=-4976
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_9"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
      NewMaterial=MaterialInstanceConstant'ECON_MAT.SOW_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-4766,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-4766,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_121'),DrawX=1965,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1920
      ObjPosY=-4800
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_8"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_65
      NewMaterial=MaterialInstanceConstant'ECON_MAT.TacticalHorzine_MKII_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-1262,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-1262,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_137'),DrawX=1789,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1744
      ObjPosY=-1296
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_65"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_63
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Dragonwave_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=842,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=842,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_2'),DrawX=1845,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1800
      ObjPosY=808
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_63"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_62
      NewMaterial=MaterialInstanceConstant'ECON_MAT.MaceShield_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-3726,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-3726,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_126'),DrawX=1837,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1792
      ObjPosY=-3760
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_62"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_61
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Junkyard_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-3534,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-3534,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_127'),DrawX=1869,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1824
      ObjPosY=-3568
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_61"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_56
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Vietnam_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-3334,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-3334,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_128'),DrawX=1917,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1872
      ObjPosY=-3368
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_56"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_55
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Deepstrike_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-3126,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-3126,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_129'),DrawX=1877,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1832
      ObjPosY=-3160
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_55"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_50
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HighVoltage_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-1478,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-1478,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_136'),DrawX=1789,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1744
      ObjPosY=-1512
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_50"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_47
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Neon_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-5574,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-5574,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_117'),DrawX=2021,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1976
      ObjPosY=-5608
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_47"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_44
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Victorian_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-1678,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-1678,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_135'),DrawX=1805,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1760
      ObjPosY=-1712
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_44"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineIssue_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-5334,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-5334,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_118'),DrawX=1997,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1952
      ObjPosY=-5368
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_4"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_31
      NewMaterial=MaterialInstanceConstant'ECON_MAT.EliteUnit-Medic_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-1918,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-1918,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_133'),DrawX=1813,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1768
      ObjPosY=-1952
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_31"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_30
      NewMaterial=MaterialInstanceConstant'ECON_MAT.SWAT_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-2390,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-2390,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_132'),DrawX=1797,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1752
      ObjPosY=-2424
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_30"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_29
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Neon_MK5_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=602,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=602,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_15'),DrawX=1853,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1808
      ObjPosY=568
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_29"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_28
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Neon_MK4_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=346,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=346,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_12'),DrawX=1853,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1808
      ObjPosY=312
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_28"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_27
      NewMaterial=MaterialInstanceConstant'ECON_MAT.OlExhibit_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-2182,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-2182,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_134'),DrawX=1773,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1728
      ObjPosY=-2216
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_27"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_26
      NewMaterial=MaterialInstanceConstant'ECON_MAT.EmergencyIssue_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-2646,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-2646,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_131'),DrawX=1845,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1800
      ObjPosY=-2680
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_26"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_21
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Neon_MK3_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=90,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=90,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_9'),DrawX=1893,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1848
      ObjPosY=56
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_21"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_20
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Predator_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-3950,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-3950,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_125'),DrawX=1925,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1880
      ObjPosY=-3984
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_20"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
      NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineFE_02_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-342,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-342,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_14'),DrawX=1877,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1832
      ObjPosY=-376
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_2"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_19
      NewMaterial=MaterialInstanceConstant'ECON_MAT.FirstEncounter_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-4166,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-4166,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_124'),DrawX=1917,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1872
      ObjPosY=-4200
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_19"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_18
      NewMaterial=MaterialInstanceConstant'ECON_MAT.StreetPunks_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-4366,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-4366,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_123'),DrawX=1925,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1880
      ObjPosY=-4400
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_18"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_17
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Cyberbone_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-4558,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-4558,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_122'),DrawX=1949,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1904
      ObjPosY=-4592
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_17"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
      NewMaterial=MaterialInstanceConstant'ECON_MAT.WepCollection_01_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-702,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-702,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_4'),DrawX=1949,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1904
      ObjPosY=-736
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_13"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
      NewMaterial=MaterialInstanceConstant'ECON_MAT.DragonFire_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-5126,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-5126,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_119'),DrawX=1981,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1936
      ObjPosY=-5160
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_10"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
      NewMaterial=MaterialInstanceConstant'ECON_MAT.Bluefire_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-158,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-158,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_8'),DrawX=1877,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1832
      ObjPosY=-192
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_1"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
      NewMaterial=MaterialInstanceConstant'ECON_MAT.TacticalHorzine_USB_M'
      MaterialIndex=2
      InputLinks(0)=(DrawY=-2870,OverrideDelta=11)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41')),DrawY=-2870,OverrideDelta=11)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_130'),DrawX=1837,OverrideDelta=23)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=1792
      ObjPosY=-2904
      DrawWidth=90
      DrawHeight=61
      Name="SeqAct_SetMaterial_0"
      ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_41
      OutputLabel="Output"
      InputLinks(0)=(DrawY=-3718,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=4896
      ObjPosY=-3752
      DrawWidth=178
      DrawHeight=45
      Name="SeqAct_FinishSequence_41"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_13
      OutputLabel="Dead Pulse"
      InputLinks(0)=(DrawY=-3630,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb'
      ObjPosX=4896
      ObjPosY=-3664
      DrawWidth=204
      DrawHeight=45
      Name="SeqAct_FinishSequence_13"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   SequenceObjects(0)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_45'
   SequenceObjects(1)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_137'
   SequenceObjects(2)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_136'
   SequenceObjects(3)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_135'
   SequenceObjects(4)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_134'
   SequenceObjects(5)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_133'
   SequenceObjects(6)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_132'
   SequenceObjects(7)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_131'
   SequenceObjects(8)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_130'
   SequenceObjects(9)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_129'
   SequenceObjects(10)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_128'
   SequenceObjects(11)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_127'
   SequenceObjects(12)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_126'
   SequenceObjects(13)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_125'
   SequenceObjects(14)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_124'
   SequenceObjects(15)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_123'
   SequenceObjects(16)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_122'
   SequenceObjects(17)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_121'
   SequenceObjects(18)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_120'
   SequenceObjects(19)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_119'
   SequenceObjects(20)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_118'
   SequenceObjects(21)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_117'
   SequenceObjects(22)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_47'
   SequenceObjects(23)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_78'
   SequenceObjects(24)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_61'
   SequenceObjects(25)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_83'
   SequenceObjects(26)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_56'
   SequenceObjects(27)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_60'
   SequenceObjects(28)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_94'
   SequenceObjects(29)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_27'
   SequenceObjects(30)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_89'
   SequenceObjects(31)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_50'
   SequenceObjects(32)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_55'
   SequenceObjects(33)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_88'
   SequenceObjects(34)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_90'
   SequenceObjects(35)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_62'
   SequenceObjects(36)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_65'
   SequenceObjects(37)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_106'
   SequenceObjects(38)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_75'
   SequenceObjects(39)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_44'
   SequenceObjects(40)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_31'
   SequenceObjects(41)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_59'
   SequenceObjects(42)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_56'
   SequenceObjects(43)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_30'
   SequenceObjects(44)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_27'
   SequenceObjects(45)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_53'
   SequenceObjects(46)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_0'
   SequenceObjects(47)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_48'
   SequenceObjects(48)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_51'
   SequenceObjects(49)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_26'
   SequenceObjects(50)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_20'
   SequenceObjects(51)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_46'
   SequenceObjects(52)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_45'
   SequenceObjects(53)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_19'
   SequenceObjects(54)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_18'
   SequenceObjects(55)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_44'
   SequenceObjects(56)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_4'
   SequenceObjects(57)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_10'
   SequenceObjects(58)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_9'
   SequenceObjects(59)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_8'
   SequenceObjects(60)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_31'
   SequenceObjects(61)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_30'
   SequenceObjects(62)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_29'
   SequenceObjects(63)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_28'
   SequenceObjects(64)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_36'
   SequenceObjects(65)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_17'
   SequenceObjects(66)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_13'
   SequenceObjects(67)=SeqVar_External'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_External_2'
   SequenceObjects(68)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41'
   SequenceObjects(69)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_7'
   SequenceObjects(70)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_13'
   SequenceObjects(71)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_4'
   SequenceObjects(72)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_8'
   SequenceObjects(73)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_14'
   SequenceObjects(74)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_2'
   SequenceObjects(75)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_1'
   SequenceObjects(76)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_103'
   SequenceObjects(77)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_1'
   SequenceObjects(78)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_4'
   SequenceObjects(79)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_21'
   SequenceObjects(80)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_9'
   SequenceObjects(81)=SequenceFrame'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SequenceFrame_8'
   SequenceObjects(82)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_12'
   SequenceObjects(83)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_28'
   SequenceObjects(84)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_10'
   SequenceObjects(85)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_11'
   SequenceObjects(86)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_29'
   SequenceObjects(87)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_15'
   SequenceObjects(88)=SeqEvent_Console'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqEvent_Console_102'
   SequenceObjects(89)=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_SetMaterial_63'
   SequenceObjects(90)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqVar_Named_2'
   DefaultViewX=-1245
   DefaultViewY=111
   OutputLinks(0)=(LinkDesc="Dead Pulse",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_13',DrawY=-1426,OverrideDelta=33)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),LinkDesc="Output",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.usb.SeqAct_FinishSequence_41',DrawY=-1446,OverrideDelta=13)
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Bool",LinkVar="SeqVar_External_2",MinVars=0,DrawX=-3010,OverrideDelta=29)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3052
   ObjPosY=-1482
   ObjName="USB"
   DrawWidth=86
   DrawHeight=85
   Name="usb"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="Abort_Idle_Cam"
   InputLinks(0)=(DrawY=-1440,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1440,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2719,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2860
   ObjPosY=-1474
   ObjComment="Abort_Idle_Cam"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_161
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3016
   ObjPosY=-144
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_161"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_162
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2470
   ObjPosY=722
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_162"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_168
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2072
   ObjPosY=712
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_168"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_164
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1206
   ObjPosY=744
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_164"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_165
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1310
   ObjPosY=736
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_165"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_169
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2198
   ObjPosY=712
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_169"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_167
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2598
   ObjPosY=696
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_167"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_160
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=-136
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_160"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="Check_DelayTimeout"
   MaxWidth=254
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=-1838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1903,OverrideDelta=95)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1776
   ObjPosY=-1904
   ObjComment="Check_DelayTimeout"
   DrawWidth=147
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="Check_DelayTimeout"
   InputLinks(0)=(DrawY=-1070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1070,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1667,OverrideDelta=125)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1824
   ObjPosY=-1104
   ObjComment="Check_DelayTimeout"
   DrawWidth=315
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=932
   SizeY=284
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=-1928
   ObjComment="Check Item Timeout"
   DrawWidth=932
   DrawHeight=284
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="Check_DelayTimeout"
   InputLinks(0)=(DrawY=-2454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1627,OverrideDelta=125)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1784
   ObjPosY=-2488
   ObjComment="Check_DelayTimeout"
   DrawWidth=315
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="Check_DelayTimeout"
   InputLinks(0)=(DrawY=-86,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-86,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2163,OverrideDelta=125)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2320
   ObjPosY=-120
   ObjComment="Check_DelayTimeout"
   DrawWidth=315
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_170
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2656
   ObjPosY=-359
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_170"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_171
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=-359
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_171"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_173
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2200
   ObjPosY=-336
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_173"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_172
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2304
   ObjPosY=-336
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_172"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_175
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Trader_Skel"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1200
   ObjPosY=-344
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_175"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_174
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1328
   ObjPosY=-344
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_174"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_176
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2280
   ObjPosY=-1288
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_176"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_177
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1896
   ObjPosY=-1288
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_177"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_166
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="Craft_Cam"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1056
   ObjPosY=-1320
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_166"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="Check_DelayTimeout"
   InputLinks(0)=(DrawY=890,OverrideDelta=11)
   OutputLinks(0)=(DrawY=890,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2075,OverrideDelta=125)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2232
   ObjPosY=856
   ObjComment="Check_DelayTimeout"
   DrawWidth=315
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_0
   MaxWidth=177
   OutputLinks(0)=(DrawY=-8513,bHidden=True,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-8469,bHidden=True,OverrideDelta=60)
   OutputLinks(2)=(DrawY=-8491,bHidden=True,OverrideDelta=38)
   OutputLinks(3)=(DrawY=-8425,bHidden=True,OverrideDelta=104)
   OutputLinks(4)=(DrawY=-8403,bHidden=True,OverrideDelta=126)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18',InputLinkIdx=2)),DrawY=-8518,OverrideDelta=11)
   VariableLinks(0)=(bHidden=True,DrawX=-7576,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7664
   ObjPosY=-8584
   DrawWidth=114
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_0"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   OscillationDuration=1.000000
   RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
   Name="CameraShake_0"
   ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
End Object
