Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=1743
   SizeY=1031
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1296
   ObjPosY=888
   ObjComment="Primary Nuke Sequence"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=997,OverrideDelta=14)
   InputLinks(1)=(DrawY=1018,OverrideDelta=35)
   InputLinks(2)=(DrawY=1039,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=1018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=4734,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4785,OverrideDelta=76)
   EventLinks(0)=(DrawX=4834,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4696
   ObjPosY=960
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=1144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_86'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=1312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4896
   ObjPosY=1584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4888
   ObjPosY=1728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4896
   ObjPosY=1880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4880
   ObjPosY=2008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=8
   bAutoDisableLinks=True
   InputLinks(0)=(DrawY=992,OverrideDelta=49)
   InputLinks(1)=(DrawY=1084,OverrideDelta=141)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=958,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),LinkDesc="Link 2",DrawY=981,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),LinkDesc="Link 3",DrawY=1004,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),LinkDesc="Link 4",DrawY=1027,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),LinkDesc="Link 5",DrawY=1050,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),LinkDesc="Link 6",DrawY=1073,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),LinkDesc="Link 7",DrawY=1096,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),LinkDesc="Link 8",DrawY=1119,OverrideDelta=176)
   VariableLinks(0)=(DrawX=4540,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4496
   ObjPosY=920
   DrawWidth=89
   DrawHeight=245
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=1157,OverrideDelta=14)
   InputLinks(1)=(DrawY=1178,OverrideDelta=35)
   InputLinks(2)=(DrawY=1199,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=1178,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=4742,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4793,OverrideDelta=76)
   EventLinks(0)=(DrawX=4842,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4704
   ObjPosY=1120
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=1317,OverrideDelta=14)
   InputLinks(1)=(DrawY=1338,OverrideDelta=35)
   InputLinks(2)=(DrawY=1359,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),DrawY=1338,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=4750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4801,OverrideDelta=76)
   EventLinks(0)=(DrawX=4850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4712
   ObjPosY=1280
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=1469,OverrideDelta=14)
   InputLinks(1)=(DrawY=1490,OverrideDelta=35)
   InputLinks(2)=(DrawY=1511,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=1490,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=4742,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4793,OverrideDelta=76)
   EventLinks(0)=(DrawX=4842,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4704
   ObjPosY=1432
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=1613,OverrideDelta=14)
   InputLinks(1)=(DrawY=1634,OverrideDelta=35)
   InputLinks(2)=(DrawY=1655,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=1634,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=4742,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4793,OverrideDelta=76)
   EventLinks(0)=(DrawX=4842,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4704
   ObjPosY=1576
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=1749,OverrideDelta=14)
   InputLinks(1)=(DrawY=1770,OverrideDelta=35)
   InputLinks(2)=(DrawY=1791,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=1770,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=4726,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4777,OverrideDelta=76)
   EventLinks(0)=(DrawX=4826,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4688
   ObjPosY=1712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=1877,OverrideDelta=14)
   InputLinks(1)=(DrawY=1898,OverrideDelta=35)
   InputLinks(2)=(DrawY=1919,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=1898,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=4726,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4777,OverrideDelta=76)
   EventLinks(0)=(DrawX=4826,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4688
   ObjPosY=1840
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=2013,OverrideDelta=14)
   InputLinks(1)=(DrawY=2034,OverrideDelta=35)
   InputLinks(2)=(DrawY=2055,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=2034,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),DrawX=4710,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4761,OverrideDelta=76)
   EventLinks(0)=(DrawX=4810,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4672
   ObjPosY=1976
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_1
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareFloat'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareFloat_1')),LinkDesc="Start wave Logic",DrawY=1042,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1387,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1448,OverrideDelta=86)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Float'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_2'),DrawX=1529,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1344
   ObjPosY=976
   DrawWidth=188
   DrawHeight=144
   Name="KFSeqEvent_WaveStart_1"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   InputLinks(0)=(DrawY=758,OverrideDelta=15)
   InputLinks(1)=(DrawY=780,OverrideDelta=37)
   InputLinks(2)=(DrawY=802,OverrideDelta=59)
   InputLinks(3)=(DrawY=824,OverrideDelta=81)
   InputLinks(4)=(DrawY=846,OverrideDelta=103)
   OutputLinks(0)=(DrawY=774,OverrideDelta=31)
   OutputLinks(1)=(DrawY=830,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_10'),DrawX=5071,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="distant_nuke_light",MinVars=0,DrawX=5163,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142'),LinkDesc="Sound",MinVars=0,DrawX=5260,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5040
   ObjPosY=720
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_10
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_0
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_0"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0.InterpTrackToggle_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="distant_nuke_light"
      GroupColor=(B=192,G=143,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         AkEvents(1)=(Time=4.500000,Event=AkEvent'WW_ENV_Manor.Play_ENV_Manor_Thunder')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_2.InterpTrackAkEvent_1'
      GroupName="Sound"
      GroupColor=(B=103,G=0,R=214,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.526468
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_10.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.526468
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5024
   ObjPosY=896
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_10"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5144
   ObjPosY=904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   InputLinks(0)=(DrawY=1014,OverrideDelta=15)
   InputLinks(1)=(DrawY=1036,OverrideDelta=37)
   InputLinks(2)=(DrawY=1058,OverrideDelta=59)
   InputLinks(3)=(DrawY=1080,OverrideDelta=81)
   InputLinks(4)=(DrawY=1102,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1030,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1086,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=5287,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="nuke_distant_light",MinVars=0,DrawX=5379,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150'),LinkDesc="Sound",MinVars=0,DrawX=5476,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5256
   ObjPosY=976
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_1
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_1"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackToggle_1'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="nuke_distant_light"
      GroupColor=(B=0,G=231,R=30,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_2
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         Name="InterpTrackAkEvent_2"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_3.InterpTrackAkEvent_2'
      GroupName="Sound"
      GroupColor=(B=106,G=0,R=213,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.363140
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.363140
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5256
   ObjPosY=1168
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5360
   ObjPosY=1168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   InputLinks(0)=(DrawY=1270,OverrideDelta=15)
   InputLinks(1)=(DrawY=1292,OverrideDelta=37)
   InputLinks(2)=(DrawY=1314,OverrideDelta=59)
   InputLinks(3)=(DrawY=1336,OverrideDelta=81)
   InputLinks(4)=(DrawY=1358,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1286,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1342,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=5327,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),LinkDesc="nuke_light_distant",MinVars=0,DrawX=5419,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),LinkDesc="Sound",MinVars=0,DrawX=5516,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5296
   ObjPosY=1232
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_2
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_2"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2.InterpTrackToggle_2'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2.InterpTrackFloatProp_2'
      GroupName="nuke_light_distant"
      GroupColor=(B=161,G=178,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_3
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         Name="InterpTrackAkEvent_3"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackAkEvent_3'
      GroupName="Sound"
      GroupColor=(B=201,G=0,R=131,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.606586
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.433596
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5264
   ObjPosY=1416
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5392
   ObjPosY=1400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   InputLinks(0)=(DrawY=1502,OverrideDelta=15)
   InputLinks(1)=(DrawY=1524,OverrideDelta=37)
   InputLinks(2)=(DrawY=1546,OverrideDelta=59)
   InputLinks(3)=(DrawY=1568,OverrideDelta=81)
   InputLinks(4)=(DrawY=1590,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1518,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1574,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=5391,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),LinkDesc="nuke_distant_light",MinVars=0,DrawX=5483,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),LinkDesc="Sound",MinVars=0,DrawX=5580,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5360
   ObjPosY=1464
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_3
      Name="InterpCurveEdSetup_3"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_3
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_3"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_3
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_3"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_3.InterpTrackToggle_3'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_3.InterpTrackFloatProp_3'
      GroupName="nuke_distant_light"
      GroupColor=(B=207,G=0,R=120,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_4
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         Name="InterpTrackAkEvent_4"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_5.InterpTrackAkEvent_4'
      GroupName="Sound"
      GroupColor=(B=179,G=159,R=0,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.407019
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_3'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_5'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_3'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.407019
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5344
   ObjPosY=1640
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5440
   ObjPosY=1632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   InputLinks(0)=(DrawY=1726,OverrideDelta=15)
   InputLinks(1)=(DrawY=1748,OverrideDelta=37)
   InputLinks(2)=(DrawY=1770,OverrideDelta=59)
   InputLinks(3)=(DrawY=1792,OverrideDelta=81)
   InputLinks(4)=(DrawY=1814,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1742,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1798,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=5695,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),LinkDesc="nuke_distant_light",MinVars=0,DrawX=5787,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),LinkDesc="Sound",MinVars=0,DrawX=5884,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5664
   ObjPosY=1688
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_4
      Name="InterpCurveEdSetup_4"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_4
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_4"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_4
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_4"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_4.InterpTrackToggle_4'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_4.InterpTrackFloatProp_4'
      GroupName="nuke_distant_light"
      GroupColor=(B=0,G=163,R=176,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_5
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         Name="InterpTrackAkEvent_5"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_6.InterpTrackAkEvent_5'
      GroupName="Sound"
      GroupColor=(B=0,G=58,R=228,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=21.178783
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_4'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_4'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=21.178783
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5640
   ObjPosY=1848
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   InputLinks(0)=(DrawY=1974,OverrideDelta=15)
   InputLinks(1)=(DrawY=1996,OverrideDelta=37)
   InputLinks(2)=(DrawY=2018,OverrideDelta=59)
   InputLinks(3)=(DrawY=2040,OverrideDelta=81)
   InputLinks(4)=(DrawY=2062,OverrideDelta=103)
   OutputLinks(0)=(DrawY=1990,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2046,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=5511,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),LinkDesc="nuke_distant_light",MinVars=0,DrawX=5603,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154'),LinkDesc="Sound",MinVars=0,DrawX=5700,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5480
   ObjPosY=1936
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_5
      Name="InterpCurveEdSetup_5"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_5
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_5"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_5
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_5"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5.InterpTrackToggle_5'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5.InterpTrackFloatProp_5'
      GroupName="nuke_distant_light"
      GroupColor=(B=203,G=126,R=0,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_6
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         AkEvents(1)=(Time=4.500000,Event=AkEvent'WW_ENV_Manor.Play_ENV_Manor_Thunder')
         Name="InterpTrackAkEvent_6"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_7.InterpTrackAkEvent_6'
      GroupName="Sound"
      GroupColor=(B=228,G=58,R=0,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.973984
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_5'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_7'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_5'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.973984
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5448
   ObjPosY=2120
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   InputLinks(0)=(DrawY=2230,OverrideDelta=15)
   InputLinks(1)=(DrawY=2252,OverrideDelta=37)
   InputLinks(2)=(DrawY=2274,OverrideDelta=59)
   InputLinks(3)=(DrawY=2296,OverrideDelta=81)
   InputLinks(4)=(DrawY=2318,OverrideDelta=103)
   OutputLinks(0)=(DrawY=2246,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2302,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=5431,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),LinkDesc="nuke_distant_light",MinVars=0,DrawX=5523,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155'),LinkDesc="Sound",MinVars=0,DrawX=5620,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=2192
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_6
      Name="InterpCurveEdSetup_6"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_6
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_6"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_6
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_6"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_6.InterpTrackToggle_6'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_6.InterpTrackFloatProp_6'
      GroupName="nuke_distant_light"
      GroupColor=(B=0,G=42,R=230,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_7
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         Name="InterpTrackAkEvent_7"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_8.InterpTrackAkEvent_7'
      GroupName="Sound"
      GroupColor=(B=200,G=0,R=133,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.260254
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_6'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpCurveEdSetup_6'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.260254
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5400
   ObjPosY=2368
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   InputLinks(0)=(DrawY=2414,OverrideDelta=15)
   InputLinks(1)=(DrawY=2436,OverrideDelta=37)
   InputLinks(2)=(DrawY=2458,OverrideDelta=59)
   InputLinks(3)=(DrawY=2480,OverrideDelta=81)
   InputLinks(4)=(DrawY=2502,OverrideDelta=103)
   OutputLinks(0)=(DrawY=2430,OverrideDelta=31)
   OutputLinks(1)=(DrawY=2486,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=5079,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),LinkDesc="nuke_distant_light",MinVars=0,DrawX=5171,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_156'),LinkDesc="Sound",MinVars=0,DrawX=5268,OverrideDelta=200)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5048
   ObjPosY=2376
   DrawWidth=257
   DrawHeight=157
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_7
      Name="InterpCurveEdSetup_7"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_7
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=4.000000,InterpMode=CIM_CurveAuto),(InVal=4.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_7"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_7
         ToggleTrack(0)=(ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=4.000000)
         Name="InterpTrackToggle_7"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_7.InterpTrackToggle_7'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_7.InterpTrackFloatProp_7'
      GroupName="nuke_distant_light"
      GroupColor=(B=208,G=0,R=118,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_8
         AkEvents(0)=(Time=4.000000,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         AkEvents(1)=(Time=4.500000,Event=AkEvent'WW_ENV_Manor.Play_ENV_Manor_Thunder')
         Name="InterpTrackAkEvent_8"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_9.InterpTrackAkEvent_8'
      GroupName="Sound"
      GroupColor=(B=0,G=136,R=197,A=255)
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.359615
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_7'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_9'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_7'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.359615
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5056
   ObjPosY=2568
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5744
   ObjPosY=1872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5568
   ObjPosY=2112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5488
   ObjPosY=2376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5128
   ObjPosY=2576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   InputLinks(0)=(DrawY=1010,OverrideDelta=19)
   InputLinks(1)=(DrawY=1042,OverrideDelta=51)
   InputLinks(2)=(DrawY=1074,OverrideDelta=83)
   InputLinks(3)=(DrawY=1106,OverrideDelta=115)
   InputLinks(4)=(DrawY=1138,OverrideDelta=147)
   OutputLinks(0)=(DrawY=1008,OverrideDelta=17)
   OutputLinks(1)=(DrawY=1052,OverrideDelta=61)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),LinkDesc="Start",DrawY=1030,OverrideDelta=39)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1'),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1),(LinkedOp=SeqAct_AkPostEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2'),(LinkedOp=SeqAct_AkPostEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),LinkDesc="Boom",DrawY=1074,OverrideDelta=83)
   OutputLinks(4)=(LinkDesc="Flash",DrawY=1096,OverrideDelta=105)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_CameraShake'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_1')),LinkDesc="Rumble",DrawY=1118,OverrideDelta=127)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0'),(LinkedOp=SeqAct_AkPostEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),LinkDesc="Stop_Rumble",DrawY=1140,OverrideDelta=149)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=2071,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),LinkDesc="nuke_light",MinVars=0,DrawX=2136,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),LinkDesc="Light",MinVars=0,DrawX=2202,OverrideDelta=146)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="Fog",MinVars=0,DrawX=2246,OverrideDelta=194)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135'),LinkDesc="nuke_shockwave",MinVars=0,DrawX=2330,OverrideDelta=234)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),LinkDesc="nuke_sprite",MinVars=0,DrawX=2440,OverrideDelta=362)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),LinkDesc="akamb",MinVars=0,DrawX=2515,OverrideDelta=454)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Events",MinVars=0,DrawX=2574,OverrideDelta=512)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="akamb2",MinVars=0,DrawX=2638,OverrideDelta=573)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2040
   ObjPosY=968
   DrawWidth=639
   DrawHeight=205
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_9
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="DirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((InVal=25.000000,InterpMode=CIM_CurveAuto),(InVal=26.000000,OutVal=8.000000,ArriveTangent=0.800000,LeaveTangent=0.800000,InterpMode=CIM_CurveAuto),(InVal=30.000000,OutVal=4.000000,ArriveTangent=-0.037383,LeaveTangent=-0.037383,InterpMode=CIM_CurveAuto),(InVal=240.000000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_3
         ToggleTrack(0)=(Time=25.000000,ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=240.000000)
         Name="InterpTrackToggle_3"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackFloatProp_0'
      InterpTracks(1)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackToggle_3'
      GroupName="nuke_light"
      GroupColor=(B=58,G=0,R=228,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="HeightFogComponent0.FogDensity"
         FloatTrack=(Points=((InVal=33.000000,OutVal=1.400000,InterpMode=CIM_CurveAuto),(InVal=35.000000,OutVal=2.000000,LeaveTangent=0.004138,InterpMode=CIM_CurveAuto)))
         TrackTitle="FogDensity"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_1.InterpTrackFloatProp_0'
      GroupName="Fog"
      GroupColor=(B=162,G=0,R=178,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_11
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(EventName="Start")
         EventTrack(1)=(Time=25.000000,EventName="Flash")
         EventTrack(2)=(Time=30.000000,EventName="Rumble")
         EventTrack(3)=(Time=33.000000,EventName="Boom")
         EventTrack(4)=(Time=55.000000,EventName="Stop_Rumble")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_11.InterpTrackEvent_0'
      GroupName="Events"
      GroupColor=(B=228,G=0,R=64,A=255)
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="DominantDirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((InVal=25.000000,OutVal=0.500000,InterpMode=CIM_CurveAuto),(InVal=30.000000,InterpMode=CIM_CurveAuto),(InVal=240.000000,OutVal=0.500000,InterpMode=CIM_CurveAuto)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2.InterpTrackFloatProp_1'
      GroupName="Light"
      GroupColor=(B=212,G=109,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=29.500000,Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Rumble_LP_13')
         AkEvents(1)=(Time=32.849998,Event=AkEvent'WW_WEP_EXP_Dynamite.Play_WEP_EXP_Dynamite_Explosion')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_3.InterpTrackAkEvent_0'
      GroupName="akamb2"
      GroupColor=(B=203,G=126,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_3
         AkEvents(0)=(Time=31.000000,Event=AkEvent'WW_ENV_Manor.Play_ENV_Manor_Thunder')
         AkEvents(1)=(Time=33.000000,Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Erupt_Main')
         Name="InterpTrackAkEvent_3"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_6.InterpTrackAkEvent_3'
      GroupName="akamb"
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_1
         ToggleTrack(0)=(Time=25.000000,ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=45.000000)
         Name="InterpTrackToggle_1"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_8.InterpTrackToggle_1'
      GroupName="nuke_shockwave"
      GroupColor=(B=179,G=159,R=0,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_2
         ToggleTrack(0)=(Time=25.000000,ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=240.000000)
         Name="InterpTrackToggle_2"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_9.InterpTrackToggle_2'
      GroupName="nuke_sprite"
      GroupColor=(B=168,G=0,R=172,A=255)
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=240.165314
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2'
   InterpGroups(2)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_1'
   InterpGroups(3)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_8'
   InterpGroups(4)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_9'
   InterpGroups(5)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_6'
   InterpGroups(6)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_11'
   InterpGroups(7)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_3'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=240.165314
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1960
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=DirectionalLightToggleable'KF-Nuked.TheWorld:PersistentLevel.DirectionalLightToggleable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2048
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=786
   SizeY=654
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4096
   ObjPosY=3216
   ObjComment="gusts"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4256
   ObjPosY=3256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_241'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=3256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4424
   ObjPosY=3256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4512
   ObjPosY=3256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_144'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4600
   ObjPosY=3256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_143'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4680
   ObjPosY=3248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_109'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4248
   ObjPosY=3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4416
   ObjPosY=3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4592
   ObjPosY=3328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4680
   ObjPosY=3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_237'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4240
   ObjPosY=3424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_238'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=3424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_187
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4528
   ObjPosY=3424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_187"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_186
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4608
   ObjPosY=3416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_186"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_185
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4696
   ObjPosY=3424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_185"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_184
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4232
   ObjPosY=3512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_184"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_239'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=3520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_182
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=3520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_182"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=3520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4624
   ObjPosY=3520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_178
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_240'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4712
   ObjPosY=3520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_178"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_141'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4224
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_142'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_153'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_151'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_158'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_172
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_161'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4736
   ObjPosY=3600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_172"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_173
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_150'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4216
   ObjPosY=3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_173"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_162'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_148'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4424
   ObjPosY=3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_156'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4520
   ObjPosY=3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_157'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4624
   ObjPosY=3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_155'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4720
   ObjPosY=3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_152'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4216
   ObjPosY=3784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=3776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=DominantDirectionalLight'KF-Nuked.TheWorld:PersistentLevel.DominantDirectionalLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2128
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=ExponentialHeightFog'KF-Nuked.TheWorld:PersistentLevel.ExponentialHeightFog_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2208
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-Nuked.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=3477,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3498,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3519,OverrideDelta=56)
   VariableLinks(0)=(DrawX=146,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=64
   ObjPosY=3408
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=3469,OverrideDelta=14)
   InputLinks(1)=(DrawY=3490,OverrideDelta=35)
   InputLinks(2)=(DrawY=3511,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3490,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=278,OverrideDelta=16)
   VariableLinks(1)=(DrawX=329,OverrideDelta=76)
   EventLinks(0)=(DrawX=378,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=3432
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-Nuked.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=256
   ObjPosY=3576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-Nuked.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=3765,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3786,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3807,OverrideDelta=56)
   VariableLinks(0)=(DrawX=154,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=3696
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-Nuked.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=272
   ObjPosY=3872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=3759,OverrideDelta=14)
   InputLinks(1)=(DrawY=3780,OverrideDelta=35)
   InputLinks(2)=(DrawY=3801,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3780,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=296,OverrideDelta=16)
   VariableLinks(1)=(DrawX=347,OverrideDelta=76)
   EventLinks(0)=(DrawX=396,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=258
   ObjPosY=3722
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-Nuked.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=4053,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4074,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4095,OverrideDelta=56)
   VariableLinks(0)=(DrawX=138,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=56
   ObjPosY=3984
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-Nuked.TheWorld:PersistentLevel.KFSpawner_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=4045,OverrideDelta=14)
   InputLinks(1)=(DrawY=4066,OverrideDelta=35)
   InputLinks(2)=(DrawY=4087,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4066,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=294,OverrideDelta=16)
   VariableLinks(1)=(DrawX=345,OverrideDelta=76)
   EventLinks(0)=(DrawX=394,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=256
   ObjPosY=4008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-Nuked.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=4309,OverrideDelta=14)
   OutputLinks(1)=(DrawY=4330,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4351,OverrideDelta=56)
   VariableLinks(0)=(DrawX=138,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=56
   ObjPosY=4240
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=4309,OverrideDelta=14)
   InputLinks(1)=(DrawY=4330,OverrideDelta=35)
   InputLinks(2)=(DrawY=4351,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4330,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=262,OverrideDelta=16)
   VariableLinks(1)=(DrawX=313,OverrideDelta=76)
   EventLinks(0)=(DrawX=362,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=4272
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFSpawner'KF-Nuked.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=256
   ObjPosY=4416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=CameraActor'KF-Nuked.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1656
   ObjPosY=424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   InputLinks(0)=(DrawY=262,OverrideDelta=15)
   InputLinks(1)=(DrawY=284,OverrideDelta=37)
   InputLinks(2)=(DrawY=306,OverrideDelta=59)
   InputLinks(3)=(DrawY=328,OverrideDelta=81)
   InputLinks(4)=(DrawY=350,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=264,OverrideDelta=17)
   OutputLinks(1)=(DrawY=320,OverrideDelta=73)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),LinkDesc="1st",DrawY=292,OverrideDelta=45)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),LinkDesc="2nd",DrawY=348,OverrideDelta=101)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=1610,OverrideDelta=35)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),LinkDesc="Cam1",MinVars=0,DrawX=1660,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1560
   ObjPosY=224
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=346,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1327,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1232
   ObjPosY=280
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=594,OverrideDelta=11)
   OutputLinks(0)=(DrawY=594,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=1456,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=560
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=274,OverrideDelta=11)
   OutputLinks(0)=(DrawY=274,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=1904,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=240
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1616
   ObjPosY=664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=805
   SizeY=572
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1200
   ObjPosY=192
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_167'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1328
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_163'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_168'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_171'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1632
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_182'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1728
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_172'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_174'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_181'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2032
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_175'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2128
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_176'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_173'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2328
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_160'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2432
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_192'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2528
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_197'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2728
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_198'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2832
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_183'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2928
   ObjPosY=1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(EventName="1st")
         EventTrack(1)=(Time=161.522156,EventName="2nd")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=412.812500,Y=-16.511230,Z=21.673096),InterpMode=CIM_CurveAutoClamped),(InVal=5.013390,OutVal=(X=1139.847168,Y=-562.456055,Z=68.669373),ArriveTangent=(X=229.650635,Y=-84.492943,Z=14.028207),LeaveTangent=(X=229.650635,Y=-84.492943,Z=14.028207),InterpMode=CIM_CurveAutoClamped),(InVal=10.011110,OutVal=(X=2785.287842,Y=-862.379395,Z=162.111023),ArriveTangent=(X=315.681854,Y=0.000000,Z=15.962492),LeaveTangent=(X=315.681854,Y=0.000000,Z=15.962492),InterpMode=CIM_CurveAutoClamped),(InVal=15.008829,OutVal=(X=4295.226074,Y=284.259277,Z=228.221497),ArriveTangent=(X=261.239075,Y=215.561691,Z=11.403760),LeaveTangent=(X=261.239075,Y=215.561691,Z=11.403760),InterpMode=CIM_CurveAutoClamped),(InVal=19.876738,OutVal=(X=5362.575195,Y=1264.271973,Z=274.616272),ArriveTangent=(X=192.228638,Y=0.000000,Z=9.868442),LeaveTangent=(X=192.228638,Y=0.000000,Z=9.868442),InterpMode=CIM_CurveAutoClamped),(InVal=24.939363,OutVal=(X=6204.159180,Y=762.290527,Z=326.220398),ArriveTangent=(X=176.205536,Y=-119.604279,Z=0.000000),LeaveTangent=(X=176.205536,Y=-119.604279,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=29.937082,OutVal=(X=7135.263672,Y=61.011719,Z=228.189209),ArriveTangent=(X=162.704834,Y=-195.548630,Z=0.000000),LeaveTangent=(X=162.704834,Y=-195.548630,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=34.934799,OutVal=(X=7830.464844,Y=-1192.303223,Z=283.226685),ArriveTangent=(X=0.000000,Y=-256.710663,Z=4.253551),LeaveTangent=(X=0.000000,Y=-256.710663,Z=4.253551),InterpMode=CIM_CurveAutoClamped),(InVal=39.997429,OutVal=(X=7761.992188,Y=-2521.586426,Z=293.861389),ArriveTangent=(X=0.000000,Y=-246.163391,Z=4.594175),LeaveTangent=(X=0.000000,Y=-246.163391,Z=4.594175),InterpMode=CIM_CurveAutoClamped),(InVal=44.995148,OutVal=(X=8978.810547,Y=-3668.792725,Z=381.751648),ArriveTangent=(X=0.000000,Y=-251.816986,Z=8.596279),LeaveTangent=(X=0.000000,Y=-251.816986,Z=8.596279),InterpMode=CIM_CurveAutoClamped),(InVal=49.927963,OutVal=(X=8035.469727,Y=-5022.263672,Z=404.332642),ArriveTangent=(X=-168.234558,Y=-255.136871,Z=8.439859),LeaveTangent=(X=-168.234558,Y=-255.136871,Z=8.439859),InterpMode=CIM_CurveAutoClamped),(InVal=55.055489,OutVal=(X=7286.313477,Y=-6235.556641,Z=489.601013),ArriveTangent=(X=-175.845490,Y=-261.595520,Z=0.000000),LeaveTangent=(X=-175.845490,Y=-261.595520,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=59.955685,OutVal=(X=6272.140137,Y=-7645.470703,Z=454.031189),ArriveTangent=(X=-315.824524,Y=0.000000,Z=-12.986822),LeaveTangent=(X=-315.824524,Y=0.000000,Z=-12.986822),InterpMode=CIM_CurveAutoClamped),(InVal=64.888504,OutVal=(X=4148.321289,Y=-7633.776855,Z=338.606812),ArriveTangent=(X=-396.567078,Y=0.000000,Z=-21.389753),LeaveTangent=(X=-396.567078,Y=0.000000,Z=-21.389753),InterpMode=CIM_CurveAutoClamped),(InVal=70.016029,OutVal=(X=2282.538574,Y=-7742.034668,Z=238.842896),ArriveTangent=(X=-332.132324,Y=0.000000,Z=-23.428833),LeaveTangent=(X=-332.132324,Y=0.000000,Z=-23.428833),InterpMode=CIM_CurveAutoClamped),(InVal=75.013748,OutVal=(X=785.400391,Y=-7370.810059,Z=101.384155),ArriveTangent=(X=-240.775757,Y=119.394043,Z=-33.414543),LeaveTangent=(X=-240.775757,Y=119.394043,Z=-33.414543),InterpMode=CIM_CurveAutoClamped),(InVal=80.076370,OutVal=(X=-139.747559,Y=-6481.585938,Z=-97.318817),ArriveTangent=(X=-183.277939,Y=201.075790,Z=-21.331745),LeaveTangent=(X=-183.277939,Y=201.075790,Z=-21.331745),InterpMode=CIM_CurveAutoClamped),(InVal=84.944283,OutVal=(X=-1034.647461,Y=-5374.020020,Z=-155.172913),ArriveTangent=(X=0.000000,Y=256.152802,Z=0.000000),LeaveTangent=(X=0.000000,Y=256.152802,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=89.942001,OutVal=(X=-402.835449,Y=-3954.476807,Z=12.751343),ArriveTangent=(X=0.000000,Y=304.104095,Z=0.000000),LeaveTangent=(X=0.000000,Y=304.104095,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=94.939728,OutVal=(X=-620.052734,Y=-2334.364258,Z=-21.411926),ArriveTangent=(X=0.000000,Y=287.074615,Z=0.000000),LeaveTangent=(X=0.000000,Y=287.074615,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=99.872543,OutVal=(X=346.691895,Y=-1103.670410,Z=21.068848),ArriveTangent=(X=170.970947,Y=0.000000,Z=9.234629),LeaveTangent=(X=170.970947,Y=0.000000,Z=9.234629),InterpMode=CIM_CurveAutoClamped),(InVal=105.064972,OutVal=(X=1111.069824,Y=-1794.377930,Z=72.090942),ArriveTangent=(X=36.458591,Y=-119.304947,Z=0.000000),LeaveTangent=(X=36.458591,Y=-119.304947,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=109.932877,OutVal=(X=1193.166016,Y=-2303.917969,Z=52.534180),ArriveTangent=(X=37.617592,Y=-130.536606,Z=-8.369460),LeaveTangent=(X=37.617592,Y=-130.536606,Z=-8.369460),InterpMode=CIM_CurveAutoClamped),(InVal=114.995514,OutVal=(X=2131.843750,Y=-3090.677246,Z=-78.960144),ArriveTangent=(X=230.727783,Y=0.000000,Z=0.000000),LeaveTangent=(X=230.727783,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=120.058136,OutVal=(X=3529.344727,Y=-1722.316406,Z=77.141296),ArriveTangent=(X=195.239532,Y=219.940170,Z=29.268021),LeaveTangent=(X=195.239532,Y=219.940170,Z=29.268021),InterpMode=CIM_CurveAutoClamped),(InVal=125.055847,OutVal=(X=4152.576172,Y=-878.005859,Z=215.485901),InterpMode=CIM_CurveAutoClamped),(InVal=130.053574,OutVal=(X=2884.538330,Y=-2588.395996,Z=-52.059631),ArriveTangent=(X=0.000000,Y=-237.533936,Z=-18.153709),LeaveTangent=(X=0.000000,Y=-237.533936,Z=-18.153709),InterpMode=CIM_CurveAutoClamped),(InVal=134.985672,OutVal=(X=3709.816406,Y=-3327.207520,Z=-95.221619),ArriveTangent=(X=0.000000,Y=-194.338043,Z=-9.409002),LeaveTangent=(X=0.000000,Y=-194.338043,Z=-9.409002),InterpMode=CIM_CurveAutoClamped),(InVal=139.983398,OutVal=(X=2572.815918,Y=-4518.138672,Z=-145.489380),InterpMode=CIM_CurveAutoClamped),(InVal=144.981110,OutVal=(X=3238.092041,Y=-4421.632813,Z=-99.700012),ArriveTangent=(X=209.681107,Y=0.000000,Z=14.564648),LeaveTangent=(X=209.681107,Y=0.000000,Z=14.564648),InterpMode=CIM_CurveAutoClamped),(InVal=149.978836,OutVal=(X=4729.538086,Y=-5366.791992,Z=5.312256),InterpMode=CIM_CurveAutoClamped),(InVal=155.171265,OutVal=(X=4619.526855,Y=-4755.257813,Z=2.914703),ArriveTangent=(X=0.000000,Y=156.436264,Z=0.000000),LeaveTangent=(X=0.000000,Y=156.436264,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=159.974274,OutVal=(X=5424.532715,Y=-3803.143066,Z=45.472778),ArriveTangent=(X=0.000000,Y=199.793732,Z=0.000000),LeaveTangent=(X=0.000000,Y=199.793732,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.036896,OutVal=(X=4229.945313,Y=-2784.166504,Z=-33.431763),InterpMode=CIM_CurveAutoClamped),(InVal=169.969727,OutVal=(X=5367.099609,Y=-3914.031738,Z=8.831421),ArriveTangent=(X=176.789124,Y=0.000000,Z=8.961829),LeaveTangent=(X=176.789124,Y=0.000000,Z=8.961829),InterpMode=CIM_CurveAutoClamped),(InVal=175.032349,OutVal=(X=5997.032715,Y=-3849.278809,Z=56.145782),ArriveTangent=(X=125.345222,Y=0.000000,Z=8.644744),LeaveTangent=(X=125.345222,Y=0.000000,Z=8.644744),InterpMode=CIM_CurveAutoClamped),(InVal=179.965149,OutVal=(X=6619.978027,Y=-4304.561523,Z=95.239288),ArriveTangent=(X=97.990463,Y=0.000000,Z=14.028826),LeaveTangent=(X=97.990463,Y=0.000000,Z=14.028826),InterpMode=CIM_CurveAutoClamped),(InVal=184.897980,OutVal=(X=6963.770508,Y=-3913.754150,Z=216.668823),ArriveTangent=(X=98.825455,Y=134.425629,Z=19.030104),LeaveTangent=(X=98.825455,Y=134.425629,Z=19.030104),InterpMode=CIM_CurveAutoClamped),(InVal=189.960602,OutVal=(X=7607.783203,Y=-2810.036621,Z=285.453796),ArriveTangent=(X=19.674698,Y=223.268799,Z=0.000000),LeaveTangent=(X=19.674698,Y=223.268799,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=195.023224,OutVal=(X=7650.840820,Y=-1653.103027,Z=240.763977),InterpMode=CIM_CurveAutoClamped),(InVal=199.826233,OutVal=(X=6588.752441,Y=-2090.341309,Z=520.679443),ArriveTangent=(X=-199.805084,Y=-28.174520,Z=0.000000),LeaveTangent=(X=-199.805084,Y=-28.174520,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=204.979736,OutVal=(X=5661.479004,Y=-2157.778320,Z=501.332886),ArriveTangent=(X=-132.362534,Y=-30.471603,Z=-3.906829),LeaveTangent=(X=-132.362534,Y=-30.471603,Z=-3.906829),InterpMode=CIM_CurveAutoClamped),(InVal=209.977448,OutVal=(X=5225.891113,Y=-3123.995117,Z=481.020386),ArriveTangent=(X=-118.071449,Y=0.000000,Z=-5.036406),LeaveTangent=(X=-118.071449,Y=0.000000,Z=-5.036406),InterpMode=CIM_CurveAutoClamped),(InVal=214.910263,OutVal=(X=4488.967285,Y=-2999.011230,Z=451.318726),ArriveTangent=(X=-155.305969,Y=0.000000,Z=-7.269075),LeaveTangent=(X=-155.305969,Y=0.000000,Z=-7.269075),InterpMode=CIM_CurveAutoClamped),(InVal=219.907990,OutVal=(X=3683.618652,Y=-3087.611328,Z=408.834534),ArriveTangent=(X=-132.447037,Y=0.000000,Z=-8.140037),LeaveTangent=(X=-132.447037,Y=0.000000,Z=-8.140037),InterpMode=CIM_CurveAutoClamped),(InVal=225.035507,OutVal=(X=3147.908691,Y=-3026.374023,Z=368.898865),ArriveTangent=(X=-118.385323,Y=26.816814,Z=-8.989552),LeaveTangent=(X=-118.385323,Y=26.816814,Z=-8.989552),InterpMode=CIM_CurveAutoClamped),(InVal=229.903412,OutVal=(X=2500.307373,Y=-2464.396973,Z=318.980164),ArriveTangent=(X=-107.517677,Y=0.000000,Z=-4.641161),LeaveTangent=(X=-107.517677,Y=0.000000,Z=-4.641161),InterpMode=CIM_CurveAutoClamped),(InVal=234.901138,OutVal=(X=2087.178955,Y=-3222.755371,Z=307.031799),ArriveTangent=(X=-104.652870,Y=-141.503006,Z=-3.926913),LeaveTangent=(X=-104.652870,Y=-141.503006,Z=-3.926913),InterpMode=CIM_CurveAutoClamped),(InVal=240.028671,OutVal=(X=1440.669922,Y=-3897.151611,Z=276.250183),ArriveTangent=(X=0.000000,Y=-125.549545,Z=0.000000),LeaveTangent=(X=0.000000,Y=-125.549545,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=245.026398,OutVal=(X=2070.249023,Y=-4493.977051,Z=343.699219),ArriveTangent=(X=90.530411,Y=-127.642296,Z=9.122953),LeaveTangent=(X=90.530411,Y=-127.642296,Z=9.122953),InterpMode=CIM_CurveAutoClamped),(InVal=250.024109,OutVal=(X=2362.074951,Y=-5172.992188,Z=371.918396),ArriveTangent=(X=120.112457,Y=-1.056145,Z=8.925118),LeaveTangent=(X=120.112457,Y=-1.056145,Z=8.925118),InterpMode=CIM_CurveAutoClamped),(InVal=254.956924,OutVal=(X=3999.232422,Y=-5175.090820,Z=434.756775),ArriveTangent=(X=307.907837,Y=0.000000,Z=12.954973),LeaveTangent=(X=307.907837,Y=0.000000,Z=12.954973),InterpMode=CIM_CurveAutoClamped),(InVal=259.954651,OutVal=(X=5419.766602,Y=-3850.484131,Z=500.568298),ArriveTangent=(X=0.000000,Y=174.048721,Z=0.000000),LeaveTangent=(X=0.000000,Y=174.048721,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=265.082153,OutVal=(X=5102.412109,Y=-3309.648926,Z=468.864563),ArriveTangent=(X=0.000000,Y=176.925873,Z=0.000000),LeaveTangent=(X=0.000000,Y=176.925873,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=270.079895,OutVal=(X=5965.308594,Y=-1924.701660,Z=510.590027),ArriveTangent=(X=0.000000,Y=210.069290,Z=0.000000),LeaveTangent=(X=0.000000,Y=210.069290,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=275.142517,OutVal=(X=5071.809082,Y=-1196.275391,Z=438.016479),ArriveTangent=(X=-127.777878,Y=0.000000,Z=-9.049514),LeaveTangent=(X=-127.777878,Y=0.000000,Z=-9.049514),InterpMode=CIM_CurveAutoClamped),(InVal=279.996613,OutVal=(X=4667.639648,Y=-1607.051270,Z=411.738403),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=-0.895386,Y=0.104370,Z=-30.574951),InterpMode=CIM_CurveAutoClamped),(InVal=5.013390,OutVal=(X=-1.032715,Y=-1.010742,Z=-33.024902),ArriveTangent=(X=0.000000,Y=-0.123805,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.123805,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.011110,OutVal=(X=1.746826,Y=-1.356812,Z=18.704224),ArriveTangent=(X=0.269726,Y=-0.106036,Z=6.259371),LeaveTangent=(X=0.269726,Y=-0.106036,Z=6.259371),InterpMode=CIM_CurveAutoClamped),(InVal=15.008829,OutVal=(X=2.460938,Y=-2.081909,Z=36.886597),InterpMode=CIM_CurveAutoClamped),(InVal=19.876738,OutVal=(X=-1.082153,Y=-1.098633,Z=-33.112793),ArriveTangent=(X=-0.268207,Y=0.000000,Z=-4.796991),LeaveTangent=(X=-0.268207,Y=0.000000,Z=-4.796991),InterpMode=CIM_CurveAutoClamped),(InVal=24.939363,OutVal=(X=-1.741333,Y=-8.750610,Z=-44.642944),InterpMode=CIM_CurveAutoClamped),(InVal=29.937082,OutVal=(X=-1.543579,Y=-7.267456,Z=-40.017700),InterpMode=CIM_CurveAutoClamped),(InVal=34.934799,OutVal=(X=-3.350830,Y=-9.497681,Z=-91.411743),InterpMode=CIM_CurveAutoClamped),(InVal=39.997429,OutVal=(X=-0.758057,Y=-4.268188,Z=-23.917236),InterpMode=CIM_CurveAutoClamped),(InVal=44.995148,OutVal=(X=-3.471680,Y=-4.779053,Z=-100.030518),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.890137),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.890137),InterpMode=CIM_CurveAutoClamped),(InVal=49.927963,OutVal=(X=-3.262939,Y=-3.916626,Z=-125.134277),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.884613),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.884613),InterpMode=CIM_CurveAutoClamped),(InVal=55.055489,OutVal=(X=-3.273926,Y=-6.877441,Z=-127.095337),ArriveTangent=(X=0.000000,Y=-0.487540,Z=-0.933331),LeaveTangent=(X=0.000000,Y=-0.487540,Z=-0.933331),InterpMode=CIM_CurveAutoClamped),(InVal=59.955685,OutVal=(X=-0.714111,Y=-8.805542,Z=-187.003784),ArriveTangent=(X=0.000000,Y=-0.607661,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.607661,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=64.888504,OutVal=(X=-1.290894,Y=-12.958374,Z=-177.418213),ArriveTangent=(X=0.000000,Y=-0.082572,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.082572,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=70.016029,OutVal=(X=-0.285645,Y=-13.134155,Z=-195.419312),ArriveTangent=(X=0.298303,Y=0.000000,Z=-5.533043),LeaveTangent=(X=0.298303,Y=0.000000,Z=-5.533043),InterpMode=CIM_CurveAutoClamped),(InVal=75.013748,OutVal=(X=1.730347,Y=-5.916138,Z=-234.640503),ArriveTangent=(X=0.026383,Y=0.000000,Z=-0.797721),LeaveTangent=(X=0.026383,Y=0.000000,Z=-0.797721),InterpMode=CIM_CurveAutoClamped),(InVal=80.076370,OutVal=(X=1.785278,Y=-12.057495,Z=-236.332397),ArriveTangent=(X=0.025700,Y=-0.027595,Z=-0.820499),LeaveTangent=(X=0.025700,Y=-0.027595,Z=-0.820499),InterpMode=CIM_CurveAutoClamped),(InVal=84.944283,OutVal=(X=2.746582,Y=-12.112427,Z=-301.690063),ArriveTangent=(X=0.058965,Y=-0.024154,Z=0.000000),LeaveTangent=(X=0.058965,Y=-0.024154,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=89.942001,OutVal=(X=2.883911,Y=-12.540894,Z=-287.880249),InterpMode=CIM_CurveAutoClamped),(InVal=94.939728,OutVal=(X=2.581787,Y=-11.936646,Z=-309.649658),ArriveTangent=(X=-0.140758,Y=0.270946,Z=-8.500168),LeaveTangent=(X=-0.140758,Y=0.270946,Z=-8.500168),InterpMode=CIM_CurveAutoClamped),(InVal=99.872543,OutVal=(X=-2.076416,Y=-5.828247,Z=-404.642944),ArriveTangent=(X=-0.502073,Y=0.000000,Z=-17.445868),LeaveTangent=(X=-0.502073,Y=0.000000,Z=-17.445868),InterpMode=CIM_CurveAutoClamped),(InVal=105.064972,OutVal=(X=-3.493652,Y=-10.376587,Z=-486.293335),ArriveTangent=(X=0.000000,Y=-0.719111,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.719111,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=109.932877,OutVal=(X=-2.043457,Y=-13.062744,Z=-402.258911),ArriveTangent=(X=0.496916,Y=0.000000,Z=16.161633),LeaveTangent=(X=0.496916,Y=0.000000,Z=16.161633),InterpMode=CIM_CurveAutoClamped),(InVal=114.995514,OutVal=(X=1.922607,Y=-1.323853,Z=-325.799561),ArriveTangent=(X=0.199471,Y=0.000000,Z=6.449211),LeaveTangent=(X=0.199471,Y=0.000000,Z=6.449211),InterpMode=CIM_CurveAutoClamped),(InVal=120.058136,OutVal=(X=2.384033,Y=-2.147827,Z=-309.188232),ArriveTangent=(X=0.000000,Y=-0.306032,Z=6.618676),LeaveTangent=(X=0.000000,Y=-0.306032,Z=6.618676),InterpMode=CIM_CurveAutoClamped),(InVal=125.055847,OutVal=(X=1.060181,Y=-5.245972,Z=-224.824219),ArriveTangent=(X=-0.424479,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.424479,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=130.053574,OutVal=(X=-2.037964,Y=-2.642212,Z=-400.572510),ArriveTangent=(X=-0.401693,Y=0.000000,Z=-27.686478),LeaveTangent=(X=-0.401693,Y=0.000000,Z=-27.686478),InterpMode=CIM_CurveAutoClamped),(InVal=134.985672,OutVal=(X=-3.235474,Y=-7.250977,Z=-499.746094),ArriveTangent=(X=0.000000,Y=-0.439347,Z=-12.011266),LeaveTangent=(X=0.000000,Y=-0.439347,Z=-12.011266),InterpMode=CIM_CurveAutoClamped),(InVal=139.983398,OutVal=(X=-1.757813,Y=-8.399048,Z=-534.353027),ArriveTangent=(X=0.127190,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.127190,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=144.981110,OutVal=(X=-1.433716,Y=-4.427490,Z=-388.152466),ArriveTangent=(X=0.139866,Y=0.000000,Z=30.889521),LeaveTangent=(X=0.139866,Y=0.000000,Z=30.889521),InterpMode=CIM_CurveAutoClamped),(InVal=149.978836,OutVal=(X=1.065674,Y=-21.928711,Z=-225.598755),ArriveTangent=(X=0.336113,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.336113,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=155.171265,OutVal=(X=2.136841,Y=-3.702393,Z=-310.676880),InterpMode=CIM_CurveAutoClamped),(InVal=159.974274,OutVal=(X=0.911865,Y=-9.662476,Z=-225.659180),ArriveTangent=(X=-0.419882,Y=-0.283318,Z=0.000000),LeaveTangent=(X=-0.419882,Y=-0.283318,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.036896,OutVal=(X=-2.373047,Y=-10.299683,Z=-402.637939),InterpMode=CIM_CurveAutoClamped),(InVal=169.969727,OutVal=(X=0.236206,Y=-10.123901,Z=-355.753784),InterpMode=CIM_CurveAutoClamped),(InVal=175.032349,OutVal=(X=-2.362061,Y=-10.360107,Z=-401.506348),InterpMode=CIM_CurveAutoClamped),(InVal=179.965149,OutVal=(X=1.752319,Y=10.750122,Z=-319.273682),ArriveTangent=(X=0.092273,Y=0.000000,Z=3.499527),LeaveTangent=(X=0.092273,Y=0.000000,Z=3.499527),InterpMode=CIM_CurveAutoClamped),(InVal=184.897980,OutVal=(X=1.944580,Y=-7.789307,Z=-311.583252),ArriveTangent=(X=0.000000,Y=-0.693761,Z=3.399697),LeaveTangent=(X=0.000000,Y=-0.693761,Z=3.399697),InterpMode=CIM_CurveAutoClamped),(InVal=189.960602,OutVal=(X=1.428223,Y=-9.321899,Z=-242.638550),ArriveTangent=(X=-0.228256,Y=0.000000,Z=17.230488),LeaveTangent=(X=-0.228256,Y=0.000000,Z=17.230488),InterpMode=CIM_CurveAutoClamped),(InVal=195.023224,OutVal=(X=-3.938599,Y=22.170410,Z=-137.120361),InterpMode=CIM_CurveAutoClamped),(InVal=199.826233,OutVal=(X=-2.340088,Y=-6.657715,Z=-171.051636),InterpMode=CIM_CurveAutoClamped),(InVal=204.979736,OutVal=(X=-4.295654,Y=-1.719360,Z=-112.241821),InterpMode=CIM_CurveAutoClamped),(InVal=209.977448,OutVal=(X=-4.070435,Y=-2.680664,Z=-129.320068),ArriveTangent=(X=0.073254,Y=-0.358253,Z=-3.590004),LeaveTangent=(X=0.073254,Y=-0.358253,Z=-3.590004),InterpMode=CIM_CurveAutoClamped),(InVal=214.910263,OutVal=(X=-3.532104,Y=-6.168823,Z=-147.892456),ArriveTangent=(X=0.227502,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.227502,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=219.907990,OutVal=(X=-0.098877,Y=1.307373,Z=6.366577),ArriveTangent=(X=0.086174,Y=0.000000,Z=28.549116),LeaveTangent=(X=0.086174,Y=0.000000,Z=28.549116),InterpMode=CIM_CurveAutoClamped),(InVal=225.035507,OutVal=(X=0.087891,Y=-15.375366,Z=141.174316),ArriveTangent=(X=0.000000,Y=-0.197046,Z=25.111959),LeaveTangent=(X=0.000000,Y=-0.197046,Z=25.111959),InterpMode=CIM_CurveAutoClamped),(InVal=229.903412,OutVal=(X=-4.603271,Y=-15.776367,Z=257.371216),InterpMode=CIM_CurveAutoClamped),(InVal=234.901138,OutVal=(X=-4.218750,Y=-6.157837,Z=230.152588),ArriveTangent=(X=0.150549,Y=2.440259,Z=0.000000),LeaveTangent=(X=0.150549,Y=2.440259,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=240.028671,OutVal=(X=-2.406006,Y=8.931885,Z=326.019287),InterpMode=CIM_CurveAutoClamped),(InVal=245.026398,OutVal=(X=-4.147339,Y=-12.804565,Z=288.457031),InterpMode=CIM_CurveAutoClamped),(InVal=250.024109,OutVal=(X=-1.367798,Y=-9.255981,Z=346.327515),ArriveTangent=(X=0.497843,Y=1.207045,Z=10.245618),LeaveTangent=(X=0.497843,Y=1.207045,Z=10.245618),InterpMode=CIM_CurveAutoClamped),(InVal=254.956924,OutVal=(X=0.796509,Y=0.329590,Z=390.201416),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.749113),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.749113),InterpMode=CIM_CurveAutoClamped),(InVal=259.954651,OutVal=(X=-0.313110,Y=-11.645508,Z=504.415283),InterpMode=CIM_CurveAutoClamped),(InVal=265.082153,OutVal=(X=1.444702,Y=-7.410278,Z=412.580566),InterpMode=CIM_CurveAutoClamped),(InVal=270.079895,OutVal=(X=0.021973,Y=-11.491699,Z=496.038208),ArriveTangent=(X=-0.504723,Y=0.000000,Z=17.655571),LeaveTangent=(X=-0.504723,Y=0.000000,Z=17.655571),InterpMode=CIM_CurveAutoClamped),(InVal=275.142517,OutVal=(X=-4.498901,Y=-8.860474,Z=590.202026),InterpMode=CIM_CurveAutoClamped),(InVal=279.996613,OutVal=(X=-0.082397,Y=-10.332642,Z=497.241211),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.013390),(Time=10.011110),(Time=15.008829),(Time=19.876738),(Time=24.939363),(Time=29.937082),(Time=34.934799),(Time=39.997429),(Time=44.995148),(Time=49.927963),(Time=55.055489),(Time=59.955685),(Time=64.888504),(Time=70.016029),(Time=75.013748),(Time=80.076370),(Time=84.944283),(Time=89.942001),(Time=94.939728),(Time=99.872543),(Time=105.064972),(Time=109.932877),(Time=114.995514),(Time=120.058136),(Time=125.055847),(Time=130.053574),(Time=134.985672),(Time=139.983398),(Time=144.981110),(Time=149.978836),(Time=155.171265),(Time=159.974274),(Time=165.036896),(Time=169.969727),(Time=175.032349),(Time=179.965149),(Time=184.897980),(Time=189.960602),(Time=195.023224),(Time=199.826233),(Time=204.979736),(Time=209.977448),(Time=214.910263),(Time=219.907990),(Time=225.035507),(Time=229.903412),(Time=234.901138),(Time=240.028671),(Time=245.026398),(Time=250.024109),(Time=254.956924),(Time=259.954651),(Time=265.082153),(Time=270.079895),(Time=275.142517),(Time=279.996613)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackFloatProp_0'
      InterpTracks(2)=InterpTrackEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackEvent_0'
      GroupName="Cam1"
      GroupColor=(B=190,G=0,R=147,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Cam1",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=280.614594
   InterpGroups(0)=InterpGroupDirector'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=280.614594
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=424
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4392
   ObjPosY=3768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4496
   ObjPosY=3768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_115'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4592
   ObjPosY=3768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_149'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4696
   ObjPosY=3768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_242'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4792
   ObjPosY=3768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqCond_CompareFloat Name=SeqCond_CompareFloat_1
   InputLinks(0)=(DrawY=1050,OverrideDelta=59)
   OutputLinks(0)=(DrawY=1006,OverrideDelta=15)
   OutputLinks(1)=(DrawY=1028,OverrideDelta=37)
   OutputLinks(2)=(DrawY=1050,OverrideDelta=59)
   OutputLinks(3)=(DrawY=1072,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),DrawY=1094,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_2'),DrawX=1728,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_3'),DrawX=1753,OverrideDelta=61)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=968
   DrawWidth=105
   DrawHeight=157
   Name="SeqCond_CompareFloat_1"
   ObjectArchetype=SeqCond_CompareFloat'Engine.Default__SeqCond_CompareFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=1176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_2"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_3
   FloatValue=33.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=1184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_3"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(DrawY=325,OverrideDelta=14)
   OutputLinks(1)=(DrawY=346,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2)),DrawY=367,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2896
   ObjPosY=256
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2304
   ObjPosY=1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2408
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=1605,OverrideDelta=14)
   InputLinks(1)=(DrawY=1626,OverrideDelta=35)
   InputLinks(2)=(DrawY=1647,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1626,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),DrawX=1982,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2033,OverrideDelta=76)
   EventLinks(0)=(DrawX=2082,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1944
   ObjPosY=1568
   ObjComment="Big wind"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_208'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=1584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_217'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=1584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=1584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_235'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2688
   ObjPosY=1584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=1477,OverrideDelta=14)
   InputLinks(1)=(DrawY=1498,OverrideDelta=35)
   InputLinks(2)=(DrawY=1519,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1498,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),DrawX=2350,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2401,OverrideDelta=76)
   EventLinks(0)=(DrawX=2450,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2312
   ObjPosY=1440
   ObjComment="static dust clouds"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_236'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2280
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_243'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2376
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_244'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2480
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_245'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_229'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2680
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_230'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2776
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=Emitter'KF-Nuked.TheWorld:PersistentLevel.Emitter_231'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2880
   ObjPosY=1664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2800
   ObjPosY=1448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_1
   Begin Object Class=CameraShake Name=CameraShake_1 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      OscillationDuration=30.000000
      OscillationBlendInTime=3.000000
      OscillationBlendOutTime=20.000000
      RotOscillation=(Pitch=(Amplitude=75.000000,Frequency=50.000000),Yaw=(Amplitude=25.000000,Frequency=40.000000),Roll=(Amplitude=1.500000,Frequency=60.000000))
      Name="CameraShake_1"
      ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   End Object
   Shake=CameraShake'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_1.CameraShake_1'
   ShakeScale=0.700000
   InputLinks(0)=(DrawY=1372,OverrideDelta=13)
   InputLinks(1)=(DrawY=1392,OverrideDelta=33)
   OutputLinks(0)=(DrawY=1382,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=2782,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2848,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2744
   ObjPosY=1336
   DrawWidth=148
   DrawHeight=85
   Name="SeqAct_CameraShake_1"
   ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_Zed_Landing.Stop_ZL_Thunder'
   InputLinks(0)=(DrawY=1322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1322,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3176,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=1288
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
   MaxWidth=248
   OutputLinks(0)=(LinkDesc="Start wave Logic",DrawY=988,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=1008,OverrideDelta=33)
   VariableLinks(0)=(DrawX=3811,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3872,OverrideDelta=86)
   VariableLinks(2)=(DrawX=3953,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3768
   ObjPosY=920
   DrawWidth=188
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_0"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=956,OverrideDelta=29)
   InputLinks(1)=(DrawY=1007,OverrideDelta=80)
   InputLinks(2)=(DrawY=1058,OverrideDelta=131)
   InputLinks(3)=(DrawY=1109,OverrideDelta=182)
   InputLinks(4)=(DrawY=1160,OverrideDelta=233)
   OutputLinks(0)=(DrawY=943,OverrideDelta=16)
   OutputLinks(1)=(DrawY=966,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),LinkDesc="Start",DrawY=989,OverrideDelta=62)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),LinkDesc="Nuke1",DrawY=1012,OverrideDelta=85)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),LinkDesc="Nuke2",DrawY=1035,OverrideDelta=108)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1'),(LinkedOp=SeqAct_CameraShake'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0')),LinkDesc="Nuke3",DrawY=1058,OverrideDelta=131)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),LinkDesc="Nuke4",DrawY=1081,OverrideDelta=154)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),LinkDesc="Nuke5",DrawY=1104,OverrideDelta=177)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),LinkDesc="Nuke6",DrawY=1127,OverrideDelta=200)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1'),(LinkedOp=SeqAct_AkPostEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),LinkDesc="Nuke7",DrawY=1150,OverrideDelta=223)
   OutputLinks(10)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),LinkDesc="Nuke8",DrawY=1173,OverrideDelta=246)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=4207,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Events",MinVars=0,DrawX=4261,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157'),LinkDesc="akamb",MinVars=0,DrawX=4321,OverrideDelta=124)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="akamb2",MinVars=0,DrawX=4383,OverrideDelta=182)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4176
   ObjPosY=904
   DrawWidth=248
   DrawHeight=301
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(EventName="Start")
         EventTrack(1)=(Time=25.000000,EventName="Nuke1")
         EventTrack(2)=(Time=32.000000,EventName="Nuke2")
         EventTrack(3)=(Time=38.000000,EventName="Nuke3")
         EventTrack(4)=(Time=43.000000,EventName="Nuke4")
         EventTrack(5)=(Time=46.000000,EventName="Nuke5")
         EventTrack(6)=(Time=47.500000,EventName="Nuke6")
         EventTrack(7)=(Time=49.000000,EventName="Nuke7")
         EventTrack(8)=(Time=50.500000,EventName="Nuke8")
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackEvent_0'
      GroupName="Events"
      GroupColor=(B=0,G=217,R=95,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_10
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_9
         AkEvents(0)=(Time=29.000000,Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Explo')
         Name="InterpTrackAkEvent_9"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_10.InterpTrackAkEvent_9'
      GroupName="akamb"
      GroupColor=(B=146,G=0,R=191,A=255)
      Name="InterpGroup_10"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_11
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_10
         AkEvents(0)=(Time=40.000000,Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Rumble_LP_13')
         Name="InterpTrackAkEvent_10"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackAkEvent_10'
      GroupName="akamb2"
      GroupColor=(B=74,G=224,R=0,A=255)
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=58.330200
   InterpGroups(0)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_10'
   InterpGroups(2)=InterpGroup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11'
   CurveEdSetup=InterpCurveEdSetup'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=58.330200
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4144
   ObjPosY=1288
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=2439
   SizeY=1981
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3672
   ObjPosY=704
   ObjComment="Boss Wave Nuke Sequence"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5240
   ObjPosY=936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5472
   ObjPosY=1152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5504
   ObjPosY=1392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5560
   ObjPosY=1640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5864
   ObjPosY=1880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5672
   ObjPosY=2120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5600
   ObjPosY=2384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5232
   ObjPosY=2568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_156"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=InterpActor'KF-Nuked.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4304
   ObjPosY=1240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_0
   Begin Object Class=CameraShake Name=CameraShake_1 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      OscillationDuration=30.000000
      OscillationBlendInTime=5.000000
      OscillationBlendOutTime=10.000000
      RotOscillation=(Pitch=(Amplitude=75.000000,Frequency=50.000000),Yaw=(Amplitude=25.000000,Frequency=40.000000),Roll=(Amplitude=1.500000,Frequency=60.000000))
      Name="CameraShake_1"
      ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   End Object
   Shake=CameraShake'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0.CameraShake_1'
   ShakeScale=0.500000
   InputLinks(0)=(DrawY=1364,OverrideDelta=13)
   InputLinks(1)=(DrawY=1384,OverrideDelta=33)
   OutputLinks(0)=(DrawY=1374,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=4446,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4512,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4408
   ObjPosY=1328
   DrawWidth=148
   DrawHeight=85
   Name="SeqAct_CameraShake_0"
   ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4464
   ObjPosY=1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxWidth=136
   OutputLinks(0)=(DrawY=1373,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1394,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=1415,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1584
   ObjPosY=1304
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=20.000000
   InputLinks(0)=(DrawY=1501,OverrideDelta=14)
   InputLinks(1)=(DrawY=1522,OverrideDelta=35)
   InputLinks(2)=(DrawY=1543,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),DrawY=1506,OverrideDelta=19)
   OutputLinks(1)=(DrawY=1538,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1028,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1080
   ObjPosY=1464
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=1485,OverrideDelta=14)
   InputLinks(1)=(DrawY=1506,OverrideDelta=35)
   InputLinks(2)=(DrawY=1527,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1506,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_194',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_195',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_196',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_198',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199'),DrawX=-522,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-471,OverrideDelta=76)
   EventLinks(0)=(DrawX=-422,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-560
   ObjPosY=1448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=1506,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=1506,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-772,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-896
   ObjPosY=1472
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1389,OverrideDelta=14)
   InputLinks(1)=(DrawY=1410,OverrideDelta=35)
   InputLinks(2)=(DrawY=1431,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1410,OverrideDelta=35)
   VariableLinks(0)=(DrawX=-1322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1271,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_0'),DrawX=-1222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1360
   ObjPosY=1352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_0
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=1562,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1312,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1242,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1360
   ObjPosY=1496
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_0"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=810,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=810,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1316,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1440
   ObjPosY=776
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SpawnsOff"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=1)),DrawY=578,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-682,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-776
   ObjPosY=512
   ObjComment="SpawnsOff"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=725,OverrideDelta=14)
   OutputLinks(1)=(DrawY=746,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),DrawY=767,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1672
   ObjPosY=656
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=8
   IncrementAmount=0
   InputLinks(0)=(DrawY=784,OverrideDelta=49)
   InputLinks(1)=(DrawY=876,OverrideDelta=141)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30')),DrawY=750,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),LinkDesc="Link 2",DrawY=773,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),LinkDesc="Link 3",DrawY=796,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28')),LinkDesc="Link 4",DrawY=819,OverrideDelta=84)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29')),LinkDesc="Link 5",DrawY=842,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),LinkDesc="Link 6",DrawY=865,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),LinkDesc="Link 7",DrawY=888,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_Toggle'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),LinkDesc="Link 8",DrawY=911,OverrideDelta=176)
   VariableLinks(0)=(DrawX=-1100,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1144
   ObjPosY=712
   DrawWidth=89
   DrawHeight=245
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=693,OverrideDelta=14)
   InputLinks(1)=(DrawY=714,OverrideDelta=35)
   InputLinks(2)=(DrawY=735,OverrideDelta=56)
   OutputLinks(0)=(DrawY=714,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_206',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211'),DrawX=110,OverrideDelta=16)
   VariableLinks(1)=(DrawX=161,OverrideDelta=76)
   EventLinks(0)=(DrawX=210,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=656
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=669,OverrideDelta=14)
   InputLinks(1)=(DrawY=690,OverrideDelta=35)
   InputLinks(2)=(DrawY=711,OverrideDelta=56)
   OutputLinks(0)=(DrawY=690,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_217'),DrawX=518,OverrideDelta=16)
   VariableLinks(1)=(DrawX=569,OverrideDelta=76)
   EventLinks(0)=(DrawX=618,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=480
   ObjPosY=632
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=1165,OverrideDelta=14)
   InputLinks(1)=(DrawY=1186,OverrideDelta=35)
   InputLinks(2)=(DrawY=1207,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1186,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_200',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_202',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_205'),DrawX=-114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-63,OverrideDelta=76)
   EventLinks(0)=(DrawX=-14,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-152
   ObjPosY=1128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=1101,OverrideDelta=14)
   InputLinks(1)=(DrawY=1122,OverrideDelta=35)
   InputLinks(2)=(DrawY=1143,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1122,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_219',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223'),DrawX=590,OverrideDelta=16)
   VariableLinks(1)=(DrawX=641,OverrideDelta=76)
   EventLinks(0)=(DrawX=690,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=552
   ObjPosY=1064
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_32
   SizeX=2885
   SizeY=1655
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1776
   ObjPosY=400
   ObjComment="Random Start Location"
   DrawWidth=2885
   DrawHeight=1655
   Name="SequenceFrame_32"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_194
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-704
   ObjPosY=1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_194"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-600
   ObjPosY=1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_195"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_196
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_196"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-304
   ObjPosY=1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-200
   ObjPosY=1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-208
   ObjPosY=1328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-112
   ObjPosY=1328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_202
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=1328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_202"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-184
   ObjPosY=1424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-96
   ObjPosY=1424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_205
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=1424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_205"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_206
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_206"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_207
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_207"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_208
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=168
   ObjPosY=832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_208"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=112
   ObjPosY=912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=472
   ObjPosY=816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_217
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=720
   ObjPosY=904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_217"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=1256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=1256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=1256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=768
   ObjPosY=1352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=1333,OverrideDelta=14)
   InputLinks(1)=(DrawY=1354,OverrideDelta=35)
   InputLinks(2)=(DrawY=1375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_225',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_227',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_229'),DrawX=262,OverrideDelta=16)
   VariableLinks(1)=(DrawX=313,OverrideDelta=76)
   EventLinks(0)=(DrawX=362,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=1296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=208
   ObjPosY=1536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_225
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=1536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_225"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=1536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_227
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=248
   ObjPosY=1632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_227"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=1632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=1632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_229"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_230
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=512
   ObjPosY=1768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_230"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_231
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=1768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_231"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=712
   ObjPosY=1768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_232"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_233"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_234
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_234"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=768
   ObjPosY=1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_235"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=1581,OverrideDelta=14)
   InputLinks(1)=(DrawY=1602,OverrideDelta=35)
   InputLinks(2)=(DrawY=1623,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1602,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_231',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_234',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_230',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233'),DrawX=718,OverrideDelta=16)
   VariableLinks(1)=(DrawX=769,OverrideDelta=76)
   EventLinks(0)=(DrawX=818,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=680
   ObjPosY=1544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=1061,OverrideDelta=14)
   InputLinks(1)=(DrawY=1082,OverrideDelta=35)
   InputLinks(2)=(DrawY=1103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_236',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_237',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241'),DrawX=-506,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-455,OverrideDelta=76)
   EventLinks(0)=(DrawX=-406,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-544
   ObjPosY=1024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_236
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-600
   ObjPosY=1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_236"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_237"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-544
   ObjPosY=1280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-440
   ObjPosY=1280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-352
   ObjPosY=1280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=1061,OverrideDelta=14)
   InputLinks(1)=(DrawY=1082,OverrideDelta=35)
   InputLinks(2)=(DrawY=1103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246',SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247'),DrawX=-890,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-839,OverrideDelta=76)
   EventLinks(0)=(DrawX=-790,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-928
   ObjPosY=1024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1024
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-928
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-824
   ObjPosY=1208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-968
   ObjPosY=1296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-864
   ObjPosY=1296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=KFPlayerStart'KF-Nuked.TheWorld:PersistentLevel.KFPlayerStart_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-768
   ObjPosY=1296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_Nuked.Play_ENV_Nuked_Siren'
   InputLinks(0)=(DrawY=842,OverrideDelta=11)
   OutputLinks(0)=(DrawY=842,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3200,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3152
   ObjPosY=808
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_Nuked.Play_ENV_Nuked_Nuke'
   InputLinks(0)=(DrawY=970,OverrideDelta=11)
   OutputLinks(0)=(DrawY=970,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3176,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=936
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_Nuked.Play_ENV_Nuked_Rumble_Loop'
   InputLinks(0)=(DrawY=1090,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1090,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3184,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3136
   ObjPosY=1056
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_Nuked.Stop_ENV_Nuked_Rumble_Loop'
   InputLinks(0)=(DrawY=1202,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1202,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3192,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3144
   ObjPosY=1168
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_Nuked.Play_ENV_Nuked_Siren_Distant'
   InputLinks(0)=(DrawY=970,OverrideDelta=11)
   OutputLinks(0)=(DrawY=970,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157'),DrawX=3512,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-Nuked.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3464
   ObjPosY=936
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=CameraShake Name=CameraShake_1 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   OscillationDuration=30.000000
   OscillationBlendInTime=3.000000
   OscillationBlendOutTime=20.000000
   RotOscillation=(Pitch=(Amplitude=75.000000,Frequency=50.000000),Yaw=(Amplitude=25.000000,Frequency=40.000000),Roll=(Amplitude=1.500000,Frequency=60.000000))
   Name="CameraShake_1"
   ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
End Object

Begin Object Class=CameraShake Name=CameraShake_1 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   OscillationDuration=30.000000
   OscillationBlendInTime=5.000000
   OscillationBlendOutTime=10.000000
   RotOscillation=(Pitch=(Amplitude=75.000000,Frequency=50.000000),Yaw=(Amplitude=25.000000,Frequency=40.000000),Roll=(Amplitude=1.500000,Frequency=60.000000))
   Name="CameraShake_1"
   ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
End Object
