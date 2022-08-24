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
   InputLinks(0)=(DrawY=3166,OverrideDelta=15)
   InputLinks(1)=(DrawY=3188,OverrideDelta=37)
   InputLinks(2)=(DrawY=3210,OverrideDelta=59)
   InputLinks(3)=(DrawY=3232,OverrideDelta=81)
   InputLinks(4)=(DrawY=3254,OverrideDelta=103)
   OutputLinks(0)=(DrawY=3182,OverrideDelta=31)
   OutputLinks(1)=(DrawY=3238,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=2055,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96'),LinkDesc="craftcam",MinVars=0,DrawX=2116,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),LinkDesc="Trader",MinVars=0,DrawX=2183,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2024
   ObjPosY=3128
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
   ObjPosX=1976
   ObjPosY=3360
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=2478,OverrideDelta=15)
   InputLinks(1)=(DrawY=2500,OverrideDelta=37)
   InputLinks(2)=(DrawY=2522,OverrideDelta=59)
   InputLinks(3)=(DrawY=2544,OverrideDelta=81)
   InputLinks(4)=(DrawY=2566,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=2494,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2550,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=3527,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),LinkDesc="loopcam",MinVars=0,DrawX=3586,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),LinkDesc="Trader",MinVars=0,DrawX=3650,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3496
   ObjPosY=2440
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
   ObjPosX=3464
   ObjPosY=2672
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_23
   ConsoleEventName="Craft_Start"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=2466,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2857,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2760
   ObjPosY=2400
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_23"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="Idle"
   MaxWidth=143
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=2986,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1783,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=2920
   ObjComment="Idle Craft Camera"
   DrawWidth=91
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=2518,OverrideDelta=15)
   InputLinks(1)=(DrawY=2540,OverrideDelta=37)
   InputLinks(2)=(DrawY=2562,OverrideDelta=59)
   InputLinks(3)=(DrawY=2584,OverrideDelta=81)
   InputLinks(4)=(DrawY=2606,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=2525,OverrideDelta=22)
   OutputLinks(1)=(DrawY=2562,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),LinkDesc="stinger",DrawY=2599,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=4423,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),LinkDesc="finishcam",MinVars=0,DrawX=4485,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),LinkDesc="Trader",MinVars=0,DrawX=4553,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4392
   ObjPosY=2480
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
   ObjPosX=4320
   ObjPosY=2704
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=2470,OverrideDelta=15)
   InputLinks(1)=(DrawY=2492,OverrideDelta=37)
   InputLinks(2)=(DrawY=2514,OverrideDelta=59)
   InputLinks(3)=(DrawY=2536,OverrideDelta=81)
   InputLinks(4)=(DrawY=2558,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=2486,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2542,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=3119,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),LinkDesc="opencam",MinVars=0,DrawX=3180,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="Trader",MinVars=0,DrawX=3247,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3088
   ObjPosY=2432
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
   ObjPosX=3072
   ObjPosY=2680
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_7
   ConsoleEventName="gotitem"
   MaxWidth=169
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0')),DrawY=3226,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5844,OverrideDelta=52)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5760
   ObjPosY=3160
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_Console_7"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
   VarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5824
   ObjPosY=3544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_4"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   InputLinks(0)=(DrawY=3226,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3226,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_1'),DrawX=6018,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=6074,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5984
   ObjPosY=3192
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5984
   ObjPosY=3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=2494,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=2484,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_8')),DrawY=2504,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3789,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=3839,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3760
   ObjPosY=2448
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3864
   ObjPosY=2616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_5"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=3546,OverrideDelta=11)
   OutputLinks(0)=(ActivateDelay=0.500000,DrawY=3546,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_9'),DrawX=5482,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=5538,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5448
   ObjPosY=3512
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_5
   ConsoleEventName="rarityCommon"
   MaxWidth=209
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_5')),DrawY=3410,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3112,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3008
   ObjPosY=3344
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_5"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_1
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.200000,Y=0.200000,Z=0.200000))
   InputLinks(0)=(DrawY=3370,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3370,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=3550,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3608,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3512
   ObjPosY=3336
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_1"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_2
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.100000,Y=0.200000,Z=0.200000))
   InputLinks(0)=(DrawY=3434,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3434,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=4342,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4400,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4304
   ObjPosY=3400
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_2"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_6
   ConsoleEventName="rarityUncommon"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_0')),DrawY=3418,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3896,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3784
   ObjPosY=3352
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_6"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_8
   ConsoleEventName="rarityRare"
   MaxWidth=183
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_4')),DrawY=3602,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3083,OverrideDelta=59)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2992
   ObjPosY=3536
   DrawWidth=111
   DrawHeight=128
   Name="SeqEvent_Console_8"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_3
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.100000,Y=0.200000,Z=0.500000))
   InputLinks(0)=(DrawY=3602,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3602,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=3614,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3672,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3576
   ObjPosY=3568
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_3"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_4
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.250000,Y=0.000000,Z=0.250000))
   InputLinks(0)=(DrawY=3650,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3650,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=4358,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4416,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=3616
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_4"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_12
   ConsoleEventName="rarityExceptional"
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_2')),DrawY=3618,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3914,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=3552
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_12"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_13
   ConsoleEventName="rarityMastercrafted"
   MaxWidth=247
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_3')),DrawY=3810,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3099,OverrideDelta=91)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=3744
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_Console_13"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_5
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.500000,Y=0.000000,Z=1.000000))
   InputLinks(0)=(DrawY=3778,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3778,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=3534,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3592,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3496
   ObjPosY=3744
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_5"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_0
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=1.000000,Y=0.500000,Z=0.000000))
   InputLinks(0)=(DrawY=3866,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3866,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=4326,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4384,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4288
   ObjPosY=3832
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_0"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
   ConsoleEventName="rarityPrecious"
   MaxWidth=209
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_1')),DrawY=3834,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3880,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3776
   ObjPosY=3768
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_4"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_17
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Cyberbone_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-62,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-62,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=4597,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=-96
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_17"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_36
   ConsoleEventName="open_cyberbone"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_17')),DrawY=-62,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4386,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4272
   ObjPosY=-128
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_36"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply1_Crate_M'
   InputLinks(0)=(DrawY=-630,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_5')),DrawY=-630,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1949,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1904
   ObjPosY=-664
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_4"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_28
   ConsoleEventName="open_sow"
   MaxWidth=185
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_8')),DrawY=-270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4380,OverrideDelta=60)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4288
   ObjPosY=-336
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_Console_28"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_29
   ConsoleEventName="open_zedkiller"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_9')),DrawY=-446,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4425,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=-512
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_29"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_32
   ConsoleEventName="open_horzine1"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_4')),DrawY=-646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1659,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=-712
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_32"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_25
   ConsoleEventName="open_horzine2"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_3')),DrawY=-814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1651,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1544
   ObjPosY=-880
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_25"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_30
   ConsoleEventName="open_dragonfire"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_10')),DrawY=-630,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4448,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=-696
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_30"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_31
   ConsoleEventName="open_horzineissue"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_11')),DrawY=-838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4447,OverrideDelta=87)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4328
   ObjPosY=-904
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_Console_31"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
   NewMaterial=MaterialInstanceConstant'ECON_MAT.SOW_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-270,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=4613,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4568
   ObjPosY=-304
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_8"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
   NewMaterial=MaterialInstanceConstant'ECON_MAT.ZedKiller_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-446,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),DrawX=4605,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4560
   ObjPosY=-480
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_9"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
   NewMaterial=MaterialInstanceConstant'ECON_MAT.DragonFire_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-630,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-630,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=4629,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4584
   ObjPosY=-664
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_10"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_11
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineIssue_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64'),DrawX=4645,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4600
   ObjPosY=-872
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_11"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Crate_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-814,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_2')),DrawY=-814,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1941,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=-848
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_3"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="FinishCraft"
   InputLinks(0)=(DrawY=3530,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=3530,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=5240,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5176
   ObjPosY=3496
   ObjComment="call after finishing sequences"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5208
   ObjPosY=3576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-746,OverrideDelta=15)
   InputLinks(1)=(DrawY=-724,OverrideDelta=37)
   InputLinks(2)=(DrawY=-702,OverrideDelta=59)
   InputLinks(3)=(DrawY=-680,OverrideDelta=81)
   InputLinks(4)=(DrawY=-658,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),DrawY=-744,OverrideDelta=17)
   OutputLinks(1)=(DrawY=-716,OverrideDelta=45)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0')),LinkDesc="Shake",DrawY=-688,OverrideDelta=73)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0',InputLinkIdx=1)),LinkDesc="endshake",DrawY=-660,OverrideDelta=101)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=2263,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="cratecam",MinVars=0,DrawX=2326,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),LinkDesc="Crate",MinVars=0,DrawX=2391,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=-784
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
   ObjPosX=2136
   ObjPosY=-544
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=-560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-778,OverrideDelta=15)
   InputLinks(1)=(DrawY=-756,OverrideDelta=37)
   InputLinks(2)=(DrawY=-734,OverrideDelta=59)
   InputLinks(3)=(DrawY=-712,OverrideDelta=81)
   InputLinks(4)=(DrawY=-690,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-771,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-734,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_3')),LinkDesc="stinger",DrawY=-697,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=3543,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="cratecam",MinVars=0,DrawX=3606,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),LinkDesc="Crate",MinVars=0,DrawX=3671,OverrideDelta=141)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61'),LinkDesc="Fanfare",MinVars=0,DrawX=3730,OverrideDelta=193)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3512
   ObjPosY=-816
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
   ObjPosX=3520
   ObjPosY=-576
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
   ObjPosX=2576
   ObjPosY=-568
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-754,OverrideDelta=15)
   InputLinks(1)=(DrawY=-732,OverrideDelta=37)
   InputLinks(2)=(DrawY=-710,OverrideDelta=59)
   InputLinks(3)=(DrawY=-688,OverrideDelta=81)
   InputLinks(4)=(DrawY=-666,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_5')),DrawY=-747,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-710,OverrideDelta=59)
   OutputLinks(2)=(LinkDesc="Event0",DrawY=-673,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=2623,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="cratecam",MinVars=0,DrawX=2686,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),LinkDesc="Crate",MinVars=0,DrawX=2751,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-792
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
   ObjPosX=5544
   ObjPosY=2416
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=2190,OverrideDelta=15)
   InputLinks(1)=(DrawY=2212,OverrideDelta=37)
   InputLinks(2)=(DrawY=2234,OverrideDelta=59)
   InputLinks(3)=(DrawY=2256,OverrideDelta=81)
   InputLinks(4)=(DrawY=2278,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3')),DrawY=2206,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2262,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=5599,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),LinkDesc="opencam",MinVars=0,DrawX=5660,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),LinkDesc="Trader",MinVars=0,DrawX=5727,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5568
   ObjPosY=2152
   ObjComment="recycle animation"
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5640
   ObjPosY=2464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_26
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=2170,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5394,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5288
   ObjPosY=2104
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_26"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3720
   ObjPosY=-576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6320
   ObjPosY=2336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_6"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=2262,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=2252,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_12')),DrawY=2272,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=6245,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=6295,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6216
   ObjPosY=2216
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=-648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_5
   InputLinks(0)=(DrawY=-746,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=-756,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_10')),DrawY=-736,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=2885,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=2935,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2856
   ObjPosY=-792
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_5"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4136
   ObjPosY=4112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3696
   ObjPosY=4048
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
   InputLinks(0)=(DrawY=-436,OverrideDelta=13)
   InputLinks(1)=(DrawY=-416,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-426,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),DrawX=2638,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2704,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2600
   ObjPosY=-472
   DrawWidth=148
   DrawHeight=85
   Name="SeqAct_CameraShake_0"
   ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=-176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4568
   ObjPosY=-384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4592
   ObjPosY=-576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4608
   ObjPosY=-776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=1865
   SizeY=1023
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2872
   ObjPosY=3232
   ObjComment="Set the color of the emitter"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-282,OverrideDelta=15)
   InputLinks(1)=(DrawY=-260,OverrideDelta=37)
   InputLinks(2)=(DrawY=-238,OverrideDelta=59)
   InputLinks(3)=(DrawY=-216,OverrideDelta=81)
   InputLinks(4)=(DrawY=-194,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=-266,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-210,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=4999,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),LinkDesc="Trader",MinVars=0,DrawX=5052,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),LinkDesc="tradercam",MinVars=0,DrawX=5123,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4968
   ObjPosY=-320
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
   ObjPosX=4960
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5264
   ObjPosY=-104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5224
   ObjPosY=-200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
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
   ObjPosX=5392
   ObjPosY=-112
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-298,OverrideDelta=15)
   InputLinks(1)=(DrawY=-276,OverrideDelta=37)
   InputLinks(2)=(DrawY=-254,OverrideDelta=59)
   InputLinks(3)=(DrawY=-232,OverrideDelta=81)
   InputLinks(4)=(DrawY=-210,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-282,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-226,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=5375,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),LinkDesc="Trader",MinVars=0,DrawX=5428,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),LinkDesc="tradercam",MinVars=0,DrawX=5499,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5344
   ObjPosY=-336
   ObjComment="usb loop"
   DrawWidth=205
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-314,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=-324,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=-304,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=5709,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_7'),DrawX=5759,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5680
   ObjPosY=-360
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
   ObjPosX=6384
   ObjPosY=-112
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-330,OverrideDelta=15)
   InputLinks(1)=(DrawY=-308,OverrideDelta=37)
   InputLinks(2)=(DrawY=-286,OverrideDelta=59)
   InputLinks(3)=(DrawY=-264,OverrideDelta=81)
   InputLinks(4)=(DrawY=-242,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-323,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-286,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_2')),LinkDesc="stinger",DrawY=-249,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=6215,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),LinkDesc="Trader",MinVars=0,DrawX=6268,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),LinkDesc="tradercam",MinVars=0,DrawX=6339,OverrideDelta=122)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76'),LinkDesc="traderparticle",MinVars=0,DrawX=6433,OverrideDelta=205)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6184
   ObjPosY=-368
   ObjComment="usb finish"
   DrawWidth=310
   DrawHeight=157
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5728
   ObjPosY=-192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_7"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=3616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_9"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=2677
   SizeY=2034
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=-976
   ObjComment="open horzine supply crates"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=3250
   SizeY=2049
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4224
   ObjPosY=-984
   ObjComment="open weapon skin usbs"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2176
   ObjPosY=3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2080
   ObjPosY=3376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3168
   ObjPosY=2680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3560
   ObjPosY=2672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4448
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3272
   ObjPosY=2680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3664
   ObjPosY=2672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4552
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=2386
   SizeY=895
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2656
   ObjPosY=2216
   ObjComment="crafting sequence"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=2401
   SizeY=761
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5176
   ObjPosY=2024
   ObjComment="recycling sequence"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=642
   SizeY=596
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1632
   ObjPosY=2808
   ObjComment="idle sequence"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=535
   SizeY=372
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5696
   ObjPosY=3104
   ObjComment="tells matinee that an item has been received and to finish what its doing"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Craft_Start"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3330,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1457,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1360
   ObjPosY=3264
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_14
   ConsoleEventName="open_horzine2"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2994,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1451,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1344
   ObjPosY=2928
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_14"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_18
   ConsoleEventName="open_horzine1"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3162,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1459,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1352
   ObjPosY=3096
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_18"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_22
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1458,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1352
   ObjPosY=3440
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_22"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_20
   ConsoleEventName="open_horzineissue"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3674,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1479,OverrideDelta=87)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1360
   ObjPosY=3608
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_Console_20"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_17
   ConsoleEventName="open_dragonfire"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3882,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1480,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1368
   ObjPosY=3816
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_17"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_19
   ConsoleEventName="open_zedkiller"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4066,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1457,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1352
   ObjPosY=4000
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_19"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_16
   ConsoleEventName="open_sow"
   MaxWidth=185
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4242,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1412,OverrideDelta=60)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1320
   ObjPosY=4176
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_Console_16"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_15
   ConsoleEventName="open_cyberbone"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4450,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1418,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=4384
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_15"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=595
   SizeY=2257
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1008
   ObjPosY=2848
   ObjComment="doing anything cancels idle"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2962,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1973,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=2896
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_3"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5728
   ObjPosY=2424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=0.500000
   InputLinks(0)=(DrawY=3381,OverrideDelta=14)
   InputLinks(1)=(DrawY=3402,OverrideDelta=35)
   InputLinks(2)=(DrawY=3423,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=3386,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3418,OverrideDelta=51)
   VariableLinks(0)=(DrawX=5444,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5392
   ObjPosY=3344
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply1_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-662,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-662,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2093,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2048
   ObjPosY=-696
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_5"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Key_M'
   InputLinks(0)=(DrawY=-798,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-798,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2085,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=-832
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_2"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6096
   ObjPosY=2440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5992
   ObjPosY=2440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
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
   ObjPosX=5896
   ObjPosY=2440
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=2246,OverrideDelta=15)
   InputLinks(1)=(DrawY=2268,OverrideDelta=37)
   InputLinks(2)=(DrawY=2290,OverrideDelta=59)
   InputLinks(3)=(DrawY=2312,OverrideDelta=81)
   InputLinks(4)=(DrawY=2334,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=2262,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2318,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=5959,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),LinkDesc="loopcam",MinVars=0,DrawX=6018,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Trader",MinVars=0,DrawX=6082,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5928
   ObjPosY=2208
   ObjComment="looping crafting animation"
   DrawWidth=192
   DrawHeight=157
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_9
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=2)),DrawY=2314,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5389,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5312
   ObjPosY=2248
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_9"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_10
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6',InputLinkIdx=2)),DrawY=-870,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2373,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=-936
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_10"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_11
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=2)),DrawY=-526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4925,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4848
   ObjPosY=-592
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_11"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_21
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=2)),DrawY=2642,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2853,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2776
   ObjPosY=2576
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_21"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7072
   ObjPosY=2424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6968
   ObjPosY=2424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
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
   ObjPosX=6840
   ObjPosY=2416
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=2230,OverrideDelta=15)
   InputLinks(1)=(DrawY=2252,OverrideDelta=37)
   InputLinks(2)=(DrawY=2274,OverrideDelta=59)
   InputLinks(3)=(DrawY=2296,OverrideDelta=81)
   InputLinks(4)=(DrawY=2318,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=2237,OverrideDelta=22)
   OutputLinks(1)=(DrawY=2274,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_1')),LinkDesc="stinger",DrawY=2311,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=6943,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="finishcam",MinVars=0,DrawX=7005,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),LinkDesc="Trader",MinVars=0,DrawX=7073,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6912
   ObjPosY=2192
   ObjComment="craft_finish_matinee"
   DrawWidth=199
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_7
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-518,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-518,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2061,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2016
   ObjPosY=-552
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_7"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
   ConsoleEventName="open_horzine3"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_12')),DrawY=-454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1635,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=-520
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_2"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_12
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Crate_M'
   InputLinks(0)=(DrawY=-438,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_7')),DrawY=-438,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1917,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1872
   ObjPosY=-472
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_12"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Crate_M'
   InputLinks(0)=(DrawY=-270,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_14')),DrawY=-270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1901,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1856
   ObjPosY=-304
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_13"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_41
   ConsoleEventName="open_horzine4"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_13')),DrawY=-286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1627,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=-352
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_41"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_14
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-350,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2053,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2008
   ObjPosY=-384
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_14"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_15
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-198,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2077,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=-232
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_15"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_42
   ConsoleEventName="open_horzine5"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_16')),DrawY=-126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1643,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=-192
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_42"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Crate_M'
   InputLinks(0)=(DrawY=-118,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_15')),DrawY=-118,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1933,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=-152
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_16"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_22
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Crate_M'
   InputLinks(0)=(DrawY=66,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_23')),DrawY=66,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1941,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=32
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_22"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_49
   ConsoleEventName="open_horzine6"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_22')),DrawY=66,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1659,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_49"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_23
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-6,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-6,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2085,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=-40
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_23"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4544
   ObjPosY=200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_44
   ConsoleEventName="open_streetpunks"
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_18')),DrawY=130,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4366,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4248
   ObjPosY=64
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Console_44"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_18
   NewMaterial=MaterialInstanceConstant'ECON_MAT.StreetPunks_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=130,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=130,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85'),DrawX=4573,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4528
   ObjPosY=96
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_18"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_19
   NewMaterial=MaterialInstanceConstant'ECON_MAT.FirstEncounter_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=338,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=338,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84'),DrawX=4565,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4520
   ObjPosY=304
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_19"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_45
   ConsoleEventName="open_firstencounter"
   MaxWidth=252
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_19')),DrawY=338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4366,OverrideDelta=94)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4240
   ObjPosY=272
   DrawWidth=146
   DrawHeight=128
   Name="SeqEvent_Console_45"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4544
   ObjPosY=624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_46
   ConsoleEventName="open_predator"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_20')),DrawY=554,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4355,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4248
   ObjPosY=488
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_46"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_20
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Predator_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=554,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=554,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83'),DrawX=4573,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4528
   ObjPosY=520
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_20"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_26
   NewMaterial=MaterialInstanceConstant'ECON_MAT.EmergencyIssue_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=570,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=570,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=5037,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4992
   ObjPosY=536
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_26"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_51
   ConsoleEventName="open_emergencyissue"
   MaxWidth=264
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_26')),DrawY=570,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4844,OverrideDelta=100)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4712
   ObjPosY=504
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_Console_51"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4984
   ObjPosY=640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5000
   ObjPosY=416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_48
   ConsoleEventName="open_tacticalhorzine"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_0')),DrawY=346,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4832,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4704
   ObjPosY=280
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_Console_48"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   NewMaterial=MaterialInstanceConstant'ECON_MAT.TacticalHorzine_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=346,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=346,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=5029,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4984
   ObjPosY=312
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_24
   ConsoleEventName="open_horzine6"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3458,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1155,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1048
   ObjPosY=3392
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_24"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_35
   ConsoleEventName="open_horzine5"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3266,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1139,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1032
   ObjPosY=3200
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_35"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_34
   ConsoleEventName="open_horzine4"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3106,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1123,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=3040
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_34"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_33
   ConsoleEventName="open_horzine3"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2938,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1131,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1024
   ObjPosY=2872
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_33"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_74
   ConsoleEventName="open_tacticalhorzine"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3690,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1168,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1040
   ObjPosY=3624
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_Console_74"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_40
   ConsoleEventName="open_emergencyissue"
   MaxWidth=264
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3914,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1180,OverrideDelta=100)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1048
   ObjPosY=3848
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_Console_40"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_39
   ConsoleEventName="open_predator"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4498,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1147,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1040
   ObjPosY=4432
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_39"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_38
   ConsoleEventName="open_firstencounter"
   MaxWidth=252
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4290,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1158,OverrideDelta=94)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1032
   ObjPosY=4224
   DrawWidth=146
   DrawHeight=128
   Name="SeqEvent_Console_38"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_37
   ConsoleEventName="open_streetpunks"
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4082,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1158,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1040
   ObjPosY=4016
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Console_37"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=4032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_3
   SwitchGroup="Crate_Tier"
   Switch="Tier_3"
   InputLinks(0)=(DrawY=3802,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_5')),DrawY=3802,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=3343,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3296
   ObjPosY=3768
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_3"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_4
   SwitchGroup="Crate_Tier"
   Switch="Tier_2"
   InputLinks(0)=(DrawY=3570,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_3')),DrawY=3570,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=3359,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3312
   ObjPosY=3536
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_4"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_5
   SwitchGroup="Crate_Tier"
   Switch="Tier_1"
   InputLinks(0)=(DrawY=3418,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_1')),DrawY=3418,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=3367,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3320
   ObjPosY=3384
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_5"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_0
   SwitchGroup="Crate_Tier"
   Switch="Tier_1"
   InputLinks(0)=(DrawY=3434,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_2')),DrawY=3434,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=4175,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4128
   ObjPosY=3400
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_0"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_2
   SwitchGroup="Crate_Tier"
   Switch="Tier_3"
   InputLinks(0)=(DrawY=3586,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_4')),DrawY=3586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=4167,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=3552
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_2"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_1
   SwitchGroup="Crate_Tier"
   Switch="Tier_4"
   InputLinks(0)=(DrawY=3818,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_0')),DrawY=3818,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=4151,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4104
   ObjPosY=3784
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_1"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7344
   ObjPosY=2472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=2378,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2378,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=7360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7312
   ObjPosY=2344
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6632
   ObjPosY=-144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=-360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=2302,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=2292,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),LinkDesc="Link 2",DrawY=2312,OverrideDelta=33)
   VariableLinks(0)=(DrawX=7234,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7200
   ObjPosY=2256
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_1"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=2146,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2146,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=7368,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7320
   ObjPosY=2112
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7352
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6920
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=6936,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6888
   ObjPosY=-456
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_2
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-266,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-276,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),LinkDesc="Link 2",DrawY=-256,OverrideDelta=33)
   VariableLinks(0)=(DrawX=6802,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6768
   ObjPosY=-312
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_2"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-190,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-190,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=6928,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6880
   ObjPosY=-224
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
   ObjPosX=6912
   ObjPosY=-96
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4024
   ObjPosY=-808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-902,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=4040,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3992
   ObjPosY=-936
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_3
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-746,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-756,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),LinkDesc="Link 2",DrawY=-736,OverrideDelta=33)
   VariableLinks(0)=(DrawX=3906,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3872
   ObjPosY=-792
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_3"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),DrawX=4032,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3984
   ObjPosY=-704
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4016
   ObjPosY=-576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4840
   ObjPosY=2464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=2370,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2370,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=4856,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4808
   ObjPosY=2336
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=2526,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=2516,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),LinkDesc="Link 2",DrawY=2536,OverrideDelta=33)
   VariableLinks(0)=(DrawX=4722,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4688
   ObjPosY=2480
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=2602,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2602,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=4848,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4800
   ObjPosY=2568
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4832
   ObjPosY=2696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_24
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Star_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=154,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=154,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2085,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=120
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_24"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_50
   ConsoleEventName="open_horzine8"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_25')),DrawY=226,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1667,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1560
   ObjPosY=160
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_50"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_25
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Star_M'
   InputLinks(0)=(DrawY=234,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_24')),DrawY=234,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1941,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=200
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_25"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_28
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Science_M'
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_29')),DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1933,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=368
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_28"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_55
   ConsoleEventName="open_horzine7"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_28')),DrawY=394,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1667,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1560
   ObjPosY=328
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_55"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_29
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Science_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=402,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2077,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=368
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_29"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5424
   ObjPosY=616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_53
   ConsoleEventName="open_exhibit"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_27')),DrawY=546,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5253,OverrideDelta=69)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5152
   ObjPosY=480
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_Console_53"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_27
   NewMaterial=MaterialInstanceConstant'ECON_MAT.OlExhibit_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=546,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=546,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78'),DrawX=5429,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5384
   ObjPosY=512
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_27"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_30
   NewMaterial=MaterialInstanceConstant'ECON_MAT.SWAT_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=338,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=338,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77'),DrawX=5453,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5408
   ObjPosY=304
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_30"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_56
   ConsoleEventName="open_swat"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_30')),DrawY=338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5223,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5128
   ObjPosY=272
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_56"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_47
   ConsoleEventName="open_swat"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4602,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1431,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1336
   ObjPosY=4536
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_47"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_52
   ConsoleEventName="open_exhibit"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4690,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1197,OverrideDelta=69)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=4624
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_Console_52"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=-203,OverrideDelta=14)
   InputLinks(1)=(DrawY=-182,OverrideDelta=35)
   InputLinks(2)=(DrawY=-161,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_11')),DrawY=-198,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-166,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=2732,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2680
   ObjPosY=-240
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
   VarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3496
   ObjPosY=-152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_14"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_11
   InputLinks(0)=(DrawY=-186,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-196,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_9')),DrawY=-176,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=2933,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_23'),DrawX=2983,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2904
   ObjPosY=-232
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_11"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_23
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-96
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_23"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_9
   InputLinks(0)=(DrawY=-174,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-174,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_24'),DrawX=3170,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3226,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3136
   ObjPosY=-208
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_9"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_24
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=-80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_24"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_10
   InputLinks(0)=(DrawY=-658,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_3')),DrawY=-668,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-648,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3101,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_22'),DrawX=3151,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=-704
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_10"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_3
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-678,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_8')),DrawY=-678,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_4'),DrawX=3360,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3296
   ObjPosY=-712
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3336
   ObjPosY=-456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_4"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_8
   InputLinks(0)=(DrawY=-414,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_5')),DrawY=-414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_21'),DrawX=3562,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3618,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=-448
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_8"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_21
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=-320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_21"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_22
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=-552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_22"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5960
   ObjPosY=136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_8"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=74,OverrideDelta=11)
   OutputLinks(0)=(DrawY=74,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=5986,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=6042,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5952
   ObjPosY=40
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5840
   ObjPosY=136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_3"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_4
   InputLinks(0)=(DrawY=54,OverrideDelta=23)
   OutputLinks(0)=(DrawY=44,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=64,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=5781,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=5831,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5752
   ObjPosY=8
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_4"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_4')),DrawY=42,OverrideDelta=19)
   OutputLinks(1)=(DrawY=74,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=5604,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5552
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_13
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5920
   ObjPosY=-216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_13"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6344
   ObjPosY=-464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_11"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_4
   InputLinks(0)=(DrawY=-590,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_6')),DrawY=-590,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=6394,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=6450,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6360
   ObjPosY=-624
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_4"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6144
   ObjPosY=-496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-590,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_4')),DrawY=-590,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=6192,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6128
   ObjPosY=-624
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=-314,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-324,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=-304,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=5909,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_13'),DrawX=5959,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5880
   ObjPosY=-360
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_16
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6248
   ObjPosY=2704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_16"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=2634,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2634,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_16'),DrawX=6298,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=6354,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6264
   ObjPosY=2600
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6128
   ObjPosY=2704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_15"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_7
   InputLinks(0)=(DrawY=2630,OverrideDelta=23)
   OutputLinks(0)=(DrawY=2620,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5')),DrawY=2640,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=6077,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_15'),DrawX=6127,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6048
   ObjPosY=2584
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_7"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=2629,OverrideDelta=14)
   InputLinks(1)=(DrawY=2650,OverrideDelta=35)
   InputLinks(2)=(DrawY=2671,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_7')),DrawY=2634,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2666,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=5924,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5872
   ObjPosY=2592
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_25
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6632
   ObjPosY=2704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_25"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_26
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7000
   ObjPosY=2696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_26"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_10
   InputLinks(0)=(DrawY=2594,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_8')),DrawY=2594,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_26'),DrawX=7034,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=7090,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7000
   ObjPosY=2560
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_10"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6808
   ObjPosY=2688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_7"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_7
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=2594,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_10')),DrawY=2594,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_7'),DrawX=6864,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6800
   ObjPosY=2560
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_7"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_12
   InputLinks(0)=(DrawY=2598,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_7')),DrawY=2588,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14')),DrawY=2608,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=6605,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_25'),DrawX=6655,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6576
   ObjPosY=2552
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_12"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_5
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_5'),DrawX=3792,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3728
   ObjPosY=-448
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_5"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3768
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_5"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6592
   ObjPosY=-520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_6"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_6
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_6'),DrawX=6616,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6552
   ObjPosY=-640
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_6"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_8
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=2610,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2610,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_8'),DrawX=7264,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7200
   ObjPosY=2576
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_8"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7240
   ObjPosY=2696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_8"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_20
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3616
   ObjPosY=2968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_20"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_7
   InputLinks(0)=(DrawY=2874,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2874,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_20'),DrawX=3658,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3714,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3624
   ObjPosY=2840
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_7"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_19
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3488
   ObjPosY=2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_19"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_9
   InputLinks(0)=(DrawY=2862,OverrideDelta=23)
   OutputLinks(0)=(DrawY=2852,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_7')),DrawY=2872,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3421,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_19'),DrawX=3471,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3392
   ObjPosY=2816
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_9"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=2853,OverrideDelta=14)
   InputLinks(1)=(DrawY=2874,OverrideDelta=35)
   InputLinks(2)=(DrawY=2895,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_9')),DrawY=2858,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2890,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=3260,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3208
   ObjPosY=2816
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4528
   ObjPosY=2392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_3"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_4
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=2306,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2306,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_3'),DrawX=4552,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4488
   ObjPosY=2272
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_4"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_8
   InputLinks(0)=(DrawY=2302,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2'),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2)),DrawY=2292,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=2312,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3789,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_18'),DrawX=3839,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3760
   ObjPosY=2256
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_8"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=2290,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_6')),DrawY=2290,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=4152,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4088
   ObjPosY=2256
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4096
   ObjPosY=2384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_6
   InputLinks(0)=(DrawY=2290,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_4')),DrawY=2290,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_17'),DrawX=4322,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=4378,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4288
   ObjPosY=2256
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_6"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4288
   ObjPosY=2392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_17"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_18
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3984
   ObjPosY=2392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_18"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_40
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Psycho_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=586,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2069,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2024
   ObjPosY=552
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_40"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_64
   ConsoleEventName="open_horzine9"
   EventDesc="Psycho Crate"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_41')),DrawY=594,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1675,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1568
   ObjPosY=528
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_64"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_41
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Psycho_M'
   InputLinks(0)=(DrawY=586,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_40')),DrawY=586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1933,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=552
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_41"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_59
   ConsoleEventName="open_elitemedic"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_31')),DrawY=338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5680,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5568
   ObjPosY=272
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_59"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_31
   NewMaterial=MaterialInstanceConstant'ECON_MAT.EliteUnit-Medic_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=338,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=338,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=5893,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5848
   ObjPosY=304
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_31"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5848
   ObjPosY=392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_57
   ConsoleEventName="open_horzine9"
   EventDesc="Psycho Crate"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4866,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1195,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1088
   ObjPosY=4800
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_57"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_54
   ConsoleEventName="open_elitemedic"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4786,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1448,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1336
   ObjPosY=4720
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_54"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5840
   ObjPosY=632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_44
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Victorian_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=578,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=578,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=5885,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5840
   ObjPosY=544
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_44"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_75
   ConsoleEventName="open_victorian"
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_44')),DrawY=578,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5668,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5560
   ObjPosY=512
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_Console_75"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_58
   ConsoleEventName="open_victorian"
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=5018,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1188,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1080
   ObjPosY=4952
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_Console_58"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_43
   ConsoleEventName="open_horzine8"
   EventDesc=
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4994,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1419,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1312
   ObjPosY=4928
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_43"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_70
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Crate_PSN_M'
   InputLinks(0)=(DrawY=218,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_71')),DrawY=218,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=37,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=184
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_70"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_112
   ConsoleEventName="open_psncrate_cs1"
   EventDesc="psncrate_cs1"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_70')),DrawY=226,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-204,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-328
   ObjPosY=160
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_112"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_71
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=218,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=218,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=157,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=112
   ObjPosY=184
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_71"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_36
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=410,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=410,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=141,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=96
   ObjPosY=376
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_36"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_71
   ConsoleEventName="open_psncrate_cs2"
   EventDesc="psncrate_cs2"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_37')),DrawY=418,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-220,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-344
   ObjPosY=352
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_71"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_37
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply2_Crate_PSN_M'
   InputLinks(0)=(DrawY=410,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_36')),DrawY=410,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=21,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=376
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_37"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_38
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply3_Crate_PSN_M'
   InputLinks(0)=(DrawY=586,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_39')),DrawY=586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=13,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-32
   ObjPosY=552
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_38"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_72
   ConsoleEventName="open_psncrate_ws1"
   EventDesc="psncrate_ws1"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_38')),DrawY=594,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-227,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-352
   ObjPosY=528
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_72"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_39
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=586,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=133,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=552
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_39"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_72
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=762,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=762,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=141,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=96
   ObjPosY=728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_72"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_113
   ConsoleEventName="open_psncrate_ws2"
   EventDesc="psncrate_ws2"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_73')),DrawY=770,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-219,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-344
   ObjPosY=704
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_113"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_73
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply4_Crate_PSN_M'
   InputLinks(0)=(DrawY=762,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_72')),DrawY=762,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=21,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_73"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_80
   ConsoleEventName="open_psncrate_ws2"
   EventDesc="psncrate_ws2"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4098,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2165,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=4032
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_80"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_68
   ConsoleEventName="open_psncrate_ws1"
   EventDesc="psncrate_ws1"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3922,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2157,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=3856
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_68"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_111
   ConsoleEventName="open_psncrate_cs2"
   EventDesc="psncrate_cs2"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3746,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2164,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=3680
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_111"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_66
   ConsoleEventName="open_psncrate_cs1"
   EventDesc="psncrate_cs1"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3554,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2180,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2056
   ObjPosY=3488
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_66"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_1
   FloatValue=8.000000
   VarName="timeoutdelay"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3864
   ObjPosY=848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_1"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_63
   ConsoleEventName="open_horzine10"
   EventDesc="Steampunk Rebel Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4514,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1799,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=4448
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_63"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_61
   ConsoleEventName="open_horzine11"
   EventDesc="Reaper Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4514,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2055,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1944
   ObjPosY=4448
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_61"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_42
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_SteamRebel_M'
   InputLinks(0)=(DrawY=762,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_43')),DrawY=762,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1877,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_42"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_65
   ConsoleEventName="open_horzine10"
   EventDesc="Steampunk Rebel Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_42')),DrawY=770,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1623,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=704
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_65"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_43
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_SteamRebel_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=762,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=762,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2013,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1968
   ObjPosY=728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_43"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_51
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Reaper_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=946,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=946,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2013,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1968
   ObjPosY=912
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_51"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_84
   ConsoleEventName="open_horzine11"
   EventDesc="Reaper Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_52')),DrawY=954,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1623,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=888
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_84"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_52
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Reaper_M'
   InputLinks(0)=(DrawY=946,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_51')),DrawY=946,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=1877,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=912
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_52"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_27
   ConsoleEventName="open_tacticalhorzineII"
   MaxWidth=266
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3650,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1797,OverrideDelta=101)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1664
   ObjPosY=3584
   DrawWidth=153
   DrawHeight=128
   Name="SeqEvent_Console_27"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_106
   ConsoleEventName="open_tacticalhorzineII"
   MaxWidth=266
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_65')),DrawY=650,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6157,OverrideDelta=101)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6024
   ObjPosY=584
   DrawWidth=153
   DrawHeight=128
   Name="SeqEvent_Console_106"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_65
   NewMaterial=MaterialInstanceConstant'ECON_MAT.TacticalHorzine_MKII_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=650,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=650,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=6349,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6304
   ObjPosY=616
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_65"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6304
   ObjPosY=704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_79
   ConsoleEventName="open_emote1"
   EventDesc="first emotecrate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4682,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1800,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1696
   ObjPosY=4616
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_79"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_63
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Emote_M'
   InputLinks(0)=(DrawY=954,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_64')),DrawY=954,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=29,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-16
   ObjPosY=920
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_63"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_102
   ConsoleEventName="open_emote1"
   EventDesc="first emote crate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_63')),DrawY=962,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-232,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-336
   ObjPosY=896
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_102"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_64
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Emote_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=954,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=954,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=149,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=920
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_64"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4856
   ObjPosY=912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_62
   NewMaterial=MaterialInstanceConstant'ECON_MAT.MaceShield_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=858,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=858,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=4901,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4856
   ObjPosY=824
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_62"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_90
   ConsoleEventName="open_maceshield"
   MaxWidth=231
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_62')),DrawY=866,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4731,OverrideDelta=83)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=800
   DrawWidth=135
   DrawHeight=128
   Name="SeqEvent_Console_90"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_82
   ConsoleEventName="open_maceshield"
   EventDesc="maceshield"
   MaxWidth=231
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4674,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2051,OverrideDelta=83)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1936
   ObjPosY=4608
   DrawWidth=135
   DrawHeight=128
   Name="SeqEvent_Console_82"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_69
   ConsoleEventName="open_psncrate_ws3"
   EventDesc="psncrate_mace and sheild crate"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4274,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2157,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=4208
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_69"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_46
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply5_Crate_PSN_M'
   InputLinks(0)=(DrawY=1146,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_45')),DrawY=1146,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=21,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=1112
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_46"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_77
   ConsoleEventName="open_psncrate_ws3"
   EventDesc="psncrate_mace and sheild crate"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_46')),DrawY=1154,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-219,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-344
   ObjPosY=1088
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_77"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_45
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=1146,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=1146,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=141,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=96
   ObjPosY=1112
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_45"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_98
   ConsoleEventName="open_Deepstrike"
   EventDesc="deepstrike usb"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4842,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2058,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1944
   ObjPosY=4776
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_98"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_53
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Deepstrike_M'
   InputLinks(0)=(DrawY=2018,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_54')),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2869,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2824
   ObjPosY=1984
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_53"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_62
   ConsoleEventName="open_horzine12"
   EventDesc="deepstrike cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_53')),DrawY=2026,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2615,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2504
   ObjPosY=1960
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_62"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_54
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Deepstrike_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=2018,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=3005,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=1984
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_54"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_86
   ConsoleEventName="open_horzine12"
   EventDesc="deepstrike cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3066,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2423,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2312
   ObjPosY=3000
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_86"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_88
   ConsoleEventName="open_Deepstrike"
   EventDesc="deepstrike usb"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_55')),DrawY=826,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5162,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5048
   ObjPosY=760
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_88"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_55
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Deepstrike_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=818,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=818,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67'),DrawX=5333,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5288
   ObjPosY=784
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_55"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5288
   ObjPosY=872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_92
   ConsoleEventName="open_horzine13"
   EventDesc="insectoid cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3266,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2415,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2304
   ObjPosY=3200
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_92"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_93
   ConsoleEventName="open_horzine13"
   EventDesc="insectoid cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_58')),DrawY=2034,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3215,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3104
   ObjPosY=1968
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_93"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_57
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Insectoid_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=2034,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=2034,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=3581,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3536
   ObjPosY=2000
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_57"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_58
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Insectoid_M'
   InputLinks(0)=(DrawY=2034,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_57')),DrawY=2034,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=3445,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3400
   ObjPosY=2000
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_58"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5728
   ObjPosY=976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_50
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HighVoltage_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=922,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=922,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=5773,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5728
   ObjPosY=888
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_50"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_89
   ConsoleEventName="open_highvoltage"
   EventDesc="high voltage usb"
   MaxWidth=235
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_50')),DrawY=930,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5605,OverrideDelta=85)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5488
   ObjPosY=864
   DrawWidth=137
   DrawHeight=128
   Name="SeqEvent_Console_89"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_96
   ConsoleEventName="open_highvoltage"
   EventDesc="high voltage usb"
   MaxWidth=235
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=4866,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1797,OverrideDelta=85)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1680
   ObjPosY=4800
   DrawWidth=137
   DrawHeight=128
   Name="SeqEvent_Console_96"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_94
   ConsoleEventName="open_flare"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_21')),DrawY=930,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5974,OverrideDelta=62)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5880
   ObjPosY=864
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_Console_94"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_21
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Spitfire_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=922,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=922,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=6165,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6120
   ObjPosY=888
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_21"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6120
   ObjPosY=976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_101
   ConsoleEventName="open_psncrate_ws4"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2730,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2005,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1880
   ObjPosY=2664
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_101"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_59
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Spitfire_M'
   InputLinks(0)=(DrawY=970,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_60')),DrawY=970,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2485,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=936
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_59"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_60
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=970,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=970,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2621,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=936
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_60"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_76
   ConsoleEventName="open_psncrate_ws4"
   EventDesc="psn flare stoner crate"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_59')),DrawY=970,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2269,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=904
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_76"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_91
   ConsoleEventName="open_flare"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2738,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1774,OverrideDelta=62)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1680
   ObjPosY=2672
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_Console_91"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_95
   ConsoleEventName="open_horzine14"
   EventDesc="firefighter crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3346,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2687,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=3280
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_95"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_105
   ConsoleEventName="open_horzine14"
   EventDesc="firefighter crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_67')),DrawY=770,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2311,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2200
   ObjPosY=704
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_105"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_66
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Firefighter_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=722,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=722,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2669,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=688
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_66"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_67
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Firefighter_M'
   InputLinks(0)=(DrawY=722,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_66')),DrawY=722,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=2533,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=688
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_67"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_97
   ConsoleEventName="open_vietnam"
   EventDesc="vietnam  usb"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2954,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2641,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=2888
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_97"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_60
   ConsoleEventName="open_vietnam"
   EventDesc="vietnam  usb"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_56')),DrawY=1978,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6041,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5936
   ObjPosY=1912
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_60"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_56
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Vietnam_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=1050,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=1050,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=5317,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5272
   ObjPosY=1016
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_56"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6256
   ObjPosY=2000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_100
   ConsoleEventName="open_junkyard"
   EventDesc="junkyard usb"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=3554,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2387,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2280
   ObjPosY=3488
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_100"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_83
   ConsoleEventName="open_junkyard"
   EventDesc="junkyard usb"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_61')),DrawY=1034,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4531,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4424
   ObjPosY=968
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_83"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_61
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Junkyard_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=1010,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=1010,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=4709,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4664
   ObjPosY=976
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_61"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5648
   ObjPosY=1960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
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

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_6
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Emote_02_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=1290,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=1290,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=157,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=112
   ObjPosY=1256
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_6"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_103
   ConsoleEventName="open_emote2"
   EventDesc="first emote crate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1')),DrawY=1298,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-224,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-328
   ObjPosY=1232
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_103"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Emote_02_M'
   InputLinks(0)=(DrawY=1290,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_6')),DrawY=1290,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=37,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=1256
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_73
   ConsoleEventName="open_emote2"
   EventDesc="first emote crate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2834,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1512,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1408
   ObjPosY=2768
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_73"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
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

Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7536
   ObjPosY=-6704
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_43"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_1
   InputLinks(0)=(DrawY=-6798,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_23')),DrawY=-6798,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_8'),DrawX=-7590,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_43'),DrawX=-7534,OverrideDelta=68)
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
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_7'),DrawX=-8223,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8313
   ObjPosY=-8799
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_2"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8225
   ObjPosY=-8671
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_7"
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

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_76
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_DoshVault_M'
   InputLinks(0)=(DrawY=-638,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_77')),DrawY=-638,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-107,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-152
   ObjPosY=-672
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_76"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_77
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_DoshVault_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-638,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-638,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=29,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-16
   ObjPosY=-672
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_77"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_114
   ConsoleEventName="open_vaultcrate"
   EventDesc="vault crate"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_76')),DrawY=-590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-327,OverrideDelta=81)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-440
   ObjPosY=-656
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_Console_114"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_87
   ConsoleEventName="open_vaultcrate"
   EventDesc="vault crate"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2674,OverrideDelta=11)
   VariableLinks(0)=(DrawX=553,OverrideDelta=81)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=440
   ObjPosY=2608
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_Console_87"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=430
   SizeY=244
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=-1368
   ObjComment="new crates"
   DrawWidth=430
   DrawHeight=244
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_78
   ConsoleEventName="open_neon"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_47')),DrawY=-1262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3343,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=-1328
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_78"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_47
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Neon_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1262,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=3573,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=-1296
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_47"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=-1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_99
   ConsoleEventName="open_neon"
   EventDesc="neon usb"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2482,OverrideDelta=11)
   VariableLinks(0)=(DrawX=807,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=712
   ObjPosY=2416
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_99"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=558
   SizeY=655
   bDrawBox=True
   BorderColor=(B=0,G=211,R=255,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=2336
   ObjComment="New Crates"
   DrawWidth=558
   DrawHeight=655
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_107
   ConsoleEventName="open_horzine16"
   EventDesc="slaughterhouse crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2482,OverrideDelta=11)
   VariableLinks(0)=(DrawX=543,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=432
   ObjPosY=2416
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_107"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=824
   SizeY=827
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-520
   ObjPosY=-912
   ObjComment="New Crates"
   DrawWidth=824
   DrawHeight=827
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_109
   ConsoleEventName="open_horzine16"
   EventDesc="slaughterhouse crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_75')),DrawY=-774,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-321,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-432
   ObjPosY=-840
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_109"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_74
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Slaughterhouse_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-822,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=37,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=-856
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_74"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_75
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Slaughterhouse_M'
   InputLinks(0)=(DrawY=-822,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_74')),DrawY=-822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-99,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-144
   ObjPosY=-856
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_75"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
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

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_85
   ConsoleEventName="open_psncrate_ws5"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2834,OverrideDelta=11)
   VariableLinks(0)=(DrawX=533,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=2768
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_85"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_67
   ConsoleEventName="open_psncrate_cs3"
   EventDesc="psncrate_cs3"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2834,OverrideDelta=11)
   VariableLinks(0)=(DrawX=828,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=2768
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_67"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_35
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-414,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=61,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=-448
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_35"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_70
   ConsoleEventName="open_psncrate_cs3"
   EventDesc="psncrate_cs3"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_34')),DrawY=-406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-300,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-424
   ObjPosY=-472
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_70"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_34
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Slaughterhouse_M'
   InputLinks(0)=(DrawY=-414,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_35')),DrawY=-414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-59,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-104
   ObjPosY=-448
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_34"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_49
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Neon_M'
   InputLinks(0)=(DrawY=-222,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_48')),DrawY=-222,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-43,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-256
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_49"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_81
   ConsoleEventName="open_psncrate_ws5"
   EventDesc="psncrate_ws5"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_49')),DrawY=-214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-283,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-408
   ObjPosY=-280
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_81"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_48
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-222,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-222,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=77,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=32
   ObjPosY=-256
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_48"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_2')),DrawY=-8667,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8645,bHidden=True,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_0')),DrawY=-8647,OverrideDelta=33)
   OutputLinks(3)=(DrawY=-6431,bHidden=True,OverrideDelta=82)
   OutputLinks(4)=(DrawY=-6409,bHidden=True,OverrideDelta=104)
   OutputLinks(5)=(DrawY=-8601,bHidden=True,OverrideDelta=80)
   VariableLinks(0)=(bHidden=True,DrawX=-5400,OverrideDelta=68)
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
   OutputLinks(0)=(DrawY=-7460,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-7416,bHidden=True,OverrideDelta=81)
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
   DefaultViewX=6041
   DefaultViewY=6984
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
      VariableLinks(0)=(DrawX=-5777,OverrideDelta=73)
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
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_21')),DrawY=-6240,OverrideDelta=33)
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
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_20')),DrawY=-6432,OverrideDelta=33)
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
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_21
      OutputLabel="Tier3"
      InputLinks(0)=(DrawY=-6238,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5336
      ObjPosY=-6272
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_21"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_20
      OutputLabel="Tier2"
      InputLinks(0)=(DrawY=-6438,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2'
      ObjPosX=-5336
      ObjPosY=-6472
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_20"
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
   SequenceObjects(18)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_20'
   SequenceObjects(19)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_21'
   SequenceObjects(20)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_22'
   SequenceObjects(21)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_23'
   SequenceObjects(22)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_24'
   DefaultViewX=5970
   DefaultViewY=7247
   InputLinks(0)=(LinkDesc="In",LinkedOp=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqEvent_SequenceActivated_3',DrawY=-8120,OverrideDelta=71)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18',InputLinkIdx=3)),LinkDesc="Tier0",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_19',DrawY=-8175,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=3)),LinkDesc="Tier2",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_20',DrawY=-8131,OverrideDelta=60)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13',InputLinkIdx=3)),LinkDesc="Tier3",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_2.SeqAct_FinishSequence_21',DrawY=-8109,OverrideDelta=82)
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
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_78
      ExpectedType=Class'Engine.SeqVar_Int'
      FindVarName="ActiveTier"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5608
      ObjPosY=-6160
      ObjColor=(B=255,G=255,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_78"
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
      VariableLinks(0)=(DrawX=-5777,OverrideDelta=73)
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
      OutputLinks(2)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_15')),DrawY=-6240,OverrideDelta=33)
      OutputLinks(3)=(DrawY=-8248,bHidden=True,OverrideDelta=81)
      OutputLinks(4)=(DrawY=-8226,bHidden=True,OverrideDelta=103)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_78'),DrawX=-5535,OverrideDelta=29)
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
      OutputLinks(3)=(Links=((LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_13')),DrawY=-6649,OverrideDelta=56)
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
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_15
      OutputLabel="Tier3"
      InputLinks(0)=(DrawY=-6238,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5336
      ObjPosY=-6272
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_15"
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
   Begin Object Class=SeqAct_FinishSequence Name=SeqAct_FinishSequence_13
      OutputLabel="Tier0"
      InputLinks(0)=(DrawY=-6702,OverrideDelta=11)
      ObjInstanceVersion=1
      ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1'
      ObjPosX=-5336
      ObjPosY=-6736
      DrawWidth=165
      DrawHeight=45
      Name="SeqAct_FinishSequence_13"
      ObjectArchetype=SeqAct_FinishSequence'Engine.Default__SeqAct_FinishSequence'
   End Object
   SequenceObjects(0)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_18'
   SequenceObjects(1)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_17'
   SequenceObjects(2)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_16'
   SequenceObjects(3)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_15'
   SequenceObjects(4)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_14'
   SequenceObjects(5)=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_13'
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
   SequenceObjects(20)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_78'
   SequenceObjects(21)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_77'
   SequenceObjects(22)=SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqVar_Named_76'
   DefaultViewX=5970
   DefaultViewY=7247
   InputLinks(0)=(LinkDesc="In",LinkedOp=SeqEvent_SequenceActivated'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqEvent_SequenceActivated_2',DrawY=-6322,OverrideDelta=71)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1')),LinkDesc="Tier0",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_13',DrawY=-6377,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_3')),LinkDesc="Tier2",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_14',DrawY=-6333,OverrideDelta=60)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_4')),LinkDesc="Tier3",LinkedOp=SeqAct_FinishSequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.EavulateForTier_1.SeqAct_FinishSequence_15',DrawY=-6311,OverrideDelta=82)
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

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_68
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Dragon_M'
   InputLinks(0)=(DrawY=-1174,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_69')),DrawY=-1174,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-91,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=-1208
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_68"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_69
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Dragon_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1174,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1174,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=45,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-1208
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_69"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_110
   ConsoleEventName="open_horzine15"
   EventDesc="Dragon crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_68')),DrawY=-1126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-313,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-424
   ObjPosY=-1192
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_110"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=635
   SizeY=255
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-448
   ObjPosY=-1232
   ObjComment="Sieries 15 Horzine Crate"
   DrawWidth=635
   DrawHeight=255
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_108
   ConsoleEventName="open_horzine15"
   EventDesc="Dragon crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=2226,OverrideDelta=11)
   VariableLinks(0)=(DrawX=815,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=2160
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_108"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=282
   SizeY=188
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=2128
   ObjComment="Series 15 Horzine Crate"
   DrawWidth=282
   DrawHeight=188
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_115
   ConsoleEventName="open_vaultcrate_test"
   EventDesc="vault crate"
   MaxWidth=262
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_33')),DrawY=-1374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-261,OverrideDelta=99)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=-1440
   DrawWidth=151
   DrawHeight=128
   Name="SeqEvent_Console_115"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_32
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_DoshVault_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1374,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1374,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=85,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=40
   ObjPosY=-1408
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_32"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_33
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_DoshVault_M'
   InputLinks(0)=(DrawY=-1374,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_32')),DrawY=-1374,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-43,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-1408
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_33"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_104
   ConsoleEventName="open_vaultcrate_test"
   EventDesc="vault crate"
   MaxWidth=262
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=1994,OverrideDelta=11)
   VariableLinks(0)=(DrawX=803,OverrideDelta=99)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=1928
   DrawWidth=151
   DrawHeight=128
   Name="SeqEvent_Console_104"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=322
   SizeY=188
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=1896
   ObjComment="Debug Vault Crate"
   DrawWidth=322
   DrawHeight=188
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=601
   SizeY=208
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-416
   ObjPosY=-1464
   ObjComment="Dosh Vault Debug Crate"
   DrawWidth=601
   DrawHeight=208
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_0
   MaxWidth=177
   OutputLinks(0)=(DrawY=-8601,bHidden=True,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-8557,bHidden=True,OverrideDelta=60)
   OutputLinks(2)=(DrawY=-8579,bHidden=True,OverrideDelta=38)
   OutputLinks(3)=(DrawY=-8513,bHidden=True,OverrideDelta=104)
   OutputLinks(4)=(DrawY=-8491,bHidden=True,OverrideDelta=126)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_13',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_19',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15',InputLinkIdx=2)),DrawY=-8606,OverrideDelta=11)
   VariableLinks(0)=(bHidden=True,DrawX=-7432,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7520
   ObjPosY=-8672
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
