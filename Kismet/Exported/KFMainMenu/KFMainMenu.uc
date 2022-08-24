Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=2489
   SizeY=1620
   bDrawBox=True
   BorderColor=(B=255,G=101,R=0,A=255)
   FillColor=(B=0,G=249,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4200
   ObjPosY=-4568
   ObjComment="WIP System to Handle No Dosh Add Idle Camera"
   DrawWidth=2489
   DrawHeight=1620
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=1117
   SizeY=1839
   bDrawBox=True
   BorderColor=(B=0,G=255,R=83,A=255)
   FillColor=(B=248,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4184
   ObjPosY=-9320
   ObjComment="Tier Handler"
   DrawWidth=1117
   DrawHeight=1839
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bLooping=True
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1562,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1540,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1518,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1496,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1474,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-1546,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1490,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-833,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96'),LinkDesc="craftcam",MinVars=0,DrawX=-772,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),LinkDesc="Trader",MinVars=0,DrawX=-705,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-864
   ObjPosY=-1600
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
   ObjPosX=-912
   ObjPosY=-1368
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-802,OverrideDelta=15)
   InputLinks(1)=(DrawY=-780,OverrideDelta=37)
   InputLinks(2)=(DrawY=-758,OverrideDelta=59)
   InputLinks(3)=(DrawY=-736,OverrideDelta=81)
   InputLinks(4)=(DrawY=-714,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=-786,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-730,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=527,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),LinkDesc="loopcam",MinVars=0,DrawX=586,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95'),LinkDesc="Trader",MinVars=0,DrawX=650,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=496
   ObjPosY=-840
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
   ObjPosX=464
   ObjPosY=-608
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_23
   ConsoleEventName="Craft_Start"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=-814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-143,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-240
   ObjPosY=-880
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_23"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="Idle"
   MaxWidth=143
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-1742,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1105,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=-1808
   ObjComment="Idle Craft Camera"
   DrawWidth=91
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-762,OverrideDelta=15)
   InputLinks(1)=(DrawY=-740,OverrideDelta=37)
   InputLinks(2)=(DrawY=-718,OverrideDelta=59)
   InputLinks(3)=(DrawY=-696,OverrideDelta=81)
   InputLinks(4)=(DrawY=-674,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-755,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-718,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),LinkDesc="stinger",DrawY=-681,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=1423,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93'),LinkDesc="finishcam",MinVars=0,DrawX=1485,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),LinkDesc="Trader",MinVars=0,DrawX=1553,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=-800
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
   ObjPosX=1320
   ObjPosY=-576
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-810,OverrideDelta=15)
   InputLinks(1)=(DrawY=-788,OverrideDelta=37)
   InputLinks(2)=(DrawY=-766,OverrideDelta=59)
   InputLinks(3)=(DrawY=-744,OverrideDelta=81)
   InputLinks(4)=(DrawY=-722,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=-794,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-738,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=119,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),LinkDesc="opencam",MinVars=0,DrawX=180,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="Trader",MinVars=0,DrawX=247,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-848
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
   ObjPosX=72
   ObjPosY=-600
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_7
   ConsoleEventName="gotitem"
   MaxWidth=169
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0')),DrawY=-54,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2844,OverrideDelta=52)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2760
   ObjPosY=-120
   DrawWidth=104
   DrawHeight=128
   Name="SeqEvent_Console_7"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
   VarName="itemhad"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2824
   ObjPosY=264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_4"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   InputLinks(0)=(DrawY=-54,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-54,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_1'),DrawX=3018,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3074,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=-88
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=48
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=-786,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=-796,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_8')),DrawY=-776,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=789,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=839,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=-832
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=-664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_5"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=266,OverrideDelta=11)
   OutputLinks(0)=(ActivateDelay=0.500000,DrawY=266,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_9'),DrawX=2482,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=2538,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=232
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_5
   ConsoleEventName="rarityCommon"
   MaxWidth=209
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_5')),DrawY=130,OverrideDelta=11)
   VariableLinks(0)=(DrawX=112,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8
   ObjPosY=64
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_5"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_1
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.200000,Y=0.200000,Z=0.200000))
   InputLinks(0)=(DrawY=90,OverrideDelta=11)
   OutputLinks(0)=(DrawY=90,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=550,OverrideDelta=16)
   VariableLinks(1)=(DrawX=608,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=512
   ObjPosY=56
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_1"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_2
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.100000,Y=0.200000,Z=0.200000))
   InputLinks(0)=(DrawY=154,OverrideDelta=11)
   OutputLinks(0)=(DrawY=154,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=1342,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1400,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=120
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_2"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_6
   ConsoleEventName="rarityUncommon"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_0')),DrawY=138,OverrideDelta=11)
   VariableLinks(0)=(DrawX=896,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=784
   ObjPosY=72
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_6"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_8
   ConsoleEventName="rarityRare"
   MaxWidth=183
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_4')),DrawY=322,OverrideDelta=11)
   VariableLinks(0)=(DrawX=83,OverrideDelta=59)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=256
   DrawWidth=111
   DrawHeight=128
   Name="SeqEvent_Console_8"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_3
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.100000,Y=0.200000,Z=0.500000))
   InputLinks(0)=(DrawY=322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=322,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=614,OverrideDelta=16)
   VariableLinks(1)=(DrawX=672,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=288
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_3"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_4
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.250000,Y=0.000000,Z=0.250000))
   InputLinks(0)=(DrawY=370,OverrideDelta=11)
   OutputLinks(0)=(DrawY=370,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88'),DrawX=1358,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1416,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1320
   ObjPosY=336
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_4"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_12
   ConsoleEventName="rarityExceptional"
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_2')),DrawY=338,OverrideDelta=11)
   VariableLinks(0)=(DrawX=914,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=800
   ObjPosY=272
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_12"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_13
   ConsoleEventName="rarityMastercrafted"
   MaxWidth=247
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_3')),DrawY=530,OverrideDelta=11)
   VariableLinks(0)=(DrawX=99,OverrideDelta=91)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=464
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_Console_13"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_5
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=0.500000,Y=0.000000,Z=1.000000))
   InputLinks(0)=(DrawY=498,OverrideDelta=11)
   OutputLinks(0)=(DrawY=498,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=534,OverrideDelta=16)
   VariableLinks(1)=(DrawX=592,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=496
   ObjPosY=464
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_5"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqAct_SetParticleSysParam Name=SeqAct_SetParticleSysParam_0
   InstanceParameters(0)=(Name="rarityColor",ParamType=PSPT_Vector,Vector=(X=1.000000,Y=0.500000,Z=0.000000))
   InputLinks(0)=(DrawY=586,OverrideDelta=11)
   OutputLinks(0)=(DrawY=586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=1326,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1384,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1288
   ObjPosY=552
   DrawWidth=133
   DrawHeight=77
   Name="SeqAct_SetParticleSysParam_0"
   ObjectArchetype=SeqAct_SetParticleSysParam'Engine.Default__SeqAct_SetParticleSysParam'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_4
   ConsoleEventName="rarityPrecious"
   MaxWidth=209
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkSetSwitch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkSetSwitch_1')),DrawY=554,OverrideDelta=11)
   VariableLinks(0)=(DrawX=880,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=776
   ObjPosY=488
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_4"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_17
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Cyberbone_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2462,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2462,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=2581,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=-2496
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_17"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_36
   ConsoleEventName="open_cyberbone"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_17')),DrawY=-2462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2370,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2256
   ObjPosY=-2528
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_36"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply1_Crate_M'
   InputLinks(0)=(DrawY=-3030,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_5')),DrawY=-3030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-67,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-112
   ObjPosY=-3064
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_4"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_28
   ConsoleEventName="open_sow"
   MaxWidth=185
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_8')),DrawY=-2670,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2364,OverrideDelta=60)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2272
   ObjPosY=-2736
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_Console_28"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_29
   ConsoleEventName="open_zedkiller"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_9')),DrawY=-2846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2409,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2304
   ObjPosY=-2912
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_29"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_32
   ConsoleEventName="open_horzine1"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_4')),DrawY=-3046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-357,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-464
   ObjPosY=-3112
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_32"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_25
   ConsoleEventName="open_horzine2"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_3')),DrawY=-3214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-365,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-472
   ObjPosY=-3280
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_25"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_30
   ConsoleEventName="open_dragonfire"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_10')),DrawY=-3030,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2432,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2320
   ObjPosY=-3096
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_30"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_31
   ConsoleEventName="open_horzineissue"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_11')),DrawY=-3238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2431,OverrideDelta=87)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2312
   ObjPosY=-3304
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_Console_31"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
   NewMaterial=MaterialInstanceConstant'ECON_MAT.SOW_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2670,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),DrawX=2597,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-2704
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_8"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
   NewMaterial=MaterialInstanceConstant'ECON_MAT.ZedKiller_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2846,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),DrawX=2589,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=-2880
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_9"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
   NewMaterial=MaterialInstanceConstant'ECON_MAT.DragonFire_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-3030,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-3030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=2613,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2568
   ObjPosY=-3064
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_10"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_11
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineIssue_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-3238,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-3238,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64'),DrawX=2629,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=-3272
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_11"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Crate_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-3214,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_2')),DrawY=-3214,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-75,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-120
   ObjPosY=-3248
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_3"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="FinishCraft"
   InputLinks(0)=(DrawY=250,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=250,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=2240,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2176
   ObjPosY=216
   ObjComment="call after finishing sequences"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2208
   ObjPosY=296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-3146,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3124,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3102,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3080,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3058,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),DrawY=-3144,OverrideDelta=17)
   OutputLinks(1)=(DrawY=-3116,OverrideDelta=45)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0')),LinkDesc="Shake",DrawY=-3088,OverrideDelta=73)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0',InputLinkIdx=1)),LinkDesc="endshake",DrawY=-3060,OverrideDelta=101)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=247,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="cratecam",MinVars=0,DrawX=310,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),LinkDesc="Crate",MinVars=0,DrawX=375,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-3184
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
   ObjPosX=120
   ObjPosY=-2944
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=-2960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-3178,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3156,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3134,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3112,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3090,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-3171,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-3134,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_3')),LinkDesc="stinger",DrawY=-3097,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=1527,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="cratecam",MinVars=0,DrawX=1590,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),LinkDesc="Crate",MinVars=0,DrawX=1655,OverrideDelta=141)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61'),LinkDesc="Fanfare",MinVars=0,DrawX=1714,OverrideDelta=193)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1496
   ObjPosY=-3216
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
   ObjPosX=1504
   ObjPosY=-2976
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
   ObjPosX=560
   ObjPosY=-2968
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-3154,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3132,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3110,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3088,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3066,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_5')),DrawY=-3147,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-3110,OverrideDelta=59)
   OutputLinks(2)=(LinkDesc="Event0",DrawY=-3073,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=607,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="cratecam",MinVars=0,DrawX=670,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),LinkDesc="Crate",MinVars=0,DrawX=735,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=-3192
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
   ObjPosX=2544
   ObjPosY=-864
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1090,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1068,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1046,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1024,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1002,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3')),DrawY=-1074,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1018,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=2599,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),LinkDesc="opencam",MinVars=0,DrawX=2660,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),LinkDesc="Trader",MinVars=0,DrawX=2727,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2568
   ObjPosY=-1128
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
   ObjPosX=2640
   ObjPosY=-816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_26
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=-1110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2394,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=-1176
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_26"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=-2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3320
   ObjPosY=-944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_6"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=-1018,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=-1028,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_12')),DrawY=-1008,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3245,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=3295,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=-1064
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=-3048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_5
   InputLinks(0)=(DrawY=-3146,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=-3156,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_10')),DrawY=-3136,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=869,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=919,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=840
   ObjPosY=-3192
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_5"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=696
   ObjPosY=768
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
   InputLinks(0)=(DrawY=-2836,OverrideDelta=13)
   InputLinks(1)=(DrawY=-2816,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-2826,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),DrawX=622,OverrideDelta=16)
   VariableLinks(1)=(DrawX=688,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=584
   ObjPosY=-2872
   DrawWidth=148
   DrawHeight=85
   Name="SeqAct_CameraShake_0"
   ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-2392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2560
   ObjPosY=-2576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-3176
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
   ObjPosX=-80
   ObjPosY=8
   ObjComment="Set the color of the emitter"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2682,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2660,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2638,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2616,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2594,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=-2666,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2610,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=2983,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),LinkDesc="Trader",MinVars=0,DrawX=3036,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),LinkDesc="tradercam",MinVars=0,DrawX=3107,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=-2720
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
   ObjPosX=2944
   ObjPosY=-2480
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=-2504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3208
   ObjPosY=-2600
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
   ObjPosX=3376
   ObjPosY=-2512
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2698,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2676,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2654,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2632,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2610,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-2682,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2626,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=3359,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),LinkDesc="Trader",MinVars=0,DrawX=3412,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),LinkDesc="tradercam",MinVars=0,DrawX=3483,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3328
   ObjPosY=-2736
   ObjComment="usb loop"
   DrawWidth=205
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-2714,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=-2724,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=-2704,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3693,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_7'),DrawX=3743,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3664
   ObjPosY=-2760
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
   ObjPosX=4368
   ObjPosY=-2512
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2730,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2708,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2686,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2664,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2642,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-2723,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-2686,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_2')),LinkDesc="stinger",DrawY=-2649,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=4199,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),LinkDesc="Trader",MinVars=0,DrawX=4252,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54'),LinkDesc="tradercam",MinVars=0,DrawX=4323,OverrideDelta=122)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76'),LinkDesc="traderparticle",MinVars=0,DrawX=4417,OverrideDelta=205)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4168
   ObjPosY=-2768
   ObjComment="usb finish"
   DrawWidth=310
   DrawHeight=157
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=-2592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_7"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2400
   ObjPosY=336
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
   ObjPosX=-504
   ObjPosY=-3376
   ObjComment="open horzine supply crates"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=3250
   SizeY=2049
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2208
   ObjPosY=-3384
   ObjComment="open weapon skin usbs"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-712
   ObjPosY=-1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-808
   ObjPosY=-1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=168
   ObjPosY=-600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=560
   ObjPosY=-608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1448
   ObjPosY=-568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=272
   ObjPosY=-600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=-608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=-568
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
   ObjPosX=-296
   ObjPosY=-1008
   ObjComment="crafting sequence"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=2401
   SizeY=761
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2224
   ObjPosY=-1208
   ObjComment="recycling sequence"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=642
   SizeY=596
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=-1856
   ObjComment="idle sequence"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=535
   SizeY=372
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2696
   ObjPosY=-176
   ObjComment="tells matinee that an item has been received and to finish what its doing"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Craft_Start"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1398,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1431,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1528
   ObjPosY=-1464
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_14
   ConsoleEventName="open_horzine2"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1437,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1544
   ObjPosY=-1800
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_14"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_18
   ConsoleEventName="open_horzine1"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1429,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1536
   ObjPosY=-1632
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_18"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_22
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1222,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1430,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1536
   ObjPosY=-1288
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_22"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_20
   ConsoleEventName="open_horzineissue"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1409,OverrideDelta=87)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1528
   ObjPosY=-1120
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_Console_20"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_17
   ConsoleEventName="open_dragonfire"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1408,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1520
   ObjPosY=-912
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_17"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_19
   ConsoleEventName="open_zedkiller"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1431,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1536
   ObjPosY=-728
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_19"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_16
   ConsoleEventName="open_sow"
   MaxWidth=185
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-486,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1476,OverrideDelta=60)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1568
   ObjPosY=-552
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_Console_16"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_15
   ConsoleEventName="open_cyberbone"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1470,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=-344
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
   ObjPosX=-1880
   ObjPosY=-1880
   ObjComment="doing anything cancels idle"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-915,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-992
   ObjPosY=-1832
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_3"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2728
   ObjPosY=-856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=0.500000
   InputLinks(0)=(DrawY=101,OverrideDelta=14)
   InputLinks(1)=(DrawY=122,OverrideDelta=35)
   InputLinks(2)=(DrawY=143,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=106,OverrideDelta=19)
   OutputLinks(1)=(DrawY=138,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2444,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2392
   ObjPosY=64
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply1_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-3062,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-3062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=77,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=32
   ObjPosY=-3096
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_5"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Key_M'
   InputLinks(0)=(DrawY=-3198,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-3198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=69,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=24
   ObjPosY=-3232
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_2"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3096
   ObjPosY=-840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2992
   ObjPosY=-840
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
   ObjPosX=2896
   ObjPosY=-840
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1034,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1012,OverrideDelta=37)
   InputLinks(2)=(DrawY=-990,OverrideDelta=59)
   InputLinks(3)=(DrawY=-968,OverrideDelta=81)
   InputLinks(4)=(DrawY=-946,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=-1018,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-962,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=2959,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),LinkDesc="loopcam",MinVars=0,DrawX=3018,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Trader",MinVars=0,DrawX=3082,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2928
   ObjPosY=-1072
   ObjComment="looping crafting animation"
   DrawWidth=192
   DrawHeight=157
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_9
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=2)),DrawY=-966,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2389,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2312
   ObjPosY=-1032
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_9"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_10
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6',InputLinkIdx=2)),DrawY=-3270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=357,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=-3336
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_10"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_11
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=2)),DrawY=-2926,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2909,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2832
   ObjPosY=-2992
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_11"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_21
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=2)),DrawY=-638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-147,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-224
   ObjPosY=-704
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_21"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4072
   ObjPosY=-856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3968
   ObjPosY=-856
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
   ObjPosX=3840
   ObjPosY=-864
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1050,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1028,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1006,OverrideDelta=59)
   InputLinks(3)=(DrawY=-984,OverrideDelta=81)
   InputLinks(4)=(DrawY=-962,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-1043,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-1006,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_1')),LinkDesc="stinger",DrawY=-969,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=3943,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="finishcam",MinVars=0,DrawX=4005,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),LinkDesc="Trader",MinVars=0,DrawX=4073,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3912
   ObjPosY=-1088
   ObjComment="craft_finish_matinee"
   DrawWidth=199
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_7
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2918,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2918,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=45,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-2952
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_7"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
   ConsoleEventName="open_horzine3"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_12')),DrawY=-2854,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-381,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-488
   ObjPosY=-2920
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_2"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_12
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Crate_M'
   InputLinks(0)=(DrawY=-2838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_7')),DrawY=-2838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-99,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-144
   ObjPosY=-2872
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_12"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Crate_M'
   InputLinks(0)=(DrawY=-2670,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_14')),DrawY=-2670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-115,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-160
   ObjPosY=-2704
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_13"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_41
   ConsoleEventName="open_horzine4"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_13')),DrawY=-2686,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-389,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-496
   ObjPosY=-2752
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_41"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_14
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2750,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=37,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=-2784
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_14"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_15
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2598,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2598,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=61,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=-2632
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_15"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_42
   ConsoleEventName="open_horzine5"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_16')),DrawY=-2526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-373,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-480
   ObjPosY=-2592
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_42"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Crate_M'
   InputLinks(0)=(DrawY=-2518,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_15')),DrawY=-2518,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-83,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=-2552
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_16"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_22
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Crate_M'
   InputLinks(0)=(DrawY=-2326,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_23')),DrawY=-2326,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-75,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-120
   ObjPosY=-2360
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_22"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_49
   ConsoleEventName="open_horzine6"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_22')),DrawY=-2334,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-357,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-464
   ObjPosY=-2400
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_49"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_23
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2406,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2406,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=69,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=24
   ObjPosY=-2440
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_23"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=-2192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_44
   ConsoleEventName="open_streetpunks"
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_18')),DrawY=-2262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2350,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=-2328
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Console_44"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_18
   NewMaterial=MaterialInstanceConstant'ECON_MAT.StreetPunks_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2262,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85'),DrawX=2557,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2512
   ObjPosY=-2296
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_18"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_19
   NewMaterial=MaterialInstanceConstant'ECON_MAT.FirstEncounter_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2054,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84'),DrawX=2549,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2504
   ObjPosY=-2088
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_19"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_45
   ConsoleEventName="open_firstencounter"
   MaxWidth=252
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_19')),DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2350,OverrideDelta=94)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2224
   ObjPosY=-2120
   DrawWidth=146
   DrawHeight=128
   Name="SeqEvent_Console_45"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2520
   ObjPosY=-1984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=-1768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_46
   ConsoleEventName="open_predator"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_20')),DrawY=-1838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2339,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=-1904
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_46"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_20
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Predator_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83'),DrawX=2557,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2512
   ObjPosY=-1872
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_20"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_26
   NewMaterial=MaterialInstanceConstant'ECON_MAT.EmergencyIssue_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1822,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=3021,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=-1856
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_26"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_51
   ConsoleEventName="open_emergencyissue"
   MaxWidth=264
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_26')),DrawY=-1822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2828,OverrideDelta=100)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2696
   ObjPosY=-1888
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_Console_51"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=-1752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=-1976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_48
   ConsoleEventName="open_tacticalhorzine"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_0')),DrawY=-2046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2816,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2688
   ObjPosY=-2112
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_Console_48"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   NewMaterial=MaterialInstanceConstant'ECON_MAT.TacticalHorzine_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2046,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=3013,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=-2080
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_24
   ConsoleEventName="open_horzine6"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1733,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1840
   ObjPosY=-1336
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_24"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_35
   ConsoleEventName="open_horzine5"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1749,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1856
   ObjPosY=-1528
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_35"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_34
   ConsoleEventName="open_horzine4"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1765,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1872
   ObjPosY=-1688
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_34"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_33
   ConsoleEventName="open_horzine3"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1790,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1757,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1864
   ObjPosY=-1856
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_33"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_74
   ConsoleEventName="open_tacticalhorzine"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1038,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1720,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1848
   ObjPosY=-1104
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_Console_74"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_40
   ConsoleEventName="open_emergencyissue"
   MaxWidth=264
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1708,OverrideDelta=100)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1840
   ObjPosY=-880
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_Console_40"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_39
   ConsoleEventName="open_predator"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1741,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1848
   ObjPosY=-296
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_39"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_38
   ConsoleEventName="open_firstencounter"
   MaxWidth=252
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1730,OverrideDelta=94)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1856
   ObjPosY=-504
   DrawWidth=146
   DrawHeight=128
   Name="SeqEvent_Console_38"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_37
   ConsoleEventName="open_streetpunks"
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1730,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1848
   ObjPosY=-712
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Console_37"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_3
   SwitchGroup="Crate_Tier"
   Switch="Tier_3"
   InputLinks(0)=(DrawY=522,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_5')),DrawY=522,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=343,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=296
   ObjPosY=488
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_3"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_4
   SwitchGroup="Crate_Tier"
   Switch="Tier_2"
   InputLinks(0)=(DrawY=290,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_3')),DrawY=290,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=359,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=256
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_4"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_5
   SwitchGroup="Crate_Tier"
   Switch="Tier_1"
   InputLinks(0)=(DrawY=138,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_1')),DrawY=138,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=367,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=320
   ObjPosY=104
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_5"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_0
   SwitchGroup="Crate_Tier"
   Switch="Tier_1"
   InputLinks(0)=(DrawY=154,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_2')),DrawY=154,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=1175,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=120
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_0"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_2
   SwitchGroup="Crate_Tier"
   Switch="Tier_3"
   InputLinks(0)=(DrawY=306,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_4')),DrawY=306,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=1167,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=272
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_2"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_1
   SwitchGroup="Crate_Tier"
   Switch="Tier_4"
   InputLinks(0)=(DrawY=538,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_0')),DrawY=538,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=1151,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=504
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_1"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4344
   ObjPosY=-808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-902,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=4360,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4312
   ObjPosY=-936
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=-2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-2760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-978,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-988,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),LinkDesc="Link 2",DrawY=-968,OverrideDelta=33)
   VariableLinks(0)=(DrawX=4234,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4200
   ObjPosY=-1024
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_1"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-1134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1134,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=4368,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=-1168
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4352
   ObjPosY=-1040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=-2728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=4920,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4872
   ObjPosY=-2856
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_2
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-2666,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-2676,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),LinkDesc="Link 2",DrawY=-2656,OverrideDelta=33)
   VariableLinks(0)=(DrawX=4786,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4752
   ObjPosY=-2712
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_2"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=4912,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4864
   ObjPosY=-2624
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
   ObjPosX=4896
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2008
   ObjPosY=-3208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-3302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3302,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=2024,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1976
   ObjPosY=-3336
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_3
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-3146,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-3156,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),LinkDesc="Link 2",DrawY=-3136,OverrideDelta=33)
   VariableLinks(0)=(DrawX=1890,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1856
   ObjPosY=-3192
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_3"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-3070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3070,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),DrawX=2016,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1968
   ObjPosY=-3104
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=-2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=-816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-910,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-910,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=1856,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-944
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-754,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-764,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),LinkDesc="Link 2",DrawY=-744,OverrideDelta=33)
   VariableLinks(0)=(DrawX=1722,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=-800
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-678,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-678,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87'),DrawX=1848,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1800
   ObjPosY=-712
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_24
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Star_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2238,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2238,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=69,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=24
   ObjPosY=-2272
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_24"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_50
   ConsoleEventName="open_horzine8"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_25')),DrawY=-2166,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-349,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-456
   ObjPosY=-2232
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_50"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_25
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Star_M'
   InputLinks(0)=(DrawY=-2158,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_24')),DrawY=-2158,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-75,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-120
   ObjPosY=-2192
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_25"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_28
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Science_M'
   InputLinks(0)=(DrawY=-1990,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_29')),DrawY=-1990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-83,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=-2024
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_28"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_55
   ConsoleEventName="open_horzine7"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_28')),DrawY=-1998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-349,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-456
   ObjPosY=-2064
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_55"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_29
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Science_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1990,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=61,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=-2024
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_29"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3408
   ObjPosY=-1776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_53
   ConsoleEventName="open_exhibit"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_27')),DrawY=-1846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3237,OverrideDelta=69)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3136
   ObjPosY=-1912
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_Console_53"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_27
   NewMaterial=MaterialInstanceConstant'ECON_MAT.OlExhibit_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78'),DrawX=3413,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3368
   ObjPosY=-1880
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_27"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_30
   NewMaterial=MaterialInstanceConstant'ECON_MAT.SWAT_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2054,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77'),DrawX=3437,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3392
   ObjPosY=-2088
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_30"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_56
   ConsoleEventName="open_swat"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_30')),DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3207,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3112
   ObjPosY=-2120
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_56"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3384
   ObjPosY=-1984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_47
   ConsoleEventName="open_swat"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1457,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1552
   ObjPosY=-192
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_47"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_52
   ConsoleEventName="open_exhibit"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-38,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1691,OverrideDelta=69)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1792
   ObjPosY=-104
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_Console_52"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=-2603,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2582,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2561,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_11')),DrawY=-2598,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2566,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=716,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=-2640
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
   VarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1480
   ObjPosY=-2552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_14"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_11
   InputLinks(0)=(DrawY=-2586,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-2596,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_9')),DrawY=-2576,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=917,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_23'),DrawX=967,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=888
   ObjPosY=-2632
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_11"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_23
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=984
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_23"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_9
   InputLinks(0)=(DrawY=-2574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_24'),DrawX=1154,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=1210,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=-2608
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_9"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_24
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1112
   ObjPosY=-2480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_24"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_10
   InputLinks(0)=(DrawY=-3058,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_3')),DrawY=-3068,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-3048,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=1085,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_22'),DrawX=1135,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1056
   ObjPosY=-3104
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_10"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_3
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-3078,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_8')),DrawY=-3078,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_4'),DrawX=1344,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1280
   ObjPosY=-3112
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1320
   ObjPosY=-2856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_4"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_8
   InputLinks(0)=(DrawY=-2814,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_5')),DrawY=-2814,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_21'),DrawX=1546,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=1602,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=-2848
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_8"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_21
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1512
   ObjPosY=-2720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_21"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_22
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1112
   ObjPosY=-2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_22"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3944
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_8"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=-2318,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2318,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=3970,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=4026,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=-2352
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3824
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_3"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_4
   InputLinks(0)=(DrawY=-2338,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-2348,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=-2328,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3765,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=3815,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3736
   ObjPosY=-2384
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_4"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=-2363,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2342,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2321,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_4')),DrawY=-2358,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2326,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=3588,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3536
   ObjPosY=-2400
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_13
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3904
   ObjPosY=-2616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_13"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4328
   ObjPosY=-2864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_11"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_4
   InputLinks(0)=(DrawY=-2990,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_6')),DrawY=-2990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_11'),DrawX=4378,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=4434,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4344
   ObjPosY=-3024
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_4"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4128
   ObjPosY=-2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-2990,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_4')),DrawY=-2990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=4176,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=-3024
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=-2714,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-2724,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=-2704,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3893,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_13'),DrawX=3943,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3864
   ObjPosY=-2760
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_16
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=-576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_16"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=-646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_16'),DrawX=3298,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3354,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3264
   ObjPosY=-680
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=-576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_15"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_7
   InputLinks(0)=(DrawY=-650,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-660,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5')),DrawY=-640,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3077,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_15'),DrawX=3127,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3048
   ObjPosY=-696
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_7"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=-651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-609,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_7')),DrawY=-646,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-614,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=2924,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2872
   ObjPosY=-688
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_25
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3632
   ObjPosY=-576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_25"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_26
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4000
   ObjPosY=-584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_26"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_10
   InputLinks(0)=(DrawY=-686,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_8')),DrawY=-686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_26'),DrawX=4034,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=4090,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4000
   ObjPosY=-720
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_10"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3808
   ObjPosY=-592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_7"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_7
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-686,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_10')),DrawY=-686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_7'),DrawX=3864,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=-720
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_7"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_12
   InputLinks(0)=(DrawY=-682,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_7')),DrawY=-692,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14')),DrawY=-672,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3605,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_25'),DrawX=3655,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3576
   ObjPosY=-728
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_12"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_5
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-2814,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2814,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_5'),DrawX=1776,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=-2848
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_5"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1752
   ObjPosY=-2728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_5"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=-2920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_6"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_6
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-3006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_6'),DrawX=4600,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=-3040
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_6"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_8
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_8'),DrawX=4264,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4200
   ObjPosY=-704
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_8"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4240
   ObjPosY=-584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_8"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_20
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=-312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_20"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_7
   InputLinks(0)=(DrawY=-406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-406,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_20'),DrawX=658,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=714,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=-440
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_7"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_19
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=488
   ObjPosY=-328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_19"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_9
   InputLinks(0)=(DrawY=-418,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-428,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_7')),DrawY=-408,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=421,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_19'),DrawX=471,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=-464
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_9"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   bStartWillRestart=True
   Duration=8.000000
   InputLinks(0)=(DrawY=-427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-385,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_9')),DrawY=-422,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-390,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=260,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=208
   ObjPosY=-464
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=-888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_3"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_4
   Commands(0)="ce Idle"
   InputLinks(0)=(DrawY=-974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-974,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_3'),DrawX=1552,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1488
   ObjPosY=-1008
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_4"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_8
   InputLinks(0)=(DrawY=-978,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2'),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2)),DrawY=-988,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=-968,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=789,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_18'),DrawX=839,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=-1024
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_8"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-990,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_6')),DrawY=-990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=1152,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1088
   ObjPosY=-1024
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1096
   ObjPosY=-896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_6
   InputLinks(0)=(DrawY=-990,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_4')),DrawY=-990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_17'),DrawX=1322,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=1378,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1288
   ObjPosY=-1024
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_6"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1288
   ObjPosY=-888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_17"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_18
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=984
   ObjPosY=-888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_18"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_40
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Psycho_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1806,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1806,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=53,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8
   ObjPosY=-1840
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_40"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_64
   ConsoleEventName="open_horzine9"
   EventDesc="Psycho Crate"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_41')),DrawY=-1798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-341,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-448
   ObjPosY=-1864
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_64"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_41
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Psycho_M'
   InputLinks(0)=(DrawY=-1806,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_40')),DrawY=-1806,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-83,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=-1840
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_41"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_59
   ConsoleEventName="open_elitemedic"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_31')),DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3664,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3552
   ObjPosY=-2120
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_59"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_31
   NewMaterial=MaterialInstanceConstant'ECON_MAT.EliteUnit-Medic_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2054,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2054,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=3877,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3832
   ObjPosY=-2088
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_31"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3832
   ObjPosY=-2000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_57
   ConsoleEventName="open_horzine9"
   EventDesc="Psycho Crate"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=138,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1693,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=72
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_57"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_54
   ConsoleEventName="open_elitemedic"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=58,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1440,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1552
   ObjPosY=-8
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_54"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3824
   ObjPosY=-1760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_44
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Victorian_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1814,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1814,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=3869,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3824
   ObjPosY=-1848
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_44"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_75
   ConsoleEventName="open_victorian"
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_44')),DrawY=-1814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3652,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3544
   ObjPosY=-1880
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_Console_75"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_58
   ConsoleEventName="open_victorian"
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=290,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1700,OverrideDelta=76)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1808
   ObjPosY=224
   DrawWidth=128
   DrawHeight=128
   Name="SeqEvent_Console_58"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_43
   ConsoleEventName="open_horzine8"
   EventDesc=
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=266,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1469,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=200
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_43"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_70
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Crate_PSN_M'
   InputLinks(0)=(DrawY=-3262,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_71')),DrawY=-3262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-747,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-792
   ObjPosY=-3296
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_70"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_112
   ConsoleEventName="open_psncrate_cs1"
   EventDesc="psncrate_cs1"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_70')),DrawY=-3254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-988,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1112
   ObjPosY=-3320
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_112"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_71
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-3262,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-3262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-619,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-664
   ObjPosY=-3296
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_71"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_36
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-3070,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-3070,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-635,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-680
   ObjPosY=-3104
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_36"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_71
   ConsoleEventName="open_psncrate_cs2"
   EventDesc="psncrate_cs2"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_37')),DrawY=-3062,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1004,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1128
   ObjPosY=-3128
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_71"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_37
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply2_Crate_PSN_M'
   InputLinks(0)=(DrawY=-3070,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_36')),DrawY=-3070,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-763,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-808
   ObjPosY=-3104
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_37"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_38
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply3_Crate_PSN_M'
   InputLinks(0)=(DrawY=-2894,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_39')),DrawY=-2894,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-771,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-816
   ObjPosY=-2928
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_38"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_72
   ConsoleEventName="open_psncrate_ws1"
   EventDesc="psncrate_ws1"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_38')),DrawY=-2886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1011,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1136
   ObjPosY=-2952
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_72"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_39
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2894,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2894,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-643,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-688
   ObjPosY=-2928
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_39"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_72
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2718,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-635,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-680
   ObjPosY=-2752
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_72"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_113
   ConsoleEventName="open_psncrate_ws2"
   EventDesc="psncrate_ws2"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_73')),DrawY=-2710,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1003,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1128
   ObjPosY=-2776
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_113"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_73
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply4_Crate_PSN_M'
   InputLinks(0)=(DrawY=-2718,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_72')),DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-763,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-808
   ObjPosY=-2752
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_73"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_80
   ConsoleEventName="open_psncrate_ws2"
   EventDesc="psncrate_ws2"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-630,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-723,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-848
   ObjPosY=-696
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_80"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_68
   ConsoleEventName="open_psncrate_ws1"
   EventDesc="psncrate_ws1"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-731,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-856
   ObjPosY=-872
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_68"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_111
   ConsoleEventName="open_psncrate_cs2"
   EventDesc="psncrate_cs2"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-982,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-724,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-848
   ObjPosY=-1048
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_111"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_66
   ConsoleEventName="open_psncrate_cs1"
   EventDesc="psncrate_cs1"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1174,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-708,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-832
   ObjPosY=-1240
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
   ObjPosX=1848
   ObjPosY=-1544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_1"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_63
   ConsoleEventName="open_horzine10"
   EventDesc="Steampunk Rebel Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1089,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1200
   ObjPosY=-280
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_63"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_61
   ConsoleEventName="open_horzine11"
   EventDesc="Reaper Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-833,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-944
   ObjPosY=-280
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_61"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_42
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_SteamRebel_M'
   InputLinks(0)=(DrawY=-1630,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_43')),DrawY=-1630,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-139,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-184
   ObjPosY=-1664
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_42"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_65
   ConsoleEventName="open_horzine10"
   EventDesc="Steampunk Rebel Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_42')),DrawY=-1622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-393,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=-1688
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_65"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_43
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_SteamRebel_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1630,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1630,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-3,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=-1664
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_43"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_51
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Reaper_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1446,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-3,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=-1480
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_51"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_84
   ConsoleEventName="open_horzine11"
   EventDesc="Reaper Crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_52')),DrawY=-1438,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-393,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=-1504
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_84"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_52
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Reaper_M'
   InputLinks(0)=(DrawY=-1446,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_51')),DrawY=-1446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-139,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-184
   ObjPosY=-1480
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_52"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_27
   ConsoleEventName="open_tacticalhorzineII"
   MaxWidth=266
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1091,OverrideDelta=101)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1224
   ObjPosY=-1144
   DrawWidth=153
   DrawHeight=128
   Name="SeqEvent_Console_27"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_106
   ConsoleEventName="open_tacticalhorzineII"
   MaxWidth=266
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_65')),DrawY=-1742,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4141,OverrideDelta=101)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4008
   ObjPosY=-1808
   DrawWidth=153
   DrawHeight=128
   Name="SeqEvent_Console_106"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_65
   NewMaterial=MaterialInstanceConstant'ECON_MAT.TacticalHorzine_MKII_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1742,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1742,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=4333,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4288
   ObjPosY=-1776
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_65"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4288
   ObjPosY=-1688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_79
   ConsoleEventName="open_emote1"
   EventDesc="first emotecrate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-46,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1088,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=-112
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_79"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_63
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Emote_M'
   InputLinks(0)=(DrawY=-2526,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_64')),DrawY=-2526,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-755,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-800
   ObjPosY=-2560
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_63"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_102
   ConsoleEventName="open_emote1"
   EventDesc="first emote crate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_63')),DrawY=-2518,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1016,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1120
   ObjPosY=-2584
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_102"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_64
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Emote_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2526,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2526,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-627,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-672
   ObjPosY=-2560
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_64"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2840
   ObjPosY=-1480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_62
   NewMaterial=MaterialInstanceConstant'ECON_MAT.MaceShield_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1534,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1534,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51'),DrawX=2885,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2840
   ObjPosY=-1568
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_62"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_90
   ConsoleEventName="open_maceshield"
   MaxWidth=231
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_62')),DrawY=-1526,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2715,OverrideDelta=83)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2600
   ObjPosY=-1592
   DrawWidth=135
   DrawHeight=128
   Name="SeqEvent_Console_90"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_82
   ConsoleEventName="open_maceshield"
   EventDesc="maceshield"
   MaxWidth=231
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-54,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-837,OverrideDelta=83)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-952
   ObjPosY=-120
   DrawWidth=135
   DrawHeight=128
   Name="SeqEvent_Console_82"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_69
   ConsoleEventName="open_psncrate_ws3"
   EventDesc="psncrate_mace and sheild crate"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-731,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-856
   ObjPosY=-520
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_69"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_46
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply5_Crate_PSN_M'
   InputLinks(0)=(DrawY=-2334,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_45')),DrawY=-2334,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-763,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-808
   ObjPosY=-2368
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_46"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_77
   ConsoleEventName="open_psncrate_ws3"
   EventDesc="psncrate_mace and sheild crate"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_46')),DrawY=-2326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1003,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1128
   ObjPosY=-2392
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_77"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_45
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2334,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2334,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-635,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-680
   ObjPosY=-2368
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_45"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_98
   ConsoleEventName="open_Deepstrike"
   EventDesc="deepstrike usb"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=114,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-830,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-944
   ObjPosY=48
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_98"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_53
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Deepstrike_M'
   InputLinks(0)=(DrawY=-1270,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_54')),DrawY=-1270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-131,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-176
   ObjPosY=-1304
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_53"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_62
   ConsoleEventName="open_horzine12"
   EventDesc="deepstrike cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_53')),DrawY=-1262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-385,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-496
   ObjPosY=-1328
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_62"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_54
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Deepstrike_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1270,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=5,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-40
   ObjPosY=-1304
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_54"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_86
   ConsoleEventName="open_horzine12"
   EventDesc="deepstrike cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-577,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-688
   ObjPosY=-280
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_86"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_88
   ConsoleEventName="open_Deepstrike"
   EventDesc="deepstrike usb"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_55')),DrawY=-1566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3146,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=-1632
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_88"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_55
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Deepstrike_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1574,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67'),DrawX=3317,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3272
   ObjPosY=-1608
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_55"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3272
   ObjPosY=-1520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_92
   ConsoleEventName="open_horzine13"
   EventDesc="insectoid cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-14,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-585,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-696
   ObjPosY=-80
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_92"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_93
   ConsoleEventName="open_horzine13"
   EventDesc="insectoid cosmetic crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_58')),DrawY=-1254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=215,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=-1320
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_93"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_57
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Insectoid_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1254,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=581,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=-1288
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_57"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_58
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Insectoid_M'
   InputLinks(0)=(DrawY=-1254,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_57')),DrawY=-1254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=445,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=-1288
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_58"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=-1416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_50
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HighVoltage_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1470,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=3757,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=-1504
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_50"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_89
   ConsoleEventName="open_highvoltage"
   EventDesc="high voltage usb"
   MaxWidth=235
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_50')),DrawY=-1462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3589,OverrideDelta=85)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3472
   ObjPosY=-1528
   DrawWidth=137
   DrawHeight=128
   Name="SeqEvent_Console_89"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_96
   ConsoleEventName="open_highvoltage"
   EventDesc="high voltage usb"
   MaxWidth=235
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=138,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1091,OverrideDelta=85)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=72
   DrawWidth=137
   DrawHeight=128
   Name="SeqEvent_Console_96"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_94
   ConsoleEventName="open_flare"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_21')),DrawY=-1462,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3958,OverrideDelta=62)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3864
   ObjPosY=-1528
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_Console_94"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_21
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Spitfire_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1470,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=4149,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4104
   ObjPosY=-1504
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_21"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4104
   ObjPosY=-1416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_101
   ConsoleEventName="open_psncrate_ws4"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-883,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=-2064
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_101"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_59
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Spitfire_M'
   InputLinks(0)=(DrawY=-1422,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_60')),DrawY=-1422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=469,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-1456
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_59"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_60
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1422,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=605,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=560
   ObjPosY=-1456
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_60"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_76
   ConsoleEventName="open_psncrate_ws4"
   EventDesc="psn flare stoner crate"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_59')),DrawY=-1422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=253,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=128
   ObjPosY=-1488
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_76"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_91
   ConsoleEventName="open_flare"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1114,OverrideDelta=62)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1208
   ObjPosY=-2056
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_Console_91"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_95
   ConsoleEventName="open_horzine14"
   EventDesc="firefighter crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=66,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-313,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-424
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_95"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_105
   ConsoleEventName="open_horzine14"
   EventDesc="firefighter crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_67')),DrawY=-1622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=295,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=184
   ObjPosY=-1688
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_105"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_66
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Firefighter_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1670,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=653,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-1704
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_66"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_67
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Firefighter_M'
   InputLinks(0)=(DrawY=-1670,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_66')),DrawY=-1670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=517,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=472
   ObjPosY=-1704
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_67"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_97
   ConsoleEventName="open_vietnam"
   EventDesc="vietnam  usb"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-359,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-464
   ObjPosY=-392
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_97"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_60
   ConsoleEventName="open_vietnam"
   EventDesc="vietnam  usb"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_56')),DrawY=-1310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3041,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2936
   ObjPosY=-1376
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_60"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_56
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Vietnam_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1342,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1342,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49'),DrawX=3301,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3256
   ObjPosY=-1376
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_56"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3256
   ObjPosY=-1288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_100
   ConsoleEventName="open_junkyard"
   EventDesc="junkyard usb"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=274,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-613,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-720
   ObjPosY=208
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_100"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_83
   ConsoleEventName="open_junkyard"
   EventDesc="junkyard usb"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_61')),DrawY=-1358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2515,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2408
   ObjPosY=-1424
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_83"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_61
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Junkyard_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1382,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1382,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=2693,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=-1416
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_61"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=-1328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_8
   SizeX=704
   SizeY=1067
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4736
   ObjPosY=-6968
   ObjComment="Dosh Vault"
   Name="SequenceFrameWrapped_8"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_110
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2)),DrawY=-5990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4179,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4256
   ObjPosY=-6056
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_110"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_6
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Emote_02_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2190,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2190,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-619,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-664
   ObjPosY=-2224
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_6"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_103
   ConsoleEventName="open_emote2"
   EventDesc="first emote crate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1')),DrawY=-2182,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1008,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1112
   ObjPosY=-2248
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_103"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Emote_02_M'
   InputLinks(0)=(DrawY=-2190,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_6')),DrawY=-2190,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-747,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-792
   ObjPosY=-2224
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_73
   ConsoleEventName="open_emote2"
   EventDesc="first emote crate"
   MaxWidth=208
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1376,OverrideDelta=72)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1480
   ObjPosY=-1960
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_Console_73"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=InterpActor'KFMainMenu.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3768
   ObjPosY=-6032
   ObjComment="Vault Door"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3880
   ObjPosY=-6056
   ObjComment="Dosh Vault Camera"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bForceStartPos=True
   InputLinks(0)=(DrawY=-6452,OverrideDelta=37)
   InputLinks(1)=(DrawY=-6387,OverrideDelta=102)
   InputLinks(2)=(DrawY=-6322,OverrideDelta=167)
   InputLinks(3)=(DrawY=-6257,OverrideDelta=232)
   InputLinks(4)=(DrawY=-6192,OverrideDelta=297)
   OutputLinks(0)=(DrawY=-6471,OverrideDelta=18)
   OutputLinks(1)=(DrawY=-6448,OverrideDelta=41)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_21')),LinkDesc="Tier1_Check",DrawY=-6425,OverrideDelta=64)
   OutputLinks(3)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_17')),LinkDesc="Tier2_Check",DrawY=-6379,OverrideDelta=110)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_10')),LinkDesc="Tier1_Lights",DrawY=-6402,OverrideDelta=87)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_11')),LinkDesc="Tier2_Lights",DrawY=-6356,OverrideDelta=133)
   OutputLinks(6)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_18')),LinkDesc="Tier3_Check",DrawY=-6333,OverrideDelta=156)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_12')),LinkDesc="Tier3_Lights",DrawY=-6310,OverrideDelta=179)
   OutputLinks(8)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_19')),LinkDesc="Tier4_Check",DrawY=-6287,OverrideDelta=202)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_13')),LinkDesc="Tier4_Lights",DrawY=-6264,OverrideDelta=225)
   OutputLinks(10)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_20')),LinkDesc="Tier5_Check",DrawY=-6241,OverrideDelta=248)
   OutputLinks(11)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_9')),LinkDesc="Tier5_Lights",DrawY=-6218,OverrideDelta=271)
   OutputLinks(12)=(Links=((LinkedOp=KFSeqAction_DoshVault'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.KFSeqAction_DoshVault_0')),LinkDesc="FillPalletCall",DrawY=-6195,OverrideDelta=294)
   OutputLinks(13)=(Links=((LinkedOp=SeqAct_Toggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),LinkDesc="FX_Open",DrawY=-6172,OverrideDelta=317)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-3857,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),LinkDesc="VaultDoorCam",MinVars=0,DrawX=-3796,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),LinkDesc="VaultDoorAnim",MinVars=0,DrawX=-3721,OverrideDelta=137)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_22'),LinkDesc="ForceStartPosition",PropertyName="ForceStartPosition",MinVars=0,DrawX=-3632,OverrideDelta=214)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_21'),LinkDesc="bForceStartPos",PropertyName="bForceStartPos",MinVars=0,DrawX=-3545,OverrideDelta=315)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Sound",MinVars=0,DrawX=-3480,OverrideDelta=388)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-6512
   ObjComment="Dosh Vault Camera Track"
   DrawWidth=445
   DrawHeight=389
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="VaultDoorCam",ShotNumber=2)
         CutTrack(1)=(Time=18.014063,TargetCamGroup="Camera",ShotNumber=5)
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
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_14.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_14.InterpTrackEvent_0'
      GroupName="VaultDoorAnim"
      GroupColor=(B=233,G=0,R=0,A=255)
      Name="InterpGroup_14"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.854612,OutVal=(X=-807.243103,Y=-2122.870605,Z=-5893.039551),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-793.693848,Y=-1905.356812,Z=-5906.038086),ArriveTangent=(X=40.444466,Y=459.753052,Z=0.000000),LeaveTangent=(X=40.444466,Y=459.753052,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-724.303711,Y=-1443.484741,Z=-5771.032715),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-753.148804,Y=-1619.177002,Z=-5863.035156),ArriveTangent=(X=0.000000,Y=-11.089390,Z=-0.277027),LeaveTangent=(X=0.000000,Y=-11.089390,Z=-0.277027),InterpMode=CIM_CurveAutoClamped),(InVal=5.965877,OutVal=(X=-752.751160,Y=-1626.176270,Z=-5863.204102),InterpMode=CIM_CurveAutoClamped),(InVal=6.997293,OutVal=(X=-774.834290,Y=-1592.891602,Z=-5746.032715),ArriveTangent=(X=-0.003744,Y=0.156833,Z=1.111252),LeaveTangent=(X=-0.003744,Y=0.156833,Z=1.111252),InterpMode=CIM_CurveAutoClamped),(InVal=8.490665,OutVal=(X=-774.836304,Y=-1592.807007,Z=-5745.431641),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.114944),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.114944),InterpMode=CIM_CurveAutoClamped),(InVal=9.510000,OutVal=(X=-755.841003,Y=-1694.235107,Z=-5623.030762),ArriveTangent=(X=0.028136,Y=-2.390068,Z=0.283272),LeaveTangent=(X=0.028136,Y=-2.390068,Z=0.283272),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=-755.825928,Y=-1695.532349,Z=-5622.878906),ArriveTangent=(X=0.000000,Y=-2.392460,Z=0.000000),LeaveTangent=(X=0.000000,Y=-2.392460,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.999799,OutVal=(X=-811.103516,Y=-1773.471191,Z=-5703.027832),ArriveTangent=(X=-48.767647,Y=-60.306953,Z=0.000000),LeaveTangent=(X=-48.767647,Y=-60.306953,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=12.999741,OutVal=(X=-853.348572,Y=-1816.130615,Z=-5640.026367),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.001215),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.001215),InterpMode=CIM_CurveAutoClamped),(InVal=14.008358,OutVal=(X=-853.348572,Y=-1816.130371,Z=-5640.025879),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.001219),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.001219),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=-851.065613,Y=-1861.098022,Z=-5583.023926),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.001766),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.001766),InterpMode=CIM_CurveAutoClamped),(InVal=16.568983,OutVal=(X=-851.065613,Y=-1861.097900,Z=-5583.022949),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.854612,OutVal=(X=0.000000,Y=6.262207,Z=91.054688),InterpMode=CIM_CurveAutoClamped),(InVal=2.395019,OutVal=(X=-0.021973,Y=-0.433960,Z=89.648438),ArriveTangent=(X=-0.055010,Y=-20.707729,Z=0.000000),LeaveTangent=(X=-0.055010,Y=-20.707729,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.324989,OutVal=(X=-0.087891,Y=-40.231934,Z=122.431641),InterpMode=CIM_CurveAutoClamped),(InVal=3.987206,OutVal=(X=-0.065918,Y=-9.030762,Z=91.466675),ArriveTangent=(X=0.000000,Y=0.036068,Z=-0.358554),LeaveTangent=(X=0.000000,Y=0.036068,Z=-0.358554),InterpMode=CIM_CurveAutoClamped),(InVal=5.965877,OutVal=(X=-0.076904,Y=-9.008789,Z=91.246948),ArriveTangent=(X=-0.012344,Y=0.000000,Z=-0.298723),LeaveTangent=(X=-0.012344,Y=0.000000,Z=-0.298723),InterpMode=CIM_CurveAutoClamped),(InVal=6.997293,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=8.490665,OutVal=(X=-0.109863,Y=-32.426147,Z=89.143066),InterpMode=CIM_CurveAutoClamped),(InVal=9.510000,OutVal=(X=-0.126343,Y=-31.354980,Z=91.900635),ArriveTangent=(X=0.000000,Y=0.078594,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.078594,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.000000,OutVal=(X=-0.126343,Y=-31.311035,Z=91.878662),ArriveTangent=(X=0.000000,Y=0.082328,Z=-0.040717),LeaveTangent=(X=0.000000,Y=0.082328,Z=-0.040717),InterpMode=CIM_CurveAutoClamped),(InVal=11.999799,OutVal=(X=-0.126343,Y=-8.366089,Z=90.071411),InterpMode=CIM_CurveAutoClamped),(InVal=12.999741,OutVal=(X=-0.148315,Y=-13.666992,Z=91.444702),ArriveTangent=(X=-0.019144,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.019144,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=14.008358,OutVal=(X=-0.164795,Y=-13.666992,Z=91.422729),ArriveTangent=(X=-0.027698,Y=0.000000,Z=-0.054160),LeaveTangent=(X=-0.027698,Y=0.000000,Z=-0.054160),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=-0.208740,Y=-14.205322,Z=89.099121),ArriveTangent=(X=-0.025743,Y=-0.038124,Z=0.000000),LeaveTangent=(X=-0.025743,Y=-0.038124,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=16.568983,OutVal=(X=-0.230713,Y=-14.227295,Z=89.099121),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.854612),(Time=2.395019),(Time=3.324989),(Time=3.987206),(Time=5.965877),(Time=6.997293),(Time=8.490665),(Time=9.510000),(Time=11.000000),(Time=11.999799),(Time=12.999741),(Time=14.008358),(Time=15.000000),(Time=16.568983)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_6
         EventTrack(0)=(Time=3.320000,EventName="FillPalletCall")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_6"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_5
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_5"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_4
         EventTrack(0)=(Time=15.027852,EventName="Tier5_Check")
         EventTrack(1)=(Time=16.459711,EventName="Tier5_Lights")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_4"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_3
         EventTrack(0)=(Time=13.062174,EventName="Tier4_Check")
         EventTrack(1)=(Time=14.038032,EventName="Tier4_Lights")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_3"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_2
         EventTrack(0)=(Time=11.081915,EventName="Tier3_Check")
         EventTrack(1)=(Time=12.164933,EventName="Tier3_Lights")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_2"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=8.523851,EventName="Tier2_Check")
         EventTrack(1)=(Time=9.539996,EventName="Tier2_Lights")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=5.987872,EventName="Tier1_Check")
         EventTrack(1)=(Time=6.957873,EventName="Tier1_Lights")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_1'
      InterpTracks(3)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_2'
      InterpTracks(4)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_3'
      InterpTracks(5)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_4'
      InterpTracks(6)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_5'
      InterpTracks(7)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_6'
      GroupName="VaultDoorCam"
      GroupColor=(B=121,G=0,R=206,A=255)
      bCollapsed=True
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=0.025091,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_1')
         AkEvents(1)=(Time=0.856996,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Open_2')
         AkEvents(2)=(Time=1.911914,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Long')
         AkEvents(3)=(Time=3.357438,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         AkEvents(4)=(Time=6.007682,Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Cam_Short')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackAkEvent_0'
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
   InterpLength=8.489688
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_14'
   InterpGroups(3)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=8.463371
   BakeAndPruneStatus(0)=(AnimSetName="ECON_emote.ECON_Emotes")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-6040
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_17
   InputLinks(0)=(DrawY=-7046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6948,bHidden=True,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-7046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_24'),DrawX=-2735,OverrideDelta=36)
   VariableLinks(1)=(bHidden=True,DrawX=-5721,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2784
   ObjPosY=-7080
   DrawWidth=99
   DrawHeight=61
   Name="SeqCond_CompareBool_17"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_32
   VarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3768
   ObjPosY=-9144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_32"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_24
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-6992
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_24"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_12
   VarName="Tier3_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3664
   ObjPosY=-9168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_12"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_27
   VarName="Tier4_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3560
   ObjPosY=-9136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_27"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   VarName="Tier5_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3456
   ObjPosY=-9168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="Pause Track"
   MaxWidth=198
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=3)),DrawY=-6214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4557,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4656
   ObjPosY=-6280
   ObjComment="Pause Track"
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="Pause Track"
   InputLinks(0)=(DrawY=-6862,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6862,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2231,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-6896
   ObjComment="Pause Track"
   DrawWidth=259
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_25
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier3_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2792
   ObjPosY=-6800
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_25"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_18
   InputLinks(0)=(DrawY=-6874,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-6884,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-6864,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_25'),DrawX=-2763,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2713,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2792
   ObjPosY=-6920
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_18"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_19
   InputLinks(0)=(DrawY=-6666,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-6676,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-6656,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_26'),DrawX=-2771,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2721,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2800
   ObjPosY=-6712
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_19"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_26
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier4_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2800
   ObjPosY=-6592
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_26"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_20
   InputLinks(0)=(DrawY=-6458,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-6468,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-6448,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_27'),DrawX=-2755,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2705,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2784
   ObjPosY=-6504
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_20"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_27
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier5_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2784
   ObjPosY=-6384
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_27"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=268
   SizeY=1010
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2864
   ObjPosY=-7296
   ObjComment="Pause Track if Tier is not unlocked"
   DrawWidth=268
   DrawHeight=1010
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_14
   InputLinks(0)=(DrawY=-8566,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_33'),DrawX=-2806,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_0',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_5'),DrawX=-2750,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=-8600
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_14"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2776
   ObjPosY=-8488
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_33
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-8520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_33"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_30
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-8304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_30"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-8248
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_9"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_12
   InputLinks(0)=(DrawY=-8350,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_30'),DrawX=-2846,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_9',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_10',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_19'),DrawX=-2790,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-8384
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_12"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier3_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2728
   ObjPosY=-8224
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_10"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier3_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2608
   ObjPosY=-8040
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_13
   InputLinks(0)=(DrawY=-8110,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_31'),DrawX=-2630,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_14',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_13',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_15',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_18'),DrawX=-2574,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2664
   ObjPosY=-8144
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_13"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2688
   ObjPosY=-7992
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_14"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_31
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2736
   ObjPosY=-8048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_31"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_15
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier4_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=-7984
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_15"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_29
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier4_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2792
   ObjPosY=-7720
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_29"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_34
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-7856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_34"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-7800
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_34"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_16
   InputLinks(0)=(DrawY=-7902,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7902,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_34'),DrawX=-2846,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_34',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_35',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_29',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_36',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_37'),DrawX=-2790,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-7936
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_16"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier3_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2728
   ObjPosY=-7776
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_35"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_36
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier5_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2888
   ObjPosY=-7728
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_36"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_10
   VarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3864
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_10"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_29
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-8792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_29"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_11
   InputLinks(0)=(DrawY=-8838,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_29'),DrawX=-2806,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_8'),DrawX=-2750,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2840
   ObjPosY=-8872
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_11"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=-8760
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_8"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_37
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2704
   ObjPosY=-7688
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_37"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_18
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2616
   ObjPosY=-7976
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_18"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_19
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2888
   ObjPosY=-8192
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_19"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_5
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2688
   ObjPosY=-8472
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_5"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_21
   InputLinks(0)=(DrawY=-7206,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7164,bHidden=True,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-7206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_28'),DrawX=-2735,OverrideDelta=36)
   VariableLinks(1)=(bHidden=True,DrawX=-5705,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2784
   ObjPosY=-7240
   DrawWidth=99
   DrawHeight=61
   Name="SeqCond_CompareBool_21"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_28
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-7152
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_28"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_10
   Commands(0)="ActiveLightActorsForTier 0"
   InputLinks(0)=(DrawY=-6102,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6102,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_11'),DrawX=-2728,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2792
   ObjPosY=-6136
   ObjComment="ActiveLightActorsForTier 1"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_10"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_11
   Commands(0)="ActiveLightActorsForTier 1"
   InputLinks(0)=(DrawY=-5974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5974,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_11'),DrawX=-2736,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2800
   ObjPosY=-6008
   ObjComment="ActiveLightActorsForTier 2"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_11"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_12
   Commands(0)="ActiveLightActorsForTier 2"
   InputLinks(0)=(DrawY=-5838,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_11'),DrawX=-2744,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2808
   ObjPosY=-5872
   ObjComment="ActiveLightActorsForTier 3"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_12"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_13
   Commands(0)="ActiveLightActorsForTier 3"
   InputLinks(0)=(DrawY=-5718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_11'),DrawX=-2744,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2808
   ObjPosY=-5752
   ObjComment="ActiveLightActorsForTier 4"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_13"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_9
   Commands(0)="ActiveLightActorsForTier 4"
   InputLinks(0)=(DrawY=-5606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_11'),DrawX=-2744,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2808
   ObjPosY=-5640
   ObjComment="ActiveLightActorsForTier 5"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_9"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=274
   SizeY=656
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2864
   ObjPosY=-6184
   ObjComment="Turn on Tier Lights"
   DrawWidth=274
   DrawHeight=656
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_35
   bValue=1
   VarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2160
   ObjPosY=-4384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_35"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_21
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="ForceStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3544
   ObjPosY=-6064
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_21"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_2
   VarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1912
   ObjPosY=-4376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_2"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_22
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-6032
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_22"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=419
   SizeY=173
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2232
   ObjPosY=-4440
   ObjComment="Variables"
   DrawWidth=419
   DrawHeight=173
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3608
   ObjPosY=-4344
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_13
   InputLinks(0)=(DrawY=-4426,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_16')),DrawY=-4416,OverrideDelta=33)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1')),DrawY=-4436,OverrideDelta=13)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_2'),DrawX=-3595,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3545,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3624
   ObjPosY=-4472
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_13"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier5_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3640
   ObjPosY=-3544
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_1"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_6
   InputLinks(0)=(DrawY=-3618,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_0')),DrawY=-3628,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_5')),DrawY=-3608,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_1'),DrawX=-3611,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3561,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3640
   ObjPosY=-3664
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_6"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier4_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3656
   ObjPosY=-3752
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_4"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_15
   InputLinks(0)=(DrawY=-3826,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_6')),DrawY=-3836,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_4')),DrawY=-3816,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_4'),DrawX=-3627,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3577,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3656
   ObjPosY=-3872
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_15"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_14
   InputLinks(0)=(DrawY=-4034,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_15')),DrawY=-4044,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_3')),DrawY=-4024,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_3'),DrawX=-3619,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3569,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-4080
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_14"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier3_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-3960
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_20
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3616
   ObjPosY=-4152
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_20"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_16
   InputLinks(0)=(DrawY=-4226,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_14')),DrawY=-4216,OverrideDelta=33)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1')),DrawY=-4236,OverrideDelta=13)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_20'),DrawX=-3603,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3553,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3632
   ObjPosY=-4272
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_16"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="ForcedStartPosition"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3200
   ObjPosY=-4272
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_43"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_1
   InputLinks(0)=(DrawY=-4366,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_23')),DrawY=-4366,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_4'),DrawX=-3254,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_43'),DrawX=-3198,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-4400
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_1"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_4
   FloatValue=5.970000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-4288
   ObjComment="Tier 1 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_4"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_15
   InputLinks(0)=(DrawY=-4422,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_13')),DrawY=-4422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_36'),DrawX=-4030,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_30'),DrawX=-3974,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4064
   ObjPosY=-4456
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
   ObjPosX=-3976
   ObjPosY=-4312
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
   ObjPosX=-4064
   ObjPosY=-4376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_36"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=505
   SizeY=1371
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2960
   ObjPosY=-8952
   ObjComment="Set Tier Variables"
   DrawWidth=505
   DrawHeight=1371
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=545
   SizeY=145
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-9208
   ObjComment="Tier Control Variables"
   DrawWidth=545
   DrawHeight=145
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="PlayVault"
   MaxWidth=178
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-6590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4463,OverrideDelta=57)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4552
   ObjPosY=-6656
   ObjComment="PlayVault"
   DrawWidth=109
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="PlayVault"
   InputLinks(0)=(DrawY=-3742,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3742,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1881,OverrideDelta=87)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2000
   ObjPosY=-3776
   ObjComment="PlayVault"
   DrawWidth=239
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_5
   FloatValue=8.490000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3320
   ObjPosY=-4056
   ObjComment="Tier 2 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_5"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_3
   InputLinks(0)=(DrawY=-4134,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_24')),DrawY=-4134,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_5'),DrawX=-3262,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_31'),DrawX=-3206,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-4168
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
   ObjPosX=-3192
   ObjPosY=-4064
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_31"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_6
   FloatValue=11.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-3856
   ObjComment="Tier 3 Idle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_6"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_4
   InputLinks(0)=(DrawY=-3934,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_25')),DrawY=-3934,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_6'),DrawX=-3254,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=-3198,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-3968
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
   ObjPosX=-3184
   ObjPosY=-3848
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
   ObjPosX=-3184
   ObjPosY=-3608
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_33"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_5
   InputLinks(0)=(DrawY=-3694,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_26')),DrawY=-3694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_7'),DrawX=-3254,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=-3198,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-3728
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_5"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_7
   FloatValue=13.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-3616
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
   ObjPosX=-3176
   ObjPosY=-3376
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_23"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_0
   InputLinks(0)=(DrawY=-3462,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_22')),DrawY=-3462,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_3'),DrawX=-3246,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_23'),DrawX=-3190,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-3496
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_0"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_3
   FloatValue=15.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-3384
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
   ObjPosX=-3352
   ObjPosY=-4424
   ObjComment="Set Time for Specific Camera Idle"
   DrawWidth=304
   DrawHeight=1136
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=228
   SizeY=1138
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-4488
   ObjComment="Check Which Tier is Open"
   DrawWidth=228
   DrawHeight=1138
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-5896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_11"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_42
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier1_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2464
   ObjPosY=-9112
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_42"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_41
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier5_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2648
   ObjPosY=-9152
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_41"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_40
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier3_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-9200
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_40"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_17
   InputLinks(0)=(DrawY=-9326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9326,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_37'),DrawX=-2606,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_39',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_40',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_38',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_41',SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_42'),DrawX=-2550,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2640
   ObjPosY=-9360
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_17"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_39
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier2_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2576
   ObjPosY=-9224
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_39"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_37
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2640
   ObjPosY=-9280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_37"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_38
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Tier4_Unlocked"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-9144
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_38"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="SetAllTiersFalse"
   MaxWidth=221
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_17')),DrawY=-9286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2834,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=-9352
   ObjComment="SetAllTiersFalse"
   DrawWidth=130
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="SetAllTiersFalse"
   InputLinks(0)=(DrawY=-8838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_11')),DrawY=-8838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3515,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3656
   ObjPosY=-8872
   ObjComment="SetAllTiersFalse"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=604
   SizeY=372
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2968
   ObjPosY=-9384
   ObjComment="Reset all Variables when changing Tiers"
   DrawWidth=604
   DrawHeight=372
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="SetAllTiersFalse"
   InputLinks(0)=(DrawY=-8566,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_14')),DrawY=-8566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3523,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3664
   ObjPosY=-8600
   ObjComment="SetAllTiersFalse"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="SetAllTiersFalse"
   InputLinks(0)=(DrawY=-8350,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_12')),DrawY=-8350,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3531,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-8384
   ObjComment="SetAllTiersFalse"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="SetAllTiersFalse"
   InputLinks(0)=(DrawY=-8110,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_13')),DrawY=-8110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3523,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3664
   ObjPosY=-8144
   ObjComment="SetAllTiersFalse"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="SetAllTiersFalse"
   InputLinks(0)=(DrawY=-7902,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_16')),DrawY=-7902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3531,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-7936
   ObjComment="SetAllTiersFalse"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=398
   SizeY=1184
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-8936
   ObjComment="Reset Tiers"
   DrawWidth=398
   DrawHeight=1184
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4584
   ObjPosY=-6776
   ObjComment="HasVaultDosh"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_0"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_2
   InputLinks(0)=(DrawY=-6854,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-6854,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-4526,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_7'),DrawX=-4470,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4560
   ObjPosY=-6888
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
   ObjPosX=-4472
   ObjPosY=-6760
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
   ObjPosX=-4600
   ObjPosY=-6920
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
   ObjPosX=-4680
   ObjPosY=-6304
   ObjComment="Camera Pause for Tiers"
   DrawWidth=258
   DrawHeight=188
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=2162
   SizeY=812
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2856
   ObjPosY=-5480
   ObjComment="Tell Script to Fill Pallet"
   DrawWidth=2162
   DrawHeight=812
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="Pause Track"
   InputLinks(0)=(DrawY=-5414,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-5414,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2463,OverrideDelta=97)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2592
   ObjPosY=-5448
   ObjComment="Pause Track"
   DrawWidth=259
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_4
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-4270,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-4270,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_4'),bHidden=False,DrawX=-2480,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_15'),DrawX=-2425,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-4304
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_4"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2448
   ObjPosY=-4208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_15"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_16
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2448
   ObjPosY=-3968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_16"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_5
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-4030,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-4030,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_5'),bHidden=False,DrawX=-2480,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_16'),DrawX=-2425,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-4064
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_5"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_17
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-3768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_17"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_6
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-3830,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-3830,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_6'),bHidden=False,DrawX=-2488,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_17'),DrawX=-2433,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-3864
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_6"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_7
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-3590,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-3590,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_7'),bHidden=False,DrawX=-2488,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_18'),DrawX=-2433,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-3624
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_7"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_18
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-3528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_18"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_Log Name=SeqAct_Log_3
   LogMessage="Tier Forced Start Position"
   InputLinks(0)=(DrawY=-3358,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-3358,OverrideDelta=11)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_3'),bHidden=False,DrawX=-2488,OverrideDelta=16)
   VariableLinks(2)=()
   VariableLinks(3)=()
   VariableLinks(4)=()
   VariableLinks(5)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_9'),DrawX=-2433,OverrideDelta=65)
   VariableLinks(6)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-3392
   ObjComment="Tier Forced Start Position"
   DrawWidth=125
   DrawHeight=61
   Name="SeqAct_Log_3"
   ObjectArchetype=SeqAct_Log'Engine.Default__SeqAct_Log'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-3296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_9"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_23
   InputLinks(0)=(DrawY=-4266,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_4')),DrawY=-4276,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-4256,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_11'),DrawX=-2787,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2737,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-4312
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_23"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_28
   VarName="bDebuging"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2032
   ObjPosY=-4384
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
   ObjPosX=-2816
   ObjPosY=-4192
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
   ObjPosX=-2816
   ObjPosY=-3968
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_12"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_24
   InputLinks(0)=(DrawY=-4026,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_5')),DrawY=-4036,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-4016,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_12'),DrawX=-2787,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2737,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-4072
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
   ObjPosX=-2832
   ObjPosY=-3760
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_16"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_25
   InputLinks(0)=(DrawY=-3826,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_6')),DrawY=-3836,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-3816,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_16'),DrawX=-2803,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2753,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-3872
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
   ObjPosX=-2832
   ObjPosY=-3480
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_17"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_26
   InputLinks(0)=(DrawY=-3586,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_7')),DrawY=-3596,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-3576,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_17'),DrawX=-2803,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2753,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-3632
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
   ObjPosX=-2832
   ObjPosY=-3256
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_6"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_22
   InputLinks(0)=(DrawY=-3354,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Log'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Log_3')),DrawY=-3364,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-3344,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_6'),DrawX=-2803,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2753,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2832
   ObjPosY=-3400
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
   ObjPosX=-2856
   ObjPosY=-4336
   ObjComment="Debugging"
   DrawWidth=508
   DrawHeight=1180
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_2
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3976
   ObjPosY=-7920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_2"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_0
   InputLinks(0)=(DrawY=-7982,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7956,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-7934,bHidden=True,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),DrawY=-7982,OverrideDelta=11)
   OutputLinks(3)=(DrawY=-7912,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-7890,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-3975,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_2'),DrawX=-3950,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4008
   ObjPosY=-8016
   DrawWidth=91
   DrawHeight=61
   Name="SeqCond_CompareInt_0"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_5
   InputLinks(0)=(DrawY=-8186,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-8044,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_0')),DrawY=-8196,OverrideDelta=13)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),DrawY=-8176,OverrideDelta=33)
   OutputLinks(3)=(DrawY=-7978,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-7956,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-3983,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=-3958,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4016
   ObjPosY=-8232
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_5"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_6
   IntValue=4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-8088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_6"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_5
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-8304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_5"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_4
   InputLinks(0)=(DrawY=-8386,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-8314,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_5')),DrawY=-8396,OverrideDelta=13)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),DrawY=-8376,OverrideDelta=33)
   OutputLinks(3)=(DrawY=-8248,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-8226,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-3983,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_5'),DrawX=-3958,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4016
   ObjPosY=-8432
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_4"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_4
   IntValue=2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3968
   ObjPosY=-8512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_4"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_3
   InputLinks(0)=(DrawY=-8578,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-8522,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_4')),DrawY=-8588,OverrideDelta=13)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=-8568,OverrideDelta=33)
   OutputLinks(3)=(DrawY=-8456,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-8434,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-3959,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_4'),DrawX=-3934,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3992
   ObjPosY=-8624
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_3"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_3
   IntValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3952
   ObjPosY=-8704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_3"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4672
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_1"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_2
   InputLinks(0)=(DrawY=-8806,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8780,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_3')),DrawY=-8827,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=-8806,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=-8785,OverrideDelta=56)
   OutputLinks(4)=(DrawY=-8714,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-3983,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_3'),DrawX=-3958,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4016
   ObjPosY=-8864
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_2"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=258
   SizeY=1132
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-8928
   ObjComment="Evaluate for Tier"
   DrawWidth=258
   DrawHeight=1132
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqAction_DoshVault Name=KFSeqAction_DoshVault_0
   InputLinks(0)=(DrawY=-5414,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0'),(LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=-5414,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2824
   ObjPosY=-5448
   DrawWidth=128
   DrawHeight=45
   Name="KFSeqAction_DoshVault_0"
   ObjectArchetype=KFSeqAction_DoshVault'KFGame.Default__KFSeqAction_DoshVault'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Stack_Loop'
   InputLinks(0)=(DrawY=-5070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5070,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2424,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2472
   ObjPosY=-5104
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_UI_Menu.Dosh_Vault.Play_Dosh_Vault_Stack_Loop'
   InputLinks(0)=(DrawY=-5694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1928,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1976
   ObjPosY=-5728
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_UI_Menu.Dosh_Vault.Stop_Dosh_Vault_Stack_Loop'
   InputLinks(0)=(DrawY=-5598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5598,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1936,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1984
   ObjPosY=-5632
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_0
   MaxWidth=177
   OutputLinks(0)=(DrawY=-5713,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-5691,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-5669,OverrideDelta=60)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-5647,OverrideDelta=82)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=-5625,OverrideDelta=104)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-5603,OverrideDelta=126)
   VariableLinks(0)=(bWriteable=False,DrawX=-2192,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2280
   ObjPosY=-5784
   DrawWidth=135
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_0"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-5411,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5390,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5369,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5390,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-2058,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2007,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1958,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2096
   ObjPosY=-5448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_5
   MaxWidth=177
   OutputLinks(0)=(DrawY=-5361,bHidden=True,OverrideDelta=16)
   OutputLinks(1)=(DrawY=-5339,bHidden=True,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=1)),DrawY=-5294,OverrideDelta=11)
   OutputLinks(3)=(DrawY=-5295,bHidden=True,OverrideDelta=82)
   OutputLinks(4)=(DrawY=-5273,bHidden=True,OverrideDelta=104)
   OutputLinks(5)=(DrawY=-5251,bHidden=True,OverrideDelta=126)
   VariableLinks(0)=(bWriteable=False,bHidden=True,DrawX=-1912,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2360
   ObjPosY=-5360
   DrawWidth=135
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_5"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_33
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_DoshVault_M'
   InputLinks(0)=(DrawY=-4062,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_32')),DrawY=-4062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-843,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-888
   ObjPosY=-4096
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_33"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_32
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_DoshVault_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-4062,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-4062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-707,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-752
   ObjPosY=-4096
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_32"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_104
   ConsoleEventName="open_vaultcrate"
   EventDesc="vault crate"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_33')),DrawY=-4014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1063,OverrideDelta=81)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=-4080
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_Console_104"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_87
   ConsoleEventName="open_vaultcrate"
   EventDesc="vault crate"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-2110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2343,OverrideDelta=81)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2456
   ObjPosY=-2176
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
   ObjPosX=1672
   ObjPosY=-3720
   ObjComment="new crates"
   DrawWidth=430
   DrawHeight=244
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_78
   ConsoleEventName="open_neon"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_47')),DrawY=-3614,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1799,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=-3680
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_78"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_47
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Neon_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-3614,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-3614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=2029,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   ObjPosY=-3648
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_47"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   ObjPosY=-3560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_99
   ConsoleEventName="open_neon"
   EventDesc="neon usb"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-2302,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2089,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2184
   ObjPosY=-2368
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
   ObjPosX=-2488
   ObjPosY=-2392
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-2302,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2353,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2464
   ObjPosY=-2368
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
   ObjPosX=-1256
   ObjPosY=-4336
   ObjComment="New Crates"
   DrawWidth=824
   DrawHeight=827
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_108
   ConsoleEventName="open_horzine16"
   EventDesc="slaughterhouse crate"
   MaxWidth=222
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_68')),DrawY=-4198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1057,OverrideDelta=79)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1168
   ObjPosY=-4264
   DrawWidth=131
   DrawHeight=128
   Name="SeqEvent_Console_108"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_69
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Slaughterhouse_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-4246,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-4246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-699,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-744
   ObjPosY=-4280
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_69"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_68
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Slaughterhouse_M'
   InputLinks(0)=(DrawY=-4246,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_69')),DrawY=-4246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-835,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-880
   ObjPosY=-4280
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_68"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2064
   ObjPosY=-5216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1968
   ObjPosY=-5216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_3
   MaxWidth=177
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_2')),DrawY=-6513,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_15')),DrawY=-6491,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-6469,OverrideDelta=60)
   OutputLinks(3)=(DrawY=-6447,OverrideDelta=82)
   OutputLinks(4)=(DrawY=-6425,OverrideDelta=104)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2)),DrawY=-6403,OverrideDelta=126)
   VariableLinks(0)=(DrawX=-4992,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5080
   ObjPosY=-6584
   DrawWidth=135
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_3"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=KFSeqEvent_DoshVault Name=KFSeqEvent_DoshVault_2
   MaxWidth=177
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_2')),DrawY=-8657,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_2')),DrawY=-8635,OverrideDelta=38)
   OutputLinks(2)=(DrawY=-8613,OverrideDelta=60)
   OutputLinks(3)=(DrawY=-8591,OverrideDelta=82)
   OutputLinks(4)=(DrawY=-8569,OverrideDelta=104)
   OutputLinks(5)=(DrawY=-8547,OverrideDelta=126)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-4632,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-8728
   DrawWidth=135
   DrawHeight=264
   Name="KFSeqEvent_DoshVault_2"
   ObjectArchetype=KFSeqEvent_DoshVault'KFGame.Default__KFSeqEvent_DoshVault'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3392
   ObjPosY=-5864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-5971,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5950,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5929,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5950,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=-3362,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3311,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3262,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3400
   ObjPosY=-6008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_109
   ConsoleEventName="Santi"
   MaxWidth=153
   OutputLinks(0)=(DrawY=-6750,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4004,OverrideDelta=44)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4080
   ObjPosY=-6816
   DrawWidth=96
   DrawHeight=128
   Name="SeqEvent_Console_109"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_85
   ConsoleEventName="open_psncrate_ws5"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2355,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-1960
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_85"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_67
   ConsoleEventName="open_psncrate_cs3"
   EventDesc="psncrate_cs3"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2060,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2184
   ObjPosY=-1960
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_67"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_35
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-3838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-3838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-667,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-712
   ObjPosY=-3872
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_35"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_70
   ConsoleEventName="open_psncrate_cs3"
   EventDesc="psncrate_cs3"
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_34')),DrawY=-3830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1036,OverrideDelta=92)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1160
   ObjPosY=-3896
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_Console_70"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_34
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Slaughterhouse_M'
   InputLinks(0)=(DrawY=-3838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_35')),DrawY=-3838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-795,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-840
   ObjPosY=-3872
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_34"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_49
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Neon_M'
   InputLinks(0)=(DrawY=-3646,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_48')),DrawY=-3646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-779,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-824
   ObjPosY=-3680
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_49"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_81
   ConsoleEventName="open_psncrate_ws5"
   EventDesc="psncrate_ws5"
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_49')),DrawY=-3638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1019,OverrideDelta=93)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1144
   ObjPosY=-3704
   DrawWidth=145
   DrawHeight=128
   Name="SeqEvent_Console_81"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_48
   NewMaterial=MaterialInstanceConstant'ECON_MAT_PSN.HorzineSupply1_Key_PSN_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-3646,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-3646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-651,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-696
   ObjPosY=-3680
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_48"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object
