Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bLooping=True
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-946,OverrideDelta=15)
   InputLinks(1)=(DrawY=-924,OverrideDelta=37)
   InputLinks(2)=(DrawY=-902,OverrideDelta=59)
   InputLinks(3)=(DrawY=-880,OverrideDelta=81)
   InputLinks(4)=(DrawY=-858,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-930,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-874,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=287,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),LinkDesc="craftcam",MinVars=0,DrawX=348,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),LinkDesc="Trader",MinVars=0,DrawX=415,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=256
   ObjPosY=-984
   ObjComment="idle craft anim"
   DrawWidth=197
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
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=-0.664616,OutVal=(X=-1447.302856,Y=-174.711395,Z=-1646.217041),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=-1227.472900,Y=139.130859,Z=-1866.216919),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=-0.664616,OutVal=(X=0.000000,Y=0.000000,Z=33.750000),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=-0.664616),))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="craftcam"
      GroupColor=(B=222,G=79,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(StartTime=-4.067451,AnimSeqName="Open",AnimPlayRate=1.000000,bReverse=True)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999756),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=129,G=0,R=202,A=255)
      GroupAnimSets(0)=AnimSet'ENV_Trader_ANIM.TraderPod_Anim_Master'
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
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
   InterpGroups(0)=InterpGroupDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(2)=InterpGroup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_Trader_ANIM.TraderPod_Anim_Master")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=208
   ObjPosY=-752
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-418,OverrideDelta=15)
   InputLinks(1)=(DrawY=-396,OverrideDelta=37)
   InputLinks(2)=(DrawY=-374,OverrideDelta=59)
   InputLinks(3)=(DrawY=-352,OverrideDelta=81)
   InputLinks(4)=(DrawY=-330,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=-402,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-346,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=743,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),LinkDesc="loopcam",MinVars=0,DrawX=802,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="Trader",MinVars=0,DrawX=866,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=712
   ObjPosY=-456
   ObjComment="looping crafting animation"
   DrawWidth=192
   DrawHeight=157
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="loopcam"
      GroupColor=(B=176,G=163,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Loop_Crafting",AnimPlayRate=2.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((OutVal=(X=-879.999817,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_5.InterpTrackMove_5'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_5.InterpTrackAnimControl_1'
      GroupName="Trader"
      GroupColor=(B=0,G=233,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
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
   ObjPosX=680
   ObjPosY=-224
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_23
   ConsoleEventName="Craft_Start"
   MaxWidth=194
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=-430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=57,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-40
   ObjPosY=-496
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_23"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="Idle"
   MaxWidth=143
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-1126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=15,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-56
   ObjPosY=-1192
   ObjComment="Idle Craft Camera"
   DrawWidth=91
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-394,OverrideDelta=15)
   InputLinks(1)=(DrawY=-372,OverrideDelta=37)
   InputLinks(2)=(DrawY=-350,OverrideDelta=59)
   InputLinks(3)=(DrawY=-328,OverrideDelta=81)
   InputLinks(4)=(DrawY=-306,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-387,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-350,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),LinkDesc="stinger",DrawY=-313,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=1391,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),LinkDesc="finishcam",MinVars=0,DrawX=1453,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),LinkDesc="Trader",MinVars=0,DrawX=1521,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1360
   ObjPosY=-432
   ObjComment="craft_finish_matinee"
   DrawWidth=199
   DrawHeight=157
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_12
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2.InterpTrackFloatProp_2'
      GroupName="finishcam"
      GroupColor=(B=103,G=0,R=214,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="End_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_6
         PosTrack=(Points=((OutVal=(X=-879.999878,Y=-0.000000,Z=-1911.999756),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=-879.999817,Y=-0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.674790)))
         Name="InterpTrackMove_6"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_6.InterpTrackMove_6'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_6.InterpTrackAnimControl_2'
      GroupName="Trader"
      GroupColor=(B=92,G=0,R=218,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_2
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_2
         CutTrack(0)=(TargetCamGroup="finishcam",ShotNumber=10)
         Name="InterpTrackDirector_2"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_3
         EventTrack(0)=(Time=0.574124,EventName="stinger")
         Name="InterpTrackEvent_3"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroupDirector_2.InterpTrackDirector_2'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroupDirector_2.InterpTrackEvent_3'
      GroupColor=(B=75,G=0,R=224,A=255)
      Name="InterpGroupDirector_2"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
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
   ObjPosX=1288
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-426,OverrideDelta=15)
   InputLinks(1)=(DrawY=-404,OverrideDelta=37)
   InputLinks(2)=(DrawY=-382,OverrideDelta=59)
   InputLinks(3)=(DrawY=-360,OverrideDelta=81)
   InputLinks(4)=(DrawY=-338,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=-410,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-354,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=335,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),LinkDesc="opencam",MinVars=0,DrawX=396,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="Trader",MinVars=0,DrawX=463,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=304
   ObjPosY=-464
   ObjComment="crafting start sequence"
   DrawWidth=197
   DrawHeight=157
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_3
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_3"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),ArriveTangent=(X=188.755875,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000)))
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_3.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_3.InterpTrackFloatProp_3'
      GroupName="opencam"
      GroupColor=(B=133,G=199,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((OutVal=(X=-879.999756,Y=0.000000,Z=-1911.999512),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_4.InterpTrackMove_4'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_4.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=224,R=74,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
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
   ObjPosX=288
   ObjPosY=-216
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
   InputLinks(0)=(DrawY=-386,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=-396,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=-376,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=1085,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=1135,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1056
   ObjPosY=-432
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1168
   ObjPosY=-296
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
   InputLinks(0)=(DrawY=-2046,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2046,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=2469,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2424
   ObjPosY=-2080
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_17"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_36
   ConsoleEventName="open_cyberbone"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_17')),DrawY=-2046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2258,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=-2112
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_36"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply1_Crate_M'
   InputLinks(0)=(DrawY=-2318,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_5')),DrawY=-2318,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=269,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=-2352
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_4"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_28
   ConsoleEventName="open_sow"
   MaxWidth=185
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_8')),DrawY=-2254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2252,OverrideDelta=60)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2160
   ObjPosY=-2320
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_Console_28"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_29
   ConsoleEventName="open_zedkiller"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_9')),DrawY=-2430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2297,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2192
   ObjPosY=-2496
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_29"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_32
   ConsoleEventName="open_horzine1"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_4')),DrawY=-2334,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-21,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=-2400
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_32"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_25
   ConsoleEventName="open_horzine2"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_3')),DrawY=-2502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-29,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=-2568
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_25"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_30
   ConsoleEventName="open_dragonfire"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_10')),DrawY=-2614,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2320,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2208
   ObjPosY=-2680
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_30"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_31
   ConsoleEventName="open_horzineissue"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_11')),DrawY=-2822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2319,OverrideDelta=87)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2200
   ObjPosY=-2888
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_Console_31"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
   NewMaterial=MaterialInstanceConstant'ECON_MAT.SOW_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2254,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=2485,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=-2288
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_8"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_9
   NewMaterial=MaterialInstanceConstant'ECON_MAT.ZedKiller_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2430,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2430,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=2477,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2432
   ObjPosY=-2464
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_9"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
   NewMaterial=MaterialInstanceConstant'ECON_MAT.DragonFire_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2614,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=2501,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-2648
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_10"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_11
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineIssue_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-2822,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-2822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=2517,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2472
   ObjPosY=-2856
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_11"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Crate_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2502,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_2')),DrawY=-2502,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=261,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-2536
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
   InputLinks(0)=(DrawY=-2434,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2412,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2390,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2368,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2346,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-2432,OverrideDelta=17)
   OutputLinks(1)=(DrawY=-2404,OverrideDelta=45)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0')),LinkDesc="Shake",DrawY=-2376,OverrideDelta=73)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_CameraShake'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0',InputLinkIdx=1)),LinkDesc="endshake",DrawY=-2348,OverrideDelta=101)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=599,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),LinkDesc="cratecam",MinVars=0,DrawX=662,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),LinkDesc="Crate",MinVars=0,DrawX=727,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=-2472
   ObjComment="open crate start"
   DrawWidth=193
   DrawHeight=157
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-1227.472656,Y=139.130829,Z=-1866.216675),InterpMode=CIM_CurveAutoClamped),(InVal=0.700000,OutVal=(X=-967.905640,Y=206.999985,Z=-1856.215576),ArriveTangent=(X=23.136948,Y=0.000076,Z=0.000000),LeaveTangent=(X=23.136948,Y=0.000076,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.161783,OutVal=(X=-962.905701,Y=207.000000,Z=-1856.215698),ArriveTangent=(X=11.449022,Y=0.000000,Z=0.000000),LeaveTangent=(X=11.449022,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-953.021912,Y=149.235992,Z=-1824.215332),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=0.700000,OutVal=(X=0.000000,Y=-25.004883,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.161783,OutVal=(X=0.000000,Y=-24.999390,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=-36.584473,Z=34.804688),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.700000),(Time=1.161783),(Time=2.000000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="cratecam"
      GroupColor=(B=75,G=0,R=224,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_Crate",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-877.441223,Y=207.429138,Z=-1912.469116),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=-180.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackAnimControl_0'
      InterpTracks(1)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_0'
      GroupName="Crate"
      GroupColor=(B=0,G=207,R=118,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.Crate_AnimTest'
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="cratecam",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=0.435853,EventName="Shake")
         EventTrack(1)=(Time=0.568773,EventName="endshake")
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0.InterpTrackDirector_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0.InterpTrackEvent_0'
      GroupColor=(B=231,G=30,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
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
   ObjPosX=472
   ObjPosY=-2232
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=584
   ObjPosY=-2072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2442,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2420,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2398,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2376,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2354,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-2435,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-2398,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_3')),LinkDesc="stinger",DrawY=-2361,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=1527,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),LinkDesc="cratecam",MinVars=0,DrawX=1590,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),LinkDesc="Crate",MinVars=0,DrawX=1655,OverrideDelta=141)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),LinkDesc="Fanfare",MinVars=0,DrawX=1714,OverrideDelta=193)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1496
   ObjPosY=-2480
   ObjComment="open crate finish"
   DrawWidth=259
   DrawHeight=157
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
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
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-953.021912,Y=149.235992,Z=-1824.215332),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-944.024841,Y=206.817947,Z=-1823.215332),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-981.478638,Y=206.205612,Z=-1867.216064),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=-36.584473,Z=34.804688),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-46.252441,Z=-0.175781),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=-9.492188,Z=0.153809),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=1.500000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_3.InterpTrackFloatProp_0'
      GroupName="cratecam"
      GroupColor=(B=216,G=0,R=102,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="End_Crate",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-877.441284,Y=207.429153,Z=-1912.469238),InterpMode=CIM_CurveAutoClamped),(InVal=1.018686,OutVal=(X=-877.441101,Y=207.429108,Z=-1912.468872),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.018686,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.018686)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5.InterpTrackAnimControl_0'
      GroupName="Crate"
      GroupColor=(B=188,G=149,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.Crate_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="cratecam",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=1.491976,EventName="stinger")
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_1.InterpTrackDirector_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroupDirector_1.InterpTrackEvent_0'
      GroupColor=(B=217,G=0,R=99,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
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
   ObjPosX=1480
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=-1.015487,OutVal=(X=-975.321655,Y=171.143799,Z=-1836.216431),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=-953.021973,Y=149.236008,Z=-1824.215454),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=-1.015487,OutVal=(X=0.000000,Y=-29.531250,Z=21.071777),InterpMode=CIM_CurveAutoClamped),(OutVal=(X=0.000000,Y=-36.584473,Z=34.804688),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=-1.015487),))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackFloatProp_0'
      GroupName="cratecam"
      GroupColor=(B=216,G=0,R=102,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Loop_Crate",AnimPlayRate=3.000000)
         AnimSeqs(1)=(StartTime=0.267131,AnimSeqName="Loop_Crate",AnimPlayRate=3.000000)
         AnimSeqs(2)=(StartTime=0.533937,AnimSeqName="Loop_Crate",AnimPlayRate=3.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=-1.015487,OutVal=(X=-877.441284,Y=207.429153,Z=-1912.469238),InterpMode=CIM_CurveAutoClamped),(InVal=0.003199,OutVal=(X=-877.441223,Y=207.429138,Z=-1912.469116),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=-1.015487,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.003199,OutVal=(X=0.000000,Y=0.000000,Z=180.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=-1.015487),(Time=0.003199)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_5.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_5.InterpTrackAnimControl_0'
      GroupName="Crate"
      GroupColor=(B=188,G=149,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.Crate_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="cratecam",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=0.054642,EventName="Event0")
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroupDirector_1.InterpTrackDirector_1'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroupDirector_1.InterpTrackEvent_1'
      GroupColor=(B=217,G=0,R=99,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
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
   ObjPosX=912
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2442,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2420,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2398,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2376,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2354,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=-2435,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-2398,OverrideDelta=59)
   OutputLinks(2)=(LinkDesc="Event0",DrawY=-2361,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=959,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),LinkDesc="cratecam",MinVars=0,DrawX=1022,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),LinkDesc="Crate",MinVars=0,DrawX=1087,OverrideDelta=141)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=-2480
   ObjComment="open crate loop"
   DrawWidth=193
   DrawHeight=157
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_3
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_3"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),ArriveTangent=(X=188.755875,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.500000)))
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackMove_3'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackFloatProp_3'
      GroupName="opencam"
      GroupColor=(B=133,G=199,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((OutVal=(X=-879.999756,Y=0.000000,Z=-1911.999512),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackMove_4'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=224,R=74,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
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
   ObjPosX=1024
   ObjPosY=-776
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-1002,OverrideDelta=15)
   InputLinks(1)=(DrawY=-980,OverrideDelta=37)
   InputLinks(2)=(DrawY=-958,OverrideDelta=59)
   InputLinks(3)=(DrawY=-936,OverrideDelta=81)
   InputLinks(4)=(DrawY=-914,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-986,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-930,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=1079,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),LinkDesc="opencam",MinVars=0,DrawX=1140,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="Trader",MinVars=0,DrawX=1207,OverrideDelta=138)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1048
   ObjPosY=-1040
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
   ObjPosX=1120
   ObjPosY=-728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_26
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=-1022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=874,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=768
   ObjPosY=-1088
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_26"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1680
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1792
   ObjPosY=-920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_6"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=-962,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=-972,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-952,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=1701,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_6'),DrawX=1751,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1672
   ObjPosY=-1008
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1320
   ObjPosY=-2288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=-2426,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=-2436,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-2416,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=1285,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=1335,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1256
   ObjPosY=-2472
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
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
   InputLinks(0)=(DrawY=-2124,OverrideDelta=13)
   InputLinks(1)=(DrawY=-2104,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-2114,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=974,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1040,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=-2160
   DrawWidth=148
   DrawHeight=85
   Name="SeqAct_CameraShake_0"
   ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=-1976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=-2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=-2368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2464
   ObjPosY=-2560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2480
   ObjPosY=-2760
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
   InputLinks(0)=(DrawY=-2290,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2268,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2246,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2224,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2202,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=-2274,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2218,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=2887,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="Trader",MinVars=0,DrawX=2940,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),LinkDesc="tradercam",MinVars=0,DrawX=3011,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2856
   ObjPosY=-2328
   ObjComment="usb start"
   DrawWidth=205
   DrawHeight=157
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_10
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Start_USB",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.583832,OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.583832,OutVal=(X=0.000000,Y=0.000000,Z=-67.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.583832)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=147,R=189,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1227.472412,Y=139.130798,Z=-1866.216431),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-1175.426514,Y=45.936668,Z=-1729.216064),ArriveTangent=(X=4.485033,Y=0.000000,Z=0.000000),LeaveTangent=(X=4.485033,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.333853,OutVal=(X=-1173.115479,Y=46.776646,Z=-1730.215820),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-5.998535),ArriveTangent=(X=0.000000,Y=-1.367247,Z=1.387540),LeaveTangent=(X=0.000000,Y=-1.367247,Z=1.387540),InterpMode=CIM_CurveAutoClamped),(InVal=2.333853,OutVal=(X=0.000000,Y=-0.703125,Z=-5.295410),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=2.333853)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_1.InterpTrackFloatProp_0'
      GroupName="tradercam"
      GroupColor=(B=178,G=161,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
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
   ObjPosX=2832
   ObjPosY=-2064
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=-2024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=-2128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Loop_USB",AnimPlayRate=2.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.000000,OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-67.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.000000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=147,R=189,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1173.115479,Y=46.776646,Z=-1730.215820),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=-0.703125,Z=-5.295410),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_1.InterpTrackFloatProp_0'
      GroupName="tradercam"
      GroupColor=(B=178,G=161,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
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
   ObjPosX=3200
   ObjPosY=-2088
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2282,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2260,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2238,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2216,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2194,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-2266,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-2210,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=3247,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="Trader",MinVars=0,DrawX=3300,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),LinkDesc="tradercam",MinVars=0,DrawX=3371,OverrideDelta=122)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=-2320
   ObjComment="usb loop"
   DrawWidth=205
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-2306,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=-2316,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=-2296,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=3573,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_7'),DrawX=3623,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3544
   ObjPosY=-2352
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=InterpData Name=InterpData_9
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="End_USB",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=1.500000,OutVal=(X=-879.999878,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=1.500000,OutVal=(X=0.000000,Y=0.000000,Z=-67.500000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=1.500000)))
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="Trader"
      GroupColor=(B=0,G=147,R=189,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1173.115479,Y=46.776646,Z=-1730.215820),InterpMode=CIM_CurveAutoClamped),(InVal=0.750000,OutVal=(X=-1175.426514,Y=45.936668,Z=-1729.216064),ArriveTangent=(X=-7.314659,Y=0.000000,Z=0.000000),LeaveTangent=(X=-7.314659,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-1227.472412,Y=139.130798,Z=-1866.216431),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=-0.703125,Z=-5.295410),InterpMode=CIM_CurveAutoClamped),(InVal=0.750000,OutVal=(X=0.000000,Y=0.000000,Z=-5.998535),ArriveTangent=(X=0.000000,Y=2.230247,Z=-2.266338),LeaveTangent=(X=0.000000,Y=2.230247,Z=-2.266338),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.750000),(Time=1.500000)))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_1.InterpTrackFloatProp_0'
      GroupName="tradercam"
      GroupColor=(B=178,G=161,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
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
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="tradercam",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=0.359484,EventName="stinger")
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroupDirector_0.InterpTrackDirector_0'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroupDirector_0.InterpTrackEvent_1'
      GroupColor=(B=118,G=0,R=207,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
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
   ObjPosX=3824
   ObjPosY=-2096
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-2314,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2292,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2270,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2248,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2226,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-2307,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-2270,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_2')),LinkDesc="stinger",DrawY=-2233,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=3791,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),LinkDesc="Trader",MinVars=0,DrawX=3844,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),LinkDesc="tradercam",MinVars=0,DrawX=3915,OverrideDelta=122)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),LinkDesc="traderparticle",MinVars=0,DrawX=4009,OverrideDelta=205)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3760
   ObjPosY=-2352
   ObjComment="usb finish"
   DrawWidth=310
   DrawHeight=157
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3592
   ObjPosY=-2184
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
   SizeX=2271
   SizeY=1154
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-200
   ObjPosY=-2624
   ObjComment="open horzine supply crates"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=2294
   SizeY=1697
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2096
   ObjPosY=-2968
   ObjComment="open weapon skin usbs"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=-744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=-736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=384
   ObjPosY=-216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=776
   ObjPosY=-224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1416
   ObjPosY=-200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=488
   ObjPosY=-216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=880
   ObjPosY=-224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=-200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=1936
   SizeY=520
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-96
   ObjPosY=-552
   ObjComment="crafting sequence"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=1631
   SizeY=516
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=-1144
   ObjComment="recycling sequence"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=642
   SizeY=596
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-1240
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1062,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-591,OverrideDelta=65)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-688
   ObjPosY=-1128
   DrawWidth=117
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_14
   ConsoleEventName="open_horzine2"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1398,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-597,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-704
   ObjPosY=-1464
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_14"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_18
   ConsoleEventName="open_horzine1"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-589,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-696
   ObjPosY=-1296
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_18"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_22
   ConsoleEventName="Recycle_Start"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-590,OverrideDelta=74)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-696
   ObjPosY=-952
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_Console_22"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_20
   ConsoleEventName="open_horzineissue"
   MaxWidth=239
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-569,OverrideDelta=87)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-688
   ObjPosY=-784
   DrawWidth=139
   DrawHeight=128
   Name="SeqEvent_Console_20"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_17
   ConsoleEventName="open_dragonfire"
   MaxWidth=225
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-568,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-680
   ObjPosY=-576
   DrawWidth=132
   DrawHeight=128
   Name="SeqEvent_Console_17"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_19
   ConsoleEventName="open_zedkiller"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-326,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-591,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-696
   ObjPosY=-392
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_Console_19"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_16
   ConsoleEventName="open_sow"
   MaxWidth=185
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-150,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-636,OverrideDelta=60)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-728
   ObjPosY=-216
   DrawWidth=112
   DrawHeight=128
   Name="SeqEvent_Console_16"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_15
   ConsoleEventName="open_cyberbone"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=58,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-630,OverrideDelta=82)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-744
   ObjPosY=-8
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_Console_15"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=600
   SizeY=1833
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1040
   ObjPosY=-1544
   ObjComment="doing anything cancels idle"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1150,OverrideDelta=11)
   VariableLinks(0)=(DrawX=205,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=128
   ObjPosY=-1216
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_3"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1208
   ObjPosY=-768
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
   InputLinks(0)=(DrawY=-2350,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=421,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=376
   ObjPosY=-2384
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_5"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply2_Key_M'
   InputLinks(0)=(DrawY=-2486,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2486,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=413,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=368
   ObjPosY=-2520
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_2"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1576
   ObjPosY=-752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1472
   ObjPosY=-752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="loopcam"
      GroupColor=(B=176,G=163,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Loop_Crafting",AnimPlayRate=2.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((OutVal=(X=-879.999817,Y=0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_5.InterpTrackMove_5'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_5.InterpTrackAnimControl_1'
      GroupName="Trader"
      GroupColor=(B=0,G=233,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
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
   ObjPosX=1376
   ObjPosY=-752
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-946,OverrideDelta=15)
   InputLinks(1)=(DrawY=-924,OverrideDelta=37)
   InputLinks(2)=(DrawY=-902,OverrideDelta=59)
   InputLinks(3)=(DrawY=-880,OverrideDelta=81)
   InputLinks(4)=(DrawY=-858,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=-930,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-874,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=1439,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),LinkDesc="loopcam",MinVars=0,DrawX=1498,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Trader",MinVars=0,DrawX=1562,OverrideDelta=133)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1408
   ObjPosY=-984
   ObjComment="looping crafting animation"
   DrawWidth=192
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_9
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1',InputLinkIdx=2)),DrawY=-878,OverrideDelta=11)
   VariableLinks(0)=(DrawX=869,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=792
   ObjPosY=-944
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_9"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_10
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6',InputLinkIdx=2)),DrawY=-2558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=709,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=-2624
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_10"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_11
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=2)),DrawY=-1774,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3189,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3112
   ObjPosY=-1840
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_11"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_21
   ConsoleEventName="Abort"
   MaxWidth=155
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12',InputLinkIdx=2)),DrawY=-238,OverrideDelta=11)
   VariableLinks(0)=(DrawX=45,OverrideDelta=45)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-32
   ObjPosY=-304
   DrawWidth=97
   DrawHeight=128
   Name="SeqEvent_Console_21"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2088
   ObjPosY=-776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   ObjPosY=-776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=-1043.853271,Y=15.710335,Z=-1792.216553),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-1227.472778,Y=139.130844,Z=-1866.216797),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=8.085938,Z=-6.328125),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=16.523438,Z=-30.410156),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackMove_2'
      InterpTracks(1)=InterpTrackFloatProp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_2.InterpTrackFloatProp_2'
      GroupName="finishcam"
      GroupColor=(B=103,G=0,R=214,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="End_Crafting",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_6
         PosTrack=(Points=((OutVal=(X=-879.999878,Y=-0.000000,Z=-1911.999756),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=-879.999817,Y=-0.000000,Z=-1911.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped),(InVal=0.674790,OutVal=(X=0.000000,Y=0.000000,Z=56.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.674790)))
         Name="InterpTrackMove_6"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_6.InterpTrackMove_6'
      InterpTracks(1)=InterpTrackAnimControl'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_6.InterpTrackAnimControl_2'
      GroupName="Trader"
      GroupColor=(B=92,G=0,R=218,A=255)
      GroupAnimSets(0)=AnimSet'ECON_ANIM.TraderUSB_AnimTest'
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_2
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_2
         CutTrack(0)=(TargetCamGroup="finishcam",ShotNumber=10)
         Name="InterpTrackDirector_2"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_2
         EventTrack(0)=(Time=0.115324,EventName="stinger")
         Name="InterpTrackEvent_2"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackDirector'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroupDirector_2.InterpTrackDirector_2'
      InterpTracks(1)=InterpTrackEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroupDirector_2.InterpTrackEvent_2'
      GroupColor=(B=75,G=0,R=224,A=255)
      Name="InterpGroupDirector_2"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
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
   ObjPosX=1856
   ObjPosY=-784
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bRewindOnPlay=True
   bRewindIfAlreadyPlaying=True
   InputLinks(0)=(DrawY=-970,OverrideDelta=15)
   InputLinks(1)=(DrawY=-948,OverrideDelta=37)
   InputLinks(2)=(DrawY=-926,OverrideDelta=59)
   InputLinks(3)=(DrawY=-904,OverrideDelta=81)
   InputLinks(4)=(DrawY=-882,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-963,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-926,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Switch'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_1')),LinkDesc="stinger",DrawY=-889,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=1959,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="finishcam",MinVars=0,DrawX=2021,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),LinkDesc="Trader",MinVars=0,DrawX=2089,OverrideDelta=140)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=-1008
   ObjComment="craft_finish_matinee"
   DrawWidth=199
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_7
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2206,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=389,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=-2240
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_7"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
   ConsoleEventName="open_horzine3"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_12')),DrawY=-2142,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-45,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-152
   ObjPosY=-2208
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_2"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_12
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply3_Crate_M'
   InputLinks(0)=(DrawY=-2126,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_7')),DrawY=-2126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=237,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=192
   ObjPosY=-2160
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_12"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Crate_M'
   InputLinks(0)=(DrawY=-1958,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_14')),DrawY=-1958,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=221,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=176
   ObjPosY=-1992
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_13"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_41
   ConsoleEventName="open_horzine4"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_13')),DrawY=-1974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-53,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-160
   ObjPosY=-2040
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_41"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_14
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply4_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-2038,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-2038,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=373,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=-2072
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_14"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_15
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1886,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1886,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=405,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=360
   ObjPosY=-1920
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_15"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_42
   ConsoleEventName="open_horzine5"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_16')),DrawY=-1814,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-37,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-144
   ObjPosY=-1880
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_42"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply5_Crate_M'
   InputLinks(0)=(DrawY=-1806,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_15')),DrawY=-1806,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=253,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=208
   ObjPosY=-1840
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_16"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Crate_M'
   InputLinks(0)=(DrawY=-1614,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_6')),DrawY=-1614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=261,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-1648
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_43
   ConsoleEventName="open_horzine6"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1')),DrawY=-1622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-21,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=-1688
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_43"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_6
   NewMaterial=MaterialInstanceConstant'ECON_MAT.HorzineSupply6_Key_M'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1694,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=-1694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=413,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=368
   ObjPosY=-1728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_6"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2416
   ObjPosY=-1776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_44
   ConsoleEventName="open_streetpunks"
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_18')),DrawY=-1846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2238,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2120
   ObjPosY=-1912
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Console_44"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_18
   NewMaterial=MaterialInstanceConstant'ECON_MAT.StreetPunks_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1846,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=2445,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2400
   ObjPosY=-1880
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_18"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_19
   NewMaterial=MaterialInstanceConstant'ECON_MAT.FirstEncounter_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1638,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1638,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=2437,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2392
   ObjPosY=-1672
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_19"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_45
   ConsoleEventName="open_firstencounter"
   MaxWidth=252
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_19')),DrawY=-1638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2238,OverrideDelta=94)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=-1704
   DrawWidth=146
   DrawHeight=128
   Name="SeqEvent_Console_45"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2408
   ObjPosY=-1568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2416
   ObjPosY=-1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_46
   ConsoleEventName="open_predator"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_20')),DrawY=-1422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2227,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2120
   ObjPosY=-1488
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_46"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_20
   NewMaterial=MaterialInstanceConstant'ECON_MAT.Predator_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1422,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1422,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=2445,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2400
   ObjPosY=-1456
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_20"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_21
   NewMaterial=MaterialInstanceConstant'ECON_MAT.EmergencyIssue_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1406,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1406,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=2909,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2864
   ObjPosY=-1440
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_21"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_47
   ConsoleEventName="open_emergencyissue"
   MaxWidth=264
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_21')),DrawY=-1406,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2716,OverrideDelta=100)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=-1472
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_Console_47"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2856
   ObjPosY=-1336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=SkeletalMeshActor'KFMainMenu.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2872
   ObjPosY=-1560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_48
   ConsoleEventName="open_tacticalhorzine"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_0')),DrawY=-1630,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2704,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-1696
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_Console_48"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   NewMaterial=MaterialInstanceConstant'ECON_MAT.TacticalHorzine_USB_M'
   MaterialIndex=2
   InputLinks(0)=(DrawY=-1630,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11')),DrawY=-1630,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=2901,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2856
   ObjPosY=-1664
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_24
   ConsoleEventName="open_horzine6"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-934,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-893,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-1000
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_24"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_35
   ConsoleEventName="open_horzine5"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-909,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1016
   ObjPosY=-1192
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_35"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_34
   ConsoleEventName="open_horzine4"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-925,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=-1352
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_34"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_33
   ConsoleEventName="open_horzine3"
   MaxWidth=214
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-1454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-917,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=-1520
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_33"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_27
   ConsoleEventName="open_tacticalhorzine"
   MaxWidth=256
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-880,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=-768
   DrawWidth=148
   DrawHeight=128
   Name="SeqEvent_Console_27"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_40
   ConsoleEventName="open_emergencyissue"
   MaxWidth=264
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-868,OverrideDelta=100)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1000
   ObjPosY=-544
   DrawWidth=152
   DrawHeight=128
   Name="SeqEvent_Console_40"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_39
   ConsoleEventName="open_predator"
   MaxWidth=215
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=106,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-901,OverrideDelta=75)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=40
   DrawWidth=127
   DrawHeight=128
   Name="SeqEvent_Console_39"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_38
   ConsoleEventName="open_firstencounter"
   MaxWidth=252
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-102,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-890,OverrideDelta=94)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1016
   ObjPosY=-168
   DrawWidth=146
   DrawHeight=128
   Name="SeqEvent_Console_38"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_37
   ConsoleEventName="open_streetpunks"
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=-310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-890,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1008
   ObjPosY=-376
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
   ObjPosX=2544
   ObjPosY=-736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-830,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-830,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=2560,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2512
   ObjPosY=-864
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=Emitter'KFMainMenu.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4072
   ObjPosY=-2128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=CameraActor'KFMainMenu.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=720
   ObjPosY=-1896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-906,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-916,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),LinkDesc="Link 2",DrawY=-896,OverrideDelta=33)
   VariableLinks(0)=(DrawX=2434,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2400
   ObjPosY=-952
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_1"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_UI_Menu.Play_Recycle_Complete'
   InputLinks(0)=(DrawY=-1062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1062,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=2568,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2520
   ObjPosY=-1096
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4360
   ObjPosY=-2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2406,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=4376,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4328
   ObjPosY=-2440
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_2
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-2250,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-2260,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),LinkDesc="Link 2",DrawY=-2240,OverrideDelta=33)
   VariableLinks(0)=(DrawX=4242,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4208
   ObjPosY=-2296
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_2"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2174,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2174,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=4368,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=-2208
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
   ObjPosX=4352
   ObjPosY=-2080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   ObjPosY=-2488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2582,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2582,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=2000,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1952
   ObjPosY=-2616
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_3
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-2426,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-2436,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),LinkDesc="Link 2",DrawY=-2416,OverrideDelta=33)
   VariableLinks(0)=(DrawX=1866,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-2472
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_3"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-2350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=1992,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1944
   ObjPosY=-2384
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1976
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-542,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-542,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=1824,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1776
   ObjPosY=-576
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=2
   bLooping=True
   InputLinks(0)=(DrawY=-386,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-396,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),LinkDesc="Link 2",DrawY=-376,OverrideDelta=33)
   VariableLinks(0)=(DrawX=1690,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1656
   ObjPosY=-432
   DrawWidth=68
   DrawHeight=85
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_UI_Menu.Play_Crate_Open'
   InputLinks(0)=(DrawY=-310,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-310,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=1816,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1768
   ObjPosY=-344
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=AkAmbientSound'KFMainMenu.TheWorld:PersistentLevel.AkAmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KFMainMenu.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1800
   ObjPosY=-216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   OscillationDuration=1.000000
   RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
   Name="CameraShake_0"
   ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
End Object
