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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),LinkDesc="craftcam",MinVars=0,DrawX=-772,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),LinkDesc="Trader",MinVars=0,DrawX=-705,OverrideDelta=138)
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),LinkDesc="loopcam",MinVars=0,DrawX=586,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="Trader",MinVars=0,DrawX=650,OverrideDelta=133)
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),LinkDesc="finishcam",MinVars=0,DrawX=1485,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),LinkDesc="Trader",MinVars=0,DrawX=1553,OverrideDelta=140)
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),LinkDesc="opencam",MinVars=0,DrawX=180,OverrideDelta=63)
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
   InputLinks(0)=(DrawY=282,OverrideDelta=11)
   OutputLinks(0)=(ActivateDelay=1.000000,DrawY=282,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_9'),DrawX=2490,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=2546,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=248
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=550,OverrideDelta=16)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=1342,OverrideDelta=16)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=614,OverrideDelta=16)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=1358,OverrideDelta=16)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=534,OverrideDelta=16)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=1326,OverrideDelta=16)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=2581,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-67,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=2597,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=2589,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=2613,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=2629,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-75,OverrideDelta=23)
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
   ObjPosX=2200
   ObjPosY=376
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),LinkDesc="cratecam",MinVars=0,DrawX=310,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),LinkDesc="Crate",MinVars=0,DrawX=375,OverrideDelta=141)
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=-2752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),LinkDesc="cratecam",MinVars=0,DrawX=1590,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),LinkDesc="Crate",MinVars=0,DrawX=1655,OverrideDelta=141)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),LinkDesc="Fanfare",MinVars=0,DrawX=1714,OverrideDelta=193)
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),LinkDesc="cratecam",MinVars=0,DrawX=670,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),LinkDesc="Crate",MinVars=0,DrawX=735,OverrideDelta=141)
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
   ObjPosX=2520
   ObjPosY=-1208
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1434,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1412,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1390,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1368,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1346,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_Delay'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3')),DrawY=-1418,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1362,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=2575,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),LinkDesc="opencam",MinVars=0,DrawX=2636,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="Trader",MinVars=0,DrawX=2703,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=-1472
   ObjComment="recycle animation"
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=-1160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_26
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=-1454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2370,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2264
   ObjPosY=-1520
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_26"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=-2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3296
   ObjPosY=-1288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_6"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=-1362,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=-1372,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_12')),DrawY=-1352,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3221,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=3271,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3192
   ObjPosY=-1408
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=696
   ObjPosY=768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=622,OverrideDelta=16)
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-2392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2560
   ObjPosY=-2576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-3176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="Trader",MinVars=0,DrawX=3036,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),LinkDesc="tradercam",MinVars=0,DrawX=3107,OverrideDelta=122)
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=-2504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3208
   ObjPosY=-2600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="Trader",MinVars=0,DrawX=3412,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),LinkDesc="tradercam",MinVars=0,DrawX=3483,OverrideDelta=122)
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
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="Trader",MinVars=0,DrawX=4252,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),LinkDesc="tradercam",MinVars=0,DrawX=4323,OverrideDelta=122)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),LinkDesc="traderparticle",MinVars=0,DrawX=4417,OverrideDelta=205)
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
   ObjPosX=2448
   ObjPosY=352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_9"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=2661
   SizeY=1455
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=-3376
   ObjComment="open horzine supply crates"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=3264
   SizeY=1774
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2208
   ObjPosY=-3384
   ObjComment="open weapon skin usbs"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-712
   ObjPosY=-1360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-808
   ObjPosY=-1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=168
   ObjPosY=-600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=560
   ObjPosY=-608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1448
   ObjPosY=-568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=272
   ObjPosY=-600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=-608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=-568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
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
   ObjPosX=2200
   ObjPosY=-1576
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
   SizeX=599
   SizeY=1973
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2704
   ObjPosY=-1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   InputLinks(0)=(DrawY=77,OverrideDelta=14)
   InputLinks(1)=(DrawY=98,OverrideDelta=35)
   InputLinks(2)=(DrawY=119,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=82,OverrideDelta=19)
   OutputLinks(1)=(DrawY=114,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2388,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2336
   ObjPosY=40
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=77,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=69,OverrideDelta=23)
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
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=-1184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=-1184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="loopcam",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_1.InterpTrackDirector_1'
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
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_5.InterpTrackMove_5'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_5.InterpTrackAnimControl_1'
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
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="loopcam"
      GroupColor=(B=176,G=163,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000648
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_1'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_5'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.999748
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   BakeAndPruneStatus(1)=(AnimSetName="ECON_ANIM.TraderUSB_AnimTest")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2872
   ObjPosY=-1184
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1378,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1356,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1334,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1312,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1290,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=-1362,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1306,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=2935,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),LinkDesc="loopcam",MinVars=0,DrawX=2994,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Trader",MinVars=0,DrawX=3058,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2904
   ObjPosY=-1416
   ObjComment="looping crafting animation"
   DrawWidth=192
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_9
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2)),DrawY=-1310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2365,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=-1376
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=2)),DrawY=-2134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3389,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3312
   ObjPosY=-2200
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_11"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_21
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=2)),DrawY=-622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-155,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-232
   ObjPosY=-688
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_21"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4048
   ObjPosY=-1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3944
   ObjPosY=-1200
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
   ObjPosX=3816
   ObjPosY=-1208
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1394,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1372,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1350,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1328,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1306,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-1387,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-1350,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_1')),LinkDesc="stinger",DrawY=-1313,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=3919,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="finishcam",MinVars=0,DrawX=3981,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),LinkDesc="Trader",MinVars=0,DrawX=4049,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3888
   ObjPosY=-1432
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=45,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-99,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-115,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=37,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=61,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-83,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-75,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=69,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=24
   ObjPosY=-2440
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_23"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=-2192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=2557,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=2549,OverrideDelta=23)
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2520
   ObjPosY=-1984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=-1768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=2557,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=3021,OverrideDelta=23)
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=-1752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2984
   ObjPosY=-1976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=3013,OverrideDelta=23)
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

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_27
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
   Name="SeqEvent_Console_27"
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkSetSwitch Name=SeqAct_AkSetSwitch_3
   SwitchGroup="Crate_Tier"
   Switch="Tier_3"
   InputLinks(0)=(DrawY=522,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetParticleSysParam'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetParticleSysParam_5')),DrawY=522,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=343,OverrideDelta=25)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=359,OverrideDelta=25)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=367,OverrideDelta=25)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=1175,OverrideDelta=25)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=1167,OverrideDelta=25)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=1151,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=504
   DrawWidth=94
   DrawHeight=61
   Name="SeqAct_AkSetSwitch_1"
   ObjectArchetype=SeqAct_AkSetSwitch'AkAudio.Default__SeqAct_AkSetSwitch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=-1152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-1246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=4336,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4288
   ObjPosY=-1280
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=-2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=368
   ObjPosY=-2608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-1322,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-1332,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),LinkDesc="Link 2",DrawY=-1312,OverrideDelta=33)
   VariableLinks(0)=(DrawX=4210,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4176
   ObjPosY=-1368
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_1"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-1478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1478,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=4344,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4296
   ObjPosY=-1512
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4328
   ObjPosY=-1384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=-2728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=4920,OverrideDelta=26)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=4912,OverrideDelta=26)
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4896
   ObjPosY=-2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2008
   ObjPosY=-3208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-3302,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3302,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=2024,OverrideDelta=26)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=2016,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1968
   ObjPosY=-3104
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=-2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=-816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-910,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-910,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=1856,OverrideDelta=26)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=1848,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1800
   ObjPosY=-712
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_24
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Star_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2238,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2238,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=69,OverrideDelta=23)
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-75,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-120
   ObjPosY=-2192
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_25"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Crate_Science_M'
   InputLinks(0)=(DrawY=-2110,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_6')),DrawY=-2110,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=469,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-2144
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_43
   ConsoleEventName="open_horzine7"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1')),DrawY=-2118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=195,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-2184
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_43"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_6
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply_Key_Science_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2190,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2190,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=621,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=-2224
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_6"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3408
   ObjPosY=-1776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
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
   InputLinks(0)=(DrawY=-1974,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1974,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=3317,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3272
   ObjPosY=-2008
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_27"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_21
   NewMaterial=MaterialInstanceConstant'ECON_MAT.SWAT_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1950,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1950,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=3845,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=-1984
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_21"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_54
   ConsoleEventName="open_swat"
   MaxWidth=191
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_21')),DrawY=-1950,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3615,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3520
   ObjPosY=-2016
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_54"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3792
   ObjPosY=-1880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
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
   Duration=5.000000
   InputLinks(0)=(DrawY=-2595,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2574,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2553,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_11')),DrawY=-2590,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2558,OverrideDelta=51)
   VariableLinks(0)=(DrawX=756,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=-2632
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_14
   VarName="ItemTimeout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1488
   ObjPosY=-2472
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
   InputLinks(0)=(DrawY=-3046,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_8')),DrawY=-3046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_4'),DrawX=1336,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1272
   ObjPosY=-3080
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1304
   ObjPosY=-2776
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
   Duration=5.000000
   InputLinks(0)=(DrawY=-2363,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2342,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2321,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_4')),DrawY=-2358,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2326,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3588,OverrideDelta=25)
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
   ObjPosX=3224
   ObjPosY=-920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_16"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=-990,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-990,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_16'),DrawX=3274,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3330,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=-1024
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3104
   ObjPosY=-920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_15"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_7
   InputLinks(0)=(DrawY=-994,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-1004,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5')),DrawY=-984,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3053,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_15'),DrawX=3103,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3024
   ObjPosY=-1040
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_7"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   bStartWillRestart=True
   Duration=5.000000
   InputLinks(0)=(DrawY=-995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-953,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_7')),DrawY=-990,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-958,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2900,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=-1032
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_25
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3608
   ObjPosY=-920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_25"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_26
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3976
   ObjPosY=-928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_26"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_10
   InputLinks(0)=(DrawY=-1030,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_8')),DrawY=-1030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_26'),DrawX=4010,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=4066,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3976
   ObjPosY=-1064
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_10"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3784
   ObjPosY=-936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_7"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_7
   Commands(0)="ItemExchangeTimeOut"
   InputLinks(0)=(DrawY=-1030,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_10')),DrawY=-1030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_7'),DrawX=3840,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3776
   ObjPosY=-1064
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_7"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_12
   InputLinks(0)=(DrawY=-1026,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2),(LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_7')),DrawY=-1036,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-1016,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=3581,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_25'),DrawX=3631,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3552
   ObjPosY=-1072
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
   InputLinks(0)=(DrawY=-1014,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1014,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_8'),DrawX=4240,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4176
   ObjPosY=-1048
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_8"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4216
   ObjPosY=-928
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
   Duration=5.000000
   InputLinks(0)=(DrawY=-427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-385,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_9')),DrawY=-422,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-390,OverrideDelta=51)
   VariableLinks(0)=(DrawX=260,OverrideDelta=25)
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
   InputLinks(0)=(DrawY=-994,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2'),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2)),DrawY=-1004,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=-984,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_14'),DrawX=957,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_18'),DrawX=1007,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=-1040
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

Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   OscillationDuration=1.000000
   RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
   Name="CameraShake_0"
   ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
End Object
