Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-4819,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4798,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4777,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6838,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=-4888
   ObjName="TriggerVolume_0 Touch"
   ObjComment="Morgue"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-4851,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4830,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4809,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4830,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-6610,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6559,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6510,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-4888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_18
   InputLinks(0)=(DrawY=-7234,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7212,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7190,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7168,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7146,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7218,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7162,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_18'),DrawX=5010,OverrideDelta=19)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216'),LinkDesc="FloorboardRamp",MinVars=0,DrawX=5076,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4976
   ObjPosY=-7272
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_18"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_18
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.501152,OutVal=(X=0.000000,Y=0.000000,Z=-0.000122),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.501152,OutVal=(X=15.996094,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.501152)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_5.InterpTrackMove_0'
      GroupName="FloorboardRamp"
      GroupColor=(B=222,G=0,R=84,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_5'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4960
   ObjPosY=-7040
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_18"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_260
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-9448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_260"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_261
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3456
   ObjPosY=-9448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_261"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_262
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3360
   ObjPosY=-9448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_262"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_263
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-9448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_263"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_264
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=-9440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_264"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_265
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3088
   ObjPosY=-9440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_265"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-9424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_8"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_7
   InputLinks(0)=(DrawY=-6843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_24'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),DrawY=-6822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_190',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_237',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238'),DrawX=-6730,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6679,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6630,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-6880
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_7"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3776
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_3
   InputLinks(0)=(DrawY=-6603,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6582,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6561,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_30'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),DrawY=-6582,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_376',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_579',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_604',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_637',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_156'),DrawX=-6706,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6655,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6606,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-6640
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_3"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-9168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_9"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3904
   ObjPosY=-8904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_10"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_2
   InputLinks(0)=(DrawY=-6339,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6318,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6297,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_24')),DrawY=-6318,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_649',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-6698,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6647,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6598,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-6376
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_2"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_14
   InputLinks(0)=(DrawY=-6059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6017,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_24'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),DrawY=-6038,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_193',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_194',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_195',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_198',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146'),DrawX=-6714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-6096
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_14"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3880
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_15"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3872
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_4"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_6
   InputLinks(0)=(DrawY=-5843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_24'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),DrawY=-5822,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_200',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_202',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=-6714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-5880
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_6"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=-8912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3760
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3792
   ObjPosY=-8152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_329
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-8912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_329"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_330
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3464
   ObjPosY=-8912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_330"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_331
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3368
   ObjPosY=-8912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_331"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_332
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-8912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_332"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_333
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=-8912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_333"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_334
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3072
   ObjPosY=-8912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_334"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_347
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3648
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_347"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_348
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_348"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_349
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3448
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_349"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_350
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3360
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_350"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_351
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_351"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_352
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3160
   ObjPosY=-8552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_352"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_353
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3656
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_353"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_354
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_354"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_355
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3448
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_355"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_356
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3352
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_356"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_357
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3256
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_357"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_358
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3152
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_358"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7688
   ObjPosY=-6749
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_1"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_2
   IntValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7672
   ObjPosY=-6517
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_2"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_4
   IntValue=2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7696
   ObjPosY=-6264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_4"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_8
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-5989
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_8"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_0
   IntValue=4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=-5773
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_0"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_4
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_7')),DrawY=-6660,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_16')),DrawY=-6640,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9933,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9872,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9791,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9976
   ObjPosY=-6728
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_4"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=KFSeqAct_SetTeleporterURLNum Name=KFSeqAct_SetTeleporterURLNum_2
   InputLinks(0)=(DrawY=-6843,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_23')),DrawY=-6843,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_435',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_436',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_437',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_438',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_449',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_450'),DrawX=-8166,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-8110,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8224
   ObjPosY=-6877
   DrawWidth=168
   DrawHeight=61
   Name="KFSeqAct_SetTeleporterURLNum_2"
   ObjectArchetype=KFSeqAct_SetTeleporterURLNum'KFGame.Default__KFSeqAct_SetTeleporterURLNum'
End Object

Begin Object Class=KFSeqAct_SetTeleporterURLNum Name=KFSeqAct_SetTeleporterURLNum_11
   InputLinks(0)=(DrawY=-6619,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_26')),DrawY=-6619,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_473',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_474',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_475',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_476',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_481',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_482'),DrawX=-8158,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_2'),DrawX=-8102,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-6653
   DrawWidth=168
   DrawHeight=61
   Name="KFSeqAct_SetTeleporterURLNum_11"
   ObjectArchetype=KFSeqAct_SetTeleporterURLNum'KFGame.Default__KFSeqAct_SetTeleporterURLNum'
End Object

Begin Object Class=KFSeqAct_SetTeleporterURLNum Name=KFSeqAct_SetTeleporterURLNum_12
   InputLinks(0)=(DrawY=-6358,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=-6358,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_463',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_464',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_465',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_466',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_471',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_472'),DrawX=-8190,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_4'),DrawX=-8134,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8248
   ObjPosY=-6392
   DrawWidth=168
   DrawHeight=61
   Name="KFSeqAct_SetTeleporterURLNum_12"
   ObjectArchetype=KFSeqAct_SetTeleporterURLNum'KFGame.Default__KFSeqAct_SetTeleporterURLNum'
End Object

Begin Object Class=KFSeqAct_SetTeleporterURLNum Name=KFSeqAct_SetTeleporterURLNum_0
   InputLinks(0)=(DrawY=-5835,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_21')),DrawY=-5835,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_397',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_398',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_399',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_400',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_411',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_412'),DrawX=-8214,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_0'),DrawX=-8158,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8272
   ObjPosY=-5869
   DrawWidth=168
   DrawHeight=61
   Name="KFSeqAct_SetTeleporterURLNum_0"
   ObjectArchetype=KFSeqAct_SetTeleporterURLNum'KFGame.Default__KFSeqAct_SetTeleporterURLNum'
End Object

Begin Object Class=KFSeqAct_SetTeleporterURLNum Name=KFSeqAct_SetTeleporterURLNum_17
   InputLinks(0)=(DrawY=-6051,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_28')),DrawY=-6051,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_413',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_414',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_415',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_416',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_421',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_422'),DrawX=-8214,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_8'),DrawX=-8158,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8272
   ObjPosY=-6085
   DrawWidth=168
   DrawHeight=61
   Name="KFSeqAct_SetTeleporterURLNum_17"
   ObjectArchetype=KFSeqAct_SetTeleporterURLNum'KFGame.Default__KFSeqAct_SetTeleporterURLNum'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3960
   ObjPosY=-7792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3872
   ObjPosY=-7792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3768
   ObjPosY=-7800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-7800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3584
   ObjPosY=-7800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3488
   ObjPosY=-7800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3392
   ObjPosY=-7800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-7800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetTeleporterURLNum Name=KFSeqAct_SetTeleporterURLNum_16
   InputLinks(0)=(DrawY=-5822,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_1')),DrawY=-5822,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_507',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_508',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_509',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_510',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_517',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_518'),DrawX=-9798,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_9'),DrawX=-9742,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9856
   ObjPosY=-5856
   DrawWidth=168
   DrawHeight=61
   Name="KFSeqAct_SetTeleporterURLNum_16"
   ObjectArchetype=KFSeqAct_SetTeleporterURLNum'KFGame.Default__KFSeqAct_SetTeleporterURLNum'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_9
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-5728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_9"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_1
   InputLinks(0)=(DrawY=-5803,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5782,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5761,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5782,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_205',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_206',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243'),DrawX=-9034,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8983,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8934,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9072
   ObjPosY=-5840
   ObjComment="Boss Spawners"
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_1"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7552
   ObjPosY=-7360
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_34"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=-7610,OverrideDelta=47)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),DrawY=-7643,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),LinkDesc="Link 2",DrawY=-7621,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10')),LinkDesc="Link 3",DrawY=-7599,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24')),LinkDesc="Link 4",DrawY=-7577,OverrideDelta=80)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_34'),DrawX=7586,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7552
   ObjPosY=-7680
   DrawWidth=68
   DrawHeight=133
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_5
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_8')),DrawY=-7692,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-7672,OverrideDelta=33)
   VariableLinks(0)=(DrawX=6075,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6136,OverrideDelta=86)
   VariableLinks(2)=(DrawX=6217,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6032
   ObjPosY=-7760
   ObjComment="Open all doors, except new arena"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_5"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_2
   InputLinks(0)=(DrawY=-9606,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_4')),DrawY=-9606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_8'),DrawX=-3895,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=-3838,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265'),DrawX=-3761,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3928
   ObjPosY=-9640
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_2"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_3
   InputLinks(0)=(DrawY=-9278,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_9')),DrawY=-9278,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_9'),DrawX=-3839,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=-3782,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215'),DrawX=-3705,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3872
   ObjPosY=-9312
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_3"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3576
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3480
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3376
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3184
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjValue=KFPlayerStart'KF-NIGHTMARE.TheWorld:PersistentLevel.KFPlayerStart_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3088
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_4
   InputLinks(0)=(DrawY=-9022,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_11')),DrawY=-9022,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_10'),DrawX=-3839,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=-3782,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_329',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_330',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_331',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_332',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_333',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_334'),DrawX=-3705,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3872
   ObjPosY=-9056
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_4"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_11
   InputLinks(0)=(DrawY=-8702,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_19')),DrawY=-8702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_15'),DrawX=-3863,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=-3806,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_347',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_348',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_349',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_350',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_351',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_352'),DrawX=-3729,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-8736
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_11"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_9
   InputLinks(0)=(DrawY=-8286,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_5')),DrawY=-8286,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_4'),DrawX=-3855,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=-3798,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_353',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_354',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_355',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_356',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_357',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_358'),DrawX=-3721,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-8320
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_9"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_18
   MaxWidth=248
   OutputLinks(0)=(DrawY=-7236,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_18'),(LinkedOp=SeqAct_ChangeCollision'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_14')),DrawY=-7216,OverrideDelta=33)
   VariableLinks(0)=(DrawX=4523,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4584,OverrideDelta=86)
   VariableLinks(2)=(DrawX=4665,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4480
   ObjPosY=-7304
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_18"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_268
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-8072
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_268"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_273
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8608
   ObjPosY=-8160
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_273"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_274
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8608
   ObjPosY=-8232
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_274"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_275
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8608
   ObjPosY=-8304
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_275"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_657
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8800
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_657"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_658
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8712
   ObjPosY=-8280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_658"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_662
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8704
   ObjPosY=-8120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_662"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_665
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8800
   ObjPosY=-8200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_665"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_666
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8704
   ObjPosY=-8200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_666"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_15
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000012,Z=-0.000002),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_0.InterpTrackMove_0'
      GroupName="Trader_Doors_Left"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000020,Z=-0.000003),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_2.InterpTrackMove_2'
      GroupName="Trader_Door_Right"
      GroupColor=(B=0,G=202,R=128,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_15.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8536
   ObjPosY=-8488
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_15"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-8642,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8620,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8598,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8576,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8554,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8626,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8570,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_15'),DrawX=8679,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_666',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_662',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_658',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_796'),LinkDesc="Trader_Doors_Left",MinVars=0,DrawX=8746,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_665',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_657'),LinkDesc="Trader_Door_Right",MinVars=0,DrawX=8833,OverrideDelta=150)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8648
   ObjPosY=-8680
   ObjComment="Spider"
   DrawWidth=237
   DrawHeight=173
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=KFSeqAct_ShowPath Name=KFSeqAct_ShowPath_11
   VolumeCheckType=VCT_InVolume
   Targets(0)=None
   InputLinks(0)=(DrawY=-7100,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7080,OverrideDelta=33)
   OutputLinks(0)=(LinkDesc="Finished",DrawY=-7100,OverrideDelta=13)
   OutputLinks(1)=(LinkDesc="Aborted",DrawY=-7080,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_15'),DrawX=-3083,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_14'),DrawX=-3007,OverrideDelta=106)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3136
   ObjPosY=-7136
   DrawWidth=169
   DrawHeight=101
   Name="KFSeqAct_ShowPath_11"
   ObjectArchetype=KFSeqAct_ShowPath'KFGame.Default__KFSeqAct_ShowPath'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_8')),DrawY=-5475,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5454,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5433,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9856
   ObjPosY=-5544
   ObjComment="Start Arena Turn On Spawns"
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_8
   InputLinks(0)=(DrawY=-5475,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5454,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5433,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5454,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_321',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_342',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_344',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_365',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_367',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_821',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_822',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_188',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_189',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_191',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_196',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209'),DrawX=-9594,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9543,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9494,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9632
   ObjPosY=-5512
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_8"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_4
   InputLinks(0)=(DrawY=-9611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9569,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_1')),DrawY=-9590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265'),DrawX=-3458,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3407,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3358,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3496
   ObjPosY=-9648
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_4"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_28
   InputLinks(0)=(LinkDesc="In",DrawY=-8030,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTraderVolumeIgnore'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTraderVolumeIgnore_0')),DrawY=-8030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_592'),PropertyName="Targets",DrawX=1265,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1224
   ObjPosY=-8064
   DrawWidth=83
   DrawHeight=77
   Name="KFSeqAct_SetTrader_28"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_592
   ObjValue=KFTraderTrigger'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTraderTrigger_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1264
   ObjPosY=-7936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_592"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_9
   InputLinks(0)=(DrawY=-9299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9257,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_9')),DrawY=-9278,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215'),DrawX=-3490,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3439,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3390,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3528
   ObjPosY=-9336
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_9"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_11
   InputLinks(0)=(DrawY=-9059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9017,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_8')),DrawY=-9038,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_329',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_330',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_331',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_332',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_333',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_334'),DrawX=-3530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3568
   ObjPosY=-9096
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_11"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_19
   InputLinks(0)=(DrawY=-8707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8665,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_3')),DrawY=-8686,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_347',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_348',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_349',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_350',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_351',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_352'),DrawX=-3570,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3519,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3470,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3608
   ObjPosY=-8744
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_19"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_5
   InputLinks(0)=(DrawY=-8299,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8278,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8257,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_2')),DrawY=-8278,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_353',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_354',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_355',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_356',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_357',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_358'),DrawX=-3562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3600
   ObjPosY=-8336
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_5"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_1
   InputLinks(0)=(LinkDesc="In",DrawY=-7774,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTraderVolumeIgnore'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTraderVolumeIgnore_1')),DrawY=-7774,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),PropertyName="Targets",DrawX=1273,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1232
   ObjPosY=-7808
   ObjComment="Set Boss Trader"
   DrawWidth=83
   DrawHeight=77
   Name="KFSeqAct_SetTrader_1"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=KFTraderTrigger'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTraderTrigger_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1256
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_8
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=-6346,OverrideDelta=47)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_2')),DrawY=-6379,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_11')),LinkDesc="Link 2",DrawY=-6357,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_12')),LinkDesc="Link 3",DrawY=-6335,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_17')),LinkDesc="Link 4",DrawY=-6313,OverrideDelta=80)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_4'),DrawX=-8886,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-6416
   DrawWidth=68
   DrawHeight=133
   Name="SeqAct_Switch_8"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-6224
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_4"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_0
   ValueB=1
   InputLinks(0)=(DrawY=-9178,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9290,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_3')),DrawY=-9188,OverrideDelta=13)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_12')),DrawY=-9168,OverrideDelta=33)
   OutputLinks(3)=(DrawY=-9224,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9202,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=-8847,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_3'),DrawX=-8822,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-9224
   ObjComment="Short?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_0"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_2
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_0'),(LinkedOp=KFSeqAct_SetPawnIconVisibility'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetPawnIconVisibility_2')),DrawY=-9132,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-9112,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_32'),DrawX=-9453,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_33'),DrawX=-9392,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9311,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9496
   ObjPosY=-9200
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_2"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_0')),DrawY=-8675,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8654,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8633,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9624
   ObjPosY=-8744
   ObjComment="Wave 2 Arena Selection"
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="SetNextTrader"
   MaxWidth=213
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_23')),DrawY=-9262,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-614,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-720
   ObjPosY=-9328
   ObjComment="SetRandomArena"
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_32
   VarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9512
   ObjPosY=-8976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_32"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="SetNextTrader"
   InputLinks(0)=(DrawY=-9030,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9030,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1735,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1872
   ObjPosY=-9064
   DrawWidth=274
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_33
   VarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_33"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=-8648
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_8"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_26
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=-9184
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_26"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_75
   SizeX=4042
   SizeY=2239
   bDrawBox=True
   FillColor=(B=236,G=255,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-752
   ObjPosY=-9728
   ObjComment="Next Arena/Trader Selection"
   DrawWidth=4042
   DrawHeight=2239
   Name="SequenceFrame_75"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_3
   InputLinks(0)=(DrawY=-9098,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9138,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_0')),DrawY=-9108,OverrideDelta=13)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_1')),DrawY=-9088,OverrideDelta=33)
   OutputLinks(3)=(DrawY=-9072,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9050,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_29'),DrawX=-8663,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_5'),DrawX=-8638,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-9144
   ObjComment="Medium?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_3"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=4118
   SizeY=2146
   bDrawBox=True
   FillColor=(B=0,G=255,R=81,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5200
   ObjPosY=-9776
   ObjComment="Teleport Players/Enable Spawns"
   DrawWidth=4118
   DrawHeight=2146
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqAct_SetTraderVolumeIgnore Name=KFSeqAct_SetTraderVolumeIgnore_0
   VolumeCheckType=VCT_InVolume
   InputLinks(0)=(DrawY=-8028,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8008,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8018,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=1632,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1536
   ObjPosY=-8064
   DrawWidth=193
   DrawHeight=85
   Name="KFSeqAct_SetTraderVolumeIgnore_0"
   ObjectArchetype=KFSeqAct_SetTraderVolumeIgnore'KFGame.Default__KFSeqAct_SetTraderVolumeIgnore'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1608
   ObjPosY=-7920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_1
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6')),DrawY=-6812,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7')),DrawY=-6792,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-3797,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3736,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-3655,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3840
   ObjPosY=-6880
   ObjComment="Disable Scripted Path"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_1"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_0
   InputLinks(0)=(DrawY=-8702,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_10')),DrawY=-8702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),DrawX=-9318,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=-9262,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9352
   ObjPosY=-8736
   ObjComment="Set Current Arena Volume (for Scripted Paths)"
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_0"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   VarName="CurrentArenaVolume"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9264
   ObjPosY=-8632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_2
   InputLinks(0)=(DrawY=-8278,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_17')),DrawY=-8278,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=-3182,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_1'),DrawX=-3126,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3216
   ObjPosY=-8312
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_2"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaVolume"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3152
   ObjPosY=-8200
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_1"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaVolume"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3112
   ObjPosY=-8616
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_7"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_3
   InputLinks(0)=(DrawY=-8686,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_16')),DrawY=-8686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=-3142,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_7'),DrawX=-3086,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=-8720
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_3"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_12
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaVolume"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3112
   ObjPosY=-8976
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_12"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_8
   InputLinks(0)=(DrawY=-9054,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_18')),DrawY=-9054,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=-3142,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_12'),DrawX=-3086,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3176
   ObjPosY=-9088
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_8"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaVolume"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3112
   ObjPosY=-9248
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_9
   InputLinks(0)=(DrawY=-9310,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_19')),DrawY=-9310,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80'),DrawX=-3134,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_13'),DrawX=-3078,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-9344
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_9"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_5
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaVolume"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-9496
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_5"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_1
   InputLinks(0)=(DrawY=-9558,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetObject'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetObject_11')),DrawY=-9558,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79'),DrawX=-3078,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_5'),DrawX=-3022,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3112
   ObjPosY=-9592
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_1"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-8632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaVolume"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-7000
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_14"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_10
   InputLinks(0)=(DrawY=-8702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=-8958,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-8902,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-8736
   ObjComment="Set Current Scripted Path Target"
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_10"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   VarName="CurrentArenaScriptedPathTarget"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8920
   ObjPosY=-8608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_15
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaScriptedPathTarget"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3112
   ObjPosY=-6936
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_15"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_34
   SizeX=995
   SizeY=776
   bDrawBox=True
   FillColor=(B=70,G=255,R=110,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3864
   ObjPosY=-7336
   ObjComment="Enable/Disable Scripted Path"
   DrawWidth=995
   DrawHeight=776
   Name="SequenceFrame_34"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_21
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaScriptedPathTarget"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2744
   ObjPosY=-8576
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_21"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_16
   InputLinks(0)=(DrawY=-8702,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_32')),DrawY=-8702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),DrawX=-2774,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_21'),DrawX=-2718,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2808
   ObjPosY=-8736
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_16"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_22
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaScriptedPathTarget"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2704
   ObjPosY=-8216
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_22"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_17
   InputLinks(0)=(DrawY=-8286,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_19')),DrawY=-8286,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=-2782,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_22'),DrawX=-2726,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-8320
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_17"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_23
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaScriptedPathTarget"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2752
   ObjPosY=-8912
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_23"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_18
   InputLinks(0)=(DrawY=-9030,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_18')),DrawY=-9030,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),DrawX=-2782,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_23'),DrawX=-2726,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-9064
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_18"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_24
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaScriptedPathTarget"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-9200
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_24"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_19
   InputLinks(0)=(DrawY=-9294,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_20')),DrawY=-9294,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=-2790,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_24'),DrawX=-2734,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2824
   ObjPosY=-9328
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_19"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_16
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="CurrentArenaScriptedPathTarget"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-9440
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_16"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetObject Name=SeqAct_SetObject_11
   InputLinks(0)=(DrawY=-9558,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_31')),DrawY=-9558,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=-2790,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_16'),DrawX=-2734,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2824
   ObjPosY=-9592
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetObject_11"
   ObjectArchetype=SeqAct_SetObject'Engine.Default__SeqAct_SetObject'
End Object

Begin Object Class=KFSeqAct_SetPawnIconVisibility Name=KFSeqAct_SetPawnIconVisibility_2
   InputLinks(0)=(DrawY=-9380,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9360,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9370,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8888
   ObjPosY=-9416
   DrawWidth=165
   DrawHeight=69
   Name="KFSeqAct_SetPawnIconVisibility_2"
   ObjectArchetype=KFSeqAct_SetPawnIconVisibility'KFGame.Default__KFSeqAct_SetPawnIconVisibility'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=TriggeredPath'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggeredPath_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9008
   ObjPosY=-8624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=TriggeredPath'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggeredPath_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-9496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=TriggeredPath'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggeredPath_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2824
   ObjPosY=-9232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=TriggeredPath'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggeredPath_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2848
   ObjPosY=-8224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=TriggeredPath'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggeredPath_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2800
   ObjPosY=-8632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=TriggeredPath'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggeredPath_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2816
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2888
   ObjPosY=-9688
   ObjComment="Trader Paths"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-7914,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7892,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7870,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7848,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7826,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7898,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7842,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=8687,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_682',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_678',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_781',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_798'),LinkDesc="Trader_Doors_Left",MinVars=0,DrawX=8754,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_681'),LinkDesc="Trader_Door_Right",MinVars=0,DrawX=8841,OverrideDelta=150)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8656
   ObjPosY=-7952
   ObjComment="Morgue"
   DrawWidth=237
   DrawHeight=173
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000012,Z=-0.000002),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_0.InterpTrackMove_0'
      GroupName="Trader_Doors_Left"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000020,Z=-0.000003),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2.InterpTrackMove_2'
      GroupName="Trader_Door_Right"
      GroupColor=(B=0,G=202,R=128,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8560
   ObjPosY=-7792
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_682
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8720
   ObjPosY=-7512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_682"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_681
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8824
   ObjPosY=-7504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_681"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_678
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8720
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_678"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_293
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8624
   ObjPosY=-7608
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_293"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_292
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8624
   ObjPosY=-7536
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_292"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_291
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8624
   ObjPosY=-7464
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_291"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_286
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8632
   ObjPosY=-7384
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_286"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_10
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-7234,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7212,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7190,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7168,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7146,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7218,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7162,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=8663,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_694',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_690',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_784',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_800'),LinkDesc="Trader_Doors_Left",MinVars=0,DrawX=8730,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_689'),LinkDesc="Trader_Door_Right",MinVars=0,DrawX=8817,OverrideDelta=150)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8632
   ObjPosY=-7272
   ObjComment="War"
   DrawWidth=237
   DrawHeight=173
   Name="SeqAct_Interp_10"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_9
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000012,Z=-0.000002),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackMove_0'
      GroupName="Trader_Doors_Left"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000020,Z=-0.000003),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2.InterpTrackMove_2'
      GroupName="Trader_Door_Right"
      GroupColor=(B=0,G=202,R=128,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8536
   ObjPosY=-7112
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_694
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8704
   ObjPosY=-6752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_694"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_690
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8704
   ObjPosY=-6888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_690"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_689
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8792
   ObjPosY=-6888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_689"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_311
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-6920
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_311"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_310
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-6848
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_310"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_309
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-6776
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_309"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_304
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8584
   ObjPosY=-6696
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_304"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_24
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-6522,OverrideDelta=15)
   InputLinks(1)=(DrawY=-6500,OverrideDelta=37)
   InputLinks(2)=(DrawY=-6478,OverrideDelta=59)
   InputLinks(3)=(DrawY=-6456,OverrideDelta=81)
   InputLinks(4)=(DrawY=-6434,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-6506,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-6450,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_23'),DrawX=8663,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_778',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_770',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_793',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_810'),LinkDesc="Trader_Doors_Left",MinVars=0,DrawX=8730,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_777',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_769'),LinkDesc="Trader_Door_Right",MinVars=0,DrawX=8817,OverrideDelta=150)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8632
   ObjPosY=-6560
   ObjComment="Circus"
   DrawWidth=237
   DrawHeight=173
   Name="SeqAct_Interp_24"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_23
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000012,Z=-0.000002),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0.InterpTrackMove_0'
      GroupName="Trader_Doors_Left"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000020,Z=-0.000003),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_2.InterpTrackMove_2'
      GroupName="Trader_Door_Right"
      GroupColor=(B=0,G=202,R=128,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_23.InterpGroup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8536
   ObjPosY=-6408
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_23"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_778
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8688
   ObjPosY=-6120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_778"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_777
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8784
   ObjPosY=-6104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_777"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_770
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8688
   ObjPosY=-6192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_770"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_769
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8784
   ObjPosY=-6176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_769"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_401
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-6216
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_401"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_400
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-6144
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_400"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_399
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-6072
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_399"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_394
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-6008
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_394"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_15
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5826,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5804,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5782,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5760,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5738,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-5810,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5754,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_12'),DrawX=8711,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_648',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_644',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_640',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_779',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_773'),LinkDesc="Trader_Doors_Left",MinVars=0,DrawX=8778,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_647',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_639'),LinkDesc="Trader_Door_Right",MinVars=0,DrawX=8865,OverrideDelta=150)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8680
   ObjPosY=-5864
   ObjComment="Cabin"
   DrawWidth=237
   DrawHeight=173
   Name="SeqAct_Interp_15"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_12
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000012,Z=-0.000002),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_0.InterpTrackMove_0'
      GroupName="Trader_Doors_Left"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000020,Z=-0.000003),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2.InterpTrackMove_2'
      GroupName="Trader_Door_Right"
      GroupColor=(B=0,G=202,R=128,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_12.InterpGroup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8576
   ObjPosY=-5680
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_12"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_648
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8736
   ObjPosY=-5384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_648"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_647
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8848
   ObjPosY=-5384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_647"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_644
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8736
   ObjPosY=-5304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_644"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_640
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8736
   ObjPosY=-5456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_640"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_639
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8840
   ObjPosY=-5464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_639"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_257
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8640
   ObjPosY=-5480
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_257"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_256
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8640
   ObjPosY=-5408
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_256"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_255
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8640
   ObjPosY=-5336
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_255"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_172
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8648
   ObjPosY=-5264
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_172"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_781
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8728
   ObjPosY=-7656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_781"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_784
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8696
   ObjPosY=-6968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_784"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_793
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8696
   ObjPosY=-6256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_793"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_779
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8744
   ObjPosY=-5536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_779"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_5
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_10',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_24',InputLinkIdx=1),(LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15',InputLinkIdx=1)),DrawY=-6204,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-6184,OverrideDelta=33)
   VariableLinks(0)=(DrawX=6987,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7048,OverrideDelta=86)
   VariableLinks(2)=(DrawX=7129,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6944
   ObjPosY=-6272
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_5"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_405
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6952
   ObjPosY=-6296
   ObjComment="Close all doors"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_405"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_1
   InputLinks(0)=(DrawY=-7950,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7950,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-3839,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=-3782,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135'),DrawX=-3705,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3872
   ObjPosY=-7984
   ObjComment="Boss"
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_1"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8701
   ObjPosY=-5736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6765
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6661
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6565
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6461
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6365
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6261
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9808
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9608
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9511
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9407
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9311
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_110'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6741
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_112'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6541
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6437
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6341
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_115'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6237
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6632
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_121'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6232
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_193
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6749
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_193"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_194
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6645
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_194"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6549
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_195"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6352
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6749
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_153'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6645
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_154'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6549
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_202
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6445
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_202"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6349
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6245
   ObjPosY=-5752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_205
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9207
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_205"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_206
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9111
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_206"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_207
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9006
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_207"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8909
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8805
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8709
   ObjPosY=-5608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_46
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9992
   ObjPosY=-6744
   ObjComment="Turn spawns On/Off"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_46"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_397
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8368
   ObjPosY=-5765
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_397"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_398
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8272
   ObjPosY=-5765
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_398"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_399
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8168
   ObjPosY=-5765
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_399"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_400
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=-5765
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_400"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_411
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-5773
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_411"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_412
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-5773
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_412"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_413
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-5981
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_413"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_414
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8240
   ObjPosY=-5981
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_414"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_415
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=-5981
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_415"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_416
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8040
   ObjPosY=-5981
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_416"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_421
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-5989
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_421"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_422
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7832
   ObjPosY=-5989
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_422"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_435
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-6749
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_435"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_436
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-6749
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_436"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_437
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-6749
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_437"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_438
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7984
   ObjPosY=-6749
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_438"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_449
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7872
   ObjPosY=-6749
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_449"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_450
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=-6749
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_450"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_463
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_463"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_464
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_464"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_465
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_465"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_466
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_466"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_471
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7856
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_471"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_472
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-6272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_472"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_473
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8256
   ObjPosY=-6517
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_473"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_474
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-6517
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_474"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_475
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8056
   ObjPosY=-6517
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_475"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_476
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-6517
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_476"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_481
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-6517
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_481"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_482
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-6517
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_482"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_507
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9880
   ObjPosY=-5744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_507"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_508
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9776
   ObjPosY=-5744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_508"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_509
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=-5744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_509"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_510
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9576
   ObjPosY=-5744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_510"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_517
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-5744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_517"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_518
   ObjValue=KFTeleporter'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTeleporter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-5744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_518"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6037
   ObjPosY=-6512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_8
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28'),(LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-4532,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4512,OverrideDelta=33)
   VariableLinks(0)=(DrawX=4635,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4696,OverrideDelta=86)
   VariableLinks(2)=(DrawX=4777,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4592
   ObjPosY=-4600
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_8"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=-4611,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4590,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4569,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4590,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_581',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239'),DrawX=5342,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5393,OverrideDelta=76)
   EventLinks(0)=(DrawX=5442,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5304
   ObjPosY=-4648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_321
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8904
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_321"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_342
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_342"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_344
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_344"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_365
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9328
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_365"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_376
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5933
   ObjPosY=-6512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_376"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_367
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9632
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_367"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_579
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5824
   ObjPosY=-6512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_579"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_604
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_111'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5736
   ObjPosY=-6512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_604"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_637
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6133
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_637"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_649
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6112
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_649"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_581
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5528
   ObjPosY=-4456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_581"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_796
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8712
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_796"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_798
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8720
   ObjPosY=-7728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_798"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_800
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8696
   ObjPosY=-7040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_800"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_810
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8696
   ObjPosY=-6344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_810"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_773
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8736
   ObjPosY=-5616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_773"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_821
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9199
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_821"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_822
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9528
   ObjPosY=-5232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_822"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9480
   ObjPosY=-3272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=InterpData Name=InterpData_14
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-2341.160156,Y=-2587.484375,Z=-18.777588),InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,OutVal=(X=-2571.722656,Y=-1503.632813,Z=-24.069092),ArriveTangent=(X=0.000000,Y=46.562355,Z=0.000000),LeaveTangent=(X=0.000000,Y=46.562355,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,OutVal=(X=-1913.285156,Y=-1388.183594,Z=-21.464600),ArriveTangent=(X=149.737106,Y=0.000000,Z=0.000000),LeaveTangent=(X=149.737106,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=16.500000,OutVal=(X=-1074.351563,Y=-1462.519531,Z=-25.976563),ArriveTangent=(X=127.008202,Y=0.000000,Z=-1.365462),LeaveTangent=(X=127.008202,Y=0.000000,Z=-1.365462),InterpMode=CIM_CurveAutoClamped),(InVal=21.500000,OutVal=(X=-643.203125,Y=-1462.265625,Z=-35.173828),ArriveTangent=(X=113.666359,Y=0.137712,Z=-4.264351),LeaveTangent=(X=113.666359,Y=0.137712,Z=-4.264351),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=-108.187500,Y=-1448.558594,Z=-87.599365),ArriveTangent=(X=141.308334,Y=7.946204,Z=-10.021670),LeaveTangent=(X=141.308334,Y=7.946204,Z=-10.021670),InterpMode=CIM_CurveAutoClamped),(InVal=29.000000,OutVal=(X=416.609375,Y=-1351.730469,Z=-111.878662),ArriveTangent=(X=136.262146,Y=0.000000,Z=-8.182332),LeaveTangent=(X=136.262146,Y=0.000000,Z=-8.182332),InterpMode=CIM_CurveAutoClamped),(InVal=34.000000,OutVal=(X=1118.171875,Y=-2258.609375,Z=-161.497925),ArriveTangent=(X=0.000000,Y=-164.233200,Z=0.000000),LeaveTangent=(X=0.000000,Y=-164.233200,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=844.644531,Y=-2994.062500,Z=-154.902344),ArriveTangent=(X=-30.208000,Y=-204.432159,Z=0.000000),LeaveTangent=(X=-30.208000,Y=-204.432159,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=43.500000,OutVal=(X=767.484375,Y=-4200.714844,Z=-185.289063),ArriveTangent=(X=-32.671249,Y=-213.296051,Z=0.000000),LeaveTangent=(X=-32.671249,Y=-213.296051,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=48.500000,OutVal=(X=396.527344,Y=-5020.375000,Z=-152.348145),ArriveTangent=(X=-138.999786,Y=-2.982399,Z=9.675285),LeaveTangent=(X=-138.999786,Y=-2.982399,Z=9.675285),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=-1234.386719,Y=-5026.808594,Z=-82.397827),ArriveTangent=(X=-258.783997,Y=0.000000,Z=12.990967),LeaveTangent=(X=-258.783997,Y=0.000000,Z=12.990967),InterpMode=CIM_CurveAutoClamped),(InVal=58.500000,OutVal=(X=-2191.312500,Y=-3940.097656,Z=-22.438477),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((OutVal=(X=1.757813,Y=0.000000,Z=274.042969),InterpMode=CIM_CurveAutoClamped),(InVal=6.500000,OutVal=(X=-0.076904,Y=-1.757813,Z=362.285156),ArriveTangent=(X=-0.259851,Y=0.000000,Z=10.887973),LeaveTangent=(X=-0.259851,Y=0.000000,Z=10.887973),InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,OutVal=(X=-1.230469,Y=1.181030,Z=401.846924),ArriveTangent=(X=0.000000,Y=0.610291,Z=14.471369),LeaveTangent=(X=0.000000,Y=0.610291,Z=14.471369),InterpMode=CIM_CurveAutoClamped),(InVal=16.500000,OutVal=(X=-0.269165,Y=4.345093,Z=538.934326),ArriveTangent=(X=0.145020,Y=0.000000,Z=8.051047),LeaveTangent=(X=0.145020,Y=0.000000,Z=8.051047),InterpMode=CIM_CurveAutoClamped),(InVal=21.500000,OutVal=(X=0.219727,Y=4.213257,Z=557.753906),ArriveTangent=(X=0.000000,Y=-0.070225,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.070225,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=-0.681152,Y=0.505371,Z=525.811157),ArriveTangent=(X=-0.204346,Y=-0.220130,Z=-6.467285),LeaveTangent=(X=-0.204346,Y=-0.220130,Z=-6.467285),InterpMode=CIM_CurveAutoClamped),(InVal=29.000000,OutVal=(X=-1.312866,Y=0.126343,Z=509.249268),ArriveTangent=(X=0.000000,Y=-0.203030,Z=-8.274625),LeaveTangent=(X=0.000000,Y=-0.203030,Z=-8.274625),InterpMode=CIM_CurveAutoClamped),(InVal=34.000000,OutVal=(X=-0.834961,Y=-5.421753,Z=377.874756),ArriveTangent=(X=0.179640,Y=0.000000,Z=-26.540222),LeaveTangent=(X=0.179640,Y=0.000000,Z=-26.540222),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=0.994263,Y=3.565063,Z=243.847046),ArriveTangent=(X=0.139974,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.139974,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=43.500000,OutVal=(X=1.312866,Y=2.389526,Z=284.315186),ArriveTangent=(X=0.000000,Y=-0.254998,Z=12.322034),LeaveTangent=(X=0.000000,Y=-0.254998,Z=12.322034),InterpMode=CIM_CurveAutoClamped),(InVal=48.500000,OutVal=(X=-0.450439,Y=1.142578,Z=360.906372),ArriveTangent=(X=-0.322789,Y=0.000000,Z=18.376465),LeaveTangent=(X=-0.322789,Y=0.000000,Z=18.376465),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=-2.076416,Y=3.460693,Z=477.268066),ArriveTangent=(X=-0.052766,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.052766,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=58.500000,OutVal=(X=-2.186279,Y=2.142334,Z=434.613647),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=6.500000),(Time=11.500000),(Time=16.500000),(Time=21.500000),(Time=25.000000),(Time=29.000000),(Time=34.000000),(Time=39.000000),(Time=43.500000),(Time=48.500000),(Time=54.000000),(Time=58.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_0.InterpTrackMove_0'
      GroupName="NewCameraGroup"
      GroupColor=(B=51,G=0,R=229,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=0.000000,Y=0.000000,Z=-0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=59.500000,OutVal=(X=7.929688,Y=2.472656,Z=-45.000488),ArriveTangent=(X=0.510886,Y=0.000000,Z=-0.848004),LeaveTangent=(X=0.510886,Y=0.000000,Z=-0.848004),InterpMode=CIM_CurveAutoClamped),(InVal=62.500000,OutVal=(X=935.492188,Y=-1389.703613,Z=-53.000488),ArriveTangent=(X=279.299316,Y=-158.485764,Z=0.000000),LeaveTangent=(X=279.299316,Y=-158.485764,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=67.500000,OutVal=(X=2242.324219,Y=-1737.850342,Z=-37.000488),ArriveTangent=(X=251.044922,Y=0.000000,Z=0.000000),LeaveTangent=(X=251.044922,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=72.500000,OutVal=(X=3445.941406,Y=-687.713928,Z=-45.000488),ArriveTangent=(X=163.456543,Y=272.928619,Z=0.000000),LeaveTangent=(X=163.456543,Y=272.928619,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=77.500000,OutVal=(X=3953.218750,Y=991.435669,Z=-13.000488),ArriveTangent=(X=0.000000,Y=160.368118,Z=14.464348),LeaveTangent=(X=0.000000,Y=160.368118,Z=14.464348),InterpMode=CIM_CurveAutoClamped),(InVal=82.500000,OutVal=(X=3029.164063,Y=1413.949829,Z=352.999390),ArriveTangent=(X=-192.571869,Y=0.000000,Z=9.383514),LeaveTangent=(X=-192.571869,Y=0.000000,Z=9.383514),InterpMode=CIM_CurveAutoClamped),(InVal=87.500000,OutVal=(X=2027.500000,Y=316.378906,Z=372.999146),ArriveTangent=(X=0.000000,Y=-190.278885,Z=2.629664),LeaveTangent=(X=0.000000,Y=-190.278885,Z=2.629664),InterpMode=CIM_CurveAutoClamped),(InVal=92.500000,OutVal=(X=2180.296875,Y=-488.838989,Z=380.999512),ArriveTangent=(X=61.644848,Y=-0.760513,Z=0.000078),LeaveTangent=(X=61.644848,Y=-0.760513,Z=0.000078),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=2639.906250,Y=-490.031494,Z=380.999634),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=59.500000,OutVal=(X=0.000000,Y=-1.933594,Z=6.503906),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.394998),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.394998),InterpMode=CIM_CurveAutoClamped),(InVal=62.500000,OutVal=(X=0.000000,Y=-1.933594,Z=79.628906),ArriveTangent=(X=0.000000,Y=0.000000,Z=18.083496),LeaveTangent=(X=0.000000,Y=0.000000,Z=18.083496),InterpMode=CIM_CurveAutoClamped),(InVal=67.500000,OutVal=(X=0.000000,Y=-1.933594,Z=151.171875),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.484375),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.484375),InterpMode=CIM_CurveAutoClamped),(InVal=72.500000,OutVal=(X=0.000000,Y=-1.933594,Z=224.472656),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.802150),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.802150),InterpMode=CIM_CurveAutoClamped),(InVal=77.500000,OutVal=(X=0.000000,Y=-1.933594,Z=249.960938),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.921875),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.921875),InterpMode=CIM_CurveAutoClamped),(InVal=82.500000,OutVal=(X=0.000000,Y=-5.097656,Z=273.691406),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.115234),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.115234),InterpMode=CIM_CurveAutoClamped),(InVal=87.500000,OutVal=(X=0.000000,Y=-5.097656,Z=301.113281),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.134406),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.134406),InterpMode=CIM_CurveAutoClamped),(InVal=92.500000,OutVal=(X=0.000000,Y=-5.097656,Z=448.417969),ArriveTangent=(X=0.000000,Y=0.000000,Z=26.718750),LeaveTangent=(X=0.000000,Y=0.000000,Z=26.718750),InterpMode=CIM_CurveAutoClamped),(InVal=96.000000,OutVal=(X=0.000000,Y=-5.097656,Z=528.222656),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=59.500000),(Time=62.500000),(Time=67.500000),(Time=72.500000),(Time=77.500000),(Time=82.500000),(Time=87.500000),(Time=92.500000),(Time=96.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1.InterpTrackMove_0'
      GroupName="SpiderCAve"
      GroupColor=(B=174,G=165,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_19
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_12
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=233.500000,OutVal=(X=0.007813,Y=0.000488,Z=-0.000061),ArriveTangent=(X=0.000132,Y=0.000000,Z=-0.000001),LeaveTangent=(X=0.000132,Y=0.000000,Z=-0.000001),InterpMode=CIM_CurveAutoClamped),(InVal=237.500000,OutVal=(X=1265.437500,Y=-1593.238281,Z=-6.000305),ArriveTangent=(X=332.904938,Y=-253.335114,Z=-0.000130),LeaveTangent=(X=332.904938,Y=-253.335114,Z=-0.000130),InterpMode=CIM_CurveAutoClamped),(InVal=242.500000,OutVal=(X=2996.152344,Y=-2330.332031,Z=-6.000549),ArriveTangent=(X=298.919525,Y=0.000000,Z=0.000000),LeaveTangent=(X=298.919525,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=247.500000,OutVal=(X=4254.632813,Y=-1057.019043,Z=-6.000427),ArriveTangent=(X=243.691406,Y=208.980865,Z=0.000000),LeaveTangent=(X=243.691406,Y=208.980865,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=252.500000,OutVal=(X=5433.066406,Y=-240.523438,Z=-6.000793),ArriveTangent=(X=197.046097,Y=183.213425,Z=-0.000043),LeaveTangent=(X=197.046097,Y=183.213425,Z=-0.000043),InterpMode=CIM_CurveAutoClamped),(InVal=257.500000,OutVal=(X=6225.093750,Y=775.115234,Z=-6.000916),ArriveTangent=(X=0.000000,Y=208.425247,Z=0.000000),LeaveTangent=(X=0.000000,Y=208.425247,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=262.500000,OutVal=(X=5355.832031,Y=1843.729004,Z=-6.000793),ArriveTangent=(X=-181.718353,Y=0.000000,Z=0.000000),LeaveTangent=(X=-181.718353,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=267.500000,OutVal=(X=4407.910156,Y=1286.186035,Z=-6.000916),ArriveTangent=(X=-196.208206,Y=-144.553711,Z=-0.000024),LeaveTangent=(X=-196.208206,Y=-144.553711,Z=-0.000024),InterpMode=CIM_CurveAutoClamped),(InVal=272.500000,OutVal=(X=3393.750000,Y=398.191895,Z=-6.001038),ArriveTangent=(X=-206.609772,Y=0.000000,Z=-0.000024),LeaveTangent=(X=-206.609772,Y=0.000000,Z=-0.000024),InterpMode=CIM_CurveAutoClamped),(InVal=277.500000,OutVal=(X=2341.812500,Y=1553.090332,Z=-6.001160),ArriveTangent=(X=-251.046875,Y=0.000000,Z=-0.000021),LeaveTangent=(X=-251.046875,Y=0.000000,Z=-0.000021),InterpMode=CIM_CurveAutoClamped),(InVal=284.000000,OutVal=(X=506.710938,Y=359.520020,Z=-6.001282),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=233.500000,InterpMode=CIM_CurveAutoClamped),(InVal=237.500000,OutVal=(X=0.000000,Y=0.000000,Z=47.285156),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.226563),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.226563),InterpMode=CIM_CurveAutoClamped),(InVal=242.500000,OutVal=(X=0.000000,Y=0.000000,Z=110.039063),ArriveTangent=(X=0.000000,Y=0.000000,Z=10.863281),LeaveTangent=(X=0.000000,Y=0.000000,Z=10.863281),InterpMode=CIM_CurveAutoClamped),(InVal=247.500000,OutVal=(X=0.000000,Y=0.000000,Z=155.917969),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.496335),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.496335),InterpMode=CIM_CurveAutoClamped),(InVal=252.500000,OutVal=(X=0.000000,Y=0.000000,Z=167.871094),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.884977),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.884977),InterpMode=CIM_CurveAutoClamped),(InVal=257.500000,OutVal=(X=0.000000,Y=0.000000,Z=196.875000),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.750621),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.750621),InterpMode=CIM_CurveAutoClamped),(InVal=262.500000,OutVal=(X=0.000000,Y=0.000000,Z=255.585938),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.562958),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.562958),InterpMode=CIM_CurveAutoClamped),(InVal=267.500000,OutVal=(X=0.000000,Y=0.000000,Z=258.925781),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.539503),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.539503),InterpMode=CIM_CurveAutoClamped),(InVal=272.500000,OutVal=(X=0.000000,Y=0.000000,Z=306.562500),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.687366),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.687366),InterpMode=CIM_CurveAutoClamped),(InVal=277.500000,OutVal=(X=0.000000,Y=0.000000,Z=310.253906),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.618783),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.618783),InterpMode=CIM_CurveAutoClamped),(InVal=284.000000,OutVal=(X=0.000000,Y=0.000000,Z=404.648438),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=233.500000),(Time=237.500000),(Time=242.500000),(Time=247.500000),(Time=252.500000),(Time=257.500000),(Time=262.500000),(Time=267.500000),(Time=272.500000),(Time=277.500000),(Time=284.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_12"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_19.InterpTrackMove_12'
      GroupName="cabin"
      GroupColor=(B=166,G=0,R=174,A=255)
      Name="InterpGroup_19"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=97.500000,OutVal=(X=270.484375,Y=1913.000000,Z=48.000000),InterpMode=CIM_CurveAutoClamped),(InVal=102.500000,OutVal=(X=-355.835938,Y=923.484375,Z=48.000000),ArriveTangent=(X=0.000000,Y=-292.936340,Z=0.000000),LeaveTangent=(X=0.000000,Y=-292.936340,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=107.500000,OutVal=(X=-348.765625,Y=-1016.363281,Z=48.000000),ArriveTangent=(X=3.319015,Y=-27.823715,Z=0.000000),LeaveTangent=(X=3.319015,Y=-27.823715,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=111.500000,OutVal=(X=-289.730469,Y=-1065.601563,Z=48.000000),ArriveTangent=(X=32.402641,Y=-6.813786,Z=0.000000),LeaveTangent=(X=32.402641,Y=-6.813786,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=116.500000,OutVal=(X=924.937500,Y=-1084.003906,Z=48.000000),ArriveTangent=(X=31.880356,Y=0.000000,Z=0.000000),LeaveTangent=(X=31.880356,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=120.500000,OutVal=(X=982.960938,Y=-1047.253906,Z=48.000000),ArriveTangent=(X=8.979557,Y=20.944778,Z=0.000000),LeaveTangent=(X=8.979557,Y=20.944778,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=125.500000,OutVal=(X=1008.671875,Y=923.863281,Z=48.000000),ArriveTangent=(X=0.000000,Y=195.888046,Z=0.000000),LeaveTangent=(X=0.000000,Y=195.888046,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=129.000000,OutVal=(X=818.539063,Y=1319.015625,Z=48.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=97.500000,OutVal=(X=0.000000,Y=0.000000,Z=-89.824219),InterpMode=CIM_CurveAutoClamped),(InVal=102.500000,OutVal=(X=0.000000,Y=0.000000,Z=-89.648438),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.076213),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.076213),InterpMode=CIM_CurveAutoClamped),(InVal=107.500000,OutVal=(X=0.000000,Y=0.000000,Z=-88.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.737375),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.737375),InterpMode=CIM_CurveAutoClamped),(InVal=111.500000,OutVal=(X=0.000000,Y=0.000000,Z=1.054688),InterpMode=CIM_CurveAutoClamped),(InVal=116.500000,InterpMode=CIM_CurveAutoClamped),(InVal=120.500000,OutVal=(X=0.000000,Y=0.000000,Z=97.031250),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.750267),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.750267),InterpMode=CIM_CurveAutoClamped),(InVal=125.500000,OutVal=(X=0.000000,Y=0.000000,Z=120.410156),ArriveTangent=(X=0.000000,Y=0.000000,Z=10.363099),LeaveTangent=(X=0.000000,Y=0.000000,Z=10.363099),InterpMode=CIM_CurveAutoClamped),(InVal=129.000000,OutVal=(X=0.000000,Y=0.000000,Z=224.648438),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=97.500000),(Time=102.500000),(Time=107.500000),(Time=111.500000),(Time=116.500000),(Time=120.500000),(Time=125.500000),(Time=129.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_2.InterpTrackMove_1'
      GroupName="morgue"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_20
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_13
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=285.000000,InterpMode=CIM_CurveAutoClamped),(InVal=287.500000,OutVal=(X=319.980469,Y=-540.591797,Z=45.000000),ArriveTangent=(X=154.172852,Y=-139.919266,Z=18.000000),LeaveTangent=(X=154.172852,Y=-139.919266,Z=18.000000),InterpMode=CIM_CurveAutoClamped),(InVal=292.500000,OutVal=(X=1206.478516,Y=-1049.394531,Z=135.000000),ArriveTangent=(X=193.334961,Y=-110.012497,Z=0.000000),LeaveTangent=(X=193.334961,Y=-110.012497,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=297.500000,OutVal=(X=2253.330078,Y=-1640.716797,Z=-27.000000),ArriveTangent=(X=200.781448,Y=-101.243752,Z=-30.600000),LeaveTangent=(X=200.781448,Y=-101.243752,Z=-30.600000),InterpMode=CIM_CurveAutoClamped),(InVal=302.500000,OutVal=(X=3214.292969,Y=-2061.832031,Z=-171.000000),ArriveTangent=(X=174.097855,Y=0.000000,Z=-22.200001),LeaveTangent=(X=174.097855,Y=0.000000,Z=-22.200001),InterpMode=CIM_CurveAutoClamped),(InVal=307.500000,OutVal=(X=3994.308594,Y=-1793.417969,Z=-249.000000),ArriveTangent=(X=30.157993,Y=97.929024,Z=-24.348507),LeaveTangent=(X=30.157993,Y=97.929024,Z=-24.348507),InterpMode=CIM_CurveAutoClamped),(InVal=312.500000,OutVal=(X=4060.871094,Y=-871.716797,Z=-420.000000),ArriveTangent=(X=27.765303,Y=177.839645,Z=-10.233215),LeaveTangent=(X=27.765303,Y=177.839645,Z=-10.233215),InterpMode=CIM_CurveAutoClamped),(InVal=317.500000,OutVal=(X=4474.986328,Y=-15.021484,Z=-444.000244),ArriveTangent=(X=39.664604,Y=177.420700,Z=0.000000),LeaveTangent=(X=39.664604,Y=177.420700,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=322.500000,OutVal=(X=4579.591797,Y=902.490234,Z=-228.000244),ArriveTangent=(X=0.000000,Y=96.712433,Z=49.799999),LeaveTangent=(X=0.000000,Y=96.712433,Z=49.799999),InterpMode=CIM_CurveAutoClamped),(InVal=327.500000,OutVal=(X=3905.583984,Y=1166.726563,Z=53.999756),ArriveTangent=(X=-176.400391,Y=58.158985,Z=30.955057),LeaveTangent=(X=-176.400391,Y=58.158985,Z=30.955057),InterpMode=CIM_CurveAutoClamped),(InVal=332.500000,OutVal=(X=2815.587891,Y=1484.080078,Z=139.999756),ArriveTangent=(X=-205.248825,Y=0.000000,Z=0.000000),LeaveTangent=(X=-205.248825,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=337.500000,OutVal=(X=1853.095703,Y=632.697266,Z=129.999756),ArriveTangent=(X=-139.591476,Y=-133.087494,Z=-4.168839),LeaveTangent=(X=-139.591476,Y=-133.087494,Z=-4.168839),InterpMode=CIM_CurveAutoClamped),(InVal=342.500000,OutVal=(X=1399.945313,Y=153.205078,Z=67.999512),ArriveTangent=(X=0.000000,Y=-78.208206,Z=-9.800024),LeaveTangent=(X=0.000000,Y=-78.208206,Z=-9.800024),InterpMode=CIM_CurveAutoClamped),(InVal=347.500000,OutVal=(X=2419.261719,Y=-149.384766,Z=31.999512),ArriveTangent=(X=147.101700,Y=-97.261787,Z=-13.293365),LeaveTangent=(X=147.101700,Y=-97.261787,Z=-13.293365),InterpMode=CIM_CurveAutoClamped),(InVal=352.500000,OutVal=(X=2895.060547,Y=-862.820313,Z=-97.000488),ArriveTangent=(X=87.957619,Y=-97.278610,Z=-27.599976),LeaveTangent=(X=87.957619,Y=-97.278610,Z=-27.599976),InterpMode=CIM_CurveAutoClamped),(InVal=357.500000,OutVal=(X=3298.837891,Y=-1165.496094,Z=-244.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=285.000000,InterpMode=CIM_CurveAutoClamped),(InVal=287.500000,OutVal=(X=0.000000,Y=0.000000,Z=44.121094),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.641608),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.641608),InterpMode=CIM_CurveAutoClamped),(InVal=292.500000,OutVal=(X=0.000000,Y=0.000000,Z=58.886719),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.041016),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.041016),InterpMode=CIM_CurveAutoClamped),(InVal=297.500000,OutVal=(X=0.000000,Y=0.000000,Z=74.531250),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.213669),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.213669),InterpMode=CIM_CurveAutoClamped),(InVal=302.500000,OutVal=(X=0.000000,Y=-3.339844,Z=115.136719),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.083984),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.083984),InterpMode=CIM_CurveAutoClamped),(InVal=307.500000,OutVal=(X=0.000000,Y=-0.703125,Z=145.371094),ArriveTangent=(X=0.000000,Y=0.439453,Z=5.466797),LeaveTangent=(X=0.000000,Y=0.439453,Z=5.466797),InterpMode=CIM_CurveAutoClamped),(InVal=312.500000,OutVal=(X=0.000000,Y=1.054688,Z=169.804688),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.468750),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.468750),InterpMode=CIM_CurveAutoClamped),(InVal=317.500000,OutVal=(X=0.000000,Y=1.054688,Z=210.058594),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.277344),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.277344),InterpMode=CIM_CurveAutoClamped),(InVal=322.500000,OutVal=(X=0.000000,Y=-2.988281,Z=242.578125),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.097656),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.097656),InterpMode=CIM_CurveAutoClamped),(InVal=327.500000,OutVal=(X=0.000000,Y=-1.406250,Z=261.035156),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.078125),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.078125),InterpMode=CIM_CurveAutoClamped),(InVal=332.500000,OutVal=(X=0.000000,Y=-3.867188,Z=283.359375),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.384795),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.384795),InterpMode=CIM_CurveAutoClamped),(InVal=337.500000,OutVal=(X=0.000000,Y=0.000000,Z=340.136719),ArriveTangent=(X=0.000000,Y=0.000000,Z=10.230469),LeaveTangent=(X=0.000000,Y=0.000000,Z=10.230469),InterpMode=CIM_CurveAutoClamped),(InVal=342.500000,OutVal=(X=0.000000,Y=0.000000,Z=385.664063),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.828552),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.828552),InterpMode=CIM_CurveAutoClamped),(InVal=347.500000,OutVal=(X=0.000000,Y=3.691406,Z=392.343750),ArriveTangent=(X=0.000000,Y=0.506440,Z=3.141521),LeaveTangent=(X=0.000000,Y=0.506440,Z=3.141521),InterpMode=CIM_CurveAutoClamped),(InVal=352.500000,OutVal=(X=0.000000,Y=5.273438,Z=519.433594),ArriveTangent=(X=0.000000,Y=0.638785,Z=1.619560),LeaveTangent=(X=0.000000,Y=0.638785,Z=1.619560),InterpMode=CIM_CurveAutoClamped),(InVal=357.500000,OutVal=(X=0.000000,Y=13.535156,Z=522.773438),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=285.000000),(Time=287.500000),(Time=292.500000),(Time=297.500000),(Time=302.500000),(Time=307.500000),(Time=312.500000),(Time=317.500000),(Time=322.500000),(Time=327.500000),(Time=332.500000),(Time=337.500000),(Time=342.500000),(Time=347.500000),(Time=352.500000),(Time=357.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_13"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_20.InterpTrackMove_13'
      GroupName="InTheFlesh"
      GroupColor=(B=0,G=225,R=69,A=255)
      Name="InterpGroup_20"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=843.812012,Y=-937.390625,Z=21.000000),InterpMode=CIM_CurveAutoClamped),(InVal=133.500000,OutVal=(X=702.082520,Y=-601.847656,Z=-114.000000),ArriveTangent=(X=-15.416200,Y=137.282394,Z=-27.882353),LeaveTangent=(X=-15.416200,Y=137.282394,Z=-27.882353),InterpMode=CIM_CurveAutoClamped),(InVal=138.500000,OutVal=(X=666.448730,Y=315.019531,Z=-216.000000),ArriveTangent=(X=-17.673088,Y=126.132698,Z=0.000000),LeaveTangent=(X=-17.673088,Y=126.132698,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=-360.499023,Y=675.335938,Z=-216.000000),ArriveTangent=(X=0.000000,Y=81.668358,Z=0.000000),LeaveTangent=(X=0.000000,Y=81.668358,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=148.500000,OutVal=(X=-334.047852,Y=1131.703125,Z=-168.000000),InterpMode=CIM_CurveAutoClamped),(InVal=153.500000,OutVal=(X=-814.134277,Y=388.617188,Z=-228.000000),ArriveTangent=(X=-49.121616,Y=-208.024994,Z=0.000000),LeaveTangent=(X=-49.121616,Y=-208.024994,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=158.500000,OutVal=(X=-946.800293,Y=-948.546875,Z=-141.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=22.500000),LeaveTangent=(X=0.000000,Y=0.000000,Z=22.500000),InterpMode=CIM_CurveAutoClamped),(InVal=163.500000,OutVal=(X=-138.929199,Y=-927.824219,Z=-3.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=0.000000,Y=0.000000,Z=175.078125),InterpMode=CIM_CurveAutoClamped),(InVal=133.500000,OutVal=(X=0.000000,Y=0.000000,Z=90.878906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-20.948990),LeaveTangent=(X=0.000000,Y=0.000000,Z=-20.948990),InterpMode=CIM_CurveAutoClamped),(InVal=138.500000,OutVal=(X=0.000000,Y=0.000000,Z=-2.988281),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=0.000000,Y=0.000000,Z=5.976563),InterpMode=CIM_CurveAutoClamped),(InVal=148.500000,OutVal=(X=0.000000,Y=0.000000,Z=-90.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.745535),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.745535),InterpMode=CIM_CurveAutoClamped),(InVal=153.500000,OutVal=(X=0.000000,Y=0.000000,Z=-180.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.105469),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.105469),InterpMode=CIM_CurveAutoClamped),(InVal=158.500000,OutVal=(X=0.000000,Y=0.000000,Z=-271.406250),InterpMode=CIM_CurveAutoClamped),(InVal=163.500000,OutVal=(X=0.000000,Y=0.000000,Z=-262.441406),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=130.000000),(Time=133.500000),(Time=138.500000),(Time=143.000000),(Time=148.500000),(Time=153.500000),(Time=158.500000),(Time=163.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_3.InterpTrackMove_2'
      GroupName="WarTrench"
      GroupColor=(B=186,G=151,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_7
         PosTrack=(Points=((OutVal=(X=0.000488,Y=0.000000,Z=-24.000244),InterpMode=CIM_CurveAutoClamped),(InVal=164.000000,OutVal=(X=-2177.007813,Y=-1573.744141,Z=-294.000000),ArriveTangent=(X=-1.876921,Y=0.000000,Z=0.000000),LeaveTangent=(X=-1.876921,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=168.500000,OutVal=(X=-2184.906250,Y=-31.109375,Z=-270.000000),ArriveTangent=(X=0.000000,Y=298.059631,Z=0.000000),LeaveTangent=(X=0.000000,Y=298.059631,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=173.500000,OutVal=(X=-1594.041992,Y=1257.822266,Z=-291.000000),ArriveTangent=(X=177.266022,Y=33.116516,Z=0.000000),LeaveTangent=(X=177.266022,Y=33.116516,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=178.500000,OutVal=(X=-412.246094,Y=1328.416016,Z=-117.000000),ArriveTangent=(X=240.648834,Y=0.000000,Z=0.000000),LeaveTangent=(X=240.648834,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=183.500000,OutVal=(X=812.446289,Y=1310.619141,Z=-318.000000),ArriveTangent=(X=82.855827,Y=0.000000,Z=0.000000),LeaveTangent=(X=82.855827,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=188.500000,OutVal=(X=1011.452637,Y=1614.080078,Z=-306.000000),ArriveTangent=(X=77.365540,Y=35.392300,Z=0.000000),LeaveTangent=(X=77.365540,Y=35.392300,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=1538.875977,Y=1689.740234,Z=-306.000000),ArriveTangent=(X=107.276253,Y=0.000000,Z=0.000000),LeaveTangent=(X=107.276253,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=197.000000,OutVal=(X=1923.300781,Y=851.818359,Z=-306.000000),ArriveTangent=(X=0.000000,Y=-189.839447,Z=0.000000),LeaveTangent=(X=0.000000,Y=-189.839447,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=202.000000,OutVal=(X=1905.145508,Y=-208.654297,Z=-465.000244),ArriveTangent=(X=-8.268219,Y=-217.656815,Z=0.000000),LeaveTangent=(X=-8.268219,Y=-217.656815,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=207.500000,OutVal=(X=1566.764160,Y=-1433.578125,Z=-317.000732),ArriveTangent=(X=-51.265392,Y=0.000000,Z=26.761906),LeaveTangent=(X=-51.265392,Y=0.000000,Z=26.761906),InterpMode=CIM_CurveAutoClamped),(InVal=212.500000,OutVal=(X=1366.858887,Y=-522.847656,Z=-184.000244),ArriveTangent=(X=-84.826546,Y=50.303810,Z=28.900049),LeaveTangent=(X=-84.826546,Y=50.303810,Z=28.900049),InterpMode=CIM_CurveAutoClamped),(InVal=217.500000,OutVal=(X=-13.709961,Y=-406.470703,Z=-28.000244),ArriveTangent=(X=-174.008484,Y=0.000000,Z=2.868334),LeaveTangent=(X=-174.008484,Y=0.000000,Z=2.868334),InterpMode=CIM_CurveAutoClamped),(InVal=222.500000,OutVal=(X=-530.494141,Y=-888.396484,Z=-22.000244),ArriveTangent=(X=-82.585739,Y=0.000000,Z=0.000000),LeaveTangent=(X=-82.585739,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=227.500000,OutVal=(X=-839.567383,Y=-409.150391,Z=-22.000244),ArriveTangent=(X=0.000000,Y=87.969925,Z=0.000000),LeaveTangent=(X=0.000000,Y=87.969925,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=232.500000,OutVal=(X=-463.014648,Y=-8.697266,Z=-22.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=164.000000,OutVal=(X=0.000000,Y=0.000000,Z=41.484375),InterpMode=CIM_CurveAutoClamped),(InVal=168.500000,OutVal=(X=0.000000,Y=0.000000,Z=-2.988281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.566200),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.566200),InterpMode=CIM_CurveAutoClamped),(InVal=173.500000,OutVal=(X=0.000000,Y=0.000000,Z=-49.394531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.035156),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.035156),InterpMode=CIM_CurveAutoClamped),(InVal=178.500000,OutVal=(X=0.000000,Y=0.000000,Z=-93.339844),InterpMode=CIM_CurveAutoClamped),(InVal=183.500000,OutVal=(X=0.000000,Y=1.230469,Z=-91.757813),InterpMode=CIM_CurveAutoClamped),(InVal=188.500000,OutVal=(X=0.000000,Y=1.230469,Z=-156.972656),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.332236),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.332236),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=0.000000,Y=1.230469,Z=-167.167969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.502298),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.502298),InterpMode=CIM_CurveAutoClamped),(InVal=197.000000,OutVal=(X=0.000000,Y=1.230469,Z=-178.242188),InterpMode=CIM_CurveAutoClamped),(InVal=202.000000,OutVal=(X=0.000000,Y=1.230469,Z=-177.890625),InterpMode=CIM_CurveAutoClamped),(InVal=207.500000,OutVal=(X=0.000000,Y=-5.273438,Z=-211.113281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.671875),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.671875),InterpMode=CIM_CurveAutoClamped),(InVal=212.500000,OutVal=(X=0.000000,Y=-5.273438,Z=-268.945313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-15.011719),LeaveTangent=(X=0.000000,Y=0.000000,Z=-15.011719),InterpMode=CIM_CurveAutoClamped),(InVal=217.500000,OutVal=(X=0.000000,Y=-6.503906,Z=-361.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.876953),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.876953),InterpMode=CIM_CurveAutoClamped),(InVal=222.500000,OutVal=(X=0.000000,Y=-0.703125,Z=-447.714844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-17.490234),LeaveTangent=(X=0.000000,Y=0.000000,Z=-17.490234),InterpMode=CIM_CurveAutoClamped),(InVal=227.500000,OutVal=(X=0.000000,Y=-0.703125,Z=-536.132813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-18.298828),LeaveTangent=(X=0.000000,Y=0.000000,Z=-18.298828),InterpMode=CIM_CurveAutoClamped),(InVal=232.500000,OutVal=(X=0.000000,Y=-0.703125,Z=-630.703125),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=164.000000),(Time=168.500000),(Time=173.500000),(Time=178.500000),(Time=183.500000),(Time=188.500000),(Time=192.000000),(Time=197.000000),(Time=202.000000),(Time=207.500000),(Time=212.500000),(Time=217.500000),(Time=222.500000),(Time=227.500000),(Time=232.500000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_7"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_8.InterpTrackMove_7'
      GroupName="circus"
      GroupColor=(B=0,G=220,R=88,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         CutTrack(1)=(Time=59.500000,TargetCamGroup="SpiderCAve",ShotNumber=20)
         CutTrack(2)=(Time=97.500000,TargetCamGroup="morgue",ShotNumber=30)
         CutTrack(3)=(Time=130.000000,TargetCamGroup="WarTrench",ShotNumber=40)
         CutTrack(4)=(Time=164.000000,TargetCamGroup="circus",ShotNumber=50)
         CutTrack(5)=(Time=233.500000,TargetCamGroup="cabin",ShotNumber=60)
         CutTrack(6)=(Time=285.000000,TargetCamGroup="InTheFlesh",ShotNumber=70)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=0,G=203,R=126,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=363.000000
   InterpGroups(0)=InterpGroupDirector'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroupDirector_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_0'
   InterpGroups(2)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_1'
   InterpGroups(3)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_2'
   InterpGroups(4)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_3'
   InterpGroups(5)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_8'
   InterpGroups(6)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_19'
   InterpGroups(7)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpGroup_20'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=363.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9536
   ObjPosY=-3528
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_14"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_14
   InputLinks(0)=(DrawY=-3690,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3668,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3646,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3624,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3602,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2')),DrawY=-3674,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3618,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_14'),DrawX=-9497,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_234'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=-9427,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_830'),LinkDesc="SpiderCAve",MinVars=0,DrawX=-9352,OverrideDelta=156)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_831'),LinkDesc="Morgue",MinVars=0,DrawX=-9291,OverrideDelta=213)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_832'),LinkDesc="WarTrench",MinVars=0,DrawX=-9215,OverrideDelta=277)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_837'),LinkDesc="Circus",MinVars=0,DrawX=-9143,OverrideDelta=365)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_842'),LinkDesc="Cabin",MinVars=0,DrawX=-9089,OverrideDelta=421)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_843'),LinkDesc="InTheFlesh",MinVars=0,DrawX=-9036,OverrideDelta=473)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9528
   ObjPosY=-3728
   DrawWidth=527
   DrawHeight=173
   Name="SeqAct_Interp_14"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1165
   SizeY=594
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9792
   ObjPosY=-3760
   ObjComment="Benchmark"
   DrawWidth=1165
   DrawHeight=594
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_14'),(LinkedOp=SeqAct_ConsoleCommand'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_3')),DrawY=-3646,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9673,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9768
   ObjPosY=-3712
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_234
   ObjValue=CameraActor'KF-NIGHTMARE.TheWorld:PersistentLevel.CameraActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9440
   ObjPosY=-3488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_234"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-3502,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3502,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-8744,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-3536
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_3
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-3398,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3398,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-9664,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9728
   ObjPosY=-3432
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_830
   ObjValue=CameraActor'KF-NIGHTMARE.TheWorld:PersistentLevel.CameraActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9368
   ObjPosY=-3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_830"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_831
   ObjValue=CameraActor'KF-NIGHTMARE.TheWorld:PersistentLevel.CameraActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9296
   ObjPosY=-3504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_831"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_832
   ObjValue=CameraActor'KF-NIGHTMARE.TheWorld:PersistentLevel.CameraActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=-3504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_832"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_837
   ObjValue=CameraActor'KF-NIGHTMARE.TheWorld:PersistentLevel.CameraActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9152
   ObjPosY=-3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_837"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_842
   ObjValue=CameraActor'KF-NIGHTMARE.TheWorld:PersistentLevel.CameraActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9048
   ObjPosY=-3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_842"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_843
   ObjValue=CameraActor'KF-NIGHTMARE.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8968
   ObjPosY=-3504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_843"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=1193
   SizeY=731
   bDrawBox=True
   FillColor=(B=0,G=63,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4560
   ObjPosY=-4672
   ObjComment="Start_Arena_Portal_FX"
   DrawWidth=1193
   DrawHeight=731
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_93
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3880
   ObjPosY=-8312
   ObjComment="Cabin"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_93"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_92
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3880
   ObjPosY=-8728
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_92"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_87
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3848
   ObjPosY=-9056
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_87"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_86
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3856
   ObjPosY=-9312
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_86"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_85
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3864
   ObjPosY=-9640
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_85"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_102
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8088
   ObjPosY=-5837
   ObjComment="Cabin"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_102"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_101
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8088
   ObjPosY=-6069
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_101"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_96
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8040
   ObjPosY=-6381
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_96"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_95
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8032
   ObjPosY=-6629
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_95"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_94
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8048
   ObjPosY=-6845
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_94"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_2
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=-3298,OverrideDelta=47)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-3331,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),LinkDesc="Link 2",DrawY=-3309,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),LinkDesc="Link 3",DrawY=-3287,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),LinkDesc="Link 4",DrawY=-3265,OverrideDelta=80)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_25'),DrawX=7274,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7240
   ObjPosY=-3368
   DrawWidth=68
   DrawHeight=133
   Name="SeqAct_Switch_2"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_25
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7256
   ObjPosY=-3160
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_25"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-4539,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4518,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4497,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4518,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=8686,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8737,OverrideDelta=76)
   EventLinks(0)=(DrawX=8786,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8648
   ObjPosY=-4576
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8760
   ObjPosY=-4416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8680
   ObjPosY=-4416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8600
   ObjPosY=-4416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8504
   ObjPosY=-3760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_171
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8664
   ObjPosY=-3760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_171"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_172
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8744
   ObjPosY=-3760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_172"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-3867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3825,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_172',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_171',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_173',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),DrawX=8654,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8705,OverrideDelta=76)
   EventLinks(0)=(DrawX=8754,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8616
   ObjPosY=-3904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8480
   ObjPosY=-3088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8568
   ObjPosY=-3088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8704
   ObjPosY=-3088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-3195,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3174,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3153,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3174,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_175',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_174',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_177',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=8614,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8665,OverrideDelta=76)
   EventLinks(0)=(DrawX=8714,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8576
   ObjPosY=-3232
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_178
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8456
   ObjPosY=-2464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_178"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8544
   ObjPosY=-2464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8624
   ObjPosY=-2464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-2587,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2566,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2545,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2566,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_180',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_178',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),DrawX=8590,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8641,OverrideDelta=76)
   EventLinks(0)=(DrawX=8690,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8552
   ObjPosY=-2624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-1907,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1886,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1865,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1886,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_184',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_183',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_185',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_182',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_186',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=8590,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8641,OverrideDelta=76)
   EventLinks(0)=(DrawX=8690,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8552
   ObjPosY=-1944
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6688
   ObjPosY=-4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-4560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6544
   ObjPosY=-4480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-4480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6688
   ObjPosY=-4560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-4560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-4488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-4488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=687
   SizeY=627
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7016
   ObjPosY=-4960
   ObjComment="Portal_Spawns"
   DrawWidth=687
   DrawHeight=627
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_3
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8824
   ObjPosY=-9104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_3"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="Short_Logic_Thread"
   MaxWidth=249
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_1')),DrawY=-9374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6852,OverrideDelta=92)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6976
   ObjPosY=-9440
   DrawWidth=144
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_12
   EventName="Short_Logic_Thread"
   InputLinks(0)=(DrawY=-9278,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7773,OverrideDelta=123)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-9312
   ObjComment="Short"
   DrawWidth=310
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_12"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_5
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-9024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_5"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_7
   EventName="Medium_Logic_Thread"
   MaxWidth=262
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_3')),DrawY=-9022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6869,OverrideDelta=99)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7000
   ObjPosY=-9088
   DrawWidth=151
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_7"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="Medium_Logic_Thread"
   InputLinks(0)=(DrawY=-9134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7767,OverrideDelta=129)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7928
   ObjPosY=-9168
   ObjComment="Medium"
   DrawWidth=323
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_15
   EventName="cabin"
   MaxWidth=152
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_9')),DrawY=-8318,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4956,OverrideDelta=44)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5032
   ObjPosY=-8384
   ObjComment="Cabin"
   DrawWidth=96
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_15"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_SetInt Name=SeqAct_SetInt_0
   InputLinks(0)=(DrawY=-8894,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_13')),DrawY=-8894,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_6'),DrawX=-8246,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_64'),DrawX=-8190,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8280
   ObjPosY=-8928
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetInt_0"
   ObjectArchetype=SeqAct_SetInt'Engine.Default__SeqAct_SetInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8288
   ObjPosY=-8800
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_6"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_64
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8192
   ObjPosY=-8800
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_64"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_32
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-9056
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_32"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_31
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8312
   ObjPosY=-9064
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_31"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetInt Name=SeqAct_SetInt_1
   InputLinks(0)=(DrawY=-9134,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=-9134,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_31'),DrawX=-8230,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=-8174,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-9168
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetInt_1"
   ObjectArchetype=SeqAct_SetInt'Engine.Default__SeqAct_SetInt'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
   EventName="Long_Logic_Thread"
   InputLinks(0)=(DrawY=-8894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8894,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7792,OverrideDelta=120)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7944
   ObjPosY=-8928
   ObjComment="Long"
   DrawWidth=305
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_13"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_4
   EventName="Long_Logic_Thread"
   MaxWidth=244
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_7')),DrawY=-8630,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6870,OverrideDelta=90)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6992
   ObjPosY=-8696
   DrawWidth=142
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_4"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=-9370,OverrideDelta=47)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),DrawY=-9403,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),LinkDesc="Link 2",DrawY=-9381,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),LinkDesc="Link 3",DrawY=-9359,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_8')),LinkDesc="Link 4",DrawY=-9337,OverrideDelta=80)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_30'),DrawX=-6430,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6464
   ObjPosY=-9440
   DrawWidth=68
   DrawHeight=133
   Name="SeqAct_Switch_1"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="RandomLevel"
   InputLinks(0)=(DrawY=-9390,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9390,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5973,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6104
   ObjPosY=-9424
   ObjComment="RandomLevel"
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_8
   EventName="RandomLevel"
   MaxWidth=202
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_4')),DrawY=-9062,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5011,OverrideDelta=69)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5112
   ObjPosY=-9128
   ObjComment="RandomLevel"
   DrawWidth=121
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_8"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_8
   EventName="cabin"
   InputLinks(0)=(DrawY=-9278,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9278,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5998,OverrideDelta=74)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6104
   ObjPosY=-9312
   ObjComment="Pick_Cabin"
   DrawWidth=213
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_8"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="cabin"
   InputLinks(0)=(DrawY=-8878,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8878,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5926,OverrideDelta=74)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=-8912
   ObjComment="Pick_Cabin"
   DrawWidth=213
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="RandomLevel"
   InputLinks(0)=(DrawY=-8962,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8962,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5904,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6035
   ObjPosY=-8996
   ObjComment="RandomLevel"
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-8856
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_11"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_3
   LinkCount=7
   IncrementAmount=0
   InputLinks(0)=(DrawY=-8990,OverrideDelta=83)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),DrawY=-9056,OverrideDelta=17)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),LinkDesc="Link 2",DrawY=-9034,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),LinkDesc="Link 3",DrawY=-9012,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),LinkDesc="Link 4",DrawY=-8990,OverrideDelta=83)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_2')),LinkDesc="Link 5",DrawY=-8968,OverrideDelta=105)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),LinkDesc="Link 6",DrawY=-8946,OverrideDelta=127)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),LinkDesc="Link 7",DrawY=-8924,OverrideDelta=149)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_11'),DrawX=-6422,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-9096
   DrawWidth=68
   DrawHeight=205
   Name="SeqAct_Switch_3"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_7
   LinkCount=10
   IncrementAmount=0
   InputLinks(0)=(DrawY=-8586,OverrideDelta=119)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),DrawY=-8689,OverrideDelta=16)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 2",DrawY=-8666,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 3",DrawY=-8643,OverrideDelta=62)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 4",DrawY=-8620,OverrideDelta=85)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),LinkDesc="Link 5",DrawY=-8597,OverrideDelta=108)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 6",DrawY=-8574,OverrideDelta=131)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 7",DrawY=-8551,OverrideDelta=154)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 8",DrawY=-8528,OverrideDelta=177)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),LinkDesc="Link 9",DrawY=-8505,OverrideDelta=200)
   OutputLinks(9)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),LinkDesc="Link 10",DrawY=-8482,OverrideDelta=223)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_17'),DrawX=-6404,OverrideDelta=18)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-8728
   DrawWidth=73
   DrawHeight=277
   Name="SeqAct_Switch_7"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="RandomLevel"
   InputLinks(0)=(DrawY=-8542,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8542,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5989,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6120
   ObjPosY=-8576
   ObjComment="RandomLevel"
   DrawWidth=263
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_17
   EventName="cabin"
   InputLinks(0)=(DrawY=-8422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6014,OverrideDelta=74)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6120
   ObjPosY=-8456
   ObjComment="Pick_Cabin"
   DrawWidth=213
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_17"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_17
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-8376
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_17"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_2
   LinkCount=4
   IncrementAmount=0
   bAutoDisableLinks=True
   InputLinks(0)=(DrawY=-9104,OverrideDelta=25)
   InputLinks(1)=(DrawY=-9060,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_17')),DrawY=-9115,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_20')),LinkDesc="Link 2",DrawY=-9093,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_19')),LinkDesc="Link 3",DrawY=-9071,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_18')),LinkDesc="Link 4",DrawY=-9049,OverrideDelta=80)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_6'),DrawX=828,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=784
   ObjPosY=-9152
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_2"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_31
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=-8824
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_31"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2600
   ObjPosY=-9080
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-9296
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=-9544
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_315
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=-8688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_315"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_312
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=-8976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_312"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_311
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=-9168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_311"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_282
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=-9408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_282"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetTraderVolumeIgnore Name=KFSeqAct_SetTraderVolumeIgnore_9
   VolumeCheckType=VCT_InVolume
   InputLinks(0)=(DrawY=-8788,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8768,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8778,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_315'),DrawX=2944,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=-8824
   DrawWidth=193
   DrawHeight=85
   Name="KFSeqAct_SetTraderVolumeIgnore_9"
   ObjectArchetype=KFSeqAct_SetTraderVolumeIgnore'KFGame.Default__KFSeqAct_SetTraderVolumeIgnore'
End Object

Begin Object Class=KFSeqAct_SetTraderVolumeIgnore Name=KFSeqAct_SetTraderVolumeIgnore_4
   VolumeCheckType=VCT_InVolume
   InputLinks(0)=(DrawY=-9060,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9040,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9050,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_312'),DrawX=2984,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=-9096
   DrawWidth=193
   DrawHeight=85
   Name="KFSeqAct_SetTraderVolumeIgnore_4"
   ObjectArchetype=KFSeqAct_SetTraderVolumeIgnore'KFGame.Default__KFSeqAct_SetTraderVolumeIgnore'
End Object

Begin Object Class=KFSeqAct_SetTraderVolumeIgnore Name=KFSeqAct_SetTraderVolumeIgnore_3
   VolumeCheckType=VCT_InVolume
   InputLinks(0)=(DrawY=-9268,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9248,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9258,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_311'),DrawX=2984,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=-9304
   DrawWidth=193
   DrawHeight=85
   Name="KFSeqAct_SetTraderVolumeIgnore_3"
   ObjectArchetype=KFSeqAct_SetTraderVolumeIgnore'KFGame.Default__KFSeqAct_SetTraderVolumeIgnore'
End Object

Begin Object Class=KFSeqAct_SetTraderVolumeIgnore Name=KFSeqAct_SetTraderVolumeIgnore_2
   VolumeCheckType=VCT_InVolume
   InputLinks(0)=(DrawY=-9508,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9488,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-9498,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_282'),DrawX=2976,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2880
   ObjPosY=-9544
   DrawWidth=193
   DrawHeight=85
   Name="KFSeqAct_SetTraderVolumeIgnore_2"
   ObjectArchetype=KFSeqAct_SetTraderVolumeIgnore'KFGame.Default__KFSeqAct_SetTraderVolumeIgnore'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_591
   ObjValue=KFTraderTrigger'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTraderTrigger_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-9400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_591"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_589
   ObjValue=KFTraderTrigger'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTraderTrigger_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=-8696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_589"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_584
   ObjValue=KFTraderTrigger'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTraderTrigger_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_584"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_583
   ObjValue=KFTraderTrigger'KF-NIGHTMARE.TheWorld:PersistentLevel.KFTraderTrigger_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_583"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_26
   InputLinks(0)=(LinkDesc="In",DrawY=-8788,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8768,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTraderVolumeIgnore'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTraderVolumeIgnore_9')),DrawY=-8778,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_589'),PropertyName="Targets",DrawX=2585,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=-8824
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_26"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_21
   InputLinks(0)=(LinkDesc="In",DrawY=-9052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9032,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTraderVolumeIgnore'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTraderVolumeIgnore_4')),DrawY=-9042,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_584'),PropertyName="Targets",DrawX=2617,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-9088
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_21"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_20
   InputLinks(0)=(LinkDesc="In",DrawY=-9260,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9240,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTraderVolumeIgnore'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTraderVolumeIgnore_3')),DrawY=-9250,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_583'),PropertyName="Targets",DrawX=2617,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2576
   ObjPosY=-9296
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_20"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_19
   InputLinks(0)=(LinkDesc="In",DrawY=-9508,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9488,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTraderVolumeIgnore'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTraderVolumeIgnore_2')),DrawY=-9498,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_591'),PropertyName="Targets",DrawX=2609,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2568
   ObjPosY=-9544
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_19"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_30
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6456
   ObjPosY=-9272
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_30"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_12
   VarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9592
   ObjPosY=-9496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_12"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_64
   SizeX=124
   SizeY=124
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9632
   ObjPosY=-9528
   ObjComment="Declare LastIndexID Reference"
   DrawWidth=124
   DrawHeight=124
   Name="SequenceFrame_64"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_759
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4808
   ObjPosY=-4016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_759"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000488,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000020,Z=-0.000003),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=-101.250000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_0.InterpTrackMove_0'
      GroupName="Trader_Doors_Left"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4624
   ObjPosY=-4032
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-4202,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4180,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4158,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4136,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4114,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-4186,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4130,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=4737,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_759'),LinkDesc="Trader_Doors_Left",MinVars=0,DrawX=4804,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4704
   ObjPosY=-4240
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_6
   VarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=800
   ObjPosY=-8928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_6"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="PickInitialRandomSpace"
   MaxWidth=271
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-9606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=223,OverrideDelta=103)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-9672
   ObjComment="PickInitialRandomSpace"
   DrawWidth=155
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="PickInitialRandomSpace"
   InputLinks(0)=(DrawY=-9558,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5922,OverrideDelta=134)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6088
   ObjPosY=-9592
   ObjComment="PickInitialRandomSpace"
   DrawWidth=332
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_4
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=-9066,OverrideDelta=47)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_2')),DrawY=-9099,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_3')),LinkDesc="Link 2",DrawY=-9077,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_4')),LinkDesc="Link 3",DrawY=-9055,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_11')),LinkDesc="Link 4",DrawY=-9033,OverrideDelta=80)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_3'),DrawX=-4789,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4823
   ObjPosY=-9136
   DrawWidth=68
   DrawHeight=133
   Name="SeqAct_Switch_4"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4816
   ObjPosY=-8952
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_23
   InputLinks(0)=(DrawY=-9258,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9308,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_24')),DrawY=-9248,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_26')),DrawY=-9268,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9330,bHidden=True,OverrideDelta=15)
   OutputLinks(4)=(DrawY=-9242,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_26'),DrawX=-335,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_10'),DrawX=-310,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-368
   ObjPosY=-9304
   ObjComment="Short Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_23"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_10
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-320
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_10"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_24
   InputLinks(0)=(DrawY=-9250,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9268,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_28')),DrawY=-9240,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_27')),DrawY=-9260,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9224,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9202,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_59'),DrawX=-15,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_14'),DrawX=10,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=-9296
   ObjComment="Medium Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_24"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_14
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_14"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_25
   InputLinks(0)=(DrawY=-8710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8674,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-8652,bHidden=True,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_1')),DrawY=-8710,OverrideDelta=11)
   OutputLinks(3)=(DrawY=-8608,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-8586,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_8'),DrawX=-335,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_15'),DrawX=-310,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-368
   ObjPosY=-8744
   ObjComment="Boss Wave?"
   DrawWidth=91
   DrawHeight=61
   Name="SeqCond_CompareInt_25"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_15
   IntValue=4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-320
   ObjPosY=-8648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_15"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_26
   InputLinks(0)=(DrawY=-8958,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8932,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_25')),DrawY=-8937,OverrideDelta=56)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_28')),DrawY=-8958,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-8979,OverrideDelta=14)
   OutputLinks(4)=(DrawY=-8866,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_51'),DrawX=-335,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_20'),DrawX=-310,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-368
   ObjPosY=-9016
   ObjComment="Wave 3?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_26"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_51
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=-8872
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_51"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_20
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-312
   ObjPosY=-8872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_20"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_27
   InputLinks(0)=(DrawY=-8942,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-9202,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_1')),DrawY=-8963,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_28')),DrawY=-8942,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-8921,OverrideDelta=56)
   OutputLinks(4)=(DrawY=-9114,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_57'),DrawX=-55,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_22'),DrawX=-30,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-9000
   ObjComment="Wave 6?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_27"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_22
   IntValue=6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-32
   ObjPosY=-8864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_22"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_57
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=-8864
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_57"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_28
   InputLinks(0)=(DrawY=-9238,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-9282,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_1')),DrawY=-9259,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_28')),DrawY=-9238,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2')),DrawY=-9217,OverrideDelta=56)
   OutputLinks(4)=(DrawY=-9194,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_58'),DrawX=321,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_34'),DrawX=346,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=288
   ObjPosY=-9296
   ObjComment="Long Game"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_28"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_58
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=256
   ObjPosY=-9120
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_58"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_34
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=-9128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_34"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=1641
   SizeY=1280
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6800
   ObjPosY=-6896
   ObjComment="Activate NEXT SpawnVolumes"
   DrawWidth=1641
   DrawHeight=1280
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=932
   SizeY=1261
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=-6904
   ObjComment="Set Teleport Destination"
   DrawWidth=932
   DrawHeight=1261
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_74
   SizeX=2314
   SizeY=1375
   bDrawBox=True
   FillColor=(B=230,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9784
   ObjPosY=-9640
   ObjComment="Main Logic_Determines Game Length"
   DrawWidth=2314
   DrawHeight=1375
   Name="SequenceFrame_74"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_33
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8912
   ObjPosY=-9096
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_33"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_29
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-9016
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_29"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=397
   SizeY=332
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8936
   ObjPosY=-9248
   ObjComment="Evaluate Wave Length"
   DrawWidth=397
   DrawHeight=332
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_42
   SizeX=244
   SizeY=492
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8336
   ObjPosY=-9192
   ObjComment="Store IndexID"
   DrawWidth=244
   DrawHeight=492
   Name="SequenceFrame_42"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_59
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-88
   ObjPosY=-9184
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_59"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=KFSeqAct_SetPawnIconVisibility Name=KFSeqAct_SetPawnIconVisibility_1
   InputLinks(0)=(DrawY=-8388,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8368,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-8378,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-8424
   DrawWidth=165
   DrawHeight=69
   Name="KFSeqAct_SetPawnIconVisibility_1"
   ObjectArchetype=KFSeqAct_SetPawnIconVisibility'KFGame.Default__KFSeqAct_SetPawnIconVisibility'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_2
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetPawnIconVisibility'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetPawnIconVisibility_1',InputLinkIdx=1)),DrawY=-8388,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-8368,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9557,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9496,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9415,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9600
   ObjPosY=-8456
   ObjComment="Hide Pawn Icons"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_2"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-6592
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_11
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-6520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_11"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-6512
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_1
   InputLinks(0)=(DrawY=-6630,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-6674,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-6652,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-6630,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_8')),DrawY=-6608,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_0')),DrawY=-6586,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_2'),DrawX=-9103,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_11'),DrawX=-9078,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-6712
   ObjComment="Long Game"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_1"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-6096
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_9"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_13
   IntValue=6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=-6096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_13"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_4
   InputLinks(0)=(DrawY=-6174,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-9202,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-6195,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_0')),DrawY=-6174,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_8')),DrawY=-6153,OverrideDelta=56)
   OutputLinks(4)=(DrawY=-9114,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_9'),DrawX=-9335,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_13'),DrawX=-9310,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9368
   ObjPosY=-6232
   ObjComment="Wave 7?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_4"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_17
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9648
   ObjPosY=-6312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_17"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9728
   ObjPosY=-6312
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_10"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_5
   InputLinks(0)=(DrawY=-6398,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8932,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-6377,OverrideDelta=56)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTeleporterURLNum'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTeleporterURLNum_0')),DrawY=-6398,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_8')),DrawY=-6419,OverrideDelta=14)
   OutputLinks(4)=(DrawY=-8866,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_10'),DrawX=-9671,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_17'),DrawX=-9646,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9704
   ObjPosY=-6456
   ObjComment="Wave 4?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_5"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_18
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9344
   ObjPosY=-6584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_18"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_6
   InputLinks(0)=(DrawY=-6658,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9268,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_1')),DrawY=-6648,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_4')),DrawY=-6668,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9224,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9202,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_0'),DrawX=-9359,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_18'),DrawX=-9334,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=-6704
   ObjComment="Medium Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_6"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_19
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9632
   ObjPosY=-6592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_19"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_7
   InputLinks(0)=(DrawY=-6666,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9308,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_6')),DrawY=-6656,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_5')),DrawY=-6676,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9330,bHidden=True,OverrideDelta=15)
   OutputLinks(4)=(DrawY=-9242,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_18'),DrawX=-9647,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_19'),DrawX=-9622,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=-6712
   ObjComment="Short Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_7"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_18
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9704
   ObjPosY=-6592
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_18"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_46
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6440
   ObjPosY=-7616
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_46"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_8
   InputLinks(0)=(DrawY=-7690,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9308,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_9')),DrawY=-7680,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_10')),DrawY=-7700,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9330,bHidden=True,OverrideDelta=15)
   OutputLinks(4)=(DrawY=-9242,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_46'),DrawX=6497,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_36'),DrawX=6522,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6464
   ObjPosY=-7736
   ObjComment="Short Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_8"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_36
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6512
   ObjPosY=-7616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_36"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_9
   InputLinks(0)=(DrawY=-7682,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9268,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_22')),DrawY=-7672,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_12')),DrawY=-7692,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9224,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9202,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_50'),DrawX=6785,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_37'),DrawX=6810,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6752
   ObjPosY=-7728
   ObjComment="Medium Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_9"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_37
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6800
   ObjPosY=-7608
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_37"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_10
   InputLinks(0)=(DrawY=-7286,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8932,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-7265,OverrideDelta=56)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15')),DrawY=-7286,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),DrawY=-7307,OverrideDelta=14)
   OutputLinks(4)=(DrawY=-8866,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_47'),DrawX=6657,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_38'),DrawX=6682,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6624
   ObjPosY=-7344
   ObjComment="Wave 4?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_10"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_47
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6600
   ObjPosY=-7168
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_47"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_38
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6680
   ObjPosY=-7168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_38"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_12
   InputLinks(0)=(DrawY=-6998,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-9202,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-7019,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15')),DrawY=-6998,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),DrawY=-6977,OverrideDelta=56)
   OutputLinks(4)=(DrawY=-9114,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_48'),DrawX=6913,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_39'),DrawX=6938,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6880
   ObjPosY=-7056
   ObjComment="Wave 7?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_12"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_39
   IntValue=6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6936
   ObjPosY=-6920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_39"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_48
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6832
   ObjPosY=-6920
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_48"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_22
   InputLinks(0)=(DrawY=-7654,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-7698,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-7676,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_15')),DrawY=-7654,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),DrawY=-7632,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-7610,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_49'),DrawX=7041,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_40'),DrawX=7066,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7008
   ObjPosY=-7736
   ObjComment="Long Game"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_22"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_49
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6976
   ObjPosY=-7536
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_49"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_40
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7064
   ObjPosY=-7544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_40"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_50
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6712
   ObjPosY=-7616
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_50"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_39
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6544
   ObjPosY=-3288
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_39"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_25
   IntValue=9
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6936
   ObjPosY=-3224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_25"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_38
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6848
   ObjPosY=-3216
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_38"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_15
   InputLinks(0)=(DrawY=-3334,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-3378,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-3356,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-3334,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_2')),DrawY=-3312,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-3290,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_38'),DrawX=6913,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_25'),DrawX=6938,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6880
   ObjPosY=-3416
   ObjComment="Long Game/Are we starting the cabin arena?"
   DrawWidth=91
   DrawHeight=157
   Name="SeqCond_CompareInt_15"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_37
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6520
   ObjPosY=-2736
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_37"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_24
   IntValue=6
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6624
   ObjPosY=-2736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_24"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_14
   InputLinks(0)=(DrawY=-2814,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-9202,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-2835,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-2814,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_2')),DrawY=-2793,OverrideDelta=56)
   OutputLinks(4)=(DrawY=-9114,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_37'),DrawX=6601,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_24'),DrawX=6626,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6568
   ObjPosY=-2872
   ObjComment="Are we starting the cabin arena?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_14"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_23
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6336
   ObjPosY=-2952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_23"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_36
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveNumber"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6256
   ObjPosY=-2952
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_36"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_13
   InputLinks(0)=(DrawY=-3038,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8932,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(DrawY=-3017,OverrideDelta=56)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-3038,OverrideDelta=35)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_2')),DrawY=-3059,OverrideDelta=14)
   OutputLinks(4)=(DrawY=-8866,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_36'),DrawX=6313,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_23'),DrawX=6338,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6280
   ObjPosY=-3096
   ObjComment="Are we starting the cabin arena?"
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_13"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_21
   IntValue=8
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6632
   ObjPosY=-3280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_21"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_11
   InputLinks(0)=(DrawY=-3354,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9268,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_15')),DrawY=-3344,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_14')),DrawY=-3364,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9224,bHidden=True,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-9202,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_39'),DrawX=6617,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_21'),DrawX=6642,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6584
   ObjPosY=-3400
   ObjComment="Medium Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_11"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_16
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6344
   ObjPosY=-3288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_16"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_2
   InputLinks(0)=(DrawY=-3362,OverrideDelta=23)
   OutputLinks(0)=(DrawY=-9308,bHidden=True,OverrideDelta=37)
   OutputLinks(1)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_11')),DrawY=-3352,OverrideDelta=33)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_13')),DrawY=-3372,OverrideDelta=13)
   OutputLinks(3)=(DrawY=-9330,bHidden=True,OverrideDelta=15)
   OutputLinks(4)=(DrawY=-9242,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_35'),DrawX=6329,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Int'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_16'),DrawX=6354,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6296
   ObjPosY=-3408
   ObjComment="Short Game?"
   DrawWidth=91
   DrawHeight=85
   Name="SeqCond_CompareInt_2"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="WaveMax"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6272
   ObjPosY=-3288
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_35"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareInt_2')),DrawY=-3444,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-3424,OverrideDelta=33)
   VariableLinks(0)=(DrawX=5923,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5984,OverrideDelta=86)
   VariableLinks(2)=(DrawX=6065,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5880
   ObjPosY=-3512
   ObjComment="Portal_FX_Turn on all except for arena player is teleporting to"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_0"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_33
   SizeX=3951
   SizeY=3843
   bDrawBox=True
   FillColor=(B=0,G=44,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5856
   ObjPosY=-4664
   ObjComment="Portal_FX_Turn on all except for arena player is teleporting to.  Aslo handles sound for portals"
   DrawWidth=3951
   DrawHeight=3843
   Name="SequenceFrame_33"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_6
   Duration=0.100000
   InputLinks(0)=(DrawY=-6883,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6862,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6841,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ShowPath_11',InputLinkIdx=1)),DrawY=-6878,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6846,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3500,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3552
   ObjPosY=-6920
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_6"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
   Duration=0.100000
   InputLinks(0)=(DrawY=-6747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6705,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ShowPath_11',InputLinkIdx=1)),DrawY=-6742,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-6710,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3468,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3520
   ObjPosY=-6784
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_7"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_8
   SizeX=1373
   SizeY=281
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7048
   ObjPosY=-9464
   ObjComment="Short"
   Name="SequenceFrameWrapped_8"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_11
   SizeX=1373
   SizeY=323
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7040
   ObjPosY=-9096
   ObjComment="Medium"
   Name="SequenceFrameWrapped_11"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_9
   SizeX=1382
   SizeY=443
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7040
   ObjPosY=-8736
   ObjComment="Long"
   Name="SequenceFrameWrapped_9"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(DrawY=-7892,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_1')),DrawY=-7872,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-5053,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4992,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-4911,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5096
   ObjPosY=-7960
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_0"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=4904
   SizeY=1942
   bDrawBox=True
   FillColor=(B=230,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9984
   ObjPosY=-7024
   ObjComment="Sets Teleport Destination/Activates correct ZED spawn volumes"
   DrawWidth=4904
   DrawHeight=1942
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_73
   SizeX=1767
   SizeY=1383
   bDrawBox=True
   FillColor=(B=59,G=255,R=254,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-9648
   ObjComment="Short/Medium/Long Match arena selection"
   DrawWidth=1767
   DrawHeight=1383
   Name="SequenceFrame_73"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_79
   SizeX=3952
   SizeY=3788
   bDrawBox=True
   FillColor=(B=255,G=0,R=231,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5936
   ObjPosY=-8736
   ObjComment="Handles Trader Doors"
   DrawWidth=3952
   DrawHeight=3788
   Name="SequenceFrame_79"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_36
   SizeX=1219
   SizeY=896
   bDrawBox=True
   FillColor=(B=255,G=0,R=231,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4408
   ObjPosY=-7792
   ObjComment="Lower Ramp In Cabin"
   DrawWidth=1219
   DrawHeight=896
   Name="SequenceFrame_36"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_11
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ShowPath_11')),DrawY=-7220,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_ShowPath'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ShowPath_11')),DrawY=-7200,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-3781,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3720,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-3639,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=-7288
   ObjComment="Enable Scripted Path"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_11"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   VarName="Repeat"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=-8432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="Reset_Random"
   InputLinks(0)=(DrawY=-8670,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=-8670,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5983,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6120
   ObjPosY=-8704
   ObjComment="Reset Random Levels"
   DrawWidth=274
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_9
   EventName="Reset_Random"
   MaxWidth=213
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_2',InputLinkIdx=1)),DrawY=-8390,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-566,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-672
   ObjPosY=-8456
   ObjComment="RandomLevel"
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_9"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_6
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=-228,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=-208,OverrideDelta=33)
   VariableLinks(0)=(DrawX=5955,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6016,OverrideDelta=86)
   VariableLinks(2)=(DrawX=6097,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5912
   ObjPosY=-296
   ObjComment="Turn off all portal FX"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_6"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-267,OverrideDelta=14)
   InputLinks(1)=(DrawY=-246,OverrideDelta=35)
   InputLinks(2)=(DrawY=-225,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-246,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142'),DrawX=6398,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6449,OverrideDelta=76)
   EventLinks(0)=(DrawX=6498,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6360
   ObjPosY=-304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6272
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6176
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6072
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6368
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=-3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=3.574980,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Grunt')
         AkEvents(1)=(Time=10.548833,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Grunt')
         AkEvents(2)=(Time=18.966766,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Grunt')
         AkEvents(3)=(Time=22.717855,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Grunt')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_6
         AnimSeqs(0)=(AnimSeqName="Idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_6"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackAnimControl_6'
      InterpTracks(1)=InterpTrackAkEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackAkEvent_0'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=26.451332
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=26.451332
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-3616
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3778,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3756,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3734,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3712,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3690,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-3762,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-3706,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-2975,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),LinkDesc="ClownAnim",MinVars=0,DrawX=-2924,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-3816
   ObjComment="Clown Idle"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="ClownAnimations"
   InputLinks(0)=(DrawY=-5014,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2264,OverrideDelta=112)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2408
   ObjPosY=-5048
   ObjComment="ClownAnimations"
   DrawWidth=288
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_11
   EventName="ClownAnimations"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_7')),DrawY=-5622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4207,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4320
   ObjPosY=-5688
   ObjComment="ClownAnimations"
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_11"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_1
   LinkCount=7
   IncrementAmount=0
   bAutoDisableLinks=True
   InputLinks(0)=(DrawY=-5590,OverrideDelta=43)
   InputLinks(1)=(DrawY=-5510,OverrideDelta=123)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1')),DrawY=-5616,OverrideDelta=17)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),LinkDesc="Link 2",DrawY=-5594,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),LinkDesc="Link 3",DrawY=-5572,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4')),LinkDesc="Link 4",DrawY=-5550,OverrideDelta=83)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),LinkDesc="Link 5",DrawY=-5528,OverrideDelta=105)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),LinkDesc="Link 6",DrawY=-5506,OverrideDelta=127)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),LinkDesc="Link 7",DrawY=-5484,OverrideDelta=149)
   VariableLinks(0)=(DrawX=-3660,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-5656
   DrawWidth=89
   DrawHeight=221
   Name="SeqAct_RandomSwitch_1"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_7
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5642,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5620,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5598,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5576,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5554,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_1')),DrawY=-5626,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5570,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_7'),DrawX=-3935,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),LinkDesc="ClownAnim",MinVars=0,DrawX=-3884,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-5680
   ObjComment="Clown Idle"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_7"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_7
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=2.121147,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Laugh')
         AkEvents(1)=(Time=8.183075,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Grunt')
         AkEvents(2)=(Time=10.191545,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Laugh')
         AkEvents(3)=(Time=14.829285,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Grunt')
         AkEvents(4)=(Time=23.812622,Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_GC_Laugh')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_6
         AnimSeqs(0)=(AnimSeqName="Idle",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_6"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0.InterpTrackAnimControl_6'
      InterpTracks(1)=InterpTrackAkEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0.InterpTrackAkEvent_1'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=26.451332
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_7.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=26.451332
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3984
   ObjPosY=-5480
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_7"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-5488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-4082,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4060,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4038,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4016,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3994,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-4066,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4010,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=-2975,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),LinkDesc="ClownAnim",MinVars=0,DrawX=-2924,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-4120
   ObjComment="Clown TV"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_5
         AnimSeqs(0)=(AnimSeqName="Action_TV",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_5"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0.InterpTrackAnimControl_5'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=16.240387
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=16.240387
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-3920
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=-3928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-4402,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4380,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4358,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4336,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4314,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-4386,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4330,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=-2983,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="ClownAnim",MinVars=0,DrawX=-2932,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3032
   ObjPosY=-4440
   ObjComment="Clown Sleep"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_4
         AnimSeqs(0)=(AnimSeqName="Action_Sleep",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_4"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackAnimControl_4'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=11.666500
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=11.666500
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3032
   ObjPosY=-4240
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2936
   ObjPosY=-4248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-4722,OverrideDelta=15)
   InputLinks(1)=(DrawY=-4700,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4678,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4656,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4634,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-4706,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4650,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-2983,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),LinkDesc="ClownAnim",MinVars=0,DrawX=-2932,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3032
   ObjPosY=-4760
   ObjComment="Clown Scratching Junk"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_3
         AnimSeqs(0)=(AnimSeqName="Action_Scratch",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_3"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackAnimControl_3'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=4.004679
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=4.000000
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3032
   ObjPosY=-4560
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2936
   ObjPosY=-4568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5034,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5012,OverrideDelta=37)
   InputLinks(2)=(DrawY=-4990,OverrideDelta=59)
   InputLinks(3)=(DrawY=-4968,OverrideDelta=81)
   InputLinks(4)=(DrawY=-4946,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-5018,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-4962,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=-2975,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),LinkDesc="ClownAnim",MinVars=0,DrawX=-2924,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-5072
   ObjComment="Clown Picking Nose"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_2
         AnimSeqs(0)=(AnimSeqName="Action_Nose",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_2"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackAnimControl_2'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=13.374726
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter_Classes'Engine.Default__InterpData:FilterSounds'
   EdSectionEnd=13.374726
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-4872
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=-4880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5354,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5332,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5310,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5288,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5266,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-5338,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5282,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=-2975,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),LinkDesc="ClownAnim",MinVars=0,DrawX=-2924,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-5392
   ObjComment="Clown Laugh"
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="Action_Laugh",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackAnimControl_1'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=5.669930
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.669930
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3024
   ObjPosY=-5192
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2928
   ObjPosY=-5200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=SkeletalMeshActor'KF-NIGHTMARE.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2976
   ObjPosY=-5488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Action_Fart",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="ClownAnim"
      GroupColor=(B=0,G=95,R=217,A=255)
      GroupAnimSets(0)=AnimSet'ZED_Clot_Anim.NightmareMap_Clot'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackToggle Name=InterpTrackToggle_3
         ToggleTrack(0)=(Time=3.500000,ToggleAction=ETTA_On)
         ToggleTrack(1)=(Time=10.500000)
         Name="InterpTrackToggle_3"
         ObjectArchetype=InterpTrackToggle'Engine.Default__InterpTrackToggle'
      End Object
      InterpTracks(0)=InterpTrackToggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1.InterpTrackToggle_3'
      GroupName="Gas_Cloud"
      GroupColor=(B=209,G=115,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=10.540148
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=10.540148
   BakeAndPruneStatus(0)=(AnimSetName="ZED_Clot_Anim.NightmareMap_Clot")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-5480
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-5642,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5620,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5598,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5576,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5554,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-5626,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5570,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-3009,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="ClownAnim",MinVars=0,DrawX=-2958,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),LinkDesc="Gas_Cloud",MinVars=0,DrawX=-2904,OverrideDelta=118)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-5680
   ObjComment="Clown Fart"
   DrawWidth=170
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5104
   ObjPosY=-7000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5344
   ObjPosY=-4472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_2
   EventName="Reset_Random"
   InputLinks(0)=(DrawY=-9042,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),DrawY=-9042,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5898,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6035
   ObjPosY=-9076
   ObjComment="Reset Random Levels"
   DrawWidth=274
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_2"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=891
   SizeY=514
   bDrawBox=True
   BorderColor=(B=238,G=0,R=255,A=255)
   FillColor=(B=247,G=140,R=255,A=38)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=-8120
   ObjComment="Fixed Ending"
   DrawWidth=891
   DrawHeight=514
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=681
   SizeY=1090
   bDrawBox=True
   BorderColor=(B=241,G=0,R=255,A=255)
   FillColor=(B=244,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2472
   ObjPosY=-9648
   ObjComment="Random World Pool"
   DrawWidth=681
   DrawHeight=1090
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=232
   SizeY=779
   bDrawBox=True
   BorderColor=(B=102,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1784
   ObjPosY=-9424
   ObjComment="Set LastIndexID == IndexID"
   DrawWidth=232
   DrawHeight=779
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=295
   SizeY=1166
   bDrawBox=True
   BorderColor=(B=79,G=255,R=0,A=255)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1024
   ObjPosY=-9560
   ObjComment="IndexID == LastIndexID?"
   DrawWidth=295
   DrawHeight=1166
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_17
   InputLinks(0)=(DrawY=-9454,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8842,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_3')),DrawY=-9475,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),DrawY=-9433,OverrideDelta=56)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_3')),DrawY=-9454,OverrideDelta=35)
   OutputLinks(4)=(DrawY=-8754,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_41'),DrawX=1121,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_40'),DrawX=1146,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1088
   ObjPosY=-9512
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_17"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_41
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1072
   ObjPosY=-9320
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_41"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_40
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1152
   ObjPosY=-9320
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_40"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_20
   InputLinks(0)=(DrawY=-9190,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8842,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_4')),DrawY=-9211,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),DrawY=-9169,OverrideDelta=56)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_4')),DrawY=-9190,OverrideDelta=35)
   OutputLinks(4)=(DrawY=-8754,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_69'),DrawX=1137,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_70'),DrawX=1162,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=-9248
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_20"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_69
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1088
   ObjPosY=-9056
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_69"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_70
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1168
   ObjPosY=-9056
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_70"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_19
   InputLinks(0)=(DrawY=-8910,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8842,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_5')),DrawY=-8931,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),DrawY=-8889,OverrideDelta=56)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_5')),DrawY=-8910,OverrideDelta=35)
   OutputLinks(4)=(DrawY=-8754,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_67'),DrawX=1153,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_68'),DrawX=1178,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=-8968
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_19"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_67
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=-8776
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_67"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_68
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=-8776
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_68"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_16
   EventName="SetNextTrader"
   InputLinks(0)=(DrawY=-9046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1601,OverrideDelta=105)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1464
   ObjPosY=-9080
   DrawWidth=274
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_16"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_66
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1184
   ObjPosY=-8512
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_66"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_65
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1104
   ObjPosY=-8512
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_65"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareInt Name=SeqCond_CompareInt_18
   InputLinks(0)=(DrawY=-8646,OverrideDelta=35)
   OutputLinks(0)=(DrawY=-8842,bHidden=True,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_2')),DrawY=-8667,OverrideDelta=14)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_16')),DrawY=-8625,OverrideDelta=56)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_SetInt'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetInt_2')),DrawY=-8646,OverrideDelta=35)
   OutputLinks(4)=(DrawY=-8754,bHidden=True,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_65'),DrawX=1153,OverrideDelta=29)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_66'),DrawX=1178,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=-8704
   DrawWidth=91
   DrawHeight=109
   Name="SeqCond_CompareInt_18"
   ObjectArchetype=SeqCond_CompareInt'Engine.Default__SeqCond_CompareInt'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_62
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1816
   ObjPosY=-8736
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_62"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_63
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1904
   ObjPosY=-8736
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_63"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_60
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-8912
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_60"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_61
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=-8912
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_61"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_44
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1816
   ObjPosY=-9104
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_44"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_45
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1904
   ObjPosY=-9104
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_45"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1904
   ObjPosY=-9280
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_43"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_42
   ExpectedType=Class'Engine.SeqVar_Int'
   FindVarName="IndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1816
   ObjPosY=-9280
   ObjColor=(B=255,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_42"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetInt Name=SeqAct_SetInt_2
   InputLinks(0)=(DrawY=-8798,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_26')),DrawY=-8798,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_62'),DrawX=1866,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_63'),DrawX=1922,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-8832
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetInt_2"
   ObjectArchetype=SeqAct_SetInt'Engine.Default__SeqAct_SetInt'
End Object

Begin Object Class=SeqAct_SetInt Name=SeqAct_SetInt_5
   InputLinks(0)=(DrawY=-8982,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_21')),DrawY=-8982,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_60'),DrawX=1858,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_61'),DrawX=1914,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1824
   ObjPosY=-9016
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetInt_5"
   ObjectArchetype=SeqAct_SetInt'Engine.Default__SeqAct_SetInt'
End Object

Begin Object Class=SeqAct_SetInt Name=SeqAct_SetInt_4
   InputLinks(0)=(DrawY=-9158,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_20')),DrawY=-9158,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_44'),DrawX=1866,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_45'),DrawX=1922,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-9192
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetInt_4"
   ObjectArchetype=SeqAct_SetInt'Engine.Default__SeqAct_SetInt'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_7
   VarName="LastIndexID"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1880
   ObjPosY=-9616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_7"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_SetInt Name=SeqAct_SetInt_3
   InputLinks(0)=(DrawY=-9342,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_19')),DrawY=-9342,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_42'),DrawX=1866,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_43'),DrawX=1922,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=-9376
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetInt_3"
   ObjectArchetype=SeqAct_SetInt'Engine.Default__SeqAct_SetInt'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6016
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_182
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8720
   ObjPosY=-1792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_182"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8544
   ObjPosY=-1792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_184
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8456
   ObjPosY=-1800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_184"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_185
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8640
   ObjPosY=-1792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_185"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_21
   EventName="ClownAnimations"
   InputLinks(0)=(DrawY=-5870,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_29')),DrawY=-5870,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7312,OverrideDelta=112)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-5904
   ObjComment="ClownAnimations"
   DrawWidth=288
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_21"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=2412
   SizeY=2243
   bDrawBox=True
   FillColor=(B=82,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4376
   ObjPosY=-5744
   ObjComment="Clown"
   DrawWidth=2412
   DrawHeight=2243
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6160
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_102'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=-6744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_156'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6128
   ObjPosY=-5768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_157'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6040
   ObjPosY=-5768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_155'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-5768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5848
   ObjPosY=-5768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_18
   EventName="War_Start_FX"
   InputLinks(0)=(DrawY=-9022,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-9022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2369,OverrideDelta=103)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2504
   ObjPosY=-9056
   ObjComment="War_FX"
   DrawWidth=271
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_18"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2912
   ObjPosY=-5456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8616
   ObjPosY=-8368
   ObjComment="Start"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8632
   ObjPosY=-7680
   ObjComment="Start"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8600
   ObjPosY=-6992
   ObjComment="Start"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8608
   ObjPosY=-6288
   ObjComment="Start"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8648
   ObjPosY=-5560
   ObjComment="Start"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_15
   EventName="War_Stop_FX"
   InputLinks(0)=(DrawY=-5686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5686,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5490,OverrideDelta=102)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5624
   ObjPosY=-5720
   ObjComment="War_Stop_FX"
   DrawWidth=268
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_15"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqAct_SetTraderVolumeIgnore Name=KFSeqAct_SetTraderVolumeIgnore_1
   VolumeCheckType=VCT_InVolume
   InputLinks(0)=(DrawY=-7796,OverrideDelta=13)
   InputLinks(1)=(DrawY=-7776,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-7786,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=1584,OverrideDelta=73)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1488
   ObjPosY=-7832
   DrawWidth=193
   DrawHeight=85
   Name="KFSeqAct_SetTraderVolumeIgnore_1"
   ObjectArchetype=KFSeqAct_SetTraderVolumeIgnore'KFGame.Default__KFSeqAct_SetTraderVolumeIgnore'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1560
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=253,OverrideDelta=14)
   InputLinks(1)=(DrawY=274,OverrideDelta=35)
   InputLinks(2)=(DrawY=295,OverrideDelta=56)
   OutputLinks(0)=(DrawY=274,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=6470,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6521,OverrideDelta=76)
   EventLinks(0)=(DrawX=6570,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=216
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_3
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=276,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=296,OverrideDelta=33)
   VariableLinks(0)=(DrawX=5947,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6008,OverrideDelta=86)
   VariableLinks(2)=(DrawX=6089,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5904
   ObjPosY=208
   ObjComment="Turn off all portal Lights"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_3"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6072
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6152
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6232
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6312
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8760
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8680
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8600
   ObjPosY=-4336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8736
   ObjPosY=-3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8656
   ObjPosY=-3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8496
   ObjPosY=-3688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8712
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8552
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8472
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8616
   ObjPosY=-2384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8536
   ObjPosY=-2384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8456
   ObjPosY=-2384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8720
   ObjPosY=-1712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8632
   ObjPosY=-1712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8536
   ObjPosY=-1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8448
   ObjPosY=-1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_118'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5912
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_119'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5816
   ObjPosY=-6240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_148'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6144
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_147'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5968
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6432
   ObjPosY=-5960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9056
   ObjPosY=-4416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_173
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9048
   ObjPosY=-3768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_173"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9008
   ObjPosY=-3088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8968
   ObjPosY=-2464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_186
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8976
   ObjPosY=-1792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_186"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6872
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6792
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6712
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6632
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6552
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9048
   ObjPosY=-4344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9040
   ObjPosY=-3696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9008
   ObjPosY=-3008
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8960
   ObjPosY=-2384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8968
   ObjPosY=-1720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6840
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6768
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6696
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6624
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6544
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_76
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8872
   ObjPosY=-4472
   ObjComment="Spider"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_76"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_77
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8832
   ObjPosY=-3840
   ObjComment="Morgue"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_77"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_78
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8848
   ObjPosY=-3144
   ObjComment="War"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_78"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_83
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8840
   ObjPosY=-2528
   ObjComment="Circus"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_83"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_44
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8848
   ObjPosY=-1864
   ObjComment="Cabin"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_44"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_69
   SizeX=2712
   SizeY=1167
   bDrawBox=True
   FillColor=(B=0,G=44,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=-424
   ObjComment="Portal_FX_and_Lights_Turn_Off"
   DrawWidth=2712
   DrawHeight=1167
   Name="SequenceFrame_69"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6120
   ObjPosY=600
   ObjComment="Exit_Facing_Portals"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6624
   ObjPosY=600
   ObjComment="Top_Portals"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6656
   ObjPosY=88
   ObjComment="Top_Portals"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6152
   ObjPosY=88
   ObjComment="Exit_Facing_Portals"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-1171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1129,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1150,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_187',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),DrawX=8558,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8609,OverrideDelta=76)
   EventLinks(0)=(DrawX=8658,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8520
   ObjPosY=-1208
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_187
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8952
   ObjPosY=-1080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_187"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8960
   ObjPosY=-984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_84
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8800
   ObjPosY=-1152
   ObjComment="Boss"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_84"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_9
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(DrawY=-1228,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4'),(LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=-1208,OverrideDelta=33)
   VariableLinks(0)=(DrawX=6059,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6120,OverrideDelta=86)
   VariableLinks(2)=(DrawX=6201,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6016
   ObjPosY=-1296
   ObjComment="Boss_Wave"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_TraderOpened_9"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6936
   ObjPosY=472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6960
   ObjPosY=-32
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5656
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5456
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_156
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5352
   ObjPosY=-6504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_156"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_146'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5888
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_17
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-3130,OverrideDelta=15)
   InputLinks(1)=(DrawY=-3108,OverrideDelta=37)
   InputLinks(2)=(DrawY=-3086,OverrideDelta=59)
   InputLinks(3)=(DrawY=-3064,OverrideDelta=81)
   InputLinks(4)=(DrawY=-3042,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-3123,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-3086,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_22')),LinkDesc="EventTrigger",DrawY=-3049,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17'),DrawX=-2521,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158'),LinkDesc="Leg1",MinVars=0,DrawX=-2474,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159'),LinkDesc="Leg2",MinVars=0,DrawX=-2427,OverrideDelta=110)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),LinkDesc="Leg3",MinVars=0,DrawX=-2380,OverrideDelta=157)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),LinkDesc="Leg4",MinVars=0,DrawX=-2333,OverrideDelta=204)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),LinkDesc="Leg5",MinVars=0,DrawX=-2286,OverrideDelta=251)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163'),LinkDesc="Leg6",MinVars=0,DrawX=-2239,OverrideDelta=298)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="TriggerEvent",MinVars=0,DrawX=-2184,OverrideDelta=345)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2552
   ObjPosY=-3168
   ObjComment="Leg1"
   DrawWidth=407
   DrawHeight=173
   Name="SeqAct_Interp_17"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_17
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_0.InterpTrackMove_0'
      GroupName="Leg1"
      GroupColor=(B=0,G=136,R=197,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-19.687500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-19.687500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=8.437500,Y=0.000000,Z=0.000000),ArriveTangent=(X=90.000000,Y=0.000000,Z=0.000000),LeaveTangent=(X=90.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_1.InterpTrackMove_1'
      GroupName="Leg2"
      GroupColor=(B=0,G=115,R=209,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_12
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_2
         EventTrack(0)=(Time=20.000000,EventName="EventTrigger")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_2"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_12.InterpTrackEvent_2'
      GroupName="TriggerEvent"
      GroupColor=(B=0,G=225,R=69,A=255)
      Name="InterpGroup_12"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=0.007813,Y=-0.000443,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.011719,Y=-44.556229,Z=36.644043),ArriveTangent=(X=0.007813,Y=-0.000149,Z=0.000000),LeaveTangent=(X=0.007813,Y=-0.000149,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.015625,Y=-44.556259,Z=36.644043),ArriveTangent=(X=0.016741,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.016741,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.023438,Y=14.041245,Z=-18.730347),ArriveTangent=(X=0.031250,Y=114.236526,Z=-201.453857),LeaveTangent=(X=0.031250,Y=114.236526,Z=-201.453857),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.031250,Y=29.888840,Z=-64.082886),ArriveTangent=(X=0.014648,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.014648,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.035156,Y=29.888840,Z=-64.082886),ArriveTangent=(X=0.015633,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.015633,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.054688,Y=-0.000504,Z=0.000244),ArriveTangent=(X=0.017912,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.017912,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.058594,Y=-0.000504,Z=0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.058594,Y=-0.000504,Z=0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-2.812500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-2.812500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_2.InterpTrackMove_2'
      GroupName="Leg3"
      GroupColor=(B=0,G=145,R=191,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-65.089966,Z=-19.679749),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-65.089966,Z=-19.679749),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=9.016846,Z=4.323914),ArriveTangent=(X=0.000000,Y=277.677246,Z=0.000000),LeaveTangent=(X=0.000000,Y=277.677246,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=73.748657,Z=-8.552063),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=73.748657,Z=-8.552063),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.000000,Y=-5.483887,Z=-7.066101),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.379346),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.379346),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=-0.000366,Z=-0.000183),ArriveTangent=(X=0.000000,Y=1.221538,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.221538,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=-0.000244,Z=-0.000183),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.000000,Y=-0.000366,Z=-0.000183),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-39.375000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-73.125000,Y=0.000000,Z=0.000000),LeaveTangent=(X=-73.125000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-73.125000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-73.125000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-56.250000,Y=0.000000,Z=0.000000),ArriveTangent=(X=52.734379,Y=0.000000,Z=0.000000),LeaveTangent=(X=52.734379,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-30.937500,Y=0.000000,Z=0.000000),ArriveTangent=(X=42.187500,Y=0.000000,Z=0.000000),LeaveTangent=(X=42.187500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-14.062500,Y=0.000000,Z=0.000000),ArriveTangent=(X=34.374996,Y=0.000000,Z=0.000000),LeaveTangent=(X=34.374996,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_3.InterpTrackMove_3'
      GroupName="Leg4"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-87.153442,Z=74.432983),ArriveTangent=(X=0.000000,Y=-144.872192,Z=132.815186),LeaveTangent=(X=0.000000,Y=-144.872192,Z=132.815186),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-144.872192,Z=132.815186),ArriveTangent=(X=0.000000,Y=0.000000,Z=109.384659),LeaveTangent=(X=0.000000,Y=0.000000,Z=109.384659),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=-71.546021,Z=152.895752),ArriveTangent=(X=0.000000,Y=345.193359,Z=0.000000),LeaveTangent=(X=0.000000,Y=345.193359,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=27.724487,Z=118.875366),ArriveTangent=(X=0.000000,Y=142.884338,Z=-112.102516),LeaveTangent=(X=0.000000,Y=142.884338,Z=-112.102516),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=61.514893,Z=63.213745),ArriveTangent=(X=0.000000,Y=0.000000,Z=-90.643677),LeaveTangent=(X=0.000000,Y=0.000000,Z=-90.643677),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.000000,Y=-8.657837,Z=28.231689),ArriveTangent=(X=0.000000,Y=0.000000,Z=-71.983498),LeaveTangent=(X=0.000000,Y=0.000000,Z=-71.983498),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=-2.350952,Z=-1.571411),ArriveTangent=(X=0.000000,Y=9.911646,Z=0.000000),LeaveTangent=(X=0.000000,Y=9.911646,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.000000,Y=0.000732,Z=0.000122),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-61.875000,Y=0.000000,Z=0.000000),LeaveTangent=(X=-61.875000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-61.875000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-84.374992,Y=0.000000,Z=0.000000),LeaveTangent=(X=-84.374992,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-81.562500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-75.937500,Y=0.000000,Z=0.000000),ArriveTangent=(X=31.821112,Y=0.000000,Z=0.000000),LeaveTangent=(X=31.821112,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-42.187500,Y=0.000000,Z=0.000000),ArriveTangent=(X=39.391891,Y=0.000000,Z=0.000000),LeaveTangent=(X=39.391891,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-30.937500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_4.InterpTrackMove_4'
      GroupName="Leg5"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-70.734009,Z=126.225159),ArriveTangent=(X=0.000000,Y=-155.220703,Z=275.577576),LeaveTangent=(X=0.000000,Y=-155.220703,Z=275.577576),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-155.220703,Z=275.577576),ArriveTangent=(X=0.000000,Y=0.000000,Z=279.964264),LeaveTangent=(X=0.000000,Y=0.000000,Z=279.964264),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=-116.443604,Z=327.000793),ArriveTangent=(X=0.000000,Y=277.258850,Z=0.000000),LeaveTangent=(X=0.000000,Y=277.258850,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=-4.222778,Z=286.326233),ArriveTangent=(X=0.000000,Y=239.476486,Z=-187.613419),LeaveTangent=(X=0.000000,Y=239.476486,Z=-187.613419),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=75.137573,Z=162.463928),ArriveTangent=(X=0.000000,Y=0.000000,Z=-185.905273),LeaveTangent=(X=0.000000,Y=0.000000,Z=-185.905273),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.000000,Y=7.738159,Z=100.420959),ArriveTangent=(X=0.000000,Y=0.000000,Z=-93.048904),LeaveTangent=(X=0.000000,Y=0.000000,Z=-93.048904),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=12.863281,Z=74.931458),ArriveTangent=(X=0.000000,Y=0.000000,Z=-85.061012),LeaveTangent=(X=0.000000,Y=0.000000,Z=-85.061012),InterpMode=CIM_CurveAutoClamped),(InVal=3.100000,OutVal=(X=0.000000,Y=9.019775,Z=49.384338),ArriveTangent=(X=0.000000,Y=-33.112728,Z=-186.349243),LeaveTangent=(X=0.000000,Y=-33.112728,Z=-186.349243),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.000000,Y=-1.963623,Z=0.391785),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),ArriveTangent=(X=-59.062500,Y=0.000000,Z=0.000000),LeaveTangent=(X=-59.062500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-59.062500,Y=0.000000,Z=0.000000),ArriveTangent=(X=-100.446419,Y=0.000000,Z=0.000000),LeaveTangent=(X=-100.446419,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-95.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-95.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-95.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-56.250000,Y=0.000000,Z=0.000000),ArriveTangent=(X=65.624992,Y=0.000000,Z=0.000000),LeaveTangent=(X=65.624992,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=-36.562500,Y=0.000000,Z=0.000000),ArriveTangent=(X=50.866688,Y=0.000000,Z=0.000000),LeaveTangent=(X=50.866688,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.100000,OutVal=(X=-25.729980,Y=0.000000,Z=0.000000),ArriveTangent=(X=29.259586,Y=0.000000,Z=0.000000),LeaveTangent=(X=29.259586,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.100000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_5.InterpTrackMove_5'
      GroupName="Leg6"
      GroupColor=(B=197,G=0,R=138,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_3'
   InterpGroups(4)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_4'
   InterpGroups(5)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_5'
   InterpGroups(6)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpGroup_12'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_17.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2672
   ObjPosY=-2944
   ObjComment="Leg1"
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_17"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-2976
   ObjComment="Leg1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-2920
   ObjComment="Leg1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2408
   ObjPosY=-2968
   ObjComment="Leg1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2368
   ObjPosY=-2896
   ObjComment="Leg1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2312
   ObjPosY=-2968
   ObjComment="Leg1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2256
   ObjPosY=-2880
   ObjComment="Leg1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_16
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=())
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0.InterpTrackMove_0'
      GroupName="Leg1"
      GroupColor=(B=0,G=136,R=197,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-19.687500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-19.687500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=8.437500,Y=0.000000,Z=0.000000),ArriveTangent=(X=90.000000,Y=0.000000,Z=0.000000),LeaveTangent=(X=90.000000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_1.InterpTrackMove_1'
      GroupName="Leg2"
      GroupColor=(B=0,G=115,R=209,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_11
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=20.000000,EventName="EventTrigger")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_11.InterpTrackEvent_1'
      GroupName="TriggerEvent"
      GroupColor=(B=58,G=228,R=0,A=255)
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=0.007813,Y=-0.000443,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.011719,Y=-44.556229,Z=36.644043),ArriveTangent=(X=0.007812,Y=-0.000149,Z=0.000000),LeaveTangent=(X=0.007812,Y=-0.000149,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.015625,Y=-44.556259,Z=36.644043),ArriveTangent=(X=0.016741,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.016741,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.023438,Y=14.041245,Z=-18.730347),ArriveTangent=(X=0.031250,Y=114.236526,Z=-201.453857),LeaveTangent=(X=0.031250,Y=114.236526,Z=-201.453857),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.031250,Y=29.888840,Z=-64.082886),ArriveTangent=(X=0.014648,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.014648,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.035156,Y=29.888840,Z=-64.082886),ArriveTangent=(X=0.015632,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.015632,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.054688,Y=-0.000504,Z=0.000244),ArriveTangent=(X=0.017911,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.017911,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.058594,Y=-0.000504,Z=0.000244),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.058594,Y=-0.000504,Z=0.000244),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-2.812500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-2.812500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_2.InterpTrackMove_2'
      GroupName="Leg3"
      GroupColor=(B=0,G=145,R=191,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-65.089966,Z=-19.679749),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-65.089966,Z=-19.679749),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=9.016846,Z=4.323914),ArriveTangent=(X=0.000000,Y=277.677246,Z=0.000000),LeaveTangent=(X=0.000000,Y=277.677246,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=73.748657,Z=-8.552063),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=73.748657,Z=-8.552063),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.000000,Y=-5.483887,Z=-7.066101),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.379346),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.379346),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=-0.000366,Z=-0.000183),ArriveTangent=(X=0.000000,Y=1.220835,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.220835,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=-0.000244,Z=-0.000183),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.000000,Y=-0.000366,Z=-0.000183),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-39.375000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-73.125000,Y=0.000000,Z=0.000000),LeaveTangent=(X=-73.125000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-73.125000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-73.125000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-56.250000,Y=0.000000,Z=0.000000),ArriveTangent=(X=52.734379,Y=0.000000,Z=0.000000),LeaveTangent=(X=52.734379,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-30.937500,Y=0.000000,Z=0.000000),ArriveTangent=(X=42.187500,Y=0.000000,Z=0.000000),LeaveTangent=(X=42.187500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-14.062500,Y=0.000000,Z=0.000000),ArriveTangent=(X=34.374996,Y=0.000000,Z=0.000000),LeaveTangent=(X=34.374996,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3.InterpTrackMove_3'
      GroupName="Leg4"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-87.153442,Z=74.432983),ArriveTangent=(X=0.000000,Y=-144.872192,Z=132.815186),LeaveTangent=(X=0.000000,Y=-144.872192,Z=132.815186),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-144.872192,Z=132.815186),ArriveTangent=(X=0.000000,Y=0.000000,Z=109.384659),LeaveTangent=(X=0.000000,Y=0.000000,Z=109.384659),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=-71.546021,Z=152.895752),ArriveTangent=(X=0.000000,Y=345.193359,Z=0.000000),LeaveTangent=(X=0.000000,Y=345.193359,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=27.724487,Z=118.875366),ArriveTangent=(X=0.000000,Y=142.884338,Z=-112.102516),LeaveTangent=(X=0.000000,Y=142.884338,Z=-112.102516),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=61.514893,Z=63.213745),ArriveTangent=(X=0.000000,Y=0.000000,Z=-90.643677),LeaveTangent=(X=0.000000,Y=0.000000,Z=-90.643677),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.000000,Y=-8.657837,Z=28.231689),ArriveTangent=(X=0.000000,Y=0.000000,Z=-71.983498),LeaveTangent=(X=0.000000,Y=0.000000,Z=-71.983498),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=-2.350952,Z=-1.571411),ArriveTangent=(X=0.000000,Y=9.911646,Z=0.000000),LeaveTangent=(X=0.000000,Y=9.911646,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.000000,Y=0.000732,Z=0.000122),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-61.875000,Y=0.000000,Z=0.000000),LeaveTangent=(X=-61.875000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-61.875000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-84.374992,Y=0.000000,Z=0.000000),LeaveTangent=(X=-84.374992,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-81.562500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-75.937500,Y=0.000000,Z=0.000000),ArriveTangent=(X=31.821112,Y=0.000000,Z=0.000000),LeaveTangent=(X=31.821112,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-42.187500,Y=0.000000,Z=0.000000),ArriveTangent=(X=39.391891,Y=0.000000,Z=0.000000),LeaveTangent=(X=39.391891,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-30.937500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=-33.750000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_4.InterpTrackMove_4'
      GroupName="Leg5"
      GroupColor=(B=193,G=0,R=143,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=0.000000,Y=-70.734009,Z=126.225159),ArriveTangent=(X=0.000000,Y=-155.220703,Z=275.577576),LeaveTangent=(X=0.000000,Y=-155.220703,Z=275.577576),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=-155.220703,Z=275.577576),ArriveTangent=(X=0.000000,Y=0.000000,Z=279.964264),LeaveTangent=(X=0.000000,Y=0.000000,Z=279.964264),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=0.000000,Y=-116.443604,Z=327.000793),ArriveTangent=(X=0.000000,Y=277.258850,Z=0.000000),LeaveTangent=(X=0.000000,Y=277.258850,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=0.000000,Y=-4.222778,Z=286.326233),ArriveTangent=(X=0.000000,Y=239.476486,Z=-187.613419),LeaveTangent=(X=0.000000,Y=239.476486,Z=-187.613419),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=0.000000,Y=75.137573,Z=162.463928),ArriveTangent=(X=0.000000,Y=0.000000,Z=-185.905273),LeaveTangent=(X=0.000000,Y=0.000000,Z=-185.905273),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=0.000000,Y=7.738159,Z=100.420959),ArriveTangent=(X=0.000000,Y=0.000000,Z=-93.048904),LeaveTangent=(X=0.000000,Y=0.000000,Z=-93.048904),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=0.000000,Y=12.863281,Z=74.931458),ArriveTangent=(X=0.000000,Y=0.000000,Z=-85.061050),LeaveTangent=(X=0.000000,Y=0.000000,Z=-85.061050),InterpMode=CIM_CurveAutoClamped),(InVal=3.100000,OutVal=(X=0.000000,Y=9.019775,Z=49.384338),ArriveTangent=(X=0.000000,Y=-33.112732,Z=-186.349243),LeaveTangent=(X=0.000000,Y=-33.112732,Z=-186.349243),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=0.000000,Y=-1.963623,Z=0.391785),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.500000,OutVal=(X=-25.312500,Y=0.000000,Z=0.000000),ArriveTangent=(X=-59.062500,Y=0.000000,Z=0.000000),LeaveTangent=(X=-59.062500,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=-59.062500,Y=0.000000,Z=0.000000),ArriveTangent=(X=-100.446419,Y=0.000000,Z=0.000000),LeaveTangent=(X=-100.446419,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.200000,OutVal=(X=-95.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1.500000,OutVal=(X=-95.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,OutVal=(X=-95.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.500000,OutVal=(X=-56.250000,Y=0.000000,Z=0.000000),ArriveTangent=(X=65.624992,Y=0.000000,Z=0.000000),LeaveTangent=(X=65.624992,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.900000,OutVal=(X=-36.562500,Y=0.000000,Z=0.000000),ArriveTangent=(X=50.866707,Y=0.000000,Z=0.000000),LeaveTangent=(X=50.866707,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.100000,OutVal=(X=-25.729980,Y=0.000000,Z=0.000000),ArriveTangent=(X=29.259581,Y=0.000000,Z=0.000000),LeaveTangent=(X=29.259581,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=3.300000,OutVal=(X=-22.500000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000),(Time=1.200000),(Time=1.500000),(Time=2.000000),(Time=2.500000),(Time=2.900000),(Time=3.100000),(Time=3.300000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5.InterpTrackMove_5'
      GroupName="Leg6"
      GroupColor=(B=197,G=0,R=138,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=20.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_3'
   InterpGroups(4)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_4'
   InterpGroups(5)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_5'
   InterpGroups(6)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpGroup_11'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=20.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2744
   ObjPosY=-2208
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_16"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_16
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2394,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2372,OverrideDelta=37)
   InputLinks(2)=(DrawY=-2350,OverrideDelta=59)
   InputLinks(3)=(DrawY=-2328,OverrideDelta=81)
   InputLinks(4)=(DrawY=-2306,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2387,OverrideDelta=22)
   OutputLinks(1)=(DrawY=-2350,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_14')),LinkDesc="EventTrigger",DrawY=-2313,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_16'),DrawX=-2593,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164'),LinkDesc="Leg1",MinVars=0,DrawX=-2546,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165'),LinkDesc="Leg2",MinVars=0,DrawX=-2499,OverrideDelta=110)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166'),LinkDesc="Leg3",MinVars=0,DrawX=-2452,OverrideDelta=157)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_167'),LinkDesc="Leg4",MinVars=0,DrawX=-2405,OverrideDelta=204)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168'),LinkDesc="Leg5",MinVars=0,DrawX=-2358,OverrideDelta=251)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_169'),LinkDesc="Leg6",MinVars=0,DrawX=-2311,OverrideDelta=298)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="TriggerEvent",MinVars=0,DrawX=-2256,OverrideDelta=345)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2624
   ObjPosY=-2432
   ObjComment="Leg2"
   DrawWidth=407
   DrawHeight=173
   Name="SeqAct_Interp_16"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2584
   ObjPosY=-2248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2536
   ObjPosY=-2176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2488
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2440
   ObjPosY=-2176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2392
   ObjPosY=-2256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2336
   ObjPosY=-2192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5784
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_151'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5688
   ObjPosY=-5968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_Portal_LP'
   InputLinks(0)=(DrawY=-4198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),DrawX=8728,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8680
   ObjPosY=-4232
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8896
   ObjPosY=-4096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8520
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8600
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8680
   ObjPosY=-4104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_ENV_Nightmare.Stop_Nightmare_Portal_LP_01'
   InputLinks(0)=(DrawY=-230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7544,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7496
   ObjPosY=-264
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_4
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-244,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-224,OverrideDelta=33)
   VariableLinks(0)=(DrawX=7163,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7224,OverrideDelta=86)
   VariableLinks(2)=(DrawX=7305,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7120
   ObjPosY=-312
   ObjComment="Turn off portal Sounds"
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_4"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_Portal_LP'
   InputLinks(0)=(DrawY=-3566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=8672,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8624
   ObjPosY=-3600
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_Portal_LP'
   InputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),DrawX=8656,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8608
   ObjPosY=-2936
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_Portal_LP'
   InputLinks(0)=(DrawY=-2262,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),DrawX=8680,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8632
   ObjPosY=-2296
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_Portal_LP'
   InputLinks(0)=(DrawY=-1574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=8624,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8576
   ObjPosY=-1608
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9000
   ObjPosY=-3472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8696
   ObjPosY=-3464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8616
   ObjPosY=-3464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8456
   ObjPosY=-3464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8976
   ObjPosY=-2816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8672
   ObjPosY=-2816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8536
   ObjPosY=-2816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8448
   ObjPosY=-2816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8984
   ObjPosY=-2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8640
   ObjPosY=-2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8560
   ObjPosY=-2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8472
   ObjPosY=-2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8928
   ObjPosY=-1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8408
   ObjPosY=-1448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_107'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8496
   ObjPosY=-1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_120'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8672
   ObjPosY=-1440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_Portal_LP'
   InputLinks(0)=(DrawY=-1038,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1038,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=8432,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8384
   ObjPosY=-1072
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_105'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8400
   ObjPosY=-952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=784
   SizeY=668
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8344
   ObjPosY=-1992
   ObjComment="Cabin"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=784
   SizeY=668
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8344
   ObjPosY=-2704
   ObjComment="Circus"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_3
   SizeX=784
   SizeY=668
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8336
   ObjPosY=-3384
   ObjComment="War"
   Name="SequenceFrameWrapped_3"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_4
   SizeX=776
   SizeY=580
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8336
   ObjPosY=-3968
   ObjComment="Morgue"
   Name="SequenceFrameWrapped_4"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=788
   SizeY=598
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8336
   ObjPosY=-4600
   ObjComment="Spider"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=770
   SizeY=456
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8344
   ObjPosY=-1288
   ObjComment="Boss"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_188
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_188"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_189
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_109'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9000
   ObjPosY=-5320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_189"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_191
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-5232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_191"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9728
   ObjPosY=-5232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_192"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_196
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_108'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_196"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9128
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_208
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9016
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_208"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8904
   ObjPosY=-5240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_6
   LinkCount=3
   IncrementAmount=0
   InputLinks(0)=(DrawY=-2350,OverrideDelta=35)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=-2371,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_8')),LinkDesc="Link 2",DrawY=-2350,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),LinkDesc="Link 3",DrawY=-2329,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3262,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3296
   ObjPosY=-2408
   DrawWidth=68
   DrawHeight=109
   Name="SeqAct_Switch_6"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=10.000000
   InputLinks(0)=(DrawY=-2547,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2526,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2505,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16')),DrawY=-2542,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2510,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2948,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3000
   ObjPosY=-2584
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   Duration=20.000000
   InputLinks(0)=(DrawY=-2283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2241,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16')),DrawY=-2278,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2246,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2992
   ObjPosY=-2320
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_8
   Duration=15.000000
   InputLinks(0)=(DrawY=-2419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2377,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16')),DrawY=-2414,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2382,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2992
   ObjPosY=-2456
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_8"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_23
   EventName="SpiderAnimations"
   InputLinks(0)=(DrawY=-6886,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_25')),DrawY=-6886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7263,OverrideDelta=113)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7408
   ObjPosY=-6920
   ObjComment="SpiderAnimations"
   DrawWidth=290
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_23"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="SpiderAnimations2"
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_6')),DrawY=-2358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3554,OverrideDelta=86)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3672
   ObjPosY=-2424
   ObjComment="SpiderAnimations2"
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_10
   EventName="SpiderAnimations"
   MaxWidth=229
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_5')),DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3526,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3640
   ObjPosY=-3088
   ObjComment="SpiderAnimations"
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_10"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=15.000000
   InputLinks(0)=(DrawY=-3099,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3078,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3057,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17')),DrawY=-3094,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3062,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2932,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2984
   ObjPosY=-3136
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=20.000000
   InputLinks(0)=(DrawY=-2963,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2942,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2921,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17')),DrawY=-2958,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-2926,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2932,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2984
   ObjPosY=-3000
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=10.000000
   InputLinks(0)=(DrawY=-3227,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3206,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3185,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17')),DrawY=-3222,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-3190,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-2940,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2992
   ObjPosY=-3264
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_5
   LinkCount=3
   IncrementAmount=0
   InputLinks(0)=(DrawY=-3030,OverrideDelta=35)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=-3051,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3')),LinkDesc="Link 2",DrawY=-3030,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),LinkDesc="Link 3",DrawY=-3009,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-3254,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-3088
   DrawWidth=68
   DrawHeight=109
   Name="SeqAct_Switch_5"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_25
   EventName="SpiderAnimations2"
   InputLinks(0)=(DrawY=-6710,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_7')),DrawY=-6710,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7075,OverrideDelta=117)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7224
   ObjPosY=-6744
   ObjComment="SpiderAnimations2"
   DrawWidth=298
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_25"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_14
   EventName="SpiderAnimations2"
   InputLinks(0)=(DrawY=-2318,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2318,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1939,OverrideDelta=117)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2088
   ObjPosY=-2352
   ObjComment="SpiderAnimations2"
   DrawWidth=298
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_14"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_22
   EventName="SpiderAnimations"
   InputLinks(0)=(DrawY=-3046,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3046,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1895,OverrideDelta=113)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2040
   ObjPosY=-3080
   ObjComment="SpiderAnimations"
   DrawWidth=290
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_22"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_26
   EventName="StopSpiderAnimations"
   InputLinks(0)=(DrawY=-6582,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_3')),DrawY=-6582,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7232,OverrideDelta=128)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-6616
   ObjComment="StopSpiderAnimations"
   DrawWidth=321
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_26"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="StopSpiderAnimations"
   MaxWidth=260
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_17',InputLinkIdx=2),(LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_16',InputLinkIdx=2)),DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3534,OverrideDelta=98)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3664
   ObjPosY=-2784
   ObjComment="StopSpiderAnimations"
   DrawWidth=150
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="StopSpiderAnimations"
   InputLinks(0)=(DrawY=-6382,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_27')),DrawY=-6382,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7224,OverrideDelta=128)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-6416
   ObjComment="StopSpiderAnimations"
   DrawWidth=321
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_28
   EventName="StopSpiderAnimations"
   InputLinks(0)=(DrawY=-6038,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_14')),DrawY=-6038,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7224,OverrideDelta=128)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-6072
   ObjComment="StopSpiderAnimations"
   DrawWidth=321
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_28"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_29
   EventName="StopSpiderAnimations"
   InputLinks(0)=(DrawY=-5726,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_6')),DrawY=-5726,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7120,OverrideDelta=128)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7280
   ObjPosY=-5760
   ObjComment="StopSpiderAnimations"
   DrawWidth=321
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_29"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=2836
   SizeY=1504
   bDrawBox=True
   FillColor=(B=82,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4376
   ObjPosY=-3400
   ObjComment="Spider"
   DrawWidth=2836
   DrawHeight=1504
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_190
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5872
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_190"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-5283,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5262,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5241,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5262,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_225',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_227',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_229',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_230',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_231'),DrawX=-6802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-5320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_225
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_225"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_227
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6544
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_227"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6448
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6344
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_229"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_230
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_230"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_231
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6144
   ObjPosY=-5168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_231"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_30
   EventName="StartMorguePortalSpawns"
   InputLinks(0)=(DrawY=-6590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5434,OverrideDelta=142)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5608
   ObjPosY=-6624
   ObjComment="StartMorguePortalSpawns"
   DrawWidth=349
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_30"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_12
   EventName="StartMorguePortalSpawns"
   MaxWidth=288
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_0')),DrawY=-5478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7088,OverrideDelta=112)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-5544
   ObjComment="StartMorguePortalSpawns"
   DrawWidth=164
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_12"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=KFSeqAct_ToggleEx Name=KFSeqAct_ToggleEx_0
   InputLinks(0)=(DrawY=-5499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5457,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251'),DrawX=-6810,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6759,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6710,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-5536
   DrawWidth=173
   DrawHeight=109
   Name="KFSeqAct_ToggleEx_0"
   ObjectArchetype=KFSeqAct_ToggleEx'KFGame.Default__KFSeqAct_ToggleEx'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6840
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6736
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6640
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6536
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6440
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6336
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6240
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=KFSpawner'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6136
   ObjPosY=-5408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="StopMorguePortalSpawns"
   MaxWidth=285
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1)),DrawY=-5166,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7106,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7248
   ObjPosY=-5232
   ObjComment="StopMorguePortalSpawns"
   DrawWidth=162
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_24
   EventName="StopMorguePortalSpawns"
   InputLinks(0)=(DrawY=-6806,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6806,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5611,OverrideDelta=141)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5784
   ObjPosY=-6840
   ObjComment="StopMorguePortalSpawns"
   DrawWidth=346
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_24"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=1434
   SizeY=502
   BorderColor=(B=169,G=255,R=189,A=255)
   FillColor=(B=255,G=142,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7352
   ObjPosY=-5592
   ObjComment="Start/Stop Morgue Portal Spawns"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1)),DrawY=-5331,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5310,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5289,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7320
   ObjPosY=-5400
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=-7563,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7542,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7521,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4616
   ObjPosY=-7632
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=InterpActor'KF-NIGHTMARE.TheWorld:PersistentLevel.InterpActor_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5088
   ObjPosY=-7376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_13
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.501152,OutVal=(X=-0.003906,Y=0.000000,Z=0.000977),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.501152,OutVal=(X=-17.226563,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=0.501152)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_5.InterpTrackMove_0'
      GroupName="FloorboardRamp"
      GroupColor=(B=222,G=0,R=84,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpGroup_5'
   CurveEdSetup=InterpCurveEdSetup'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_13.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=-7416
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_13"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   InputLinks(0)=(DrawY=-7610,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7588,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7566,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7544,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7522,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7594,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7538,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.InterpData_13'),DrawX=4994,OverrideDelta=19)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),LinkDesc="FloorboardRamp",MinVars=0,DrawX=5060,OverrideDelta=66)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4960
   ObjPosY=-7648
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=1)),DrawY=77,OverrideDelta=14)
   OutputLinks(1)=(DrawY=98,OverrideDelta=35)
   OutputLinks(2)=(DrawY=119,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7304
   ObjPosY=8
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=29,OverrideDelta=14)
   InputLinks(1)=(DrawY=50,OverrideDelta=35)
   InputLinks(2)=(DrawY=71,OverrideDelta=56)
   OutputLinks(0)=(DrawY=50,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_217',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_219',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235',SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_236'),DrawX=7598,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7649,OverrideDelta=76)
   EventLinks(0)=(DrawX=7698,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7560
   ObjPosY=-8
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_217
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7472
   ObjPosY=184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_217"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7576
   ObjPosY=184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7672
   ObjPosY=184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7776
   ObjPosY=184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_145'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7872
   ObjPosY=184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7432
   ObjPosY=272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7528
   ObjPosY=272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7632
   ObjPosY=272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_232"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7728
   ObjPosY=272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_233"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7832
   ObjPosY=272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_235"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_236
   ObjValue=PointLight'KF-NIGHTMARE.TheWorld:PersistentLevel.PointLight_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7928
   ObjPosY=272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_236"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_37
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8000
   ObjPosY=312
   ObjComment="Top_Portals"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_35
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7984
   ObjPosY=216
   ObjComment="Exit_Facing_Portals"
   DrawWidth=128
   DrawHeight=64
   Name="SequenceFrame_35"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-3675,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3654,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3633,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4730,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4592
   ObjPosY=-3744
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_38
   SizeX=1047
   SizeY=1410
   bDrawBox=True
   FillColor=(B=0,G=63,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4544
   ObjPosY=-3800
   ObjComment="Sound_For_Player_Using_Teleport"
   DrawWidth=1047
   DrawHeight=1410
   Name="SequenceFrame_38"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-3459,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3438,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3417,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4722,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4584
   ObjPosY=-3528
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-3219,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3198,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3177,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4722,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4584
   ObjPosY=-3288
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-2995,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2974,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2953,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4722,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4584
   ObjPosY=-3064
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-2763,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2742,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2721,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4714,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=-2832
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-2507,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2486,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2465,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4706,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4568
   ObjPosY=-2576
   ObjName="TriggerVolume_1 Touch"
   ObjComment="Cabin Drop Down"
   DrawWidth=183
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_ENV_Destruction.Play_ENV_Portal_Enter'
   InputLinks(0)=(DrawY=-3214,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3214,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5104,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5056
   ObjPosY=-3248
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5776
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_237"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=KFSpawnVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.KFSpawnVolume_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5672
   ObjPosY=-6736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_Nightmare.Play_Nightmare_Portal_LP'
   InputLinks(0)=(DrawY=-4318,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4318,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=5352,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5304
   ObjPosY=-4352
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=Emitter'KF-NIGHTMARE.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5320
   ObjPosY=-4248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_14
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-7086,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7086,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240'),DrawX=4842,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4784
   ObjPosY=-7120
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_14"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=DynamicBlockingVolume'KF-NIGHTMARE.TheWorld:PersistentLevel.DynamicBlockingVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4752
   ObjPosY=-6992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_27
   EventName="War_Start_Cannons"
   InputLinks(0)=(DrawY=-6254,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ToggleEx'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ToggleEx_2')),DrawY=-6254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7229,OverrideDelta=123)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7384
   ObjPosY=-6288
   ObjComment="StopSpiderAnimations"
   DrawWidth=310
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_27"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_20
   EventName="War_Stop_Cannons"
   InputLinks(0)=(DrawY=-9294,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-9294,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2391,OverrideDelta=121)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2544
   ObjPosY=-9328
   ObjComment="War_FX"
   DrawWidth=307
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_20"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_31
   EventName="War_Stop_Cannons"
   InputLinks(0)=(DrawY=-9558,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-9558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2407,OverrideDelta=121)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2560
   ObjPosY=-9592
   ObjComment="War_FX"
   DrawWidth=307
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_31"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_32
   EventName="War_Stop_Cannons"
   InputLinks(0)=(DrawY=-8702,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-8702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2367,OverrideDelta=121)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2520
   ObjPosY=-8736
   ObjComment="War_FX"
   DrawWidth=307
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_32"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_19
   EventName="War_Stop_Cannons"
   InputLinks(0)=(DrawY=-8294,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=-8294,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-2359,OverrideDelta=121)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NIGHTMARE.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2512
   ObjPosY=-8328
   ObjComment="War_FX"
   DrawWidth=307
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_19"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object
