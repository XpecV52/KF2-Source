Begin Object Class=SequenceFrame Name=SequenceFrame_37
   SizeX=18974
   SizeY=7704
   BorderWidth=5
   bDrawBox=True
   FillColor=(B=255,G=251,R=0,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9520
   ObjPosY=-6496
   ObjComment="Objectives"
   DrawWidth=18974
   DrawHeight=7704
   Name="SequenceFrame_37"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_28
   SizeX=3953
   SizeY=2873
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9176
   ObjPosY=-2632
   ObjComment="Obj 5 - Hold"
   DrawWidth=3953
   DrawHeight=2873
   Name="SequenceFrame_28"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_78
   SizeX=3278
   SizeY=2077
   BorderWidth=5
   bDrawBox=True
   FillColor=(B=71,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-720
   ObjPosY=-9400
   ObjComment="Initial Setup"
   DrawWidth=3278
   DrawHeight=2077
   Name="SequenceFrame_78"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=7108
   SizeY=3495
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-768
   ObjPosY=-2552
   ObjComment="Obj 7 - Operate and Control"
   DrawWidth=7108
   DrawHeight=3495
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=3013
   SizeY=2339
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=-5920
   ObjComment="Obj 3 - Escort"
   DrawWidth=3013
   DrawHeight=2339
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   PlayRate=0.015000
   bRewindOnPlay=True
   bClientSideOnly=True
   InputLinks(0)=(DrawY=2918,OverrideDelta=15)
   InputLinks(1)=(DrawY=2940,OverrideDelta=37)
   InputLinks(2)=(DrawY=2962,OverrideDelta=59)
   InputLinks(3)=(DrawY=2984,OverrideDelta=81)
   InputLinks(4)=(DrawY=3006,OverrideDelta=103)
   OutputLinks(0)=(DrawY=2925,OverrideDelta=22)
   OutputLinks(1)=(DrawY=2962,OverrideDelta=59)
   OutputLinks(2)=(LinkDesc="ExtinguishFlames",DrawY=2999,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=8240,OverrideDelta=25)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="Ocean",MinVars=0,DrawX=8293,OverrideDelta=72)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),LinkDesc="Beach",MinVars=0,DrawX=8350,OverrideDelta=130)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8200
   ObjPosY=2880
   DrawWidth=196
   DrawHeight=157
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=15.030812,OutVal=(X=0.000000,Y=0.000000,Z=84.633759),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=15.030812,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=15.030812)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.Water.Env_Ocean_Water_Ocean_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_23.StaticMeshComponent_868')))
         ParamName="Scalar_Water_WPO_Min"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=0.300000,ArriveTangent=0.106667,LeaveTangent=0.106667,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=0.800000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_0"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=15.010483,EventName="ExtinguishFlames")
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackFloatMaterialParam_0'
      GroupName="ocean"
      GroupColor=(B=152,G=0,R=186,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.Landscape.LMAT_ENV_ZedLanding_LandscapeMaterialBase_MIC',AffectedMaterialRefs=((Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_443'),(Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_444'),(Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_448'),(Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_449'),(Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_453'),(Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_454'),(Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_458'),(Primitive=LandscapeComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_459')))
         ParamName="Scalar_Water_Offset"
         FloatTrack=(Points=((OutVal=-280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.610449,OutVal=-280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-200.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_0"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackFloatMaterialParam_0'
      GroupName="Beach"
      GroupColor=(B=202,G=128,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Tabs(0)=(ViewStartInput=8.193157,ViewEndInput=58.199333)
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=60.007412
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1'
   InterpGroups(1)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=60.007412
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8136
   ObjPosY=3088
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8232
   ObjPosY=3112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=2885,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=2906,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=2927,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7864
   ObjPosY=2816
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_35
   SizeX=1141
   SizeY=468
   bDrawBox=True
   FillColor=(B=125,G=255,R=123,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7784
   ObjPosY=1816
   ObjComment="Portal Spawns"
   DrawWidth=1141
   DrawHeight=468
   Name="SequenceFrame_35"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=1949,OverrideDelta=14)
   InputLinks(1)=(DrawY=1970,OverrideDelta=35)
   InputLinks(2)=(DrawY=1991,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1970,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=8118,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8169,OverrideDelta=76)
   EventLinks(0)=(DrawX=8218,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8080
   ObjPosY=1912
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=1949,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1970,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1991,OverrideDelta=56)
   VariableLinks(0)=(DrawX=7922,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7840
   ObjPosY=1880
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-ZEDLANDING.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8048
   ObjPosY=2056
   ObjComment="PARENT - Rock 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-ZEDLANDING.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8576
   ObjPosY=2056
   ObjComment="PARENT - Rock 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=1949,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1970,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1991,OverrideDelta=56)
   VariableLinks(0)=(DrawX=8454,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8368
   ObjPosY=1880
   ObjName="TriggerVolume_18 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=1949,OverrideDelta=14)
   InputLinks(1)=(DrawY=1970,OverrideDelta=35)
   InputLinks(2)=(DrawY=1991,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1970,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=8646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8697,OverrideDelta=76)
   EventLinks(0)=(DrawX=8746,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8608
   ObjPosY=1912
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=KFSpawner'KF-ZEDLANDING.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8688
   ObjPosY=2088
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   PlayRate=4.000000
   InputLinks(0)=(DrawY=2494,OverrideDelta=23)
   InputLinks(1)=(DrawY=2530,OverrideDelta=59)
   InputLinks(2)=(DrawY=2566,OverrideDelta=95)
   InputLinks(3)=(DrawY=2602,OverrideDelta=131)
   InputLinks(4)=(DrawY=2638,OverrideDelta=167)
   OutputLinks(0)=(DrawY=2486,OverrideDelta=15)
   OutputLinks(1)=(DrawY=2509,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=1)),LinkDesc="AshEmitters",DrawY=2532,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0'),(LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1'),(LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_15'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=1)),LinkDesc="EruptionDestructible",DrawY=2555,OverrideDelta=84)
   OutputLinks(4)=(LinkDesc="FlowingLavaInterp",DrawY=2578,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2')),LinkDesc="CaveLavaPain",DrawY=2601,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_66')),LinkDesc="LavaFlowStart",DrawY=2624,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),LinkDesc="CaveLavaLights",DrawY=2647,OverrideDelta=176)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=1703,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="Fog",MinVars=0,DrawX=1747,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="CaveLava1",MinVars=0,DrawX=1794,OverrideDelta=103)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="CaveLava2",MinVars=0,DrawX=1849,OverrideDelta=158)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="WindDirectionalSource",MinVars=0,DrawX=1942,OverrideDelta=213)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="VolcanoFlow_Progression",MinVars=0,DrawX=2072,OverrideDelta=344)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="VolcanoFlow_LavaSpeckle",MinVars=0,DrawX=2205,OverrideDelta=473)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Sounds",MinVars=0,DrawX=2305,OverrideDelta=609)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_302',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),LinkDesc="CaveLavaLights",MinVars=0,DrawX=2380,OverrideDelta=673)
   VariableLinks(9)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),LinkDesc="CaveWater1",MinVars=0,DrawX=2455,OverrideDelta=759)
   VariableLinks(10)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),LinkDesc="CaveWater2",MinVars=0,DrawX=2519,OverrideDelta=823)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1672
   ObjPosY=2448
   ObjComment="Wave 2 - Start main volcano sequence"
   DrawWidth=887
   DrawHeight=245
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=(X=0.000000,Y=0.000000,Z=-32.000122),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=450.000000),(Time=465.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_8.InterpTrackMove_2'
      GroupName="CaveWater2"
      GroupColor=(B=191,G=145,R=0,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=(X=0.000000,Y=0.000000,Z=-32.000122),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=450.000000),(Time=465.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_6.InterpTrackMove_1'
      GroupName="CaveWater1"
      GroupColor=(B=0,G=126,R=203,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="WindDirectionalSourceComponent0.Speed"
         FloatTrack=(Points=((InVal=20.954815,OutVal=0.250000)))
         TrackTitle="Speed"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="WindDirectionalSourceComponent0.Strength"
         FloatTrack=(Points=((InVal=20.954815,OutVal=7.000000)))
         TrackTitle="Strength"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_5.InterpTrackFloatProp_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_5.InterpTrackFloatProp_1'
      GroupName="WindDirectionalSource"
      GroupColor=(B=180,G=0,R=159,A=255)
      bCollapsed=True
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="Radius"
         FloatTrack=(Points=((InVal=455.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=425.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Radius"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="Brightness"
         FloatTrack=(Points=((InVal=455.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=1.500000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="LightColor"
         VectorTrack=(Points=((InVal=455.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=(X=1.000000,Y=0.151058,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackFloatProp_0'
      InterpTracks(2)=InterpTrackColorProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackColorProp_0'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackFloatProp_1'
      GroupName="CaveLavaLights"
      GroupColor=(B=207,G=118,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=(X=0.000000,Y=0.000000,Z=79.999939),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=450.000000),(Time=465.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackMove_1'
      GroupName="CaveLava2"
      GroupColor=(B=177,G=0,R=163,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.volcano.ENV_Lava_Mat_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_270.StaticMeshComponent_48')))
         ParamName="Scalar_Progression"
         FloatTrack=(Points=((OutVal=-1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=499.119415,OutVal=18.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_0"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2.InterpTrackFloatMaterialParam_0'
      GroupName="VolcanoFlow_Progression"
      GroupColor=(B=69,G=225,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_11
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=21.041431,Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Erupt_Main')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=22.833691,Event=AkEvent'WW_ENV_Zed_Landing.Set_ZL_Wind_Post')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAkEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_11.InterpTrackAkEvent_1'
      InterpTracks(1)=InterpTrackAkEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_11.InterpTrackAkEvent_0'
      GroupName="Sounds"
      GroupColor=(B=226,G=0,R=69,A=255)
      bCollapsed=True
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_10
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_1
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.volcano.ENV_ZedLanding_Volcano_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_142.StaticMeshComponent_25'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_7.StaticMeshComponent_59')))
         ParamName="Volcano_Lava_Mask"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=299.236481,OutVal=20.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_1"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_10.InterpTrackFloatMaterialParam_1'
      GroupName="VolcanoFlow_LavaSpeckle"
      GroupColor=(B=186,G=151,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_10"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,OutVal=(X=0.000000,Y=0.000000,Z=79.999939),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=450.000000,InterpMode=CIM_CurveAutoClamped),(InVal=465.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=450.000000),(Time=465.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_1.InterpTrackMove_1'
      GroupName="CaveLava1"
      GroupColor=(B=120,G=206,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_3
         PropertyName="HeightFogComponent0.FogDensity"
         FloatTrack=(Points=((OutVal=0.050000,InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,OutVal=0.500000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="FogDensity"
         Name="InterpTrackFloatProp_3"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=4.500000,EventName="EruptionDestructible")
         EventTrack(1)=(Time=30.000000,EventName="FlowingLavaInterp")
         EventTrack(2)=(Time=448.820618,EventName="LavaFlowStart")
         EventTrack(3)=(Time=450.000000,EventName="CaveLavaLights")
         EventTrack(4)=(Time=462.000000,EventName="CaveLavaPain")
         EventTrack(5)=(Time=500.000000,EventName="AshEmitters")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackEvent_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackFloatProp_3'
      GroupName="Fog"
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2.InterpTrackFloatMaterialParam_0',CurveColor=(B=69,G=225,R=0,A=255),CurveName="VolcanoFlow_Progression_Float Material Param"),(CurveObject=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_10.InterpTrackFloatMaterialParam_1',CurveColor=(B=186,G=151,R=0,A=255),CurveName="VolcanoFlow_LavaSpeckle_Float Material Param")))
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1000.002441
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3'
   InterpGroups(3)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_5'
   InterpGroups(4)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2'
   InterpGroups(5)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_10'
   InterpGroups(6)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_11'
   InterpGroups(7)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4'
   InterpGroups(8)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_6'
   InterpGroups(9)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1000.002441
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1600
   ObjPosY=2776
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=ExponentialHeightFog'KF-ZEDLANDING.TheWorld:PersistentLevel.ExponentialHeightFog_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=4549
   SizeY=2841
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-232
   ObjPosY=1472
   ObjComment="Dynamic Fog / Lighting"
   DrawWidth=4549
   DrawHeight=2841
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_1
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareFloat_0')),LinkDesc="Start Objective Logic",DrawY=2586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=667,OverrideDelta=16)
   VariableLinks(1)=(DrawX=728,OverrideDelta=86)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=809,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=2520
   DrawWidth=202
   DrawHeight=144
   Name="KFSeqEvent_TraderOpened_1"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=Sequence Name=Tremble_Handler
   Begin Object Class=SeqVar_Player Name=SeqVar_Player_6
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7272
      ObjPosY=344
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Player_6"
      ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Falloff"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=9032
      ObjPosY=40
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_9"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Med"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7592
      ObjPosY=72
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_43"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_42
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Med"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6088
      ObjPosY=56
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_42"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Max"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6920
      ObjPosY=-104
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_3"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Min"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=5288
      ObjPosY=-120
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_11"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Min"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=8464
      ObjPosY=24
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_10"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
      EventName="GroundTremble"
      MaxWidth=215
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_15')),DrawY=-174,OverrideDelta=11)
      VariableLinks(0)=(DrawX=4851,OverrideDelta=75)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=4744
      ObjPosY=-240
      ObjComment="GroundTremble"
      DrawWidth=127
      DrawHeight=128
      Name="SeqEvent_RemoteEvent_0"
      ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_9
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_9.CameraShake_0'
      ShakeScale=0.100000
      InputLinks(0)=(DrawY=-180,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-160,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_10')),DrawY=-170,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=8531,OverrideDelta=16)
      VariableLinks(1)=(DrawX=8597,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_10'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8661,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=8493
      ObjPosY=-216
      bDrawLast=True
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_9"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_8
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_8.CameraShake_0'
      ShakeScale=0.100000
      InputLinks(0)=(DrawY=-196,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-176,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_9')),DrawY=-186,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=8227,OverrideDelta=16)
      VariableLinks(1)=(DrawX=8293,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_10'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8357,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=8189
      ObjPosY=-232
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_8"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_7
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_7.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_4')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=7379,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7445,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_43'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=7509,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7341
      ObjPosY=-264
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_7"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_6
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_6.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_7')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=7115,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7181,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_43'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=7245,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7077
      ObjPosY=-264
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_6"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_5
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_5.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-204,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-184,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_8')),DrawY=-194,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=7923,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7989,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_43'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8053,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7885
      ObjPosY=-240
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_5"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_4
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_4.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-212,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-192,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_5')),DrawY=-202,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=7659,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7725,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_43'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=7789,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7621
      ObjPosY=-248
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_4"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_3
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_3.CameraShake_0'
      ShakeScale=0.250000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_6')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=6819,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6885,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_3'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6949,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6781
      ObjPosY=-264
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_3"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_2
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_2.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-252,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-232,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_12')),DrawY=-242,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=6275,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6341,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_42'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6405,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6237
      ObjPosY=-288
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_2"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_15
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_15.CameraShake_0'
      ShakeScale=0.100000
      InputLinks(0)=(DrawY=-244,OverrideDelta=13)
      InputLinks(1)=(DrawY=-224,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_11')),DrawY=-234,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=5190,OverrideDelta=16)
      VariableLinks(1)=(DrawX=5256,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_11'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=5320,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=5152
      ObjPosY=-280
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_15"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_14
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_14.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-260,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-240,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_2')),DrawY=-250,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=6003,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6069,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_42'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6133,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=5965
      ObjPosY=-296
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_14"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_13
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_13.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-268,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-248,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_14')),DrawY=-258,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=5715,OverrideDelta=16)
      VariableLinks(1)=(DrawX=5781,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_42'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=5845,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=5677
      ObjPosY=-304
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_13"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_12
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_12.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_3')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=6523,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6589,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_42'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6653,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6485
      ObjPosY=-264
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_12"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_11
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_11.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-252,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-232,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_13')),DrawY=-242,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=5459,OverrideDelta=16)
      VariableLinks(1)=(DrawX=5525,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_42'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=5589,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=5421
      ObjPosY=-288
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_11"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_10
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_10.CameraShake_0'
      ShakeScale=0.050000
      InputLinks(0)=(DrawY=-172,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-152,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_1')),DrawY=-162,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=8811,OverrideDelta=16)
      VariableLinks(1)=(DrawX=8877,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_9'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8941,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=8773
      ObjPosY=-208
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_10"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_1
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_1.CameraShake_0'
      ShakeScale=0.050000
      InputLinks(0)=(DrawY=-148,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-128,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-138,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'),DrawX=9083,OverrideDelta=16)
      VariableLinks(1)=(DrawX=9149,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_9'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=9213,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=9045
      ObjPosY=-184
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_1"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   SequenceObjects(0)=SeqEvent_RemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqEvent_RemoteEvent_0'
   SequenceObjects(1)=SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_9'
   SequenceObjects(2)=SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_10'
   SequenceObjects(3)=SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_43'
   SequenceObjects(4)=SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_3'
   SequenceObjects(5)=SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_42'
   SequenceObjects(6)=SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_11'
   SequenceObjects(7)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_2'
   SequenceObjects(8)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_14'
   SequenceObjects(9)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_13'
   SequenceObjects(10)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_12'
   SequenceObjects(11)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_1'
   SequenceObjects(12)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_10'
   SequenceObjects(13)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_9'
   SequenceObjects(14)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_4'
   SequenceObjects(15)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_7'
   SequenceObjects(16)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_8'
   SequenceObjects(17)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_5'
   SequenceObjects(18)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_6'
   SequenceObjects(19)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_3'
   SequenceObjects(20)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_11'
   SequenceObjects(21)=SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_6'
   SequenceObjects(22)=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_15'
   DefaultViewX=-4707
   DefaultViewY=616
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=4640
   ObjName="Tremble_Handler"
   DrawWidth=119
   DrawHeight=29
   Name="Tremble_Handler"
   ObjectArchetype=Sequence'Engine.Default__Sequence'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_19
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=5200
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_19"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_7
   InputLinks(0)=(DrawY=5138,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=5138,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_58'),DrawX=1954,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_19'),DrawX=2010,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=5104
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_7"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_18
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=5016
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_18"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_6
   InputLinks(0)=(DrawY=4954,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_7')),DrawY=4954,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_57'),DrawX=1962,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_18'),DrawX=2018,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=4920
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_6"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_17
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2000
   ObjPosY=4848
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_17"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_5
   InputLinks(0)=(DrawY=4778,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_6')),DrawY=4778,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_56'),DrawX=1954,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_17'),DrawX=2010,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=4744
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_5"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=4664
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_4
   InputLinks(0)=(DrawY=4602,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_5'),(LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=4602,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_55'),DrawX=1962,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_13'),DrawX=2018,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=4568
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_4"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_1
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=5330,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=5330,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1970,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=5296
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_5
   FloatValue=0.050000
   VarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3048
   ObjPosY=4728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_5"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_4
   FloatValue=0.250000
   VarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2912
   ObjPosY=4728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_4"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_2
   FloatValue=0.150000
   VarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2800
   ObjPosY=4736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_2"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_1
   FloatValue=0.100000
   VarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=4744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_1"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxWidth=136
   OutputLinks(0)=(DrawY=4669,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=4690,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_16')),DrawY=4711,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1248
   ObjPosY=4600
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=45.000000
   InputLinks(0)=(DrawY=4637,OverrideDelta=14)
   InputLinks(1)=(DrawY=4658,OverrideDelta=35)
   InputLinks(2)=(DrawY=4679,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_4')),DrawY=4642,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4674,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_3'),DrawX=1604,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=4600
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_3
   Min=90.000000
   Max=240.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1568
   ObjPosY=4768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_3"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   VarName="Breakout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3176
   ObjPosY=4720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_34
   SizeX=805
   SizeY=572
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1224
   ObjPosY=1480
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_34"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-816
   ObjPosY=1952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=1562,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1562,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-528,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-592
   ObjPosY=1528
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=1882,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1882,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=-968,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1032
   ObjPosY=1848
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4'),(LinkedOp=SeqAct_ConsoleCommand'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=1634,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1097,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1192
   ObjPosY=1568
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KF-ZEDLANDING.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-760
   ObjPosY=1704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   InputLinks(0)=(DrawY=1550,OverrideDelta=15)
   InputLinks(1)=(DrawY=1572,OverrideDelta=37)
   InputLinks(2)=(DrawY=1594,OverrideDelta=59)
   InputLinks(3)=(DrawY=1616,OverrideDelta=81)
   InputLinks(4)=(DrawY=1638,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=1566,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1622,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-839,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="FlythroughCamera",MinVars=0,DrawX=-772,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-872
   ObjPosY=1512
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=3333,OverrideDelta=14)
   InputLinks(1)=(DrawY=3354,OverrideDelta=35)
   InputLinks(2)=(DrawY=3375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_290',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_296',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_148'),DrawX=3078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3129,OverrideDelta=76)
   EventLinks(0)=(DrawX=3178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=3296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_290
   ObjValue=DynamicPhysicsVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.DynamicPhysicsVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=3504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_290"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_296
   ObjValue=DynamicPhysicsVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.DynamicPhysicsVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_296"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_148
   ObjValue=DynamicPhysicsVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.DynamicPhysicsVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3176
   ObjPosY=3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_148"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_32
   SizeX=2670
   SizeY=1632
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3144
   ObjPosY=-9048
   ObjComment="Random Start Location"
   DrawWidth=2670
   DrawHeight=1632
   Name="SequenceFrame_32"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=-8347,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8326,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8305,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8326,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_282',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_283',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_284',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_285',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_286',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_287'),DrawX=5430,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5481,OverrideDelta=76)
   EventLinks(0)=(DrawX=5530,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5392
   ObjPosY=-8384
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_52
   InputLinks(0)=(DrawY=-8259,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8238,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8217,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8238,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_291',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_292',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_301',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_304',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_305',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_306'),DrawX=4982,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5033,OverrideDelta=76)
   EventLinks(0)=(DrawX=5082,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=-8296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_52"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-8779,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8758,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8737,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8758,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_166',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_245',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_274',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_279',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_280'),DrawX=5446,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5497,OverrideDelta=76)
   EventLinks(0)=(DrawX=5546,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5408
   ObjPosY=-8816
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_65
   InputLinks(0)=(DrawY=-8755,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8734,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8713,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8734,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_314',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_315',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_316',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_317',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_318',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_319'),DrawX=5038,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5089,OverrideDelta=76)
   EventLinks(0)=(DrawX=5138,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5000
   ObjPosY=-8792
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_65"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=-8552,OverrideDelta=25)
   InputLinks(1)=(DrawY=-8508,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_65')),DrawY=-8563,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),LinkDesc="Link 2",DrawY=-8541,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_52')),LinkDesc="Link 3",DrawY=-8519,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39')),LinkDesc="Link 4",DrawY=-8497,OverrideDelta=80)
   VariableLinks(0)=(DrawX=4644,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4600
   ObjPosY=-8600
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-8587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8566,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_13')),DrawY=-8545,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4072
   ObjPosY=-8656
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_314
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=-8600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_314"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_315
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5040
   ObjPosY=-8600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_315"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_316
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5136
   ObjPosY=-8600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_316"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_317
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4984
   ObjPosY=-8520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_317"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_318
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5080
   ObjPosY=-8520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_318"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_319
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5184
   ObjPosY=-8520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_319"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SpawnsOff"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_65',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_52',InputLinkIdx=1)),DrawY=-8830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4598,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4504
   ObjPosY=-8896
   ObjComment="SpawnsOff"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_13
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=-8502,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-8502,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4428,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4304
   ObjPosY=-8536
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_13"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_0
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=-7886,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3608,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3678,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3560
   ObjPosY=-7952
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_0"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-8059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8017,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8038,OverrideDelta=35)
   VariableLinks(0)=(DrawX=3598,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3649,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_0'),DrawX=3698,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3560
   ObjPosY=-8096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=-7942,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-7942,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4148,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4024
   ObjPosY=-7976
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-7963,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7942,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7921,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7942,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_308',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_309',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_310',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_311',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_312',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_313'),DrawX=4398,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4449,OverrideDelta=76)
   EventLinks(0)=(DrawX=4498,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4360
   ObjPosY=-8000
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=20.000000
   InputLinks(0)=(DrawY=-7947,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7926,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7905,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),DrawY=-7942,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7910,OverrideDelta=51)
   VariableLinks(0)=(DrawX=3892,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3840
   ObjPosY=-7984
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(DrawY=-8075,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8054,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-8033,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3336
   ObjPosY=-8144
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=3341,OverrideDelta=14)
   InputLinks(1)=(DrawY=3362,OverrideDelta=35)
   InputLinks(2)=(DrawY=3383,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3362,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=3382,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3433,OverrideDelta=76)
   EventLinks(0)=(DrawX=3482,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3344
   ObjPosY=3304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=DynamicBlockingVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.DynamicBlockingVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3328
   ObjPosY=3456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=DynamicBlockingVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.DynamicBlockingVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3424
   ObjPosY=3456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   PlayRate=1.050000
   InputLinks(0)=(DrawY=3910,OverrideDelta=15)
   InputLinks(1)=(DrawY=3932,OverrideDelta=37)
   InputLinks(2)=(DrawY=3954,OverrideDelta=59)
   InputLinks(3)=(DrawY=3976,OverrideDelta=81)
   InputLinks(4)=(DrawY=3998,OverrideDelta=103)
   OutputLinks(0)=(DrawY=3917,OverrideDelta=22)
   OutputLinks(1)=(DrawY=3954,OverrideDelta=59)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_54',InputLinkIdx=1)),LinkDesc="Waterfall_OFF",DrawY=3991,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=3639,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="NewSkeletalMeshGroup",MinVars=0,DrawX=3711,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),LinkDesc="LavaRiver",MinVars=0,DrawX=3783,OverrideDelta=159)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_299'),LinkDesc="LavaLight1",MinVars=0,DrawX=3835,OverrideDelta=207)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_300'),LinkDesc="LavaLight2",MinVars=0,DrawX=3891,OverrideDelta=263)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),LinkDesc="LavaLight3",MinVars=0,DrawX=3947,OverrideDelta=319)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_303'),LinkDesc="LavaLight4",MinVars=0,DrawX=4003,OverrideDelta=375)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),LinkDesc="LavaLight_Falls",MinVars=0,DrawX=4073,OverrideDelta=431)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),LinkDesc="LavaLight0",MinVars=0,DrawX=4144,OverrideDelta=516)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3608
   ObjPosY=3872
   DrawWidth=572
   DrawHeight=173
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=0.000000,Y=-0.001953,Z=11.180176),ArriveTangent=(X=0.000000,Y=-0.000244,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.000244,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.000000,Y=-0.002930,Z=-108.001465),ArriveTangent=(X=0.000000,Y=-0.000293,Z=-2.441538),LeaveTangent=(X=0.000000,Y=-0.000293,Z=-2.441538),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.000000,Y=-0.003418,Z=-108.001709),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.000000,Y=-0.003418,Z=-108.001709),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.000000,Y=-0.002930,Z=-108.001465),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=7.000000),(Time=12.000000),(Time=12.000000),(Time=12.000000),(Time=12.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_9.InterpTrackMove_3'
      GroupName="LavaRiver"
      GroupColor=(B=0,G=153,R=184,A=255)
      bCollapsed=True
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         EventTrack(0)=(Time=5.467335,EventName="Waterfall_OFF")
         bFireEventsWhenBackwards=False
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_1
         AnimSeqs(0)=(AnimSeqName="LavaPathBaked",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_1"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_0
         AkEvents(0)=(Time=5.297424,Event=AkEvent'WW_ENV_Zed_Landing.Set_ZL_Lava')
         Name="InterpTrackAkEvent_0"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackAnimControl_1'
      InterpTracks(1)=InterpTrackEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackAkEvent_0'
      GroupName="NewSkeletalMeshGroup"
      GroupColor=(B=206,G=0,R=123,A=255)
      GroupAnimSets(0)=AnimSet'VFX_textures.LavaPathBaked_Anims'
      bCollapsed=True
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_15
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_8
         Name="InterpTrackMove_8"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_13
         PropertyName="Radius"
         TrackTitle="Radius"
         Name="InterpTrackFloatProp_13"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_12
         PropertyName="Brightness"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.150401,InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,OutVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_12"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_6
         PropertyName="LightColor"
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_6"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackMove_8'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackFloatProp_12'
      InterpTracks(2)=InterpTrackColorProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackColorProp_6'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackFloatProp_13'
      GroupName="LavaLight4"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_15"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_13
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_6
         Name="InterpTrackMove_6"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_9
         PropertyName="Radius"
         TrackTitle="Radius"
         Name="InterpTrackFloatProp_9"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_8
         PropertyName="Brightness"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.150401,InterpMode=CIM_CurveAutoClamped),(InVal=16.000000,InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_8"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_4
         PropertyName="LightColor"
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_4"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackMove_6'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackFloatProp_8'
      InterpTracks(2)=InterpTrackColorProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackColorProp_4'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackFloatProp_9'
      GroupName="LavaLight3"
      GroupColor=(B=0,G=145,R=191,A=255)
      bCollapsed=True
      Name="InterpGroup_13"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_12
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_7
         PropertyName="Radius"
         TrackTitle="Radius"
         Name="InterpTrackFloatProp_7"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_6
         PropertyName="Brightness"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.150401,InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_6"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_3
         PropertyName="LightColor"
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_3"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackMove_5'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackFloatProp_6'
      InterpTracks(2)=InterpTrackColorProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackColorProp_3'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackFloatProp_7'
      GroupName="LavaLight2"
      GroupColor=(B=0,G=197,R=136,A=255)
      bCollapsed=True
      Name="InterpGroup_12"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_11
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_5
         PropertyName="Radius"
         TrackTitle="Radius"
         Name="InterpTrackFloatProp_5"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_4
         PropertyName="Brightness"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.150401,InterpMode=CIM_CurveAutoClamped),(InVal=11.500000,InterpMode=CIM_CurveAutoClamped),(InVal=13.000000,OutVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_4"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_2
         PropertyName="LightColor"
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_2"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackMove_4'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackFloatProp_4'
      InterpTracks(2)=InterpTrackColorProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackColorProp_2'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackFloatProp_5'
      GroupName="LavaLight1"
      GroupColor=(B=224,G=0,R=79,A=255)
      bCollapsed=True
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_3
         PropertyName="Radius"
         TrackTitle="Radius"
         Name="InterpTrackFloatProp_3"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="Brightness"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=7.916533,InterpMode=CIM_CurveAutoClamped),(InVal=9.631008,OutVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_1
         PropertyName="LightColor"
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_1"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackFloatProp_2'
      InterpTracks(2)=InterpTrackColorProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackColorProp_1'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackFloatProp_3'
      GroupName="LavaLight0"
      GroupColor=(B=0,G=133,R=199,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="Radius"
         TrackTitle="Radius"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="Brightness"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.487256,InterpMode=CIM_CurveAutoClamped),(InVal=4.762341,OutVal=3.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="LightColor"
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_0'
      InterpTracks(2)=InterpTrackColorProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackColorProp_0'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_1'
      GroupName="LavaLight_Falls"
      GroupColor=(B=51,G=0,R=229,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(ViewStartInput=-0.070777,ViewEndInput=31.929226,ViewStartOutput=-0.928571,ViewEndOutput=1.071429)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=32.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2'
   InterpGroups(1)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_9'
   InterpGroups(2)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11'
   InterpGroups(3)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12'
   InterpGroups(4)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13'
   InterpGroups(5)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15'
   InterpGroups(6)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(7)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=32.000000
   BakeAndPruneStatus(0)=(AnimSetName="VFX_textures.LavaPathBaked_Anims")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3552
   ObjPosY=4088
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_0
   InputLinks(0)=(DrawY=2828,OverrideDelta=13)
   InputLinks(1)=(DrawY=2848,OverrideDelta=33)
   InputLinks(2)=(DrawY=2935,bHidden=True,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2838,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=2971,OverrideDelta=29)
   VariableLinks(1)=(bHidden=True,DrawX=3025,OverrideDelta=76)
   EventLinks(0)=(DrawX=3074,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=2792
   DrawWidth=103
   DrawHeight=85
   Name="SeqAct_ToggleHidden_0"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=2936
   ObjComment="Cap"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=1061
   SizeY=398
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=3264
   ObjComment="Cave Pain Volumes"
   DrawWidth=1061
   DrawHeight=398
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3648
   ObjPosY=4080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_66
   InputLinks(0)=(DrawY=3909,OverrideDelta=14)
   InputLinks(1)=(DrawY=3930,OverrideDelta=35)
   InputLinks(2)=(DrawY=3951,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_99',InputLinkIdx=1)),DrawY=3930,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_307',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=2590,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2641,OverrideDelta=76)
   EventLinks(0)=(DrawX=2690,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=3872
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_66"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2472
   ObjPosY=4000
   ObjComment="Stream Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=4008
   ObjComment="Lava Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_54
   InputLinks(0)=(DrawY=3949,OverrideDelta=14)
   InputLinks(1)=(DrawY=3970,ActivateDelay=3.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3991,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_55',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43')),DrawY=3970,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),DrawX=4382,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4433,OverrideDelta=76)
   EventLinks(0)=(DrawX=4482,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4344
   ObjPosY=3912
   ObjComment="River Splashes 1 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_54"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
   ConsoleEventName="Start"
   MaxWidth=153
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=2306,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1220,OverrideDelta=44)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1144
   ObjPosY=2240
   DrawWidth=96
   DrawHeight=128
   Name="SeqEvent_Console_2"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_3
   InputLinks(0)=(DrawY=4005,OverrideDelta=14)
   InputLinks(1)=(DrawY=4026,OverrideDelta=35)
   InputLinks(2)=(DrawY=4047,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49')),DrawY=4026,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=7062,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7113,OverrideDelta=76)
   EventLinks(0)=(DrawX=7162,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7024
   ObjPosY=3968
   ObjComment="River Mesh - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_3"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7032
   ObjPosY=4128
   ObjComment="Stream Water Interp Actor"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqCond_CompareFloat Name=SeqCond_CompareFloat_0
   InputLinks(0)=(DrawY=2594,OverrideDelta=59)
   OutputLinks(0)=(DrawY=2550,OverrideDelta=15)
   OutputLinks(1)=(DrawY=2572,OverrideDelta=37)
   OutputLinks(2)=(DrawY=2594,OverrideDelta=59)
   OutputLinks(3)=(DrawY=2616,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqCond_CompareBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_2')),DrawY=2638,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=1024,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_13'),DrawX=1049,OverrideDelta=61)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=984
   ObjPosY=2512
   DrawWidth=105
   DrawHeight=157
   Name="SeqCond_CompareFloat_0"
   ObjectArchetype=SeqCond_CompareFloat'Engine.Default__SeqCond_CompareFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=880
   ObjPosY=2704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_0"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_13
   FloatValue=50.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1016
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_13"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7368
   ObjPosY=4120
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8624
   ObjPosY=4080
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6048
   ObjPosY=4088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_72"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=554
   SizeY=339
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5720
   ObjPosY=3896
   ObjComment="LavaFall Left - ON"
   DrawWidth=554
   DrawHeight=339
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3336
   ObjPosY=2856
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3440
   ObjPosY=2856
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_259'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3384
   ObjPosY=2912
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3488
   ObjPosY=2912
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=2856
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3440
   ObjPosY=2968
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_81"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=2772,OverrideDelta=13)
   InputLinks(1)=(DrawY=2792,OverrideDelta=33)
   InputLinks(2)=(DrawY=2815,bHidden=True,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2782,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=3478,OverrideDelta=24)
   VariableLinks(1)=(bHidden=True,DrawX=3521,OverrideDelta=76)
   EventLinks(0)=(DrawX=3570,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=2736
   DrawWidth=93
   DrawHeight=85
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3096
   ObjPosY=2952
   ObjComment="Eruption Particle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3232
   ObjPosY=2944
   ObjComment="Smoke Particle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=2856,OverrideDelta=33)
   InputLinks(1)=(DrawY=2836,OverrideDelta=13)
   InputLinks(2)=(DrawY=2935,bHidden=True,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2914,bHidden=True,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83'),DrawX=3270,OverrideDelta=16)
   VariableLinks(1)=(bHidden=True,DrawX=3313,OverrideDelta=76)
   EventLinks(0)=(DrawX=3362,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3232
   ObjPosY=2800
   DrawWidth=76
   DrawHeight=85
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=2844,OverrideDelta=13)
   InputLinks(1)=(DrawY=2864,OverrideDelta=33)
   InputLinks(2)=(DrawY=2887,bHidden=True,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2854,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=3134,OverrideDelta=24)
   VariableLinks(1)=(bHidden=True,DrawX=3153,OverrideDelta=76)
   EventLinks(0)=(DrawX=3202,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3088
   ObjPosY=2808
   DrawWidth=93
   DrawHeight=85
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5296
   ObjPosY=4064
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5072
   ObjPosY=4080
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5008
   ObjPosY=4080
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=4096
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4808
   ObjPosY=4168
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4720
   ObjPosY=4192
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=4088
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=4168
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=4096
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=4064
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4360
   ObjPosY=4064
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=4136
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4368
   ObjPosY=4136
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=4176
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=1186
   SizeY=907
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1208
   ObjPosY=4512
   ObjComment="Tremble Handler"
   DrawWidth=1186
   DrawHeight=907
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3720
   ObjPosY=2872
   ObjComment="Seagulls"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_36
   SizeX=318
   SizeY=133
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3688
   ObjPosY=2840
   ObjComment="Seaguls"
   DrawWidth=318
   DrawHeight=133
   Name="SequenceFrame_36"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3816
   ObjPosY=2872
   ObjComment="Seagulls"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_112'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3920
   ObjPosY=2872
   ObjComment="Seagulls"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=726
   SizeY=462
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3496
   ObjPosY=3816
   ObjComment="Lava Flow"
   DrawWidth=726
   DrawHeight=462
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_99
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=0.500000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1)),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=2982,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3033,OverrideDelta=76)
   EventLinks(0)=(DrawX=3082,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=3904
   ObjComment="Waterfall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_99"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3200
   ObjPosY=4088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_50
   InputLinks(0)=(DrawY=3973,OverrideDelta=14)
   InputLinks(1)=(DrawY=3994,ActivateDelay=0.500000,OverrideDelta=35)
   InputLinks(2)=(DrawY=4015,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=8030,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8081,OverrideDelta=76)
   EventLinks(0)=(DrawX=8130,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7992
   ObjPosY=3936
   ObjComment="Waterfall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_50"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_49
   InputLinks(0)=(DrawY=3973,ActivateDelay=5.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=3994,OverrideDelta=35)
   InputLinks(2)=(DrawY=4015,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_69')),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=7366,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7417,OverrideDelta=76)
   EventLinks(0)=(DrawX=7466,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7328
   ObjPosY=3936
   ObjComment="Lavafall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_49"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_47
   InputLinks(0)=(DrawY=3957,ActivateDelay=3.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=3978,OverrideDelta=35)
   InputLinks(2)=(DrawY=3999,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30')),DrawY=3978,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=5822,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5873,OverrideDelta=76)
   EventLinks(0)=(DrawX=5922,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=3920
   ObjComment="LavaFall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_47"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4752
   ObjPosY=4104
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=2776,OverrideDelta=33)
   InputLinks(1)=(DrawY=2756,OverrideDelta=13)
   InputLinks(2)=(DrawY=2815,bHidden=True,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2794,bHidden=True,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106'),DrawX=3838,OverrideDelta=16)
   VariableLinks(1)=(bHidden=True,DrawX=3897,OverrideDelta=76)
   EventLinks(0)=(DrawX=3946,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=2720
   DrawWidth=76
   DrawHeight=85
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_55
   Min=0.030000
   Max=0.050000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_55"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_56
   Min=0.050000
   Max=0.080000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=4840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_56"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_57
   Min=0.100000
   Max=0.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=5016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_57"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_58
   Min=0.020000
   Max=0.050000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=5208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_58"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_26
   InputLinks(0)=(DrawY=2589,OverrideDelta=14)
   InputLinks(1)=(DrawY=2610,OverrideDelta=35)
   InputLinks(2)=(DrawY=2631,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_28')),DrawY=2594,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2626,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_31'),DrawX=4796,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4744
   ObjPosY=2552
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_26"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_31
   Min=1.000000
   Max=1.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4760
   ObjPosY=2680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_31"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_28
   InputLinks(0)=(DrawY=1858,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_29')),DrawY=1858,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_50'),DrawX=4978,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=5034,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=1824
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_28"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_33
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5008
   ObjPosY=1920
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_33"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_29
   InputLinks(0)=(DrawY=2034,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_30')),DrawY=2034,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_49'),DrawX=4970,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_0'),DrawX=5026,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=2000
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_29"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5016
   ObjPosY=2104
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_30
   InputLinks(0)=(DrawY=2210,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_31')),DrawY=2210,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_48'),DrawX=4978,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_43'),DrawX=5034,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=2176
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_30"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_43
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5016
   ObjPosY=2272
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_43"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_31
   InputLinks(0)=(DrawY=2394,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_17')),DrawY=2394,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_47'),DrawX=4970,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_36'),DrawX=5026,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=2360
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_31"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_36
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5016
   ObjPosY=2456
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_36"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_17
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2602,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),DrawY=2602,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5282,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5144
   ObjPosY=2568
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_17"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2586,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6834,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6696
   ObjPosY=2552
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_5
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6568
   ObjPosY=2440
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_5"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_3
   InputLinks(0)=(DrawY=2378,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=2378,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_13'),DrawX=6522,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_5'),DrawX=6578,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6488
   ObjPosY=2344
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_3"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_41
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6568
   ObjPosY=2256
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_41"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_2
   InputLinks(0)=(DrawY=2194,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_3')),DrawY=2194,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_12'),DrawX=6530,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_41'),DrawX=6586,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6496
   ObjPosY=2160
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_2"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6568
   ObjPosY=2088
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_0
   InputLinks(0)=(DrawY=2018,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_2')),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_11'),DrawX=6522,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_3'),DrawX=6578,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6488
   ObjPosY=1984
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_0"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_4
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6560
   ObjPosY=1904
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_4"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_1
   InputLinks(0)=(DrawY=1842,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_0')),DrawY=1842,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_10'),DrawX=6530,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_4'),DrawX=6586,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6496
   ObjPosY=1808
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_1"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_25
   Min=1.000000
   Max=1.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6312
   ObjPosY=2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_25"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_18
   InputLinks(0)=(DrawY=2573,OverrideDelta=14)
   InputLinks(1)=(DrawY=2594,OverrideDelta=35)
   InputLinks(2)=(DrawY=2615,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1')),DrawY=2578,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2610,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_25'),DrawX=6348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6296
   ObjPosY=2536
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_18"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   InputLinks(0)=(DrawY=2573,OverrideDelta=14)
   InputLinks(1)=(DrawY=2594,OverrideDelta=35)
   InputLinks(2)=(DrawY=2615,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_23')),DrawY=2578,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2610,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_24'),DrawX=5572,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5520
   ObjPosY=2536
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_5"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_24
   Min=1.000000
   Max=1.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5536
   ObjPosY=2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_24"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_23
   InputLinks(0)=(DrawY=1842,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_22')),DrawY=1842,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_54'),DrawX=5754,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_9'),DrawX=5810,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5720
   ObjPosY=1808
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_23"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=1904
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_9"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_22
   InputLinks(0)=(DrawY=2018,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_21')),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_53'),DrawX=5746,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_27'),DrawX=5802,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5712
   ObjPosY=1984
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_22"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_27
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5792
   ObjPosY=2088
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_27"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_21
   InputLinks(0)=(DrawY=2194,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_20')),DrawY=2194,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_52'),DrawX=5754,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_26'),DrawX=5810,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5720
   ObjPosY=2160
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_21"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_26
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5792
   ObjPosY=2256
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_26"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_20
   InputLinks(0)=(DrawY=2378,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_15')),DrawY=2378,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_51'),DrawX=5746,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_25'),DrawX=5802,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5712
   ObjPosY=2344
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_20"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_25
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5792
   ObjPosY=2440
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_25"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_15
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2586,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_18')),DrawY=2586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6058,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5920
   ObjPosY=2552
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_15"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=WindDirectionalSource'KF-ZEDLANDING.TheWorld:PersistentLevel.WindDirectionalSource_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=2728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=2792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Lava_Explo'
   InputLinks(0)=(DrawY=3842,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3842,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=4160,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=3808
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_53
   InputLinks(0)=(DrawY=3981,ActivateDelay=8.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=4002,ActivateDelay=0.500000,OverrideDelta=35)
   InputLinks(2)=(DrawY=4023,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1)),DrawY=4002,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=6430,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6481,OverrideDelta=76)
   EventLinks(0)=(DrawX=6530,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6392
   ObjPosY=3944
   ObjComment="Waterfall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_53"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
   ConsoleEventName="Rumble1"
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_4')),DrawY=4522,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1542,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1456
   ObjPosY=4456
   DrawWidth=106
   DrawHeight=128
   Name="SeqEvent_Console_3"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_1
   ConsoleEventName="Rumble2"
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_15')),DrawY=1906,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2702,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=1840
   DrawWidth=106
   DrawHeight=128
   Name="SeqEvent_Console_1"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Rumble_LP_4'
   InputLinks(0)=(DrawY=4602,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4602,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2192,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=4568
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Rumble_LP_13'
   InputLinks(0)=(DrawY=2498,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2498,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2680,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=2464
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="FlythroughCamera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=0.001465,Y=0.000183,Z=0.000092),InterpMode=CIM_CurveAuto),(InVal=2.500000,OutVal=(X=438.327637,Y=241.229492,Z=80.000114),ArriveTangent=(X=219.501373,Y=135.154129,Z=23.466675),LeaveTangent=(X=219.501373,Y=135.154129,Z=23.466675),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=1757.236572,Y=1206.710449,Z=176.000153),ArriveTangent=(X=197.608521,Y=85.165283,Z=33.589081),LeaveTangent=(X=197.608521,Y=85.165283,Z=33.589081),InterpMode=CIM_CurveUser),(InVal=12.000000,OutVal=(X=2710.825928,Y=1154.605957,Z=560.000366),ArriveTangent=(X=235.384583,Y=-159.152771,Z=0.000055),LeaveTangent=(X=235.384583,Y=-159.152771,Z=0.000055),InterpMode=CIM_CurveUser),(InVal=15.500000,OutVal=(X=3091.305664,Y=552.775391,Z=560.000488),ArriveTangent=(X=0.000000,Y=-174.941284,Z=0.000000),LeaveTangent=(X=0.000000,Y=-174.941284,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=20.500000,OutVal=(X=2395.676025,Y=-332.395020,Z=544.000549),ArriveTangent=(X=0.000000,Y=-37.854576,Z=0.000000),LeaveTangent=(X=0.000000,Y=-37.854576,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=23.500000,OutVal=(X=2744.105469,Y=-390.937988,Z=576.000610),ArriveTangent=(X=125.803116,Y=-39.510384,Z=19.056038),LeaveTangent=(X=125.803116,Y=-39.510384,Z=19.056038),InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=(X=3276.297852,Y=-1002.600098,Z=736.000732),ArriveTangent=(X=0.000000,Y=-191.069092,Z=0.000000),LeaveTangent=(X=0.000000,Y=-191.069092,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=29.500000,OutVal=(X=3209.537354,Y=-1537.352539,Z=720.000854),ArriveTangent=(X=-61.177647,Y=-203.159668,Z=0.000000),LeaveTangent=(X=-61.177647,Y=-203.159668,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=32.500000,OutVal=(X=2732.177246,Y=-2018.398438,Z=752.000977),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.000115),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.000115),InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,OutVal=(X=2858.163330,Y=-1992.231934,Z=752.001099),ArriveTangent=(X=90.072433,Y=22.449394,Z=0.000110),LeaveTangent=(X=90.072433,Y=22.449394,Z=0.000110),InterpMode=CIM_CurveAutoClamped),(InVal=38.500000,OutVal=(X=3547.729492,Y=-1279.823730,Z=768.001221),ArriveTangent=(X=193.056381,Y=220.385361,Z=0.000000),LeaveTangent=(X=193.056381,Y=220.385361,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=41.500000,OutVal=(X=4113.029785,Y=-559.727051,Z=624.001343),ArriveTangent=(X=97.379044,Y=277.246338,Z=-28.011957),LeaveTangent=(X=97.379044,Y=277.246338,Z=-28.011957),InterpMode=CIM_CurveAutoClamped),(InVal=44.500000,OutVal=(X=4271.439453,Y=383.654297,Z=576.001465),ArriveTangent=(X=110.414139,Y=233.357452,Z=0.000000),LeaveTangent=(X=110.414139,Y=233.357452,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=47.000000,OutVal=(X=4982.766602,Y=777.835938,Z=688.001587),ArriveTangent=(X=311.907318,Y=113.213333,Z=27.793669),LeaveTangent=(X=311.907318,Y=113.213333,Z=27.793669),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=5986.929688,Y=1006.327637,Z=736.001709),ArriveTangent=(X=294.118927,Y=0.000000,Z=0.000000),LeaveTangent=(X=294.118927,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=53.500000,OutVal=(X=6894.539551,Y=673.733398,Z=528.001831),ArriveTangent=(X=179.055038,Y=-166.789383,Z=0.000000),LeaveTangent=(X=179.055038,Y=-166.789383,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=56.500000,OutVal=(X=7238.857422,Y=-152.591797,Z=528.001892),ArriveTangent=(X=89.557861,Y=-216.757324,Z=0.000020),LeaveTangent=(X=89.557861,Y=-216.757324,Z=0.000020),InterpMode=CIM_CurveAutoClamped),(InVal=59.500000,OutVal=(X=7431.886719,Y=-626.810547,Z=528.001953),ArriveTangent=(X=0.000000,Y=-136.568619,Z=0.000022),LeaveTangent=(X=0.000000,Y=-136.568619,Z=0.000022),InterpMode=CIM_CurveAutoClamped),(InVal=62.000000,OutVal=(X=7249.742676,Y=-903.719238,Z=528.002014),ArriveTangent=(X=0.000000,Y=-149.943909,Z=0.000065),LeaveTangent=(X=0.000000,Y=-149.943909,Z=0.000065),InterpMode=CIM_CurveAutoClamped),(InVal=64.000000,OutVal=(X=7365.806641,Y=-1301.558105,Z=544.002075),ArriveTangent=(X=135.156357,Y=-152.161957,Z=7.603629),LeaveTangent=(X=135.156357,Y=-152.161957,Z=7.603629),InterpMode=CIM_CurveUser),(InVal=66.000000,OutVal=(X=7719.053711,Y=-1360.706543,Z=608.002197),ArriveTangent=(X=239.667297,Y=-7.885750,Z=56.405449),LeaveTangent=(X=239.667297,Y=-7.885750,Z=56.405449),InterpMode=CIM_CurveUser),(InVal=69.000000,OutVal=(X=8450.772461,Y=-1558.862793,Z=880.002502),ArriveTangent=(X=168.299942,Y=-180.322083,Z=36.414047),LeaveTangent=(X=168.299942,Y=-180.322083,Z=36.414047),InterpMode=CIM_CurveUser),(InVal=72.500000,OutVal=(X=8460.683594,Y=-2516.736328,Z=992.002502),ArriveTangent=(X=0.000000,Y=-311.519562,Z=49.454556),LeaveTangent=(X=0.000000,Y=-311.519562,Z=49.454556),InterpMode=CIM_CurveAutoClamped),(InVal=74.500000,OutVal=(X=8287.563477,Y=-3272.220459,Z=1152.002563),ArriveTangent=(X=-72.229004,Y=-375.939331,Z=64.000046),LeaveTangent=(X=-72.229004,Y=-375.939331,Z=64.000046),InterpMode=CIM_CurveAutoClamped),(InVal=76.500000,OutVal=(X=8171.767578,Y=-4020.493652,Z=1248.002686),ArriveTangent=(X=-88.964149,Y=-292.001801,Z=0.000113),LeaveTangent=(X=-88.964149,Y=-292.001801,Z=0.000113),InterpMode=CIM_CurveAutoClamped),(InVal=79.500000,OutVal=(X=7764.364258,Y=-4732.229492,Z=1248.002808),ArriveTangent=(X=-118.726158,Y=-223.064941,Z=0.000102),LeaveTangent=(X=-118.726158,Y=-223.064941,Z=0.000102),InterpMode=CIM_CurveAutoClamped),(InVal=82.500000,OutVal=(X=7459.410645,Y=-5358.883301,Z=1264.002930),ArriveTangent=(X=-78.549477,Y=-216.903320,Z=10.138201),LeaveTangent=(X=-78.549477,Y=-216.903320,Z=10.138201),InterpMode=CIM_CurveAutoClamped),(InVal=85.500000,OutVal=(X=7293.067383,Y=-6033.649414,Z=1328.003052),ArriveTangent=(X=0.000000,Y=-185.239990,Z=18.666708),LeaveTangent=(X=0.000000,Y=-185.239990,Z=18.666708),InterpMode=CIM_CurveAutoClamped),(InVal=88.500000,OutVal=(X=7405.052734,Y=-6470.323242,Z=1376.003174),ArriveTangent=(X=0.000000,Y=-167.905991,Z=0.000000),LeaveTangent=(X=0.000000,Y=-167.905991,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=7093.457031,Y=-6957.132324,Z=1344.003418),ArriveTangent=(X=-190.557877,Y=-43.196613,Z=-24.379135),LeaveTangent=(X=-190.557877,Y=-43.196613,Z=-24.379135),InterpMode=CIM_CurveAutoClamped),(InVal=93.500000,OutVal=(X=6442.982910,Y=-7005.563965,Z=1215.003540),ArriveTangent=(X=-272.211029,Y=-39.506683,Z=-47.999958),LeaveTangent=(X=-272.211029,Y=-39.506683,Z=-47.999958),InterpMode=CIM_CurveAutoClamped),(InVal=97.000000,OutVal=(X=5460.190918,Y=-7643.333496,Z=1056.003662),ArriveTangent=(X=-149.858826,Y=-468.062042,Z=0.000000),LeaveTangent=(X=-149.858826,Y=-468.062042,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=100.000000,OutVal=(X=6133.399414,Y=-8523.530273,Z=1072.003662),ArriveTangent=(X=0.000000,Y=-320.878662,Z=6.333374),LeaveTangent=(X=0.000000,Y=-320.878662,Z=6.333374),InterpMode=CIM_CurveAutoClamped),(InVal=103.000000,OutVal=(X=5669.548340,Y=-9568.605469,Z=1094.003906),ArriveTangent=(X=-142.057785,Y=-50.875824,Z=0.000000),LeaveTangent=(X=-142.057785,Y=-50.875824,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=105.500000,OutVal=(X=5348.887695,Y=-9493.232422,Z=1104.004028),ArriveTangent=(X=-124.007469,Y=88.810997,Z=-5.333292),LeaveTangent=(X=-124.007469,Y=88.810997,Z=-5.333292),InterpMode=CIM_CurveUser),(InVal=107.500000,OutVal=(X=4959.420410,Y=-9150.695313,Z=1120.004028),ArriveTangent=(X=-217.381927,Y=130.682816,Z=11.696037),LeaveTangent=(X=-217.381927,Y=130.682816,Z=11.696037),InterpMode=CIM_CurveAutoClamped),(InVal=110.500000,OutVal=(X=4261.978027,Y=-8839.818359,Z=1169.004395),ArriveTangent=(X=-203.389771,Y=279.129700,Z=24.541946),LeaveTangent=(X=-203.389771,Y=279.129700,Z=24.541946),InterpMode=CIM_CurveUser),(InVal=113.000000,OutVal=(X=4300.201660,Y=-8009.787109,Z=1142.004517),ArriveTangent=(X=214.334229,Y=347.015564,Z=18.333008),LeaveTangent=(X=214.334229,Y=347.015564,Z=18.333008),InterpMode=CIM_CurveUser),(InVal=115.000000,OutVal=(X=4417.400879,Y=-7583.789063,Z=1140.004517),ArriveTangent=(X=0.000000,Y=264.196289,Z=-2.406167),LeaveTangent=(X=0.000000,Y=264.196289,Z=-2.406167),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=4411.117188,Y=-6953.001953,Z=1079.004639),ArriveTangent=(X=42.215820,Y=244.225952,Z=0.000000),LeaveTangent=(X=42.215820,Y=244.225952,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=119.000000,OutVal=(X=4745.781250,Y=-6508.345703,Z=1039.004761),ArriveTangent=(X=228.458984,Y=213.862915,Z=-7.189754),LeaveTangent=(X=228.458984,Y=213.862915,Z=-7.189754),InterpMode=CIM_CurveAutoClamped),(InVal=121.000000,OutVal=(X=5324.953125,Y=-6097.550293,Z=1032.004883),ArriveTangent=(X=83.382362,Y=273.653198,Z=-7.980669),LeaveTangent=(X=83.382362,Y=273.653198,Z=-7.980669),InterpMode=CIM_CurveAutoClamped),(InVal=123.000000,OutVal=(X=5402.652344,Y=-5413.732910,Z=944.004944),ArriveTangent=(X=69.207718,Y=308.350922,Z=-40.888847),LeaveTangent=(X=69.207718,Y=308.350922,Z=-40.888847),InterpMode=CIM_CurveAutoClamped),(InVal=125.500000,OutVal=(X=5746.705566,Y=-4709.971191,Z=848.005066),ArriveTangent=(X=212.081665,Y=256.344421,Z=0.000000),LeaveTangent=(X=212.081665,Y=256.344421,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=128.000000,OutVal=(X=6478.392090,Y=-4132.010742,Z=848.005188),ArriveTangent=(X=92.668213,Y=273.813416,Z=0.000000),LeaveTangent=(X=92.668213,Y=273.813416,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=130.500000,OutVal=(X=6588.208984,Y=-3340.904053,Z=720.005249),ArriveTangent=(X=-61.205933,Y=121.267899,Z=0.000000),LeaveTangent=(X=-61.205933,Y=121.267899,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=133.000000,OutVal=(X=6202.384277,Y=-3215.717041,Z=736.005371),ArriveTangent=(X=-216.541275,Y=0.000000,Z=0.000000),LeaveTangent=(X=-216.541275,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=136.000000,OutVal=(X=5383.677246,Y=-3497.772705,Z=720.005493),ArriveTangent=(X=-307.943054,Y=-104.541359,Z=-13.608181),LeaveTangent=(X=-307.943054,Y=-104.541359,Z=-13.608181),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=4662.668945,Y=-3738.423828,Z=544.005615),ArriveTangent=(X=-359.158142,Y=0.000000,Z=-63.999958),LeaveTangent=(X=-359.158142,Y=0.000000,Z=-63.999958),InterpMode=CIM_CurveAutoClamped),(InVal=140.500000,OutVal=(X=3767.465576,Y=-3509.599365,Z=432.005676),ArriveTangent=(X=-353.661469,Y=0.000000,Z=-63.999981),LeaveTangent=(X=-353.661469,Y=0.000000,Z=-63.999981),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=2894.361572,Y=-3989.904053,Z=224.005707),ArriveTangent=(X=-104.844940,Y=-284.244690,Z=0.000000),LeaveTangent=(X=-104.844940,Y=-284.244690,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=146.000000,OutVal=(X=2752.582275,Y=-5138.461426,Z=416.005768),ArriveTangent=(X=0.000000,Y=-382.589264,Z=75.636391),LeaveTangent=(X=0.000000,Y=-382.589264,Z=75.636391),InterpMode=CIM_CurveAutoClamped),(InVal=148.500000,OutVal=(X=2858.372803,Y=-6094.145020,Z=640.005859),ArriveTangent=(X=-46.935059,Y=-333.746338,Z=105.600052),LeaveTangent=(X=-46.935059,Y=-333.746338,Z=105.600052),InterpMode=CIM_CurveUser),(InVal=150.500000,OutVal=(X=2700.515137,Y=-6719.190918,Z=915.006165),ArriveTangent=(X=41.068237,Y=-251.482101,Z=77.714317),LeaveTangent=(X=41.068237,Y=-251.482101,Z=77.714317),InterpMode=CIM_CurveUser),(InVal=153.000000,OutVal=(X=3175.454102,Y=-7320.631836,Z=1084.006226),ArriveTangent=(X=44.166756,Y=-255.047943,Z=42.488033),LeaveTangent=(X=44.166756,Y=-255.047943,Z=42.488033),InterpMode=CIM_CurveAutoClamped),(InVal=155.500000,OutVal=(X=3225.271973,Y=-7994.430664,Z=1147.006348),ArriveTangent=(X=-201.075623,Y=-237.833069,Z=0.000000),LeaveTangent=(X=-201.075623,Y=-237.833069,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=158.000000,OutVal=(X=2537.915039,Y=-8196.763672,Z=1008.006409),ArriveTangent=(X=-335.257233,Y=0.000000,Z=-42.199940),LeaveTangent=(X=-335.257233,Y=0.000000,Z=-42.199940),InterpMode=CIM_CurveAutoClamped),(InVal=160.500000,OutVal=(X=1548.985840,Y=-8177.775391,Z=936.006653),ArriveTangent=(X=-352.205566,Y=0.000000,Z=0.000000),LeaveTangent=(X=-352.205566,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=776.887207,Y=-8328.244141,Z=952.006775),ArriveTangent=(X=-219.081100,Y=0.000000,Z=2.790858),LeaveTangent=(X=-219.081100,Y=0.000000,Z=2.790858),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=488.087891,Y=-8123.486328,Z=955.006897),ArriveTangent=(X=-24.842117,Y=114.999344,Z=0.000041),LeaveTangent=(X=-24.842117,Y=114.999344,Z=0.000041),InterpMode=CIM_CurveUser),(InVal=167.500000,OutVal=(X=486.691895,Y=-7526.584473,Z=928.006897),ArriveTangent=(X=69.894653,Y=199.564011,Z=0.000000),LeaveTangent=(X=69.894653,Y=199.564011,Z=0.000000),InterpMode=CIM_CurveUser),(InVal=170.500000,OutVal=(X=1042.986328,Y=-6905.625488,Z=880.007019),ArriveTangent=(X=90.958374,Y=236.453003,Z=-42.017941),LeaveTangent=(X=90.958374,Y=236.453003,Z=-42.017941),InterpMode=CIM_CurveUser),(InVal=173.500000,OutVal=(X=1021.467041,Y=-6501.679199,Z=756.007202),ArriveTangent=(X=-82.235031,Y=226.844833,Z=-54.399963),LeaveTangent=(X=-82.235031,Y=226.844833,Z=-54.399963),InterpMode=CIM_CurveUser),(InVal=176.000000,OutVal=(X=576.104004,Y=-5962.438965,Z=627.007324),ArriveTangent=(X=-123.172012,Y=216.457184,Z=-63.999958),LeaveTangent=(X=-123.172012,Y=216.457184,Z=-63.999958),InterpMode=CIM_CurveUser),(InVal=178.000000,OutVal=(X=482.605469,Y=-5358.538086,Z=416.007294),ArriveTangent=(X=57.407104,Y=281.563934,Z=-25.309837),LeaveTangent=(X=57.407104,Y=281.563934,Z=-25.309837),InterpMode=CIM_CurveUser),(InVal=180.500000,OutVal=(X=781.493164,Y=-4473.432617,Z=384.007416),ArriveTangent=(X=58.518147,Y=292.839539,Z=-29.171822),LeaveTangent=(X=58.518147,Y=292.839539,Z=-29.171822),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=859.244629,Y=-3894.340332,Z=-15.992615),ArriveTangent=(X=24.831249,Y=223.569824,Z=-17.079735),LeaveTangent=(X=24.831249,Y=223.569824,Z=-17.079735),InterpMode=CIM_CurveAutoClamped),(InVal=185.500000,OutVal=(X=905.649414,Y=-3355.583496,Z=-33.992607),ArriveTangent=(X=37.945503,Y=258.804230,Z=0.000000),LeaveTangent=(X=37.945503,Y=258.804230,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=188.500000,OutVal=(X=1293.727539,Y=-2470.916992,Z=0.007401),ArriveTangent=(X=0.000000,Y=285.181549,Z=0.000017),LeaveTangent=(X=0.000000,Y=285.181549,Z=0.000017),InterpMode=CIM_CurveAutoClamped),(InVal=190.500000,OutVal=(X=805.534668,Y=-1929.675781,Z=0.007416),ArriveTangent=(X=-174.454681,Y=326.588531,Z=0.000000),LeaveTangent=(X=-174.454681,Y=326.588531,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=193.500000,OutVal=(X=421.454102,Y=-836.395020,Z=-31.992577),ArriveTangent=(X=-135.458542,Y=333.532593,Z=0.000000),LeaveTangent=(X=-135.458542,Y=333.532593,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=196.000000,OutVal=(X=60.512695,Y=-95.246582,Z=-15.992561),ArriveTangent=(X=73.866760,Y=222.506180,Z=2.909094),LeaveTangent=(X=73.866760,Y=222.506180,Z=2.909094),InterpMode=CIM_CurveUser),(InVal=198.000000,OutVal=(X=315.836914,Y=35.311035,Z=0.007454),ArriveTangent=(X=98.788727,Y=4.060852,Z=0.000006),LeaveTangent=(X=98.788727,Y=4.060852,Z=0.000006),InterpMode=CIM_CurveUser),(InVal=200.000000,OutVal=(X=555.899414,Y=23.020020,Z=0.007469),ArriveTangent=(X=51.707359,Y=-53.201679,Z=0.000002),LeaveTangent=(X=51.707359,Y=-53.201679,Z=0.000002),InterpMode=CIM_CurveUser),(InVal=202.500000,OutVal=(X=568.286621,Y=-83.733398,Z=0.007484),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAuto),(InVal=2.500000,OutVal=(X=0.000000,Y=0.000000,Z=27.246094),InterpMode=CIM_CurveAutoClamped),(InVal=7.500000,OutVal=(X=0.000000,Y=13.359375,Z=10.019531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.231467),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.231467),InterpMode=CIM_CurveUser),(InVal=12.000000,OutVal=(X=0.000000,Y=-2.109375,Z=-36.738281),ArriveTangent=(X=0.000000,Y=-0.865688,Z=-8.470459),LeaveTangent=(X=0.000000,Y=-0.865688,Z=-8.470459),InterpMode=CIM_CurveUser),(InVal=15.500000,OutVal=(X=0.000000,Y=-5.800781,Z=-125.507813),ArriveTangent=(X=0.000000,Y=-0.092460,Z=-13.956976),LeaveTangent=(X=0.000000,Y=-0.092460,Z=-13.956976),InterpMode=CIM_CurveAutoClamped),(InVal=20.500000,OutVal=(X=0.000000,Y=-5.976563,Z=-162.597656),InterpMode=CIM_CurveAutoClamped),(InVal=23.500000,OutVal=(X=0.000000,Y=0.351563,Z=-45.175781),InterpMode=CIM_CurveAutoClamped),(InVal=27.500000,OutVal=(X=0.000000,Y=-1.054688,Z=-118.828125),ArriveTangent=(X=0.000000,Y=-0.799454,Z=-15.427368),LeaveTangent=(X=0.000000,Y=-0.799454,Z=-15.427368),InterpMode=CIM_CurveAutoClamped),(InVal=29.500000,OutVal=(X=0.000000,Y=-5.449219,Z=-143.613281),ArriveTangent=(X=0.000000,Y=-2.285156,Z=-7.201799),LeaveTangent=(X=0.000000,Y=-2.285156,Z=-7.201799),InterpMode=CIM_CurveAutoClamped),(InVal=32.500000,OutVal=(X=0.000000,Y=-12.480469,Z=-155.390625),InterpMode=CIM_CurveAutoClamped),(InVal=35.000000,OutVal=(X=0.000000,Y=-2.812500,Z=24.609375),ArriveTangent=(X=0.000000,Y=0.511907,Z=14.032631),LeaveTangent=(X=0.000000,Y=0.511907,Z=14.032631),InterpMode=CIM_CurveAutoClamped),(InVal=38.500000,OutVal=(X=0.000000,Y=-2.109375,Z=44.648438),ArriveTangent=(X=0.000000,Y=0.243389,Z=5.922476),LeaveTangent=(X=0.000000,Y=0.243389,Z=5.922476),InterpMode=CIM_CurveAutoClamped),(InVal=41.500000,OutVal=(X=0.000000,Y=-1.230469,Z=63.105469),ArriveTangent=(X=0.000000,Y=0.632886,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.632886,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=44.500000,OutVal=(X=0.000000,Y=5.625000,Z=29.179688),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.921165),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.921165),InterpMode=CIM_CurveAutoClamped),(InVal=47.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-2.460938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.062500),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.062500),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=0.000000,Y=-0.527344,Z=-48.164063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.709736),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.709736),InterpMode=CIM_CurveAutoClamped),(InVal=53.500000,OutVal=(X=0.000000,Y=-2.812500,Z=-78.574219),ArriveTangent=(X=0.000000,Y=0.000000,Z=-12.034255),LeaveTangent=(X=0.000000,Y=0.000000,Z=-12.034255),InterpMode=CIM_CurveAutoClamped),(InVal=56.500000,OutVal=(X=0.000000,Y=-2.460938,Z=-126.386719),ArriveTangent=(X=0.000000,Y=0.270440,Z=-23.613281),LeaveTangent=(X=0.000000,Y=0.270440,Z=-23.613281),InterpMode=CIM_CurveAutoClamped),(InVal=59.500000,OutVal=(X=0.000000,Y=2.636719,Z=-220.253906),InterpMode=CIM_CurveAutoClamped),(InVal=62.000000,OutVal=(X=0.000000,Y=-0.527344,Z=-100.898438),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.796795),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.796795),InterpMode=CIM_CurveAutoClamped),(InVal=64.000000,OutVal=(X=0.000000,Y=2.988281,Z=-93.691406),ArriveTangent=(X=0.000000,Y=1.605471,Z=3.953888),LeaveTangent=(X=0.000000,Y=1.605471,Z=3.953888),InterpMode=CIM_CurveUser),(InVal=66.000000,OutVal=(X=0.000000,Y=15.117188,Z=-30.410156),InterpMode=CIM_CurveUser),(InVal=69.000000,OutVal=(X=0.000000,Y=6.152344,Z=-88.769531),ArriveTangent=(X=0.000000,Y=-1.353516,Z=-8.638144),LeaveTangent=(X=0.000000,Y=-1.353516,Z=-8.638144),InterpMode=CIM_CurveUser),(InVal=72.500000,OutVal=(X=0.000000,Y=1.582031,Z=-117.246094),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.182249),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.182249),InterpMode=CIM_CurveAutoClamped),(InVal=74.500000,OutVal=(X=0.000000,Y=4.042969,Z=-117.421875),InterpMode=CIM_CurveAutoClamped),(InVal=76.500000,OutVal=(X=0.000000,Y=0.703125,Z=-116.542969),ArriveTangent=(X=0.000000,Y=-0.155370,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.155370,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=79.500000,OutVal=(X=0.000000,Y=0.527344,Z=-166.289063),InterpMode=CIM_CurveAutoClamped),(InVal=82.500000,OutVal=(X=0.000000,Y=6.328125,Z=-101.953125),ArriveTangent=(X=0.000000,Y=3.506211,Z=26.806641),LeaveTangent=(X=0.000000,Y=3.506211,Z=26.806641),InterpMode=CIM_CurveAutoClamped),(InVal=85.500000,OutVal=(X=0.000000,Y=25.839844,Z=-5.449219),InterpMode=CIM_CurveAutoClamped),(InVal=88.500000,OutVal=(X=0.000000,Y=2.285156,Z=-105.644531),ArriveTangent=(X=0.000000,Y=-4.867859,Z=-20.420835),LeaveTangent=(X=0.000000,Y=-4.867859,Z=-20.420835),InterpMode=CIM_CurveAutoClamped),(InVal=91.000000,OutVal=(X=0.000000,Y=-5.097656,Z=-136.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.568115),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.568115),InterpMode=CIM_CurveAutoClamped),(InVal=93.500000,OutVal=(X=0.000000,Y=-3.515625,Z=-143.613281),ArriveTangent=(X=0.000000,Y=0.301490,Z=-4.351737),LeaveTangent=(X=0.000000,Y=0.301490,Z=-4.351737),InterpMode=CIM_CurveAutoClamped),(InVal=97.000000,OutVal=(X=0.000000,Y=-2.988281,Z=-165.585938),InterpMode=CIM_CurveUser),(InVal=100.000000,OutVal=(X=0.000000,Y=-3.515625,Z=-129.375000),ArriveTangent=(X=0.000000,Y=0.000000,Z=20.941216),LeaveTangent=(X=0.000000,Y=0.000000,Z=20.941216),InterpMode=CIM_CurveAutoClamped),(InVal=103.000000,OutVal=(X=0.000000,Y=0.703125,Z=-23.730469),InterpMode=CIM_CurveUser),(InVal=105.500000,OutVal=(X=0.000000,Y=-0.703125,Z=-137.460938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-28.710938),LeaveTangent=(X=0.000000,Y=0.000000,Z=-28.710938),InterpMode=CIM_CurveUser),(InVal=107.500000,OutVal=(X=0.000000,Y=2.988281,Z=-195.996094),ArriveTangent=(X=0.000000,Y=0.000000,Z=-20.425781),LeaveTangent=(X=0.000000,Y=0.000000,Z=-20.425781),InterpMode=CIM_CurveAutoClamped),(InVal=110.500000,OutVal=(X=0.000000,Y=-0.527344,Z=-239.589844),ArriveTangent=(X=0.000000,Y=-1.195313,Z=-19.476563),LeaveTangent=(X=0.000000,Y=-1.195313,Z=-19.476563),InterpMode=CIM_CurveUser),(InVal=113.000000,OutVal=(X=0.000000,Y=-2.988281,Z=-293.378906),ArriveTangent=(X=0.000000,Y=0.000000,Z=-25.703125),LeaveTangent=(X=0.000000,Y=0.000000,Z=-25.703125),InterpMode=CIM_CurveUser),(InVal=115.000000,OutVal=(X=0.000000,Y=-2.988281,Z=-355.253906),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-309.023438),InterpMode=CIM_CurveUser),(InVal=119.000000,OutVal=(X=0.000000,Y=-4.570313,Z=-318.164063),ArriveTangent=(X=0.000000,Y=-1.820832,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.820832,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=121.000000,OutVal=(X=0.000000,Y=-9.843750,Z=-281.425781),InterpMode=CIM_CurveAutoClamped),(InVal=123.000000,OutVal=(X=0.000000,Y=-5.449219,Z=-293.730469),ArriveTangent=(X=0.000000,Y=1.718750,Z=-8.203125),LeaveTangent=(X=0.000000,Y=1.718750,Z=-8.203125),InterpMode=CIM_CurveAutoClamped),(InVal=125.500000,OutVal=(X=0.000000,Y=-2.109375,Z=-318.339844),InterpMode=CIM_CurveAutoClamped),(InVal=128.000000,OutVal=(X=0.000000,Y=-4.921875,Z=-298.476563),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.555865),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.555865),InterpMode=CIM_CurveAutoClamped),(InVal=130.500000,OutVal=(X=0.000000,Y=-4.921875,Z=-289.687500),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.749048),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.749048),InterpMode=CIM_CurveUser),(InVal=133.000000,OutVal=(X=0.000000,Y=1.230469,Z=-165.058594),InterpMode=CIM_CurveAutoClamped),(InVal=136.000000,OutVal=(X=0.000000,Y=-2.812500,Z=-171.914063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.410156),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.410156),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=0.000000,Y=-2.636719,Z=-182.109375),InterpMode=CIM_CurveAutoClamped),(InVal=140.500000,OutVal=(X=0.000000,Y=-5.273438,Z=-181.933594),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.175247),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.175247),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-124.101563),ArriveTangent=(X=0.000000,Y=2.045455,Z=15.519600),LeaveTangent=(X=0.000000,Y=2.045455,Z=15.519600),InterpMode=CIM_CurveAutoClamped),(InVal=146.000000,OutVal=(X=0.000000,Y=5.976563,Z=-95.976563),ArriveTangent=(X=0.000000,Y=2.780540,Z=0.000000),LeaveTangent=(X=0.000000,Y=2.780540,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=148.500000,OutVal=(X=0.000000,Y=14.941406,Z=-106.347656),InterpMode=CIM_CurveUser),(InVal=150.500000,OutVal=(X=0.000000,Y=7.910156,Z=-70.136719),ArriveTangent=(X=0.000000,Y=-1.757813,Z=3.754520),LeaveTangent=(X=0.000000,Y=-1.757813,Z=3.754520),InterpMode=CIM_CurveUser),(InVal=153.000000,OutVal=(X=0.000000,Y=2.636719,Z=-63.457031),ArriveTangent=(X=0.000000,Y=-1.230997,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.230997,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=155.500000,OutVal=(X=0.000000,Y=0.878906,Z=-153.984375),ArriveTangent=(X=0.000000,Y=-1.152911,Z=-28.546875),LeaveTangent=(X=0.000000,Y=-1.152911,Z=-28.546875),InterpMode=CIM_CurveUser),(InVal=158.000000,OutVal=(X=0.000000,Y=-3.691406,Z=-206.191406),ArriveTangent=(X=0.000000,Y=-1.244242,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.244242,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=160.500000,OutVal=(X=0.000000,Y=-5.625000,Z=-171.386719),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.921875),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.921875),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-136.582031),ArriveTangent=(X=0.000000,Y=0.377399,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.377399,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=165.000000,OutVal=(X=0.000000,Y=0.000000,Z=-223.945313),ArriveTangent=(X=0.000000,Y=0.192598,Z=-28.945313),LeaveTangent=(X=0.000000,Y=0.192598,Z=-28.945313),InterpMode=CIM_CurveUser),(InVal=167.500000,OutVal=(X=0.000000,Y=0.878906,Z=-310.253906),ArriveTangent=(X=0.000000,Y=0.678939,Z=-31.218750),LeaveTangent=(X=0.000000,Y=0.678939,Z=-31.218750),InterpMode=CIM_CurveUser),(InVal=170.500000,OutVal=(X=0.000000,Y=5.449219,Z=-380.039063),InterpMode=CIM_CurveUser),(InVal=173.500000,OutVal=(X=0.000000,Y=-5.273438,Z=-239.589844),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.413883),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.413883),InterpMode=CIM_CurveUser),(InVal=176.000000,OutVal=(X=0.000000,Y=-2.988281,Z=-236.953125),InterpMode=CIM_CurveUser),(InVal=178.000000,OutVal=(X=0.000000,Y=-6.152344,Z=-286.875000),InterpMode=CIM_CurveUser),(InVal=180.500000,OutVal=(X=0.000000,Y=-3.867188,Z=-286.171875),ArriveTangent=(X=0.000000,Y=0.984375,Z=0.691351),LeaveTangent=(X=0.000000,Y=0.984375,Z=0.691351),InterpMode=CIM_CurveAutoClamped),(InVal=183.000000,OutVal=(X=0.000000,Y=-1.230469,Z=-238.183594),ArriveTangent=(X=0.000000,Y=1.089844,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.089844,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=185.500000,OutVal=(X=0.000000,Y=1.582031,Z=-306.914063),InterpMode=CIM_CurveAutoClamped),(InVal=188.500000,OutVal=(X=0.000000,Y=-0.703125,Z=-249.433594),InterpMode=CIM_CurveAutoClamped),(InVal=190.500000,OutVal=(X=0.000000,Y=-0.703125,Z=-264.726563),InterpMode=CIM_CurveAutoClamped),(InVal=193.500000,OutVal=(X=0.000000,Y=1.582031,Z=-226.054688),ArriveTangent=(X=0.000000,Y=1.214489,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.214489,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=196.000000,OutVal=(X=0.000000,Y=5.976563,Z=-271.582031),ArriveTangent=(X=0.000000,Y=0.150649,Z=-10.802557),LeaveTangent=(X=0.000000,Y=0.150649,Z=-10.802557),InterpMode=CIM_CurveUser),(InVal=198.000000,OutVal=(X=0.000000,Y=6.328125,Z=-344.882813),ArriveTangent=(X=0.000000,Y=0.143209,Z=-11.748047),LeaveTangent=(X=0.000000,Y=0.143209,Z=-11.748047),InterpMode=CIM_CurveUser),(InVal=200.000000,OutVal=(X=0.000000,Y=10.898438,Z=-412.558594),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.114783),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.114783),InterpMode=CIM_CurveUser),(InVal=202.500000,OutVal=(X=0.000000,Y=3.515625,Z=-489.375000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=2.500000),(Time=7.500000),(Time=12.000000),(Time=15.500000),(Time=20.500000),(Time=23.500000),(Time=27.500000),(Time=29.500000),(Time=32.500000),(Time=35.000000),(Time=38.500000),(Time=41.500000),(Time=44.500000),(Time=47.000000),(Time=50.000000),(Time=53.500000),(Time=56.500000),(Time=59.500000),(Time=62.000000),(Time=64.000000),(Time=66.000000),(Time=69.000000),(Time=72.500000),(Time=74.500000),(Time=76.500000),(Time=79.500000),(Time=82.500000),(Time=85.500000),(Time=88.500000),(Time=91.000000),(Time=93.500000),(Time=97.000000),(Time=100.000000),(Time=103.000000),(Time=105.500000),(Time=107.500000),(Time=110.500000),(Time=113.000000),(Time=115.000000),(Time=117.000000),(Time=119.000000),(Time=121.000000),(Time=123.000000),(Time=125.500000),(Time=128.000000),(Time=130.500000),(Time=133.000000),(Time=136.000000),(Time=138.000000),(Time=140.500000),(Time=143.000000),(Time=146.000000),(Time=148.500000),(Time=150.500000),(Time=153.000000),(Time=155.500000),(Time=158.000000),(Time=160.500000),(Time=163.000000),(Time=165.000000),(Time=167.500000),(Time=170.500000),(Time=173.500000),(Time=176.000000),(Time=178.000000),(Time=180.500000),(Time=183.000000),(Time=185.500000),(Time=188.500000),(Time=190.500000),(Time=193.500000),(Time=196.000000),(Time=198.000000),(Time=200.000000),(Time=202.500000)))
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
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="FlythroughCamera"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=295.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionStart=295.000000
   EdSectionEnd=295.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-888
   ObjPosY=1744
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=2816
   ObjComment="CaveLava1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1864
   ObjPosY=2816
   ObjComment="CaveLava2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3720
   ObjPosY=3488
   ObjComment="CaveWater2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3608
   ObjPosY=3488
   ObjComment="CaveWater1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_50
   Min=0.150000
   Max=0.250000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4942
   ObjPosY=1911
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_50"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_49
   Min=0.250000
   Max=0.300000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4958
   ObjPosY=2095
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_49"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_48
   Min=0.300000
   Max=0.350000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4942
   ObjPosY=2277
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_48"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_47
   Min=0.050000
   Max=0.150000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4942
   ObjPosY=2461
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_47"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_54
   Min=0.150000
   Max=0.250000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5711
   ObjPosY=1887
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_54"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_53
   Min=0.250000
   Max=0.300000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5727
   ObjPosY=2071
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_53"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_52
   Min=0.300000
   Max=0.350000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5711
   ObjPosY=2253
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_52"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_51
   Min=0.050000
   Max=0.150000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5711
   ObjPosY=2437
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_51"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_10
   Min=0.150000
   Max=0.250000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6483
   ObjPosY=1892
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_10"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_11
   Min=0.250000
   Max=0.300000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6499
   ObjPosY=2076
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_11"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_12
   Min=0.300000
   Max=0.350000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6483
   ObjPosY=2258
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_12"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_13
   Min=0.050000
   Max=0.150000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6483
   ObjPosY=2442
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_13"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=818
   SizeY=498
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7840
   ObjPosY=2760
   ObjComment="Clientside"
   DrawWidth=818
   DrawHeight=498
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_37
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=2488
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_37"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_12
   InputLinks(0)=(DrawY=2426,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=2426,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_38'),DrawX=2994,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_37'),DrawX=3050,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=2392
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_12"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_38
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=2304
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_38"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_13
   InputLinks(0)=(DrawY=2242,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_12')),DrawY=2242,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_37'),DrawX=3002,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_38'),DrawX=3058,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=2208
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_13"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_15
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=2136
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_15"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_14
   InputLinks(0)=(DrawY=2066,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_13')),DrawY=2066,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_36'),DrawX=2994,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_15'),DrawX=3050,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=2032
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_14"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_20
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=1952
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_20"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_15
   InputLinks(0)=(DrawY=1890,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_14')),DrawY=1890,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_1'),DrawX=3002,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_20'),DrawX=3058,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=1856
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_15"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_3
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2610,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_17')),DrawY=2610,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3034,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2896
   ObjPosY=2576
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_17
   InputLinks(0)=(DrawY=2605,OverrideDelta=14)
   InputLinks(1)=(DrawY=2626,OverrideDelta=35)
   InputLinks(2)=(DrawY=2647,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_16')),DrawY=2610,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2642,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_15'),DrawX=3268,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=2568
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_17"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_15
   Min=1.000000
   Max=1.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3232
   ObjPosY=2696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_15"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_1
   Min=0.100000
   Max=0.150000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=1936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_1"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_36
   Min=0.200000
   Max=0.250000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=2120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_36"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_37
   Min=0.250000
   Max=0.300000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=2304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_37"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_38
   Min=0.050000
   Max=0.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=2488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_38"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_16
   InputLinks(0)=(DrawY=1906,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_17')),DrawY=1906,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_42'),DrawX=3394,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_21'),DrawX=3450,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3360
   ObjPosY=1872
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_16"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_21
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3424
   ObjPosY=1960
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_21"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_17
   InputLinks(0)=(DrawY=2074,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_18')),DrawY=2074,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_41'),DrawX=3386,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_22'),DrawX=3442,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3352
   ObjPosY=2040
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_17"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_22
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=2144
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_22"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_18
   InputLinks(0)=(DrawY=2250,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_19')),DrawY=2250,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_40'),DrawX=3394,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_23'),DrawX=3450,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3360
   ObjPosY=2216
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_18"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_23
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=2312
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_23"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_19
   InputLinks(0)=(DrawY=2434,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=2434,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_39'),DrawX=3386,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_24'),DrawX=3442,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3352
   ObjPosY=2400
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_19"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_24
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=2496
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_24"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_4
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2634,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_21')),DrawY=2634,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3698,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3560
   ObjPosY=2600
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_14
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2610,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2610,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4458,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=2576
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_14"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_29
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4192
   ObjPosY=2464
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_29"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_24
   InputLinks(0)=(DrawY=2402,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_14')),DrawY=2402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_43'),DrawX=4146,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_29'),DrawX=4202,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=2368
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_24"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_30
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4192
   ObjPosY=2280
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_30"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_25
   InputLinks(0)=(DrawY=2218,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_24')),DrawY=2218,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_44'),DrawX=4154,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_30'),DrawX=4210,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=2184
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_25"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_31
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4192
   ObjPosY=2112
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_31"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_26
   InputLinks(0)=(DrawY=2042,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_25')),DrawY=2042,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_45'),DrawX=4146,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_31'),DrawX=4202,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=2008
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_26"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_32
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4184
   ObjPosY=1928
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_32"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_27
   InputLinks(0)=(DrawY=1874,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_26')),DrawY=1874,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_46'),DrawX=4154,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=4210,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=1840
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_27"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_30
   Min=1.000000
   Max=1.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=2688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_30"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_21
   InputLinks(0)=(DrawY=2597,OverrideDelta=14)
   InputLinks(1)=(DrawY=2618,OverrideDelta=35)
   InputLinks(2)=(DrawY=2639,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_27')),DrawY=2602,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2634,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_30'),DrawX=3972,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3920
   ObjPosY=2560
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_21"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_39
   Min=0.050000
   Max=0.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3360
   ObjPosY=2496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_39"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_40
   Min=0.150000
   Max=0.170000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3360
   ObjPosY=2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_40"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_41
   Min=0.150000
   Max=0.200000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3376
   ObjPosY=2136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_41"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_42
   Min=0.100000
   Max=0.150000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3360
   ObjPosY=1952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_42"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_46
   Min=0.060000
   Max=0.090000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=1920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_46"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_45
   Min=0.100000
   Max=0.150000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4136
   ObjPosY=2104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_45"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_44
   Min=0.070000
   Max=0.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=2288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_44"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_43
   Min=0.050000
   Max=0.080000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=2472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_43"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=MaterialInstanceActor'KF-ZEDLANDING.TheWorld:PersistentLevel.MaterialInstanceActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8352
   ObjPosY=3096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_2
   InputLinks(0)=(DrawY=3349,OverrideDelta=14)
   InputLinks(1)=(DrawY=3370,OverrideDelta=35)
   InputLinks(2)=(DrawY=3391,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=3670,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3721,OverrideDelta=76)
   EventLinks(0)=(DrawX=3770,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3632
   ObjPosY=3312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_2"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_5
   ConsoleEventName="lava"
   MaxWidth=146
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_66')),DrawY=3938,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2273,OverrideDelta=41)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2200
   ObjPosY=3872
   DrawWidth=93
   DrawHeight=128
   Name="SeqEvent_Console_5"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=3973,OverrideDelta=14)
   InputLinks(1)=(DrawY=3994,ActivateDelay=1.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=4015,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51')),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=8286,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8337,OverrideDelta=76)
   EventLinks(0)=(DrawX=8386,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8248
   ObjPosY=3936
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3744
   ObjPosY=4088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2184
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_302
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_302"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2376
   ObjPosY=2984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=2816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=2800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=3061,OverrideDelta=14)
   InputLinks(1)=(DrawY=3082,OverrideDelta=35)
   InputLinks(2)=(DrawY=3103,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3082,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=3110,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3161,OverrideDelta=76)
   EventLinks(0)=(DrawX=3210,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=3024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2840
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3144
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3344
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_299
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=4160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_299"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_300
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3880
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_300"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_303
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3984
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_303"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2432
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_307
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_307"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2728
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=566
   SizeY=330
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6344
   ObjPosY=3896
   ObjComment="Waterfall Left - OFF"
   DrawWidth=566
   DrawHeight=330
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=3981,OverrideDelta=14)
   InputLinks(1)=(DrawY=4002,ActivateDelay=2.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=4023,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3')),DrawY=4002,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=6702,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6753,OverrideDelta=76)
   EventLinks(0)=(DrawX=6802,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6664
   ObjPosY=3944
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_69
   InputLinks(0)=(DrawY=3973,ActivateDelay=0.250000,OverrideDelta=14)
   InputLinks(1)=(DrawY=3994,OverrideDelta=35)
   InputLinks(2)=(DrawY=4015,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=1)),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=7646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7697,OverrideDelta=76)
   EventLinks(0)=(DrawX=7746,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7608
   ObjPosY=3936
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_69"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8896
   ObjPosY=4080
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7600
   ObjPosY=4120
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8008
   ObjPosY=4120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8240
   ObjPosY=4112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6400
   ObjPosY=4096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6664
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5440
   ObjPosY=4064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5368
   ObjPosY=4056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=4080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_55
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=2.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41',InputLinkIdx=1)),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=4678,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4729,OverrideDelta=76)
   EventLinks(0)=(DrawX=4778,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=3904
   ObjComment="River Splashes 2 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_55"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=3.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_42',InputLinkIdx=1)),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=5006,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5057,OverrideDelta=76)
   EventLinks(0)=(DrawX=5106,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4968
   ObjPosY=3904
   ObjComment="River Splashes 4 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_41"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_42
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=2.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47')),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=5350,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5401,OverrideDelta=76)
   EventLinks(0)=(DrawX=5450,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5312
   ObjPosY=3904
   ObjComment="River Splashes 4 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_42"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=615
   SizeY=315
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7888
   ObjPosY=3912
   ObjComment="Waterfall Far Left - OFF"
   DrawWidth=615
   DrawHeight=315
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=615
   SizeY=315
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7256
   ObjPosY=3904
   ObjComment="LavaFall Far Left - ON"
   DrawWidth=615
   DrawHeight=315
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=3965,ActivateDelay=0.500000,OverrideDelta=14)
   InputLinks(1)=(DrawY=3986,OverrideDelta=35)
   InputLinks(2)=(DrawY=4007,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_53',InputLinkIdx=1)),DrawY=3986,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=6078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6129,OverrideDelta=76)
   EventLinks(0)=(DrawX=6178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6040
   ObjPosY=3928
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=0.500000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=3238,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3289,OverrideDelta=76)
   EventLinks(0)=(DrawX=3338,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3200
   ObjPosY=3904
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_38
   SizeX=514
   SizeY=351
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=3824
   ObjComment="Waterfall Main - OFF"
   DrawWidth=514
   DrawHeight=351
   Name="SequenceFrame_38"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=410
   SizeY=411
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2416
   ObjPosY=3848
   ObjComment="LavaFall Main - ON"
   DrawWidth=410
   DrawHeight=411
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=615
   SizeY=315
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8544
   ObjPosY=3912
   ObjComment="LavaFall Right - ON"
   DrawWidth=615
   DrawHeight=315
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=3973,ActivateDelay=0.750000,OverrideDelta=14)
   InputLinks(1)=(DrawY=3994,OverrideDelta=35)
   InputLinks(2)=(DrawY=4015,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=8934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8985,OverrideDelta=76)
   EventLinks(0)=(DrawX=9034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8896
   ObjPosY=3936
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_51
   InputLinks(0)=(DrawY=3973,OverrideDelta=14)
   InputLinks(1)=(DrawY=3994,OverrideDelta=35)
   InputLinks(2)=(DrawY=4015,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),DrawX=8646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8697,OverrideDelta=76)
   EventLinks(0)=(DrawX=8746,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8608
   ObjPosY=3936
   ObjComment="Lavafall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_51"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=1254
   SizeY=456
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4312
   ObjPosY=3824
   ObjComment="River Splashes - OFF"
   DrawWidth=1254
   DrawHeight=456
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_24
   SizeX=242
   SizeY=449
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6976
   ObjPosY=3816
   ObjComment="River Mesh - OFF"
   DrawWidth=242
   DrawHeight=449
   Name="SequenceFrame_24"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_25
   SizeX=1254
   SizeY=456
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4456
   ObjPosY=4416
   ObjComment="Lava Splashes - ON"
   DrawWidth=1254
   DrawHeight=456
   Name="SequenceFrame_25"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_46
   InputLinks(0)=(DrawY=4533,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=4554,OverrideDelta=35)
   InputLinks(2)=(DrawY=4575,OverrideDelta=56)
   OutputLinks(0)=(DrawY=4554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=5542,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5593,OverrideDelta=76)
   EventLinks(0)=(DrawX=5642,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5504
   ObjPosY=4496
   ObjComment="Lava Splashes 4 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_46"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_45
   InputLinks(0)=(DrawY=4533,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=4554,OverrideDelta=35)
   InputLinks(2)=(DrawY=4575,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46')),DrawY=4554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=5198,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5249,OverrideDelta=76)
   EventLinks(0)=(DrawX=5298,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5160
   ObjPosY=4496
   ObjComment="Lava Splashes 3 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_45"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
   InputLinks(0)=(DrawY=4533,ActivateDelay=1.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=4554,OverrideDelta=35)
   InputLinks(2)=(DrawY=4575,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45')),DrawY=4554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=4870,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4921,OverrideDelta=76)
   EventLinks(0)=(DrawX=4970,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4832
   ObjPosY=4496
   ObjComment="Lava Splashes 2 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_44"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_43
   InputLinks(0)=(DrawY=4533,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=4554,OverrideDelta=35)
   InputLinks(2)=(DrawY=4575,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44')),DrawY=4554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=4574,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4625,OverrideDelta=76)
   EventLinks(0)=(DrawX=4674,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=4496
   ObjComment="Lava Splashes 1 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4528
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4888
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=4656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=4744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4896
   ObjPosY=4728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4952
   ObjPosY=4736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5128
   ObjPosY=4640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5224
   ObjPosY=4640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5456
   ObjPosY=4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5560
   ObjPosY=4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5656
   ObjPosY=4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(DrawY=3029,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3050,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2),(LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4'),(LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11',InputLinkIdx=1)),DrawY=3071,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1176
   ObjPosY=2960
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=3621,OverrideDelta=14)
   InputLinks(1)=(DrawY=3642,OverrideDelta=35)
   InputLinks(2)=(DrawY=3663,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_68')),DrawY=3642,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_307',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=2454,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2505,OverrideDelta=76)
   EventLinks(0)=(DrawX=2554,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2416
   ObjPosY=3584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_68
   InputLinks(0)=(DrawY=3621,OverrideDelta=14)
   InputLinks(1)=(DrawY=3642,OverrideDelta=35)
   InputLinks(2)=(DrawY=3663,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_67')),DrawY=3642,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=2710,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2761,OverrideDelta=76)
   EventLinks(0)=(DrawX=2810,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=3584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_68"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_67
   InputLinks(0)=(DrawY=3645,OverrideDelta=14)
   InputLinks(1)=(DrawY=3666,OverrideDelta=35)
   InputLinks(2)=(DrawY=3687,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_71'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=1)),DrawY=3666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),DrawX=4374,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4425,OverrideDelta=76)
   EventLinks(0)=(DrawX=4474,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=3608
   ObjComment="River Splashes 1 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_67"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_71
   InputLinks(0)=(DrawY=3645,OverrideDelta=14)
   InputLinks(1)=(DrawY=3666,OverrideDelta=35)
   InputLinks(2)=(DrawY=3687,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_92')),DrawY=3666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=4678,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4729,OverrideDelta=76)
   EventLinks(0)=(DrawX=4778,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=3608
   ObjComment="River Splashes 2 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_71"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_92
   InputLinks(0)=(DrawY=3645,OverrideDelta=14)
   InputLinks(1)=(DrawY=3666,OverrideDelta=35)
   InputLinks(2)=(DrawY=3687,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_98')),DrawY=3666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=4974,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5025,OverrideDelta=76)
   EventLinks(0)=(DrawX=5074,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=3608
   ObjComment="River Splashes 4 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_92"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_98
   InputLinks(0)=(DrawY=3637,OverrideDelta=14)
   InputLinks(1)=(DrawY=3658,OverrideDelta=35)
   InputLinks(2)=(DrawY=3679,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29',InputLinkIdx=1)),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=5318,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5369,OverrideDelta=76)
   EventLinks(0)=(DrawX=5418,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5280
   ObjPosY=3600
   ObjComment="River Splashes 4 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_98"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=4997,OverrideDelta=14)
   InputLinks(1)=(DrawY=5018,OverrideDelta=35)
   InputLinks(2)=(DrawY=5039,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27',InputLinkIdx=1)),DrawY=5018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=4574,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4625,OverrideDelta=76)
   EventLinks(0)=(DrawX=4674,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=4960
   ObjComment="Lava Splashes 1 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_27
   InputLinks(0)=(DrawY=4997,OverrideDelta=14)
   InputLinks(1)=(DrawY=5018,OverrideDelta=35)
   InputLinks(2)=(DrawY=5039,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28',InputLinkIdx=1)),DrawY=5018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=4878,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4929,OverrideDelta=76)
   EventLinks(0)=(DrawX=4978,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4840
   ObjPosY=4960
   ObjComment="Lava Splashes 2 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_27"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_28
   InputLinks(0)=(DrawY=4997,OverrideDelta=14)
   InputLinks(1)=(DrawY=5018,OverrideDelta=35)
   InputLinks(2)=(DrawY=5039,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7',InputLinkIdx=1)),DrawY=5018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=5182,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5233,OverrideDelta=76)
   EventLinks(0)=(DrawX=5282,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5144
   ObjPosY=4960
   ObjComment="Lava Splashes 3 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_28"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=4997,OverrideDelta=14)
   InputLinks(1)=(DrawY=5018,OverrideDelta=35)
   InputLinks(2)=(DrawY=5039,OverrideDelta=56)
   OutputLinks(0)=(DrawY=5018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=5510,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5561,OverrideDelta=76)
   EventLinks(0)=(DrawX=5610,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5472
   ObjPosY=4960
   ObjComment="Lava Splashes 4 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_29
   InputLinks(0)=(DrawY=3637,OverrideDelta=14)
   InputLinks(1)=(DrawY=3658,OverrideDelta=35)
   InputLinks(2)=(DrawY=3679,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=5758,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5809,OverrideDelta=76)
   EventLinks(0)=(DrawX=5858,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5720
   ObjPosY=3600
   ObjComment="LavaFall Left - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_29"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_25
   InputLinks(0)=(DrawY=3653,OverrideDelta=14)
   InputLinks(1)=(DrawY=3674,OverrideDelta=35)
   InputLinks(2)=(DrawY=3695,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1',InputLinkIdx=1)),DrawY=3674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=6398,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6449,OverrideDelta=76)
   EventLinks(0)=(DrawX=6498,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6360
   ObjPosY=3616
   ObjComment="Waterfall - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_25"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_1
   InputLinks(0)=(DrawY=3637,OverrideDelta=14)
   InputLinks(1)=(DrawY=3658,OverrideDelta=35)
   InputLinks(2)=(DrawY=3679,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33',InputLinkIdx=1)),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=7038,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7089,OverrideDelta=76)
   EventLinks(0)=(DrawX=7138,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7000
   ObjPosY=3600
   ObjComment="River Mesh - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_1"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=3638,OverrideDelta=14)
   InputLinks(1)=(DrawY=3659,OverrideDelta=35)
   InputLinks(2)=(DrawY=3680,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=3659,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=7326,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7377,OverrideDelta=76)
   EventLinks(0)=(DrawX=7426,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7288
   ObjPosY=3601
   ObjComment="Lavafall Far Left - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=3637,OverrideDelta=14)
   InputLinks(1)=(DrawY=3658,OverrideDelta=35)
   InputLinks(2)=(DrawY=3679,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=1)),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=7934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7985,OverrideDelta=76)
   EventLinks(0)=(DrawX=8034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7896
   ObjPosY=3600
   ObjComment="Waterfall Far Left - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=3645,OverrideDelta=14)
   InputLinks(1)=(DrawY=3666,OverrideDelta=35)
   InputLinks(2)=(DrawY=3687,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=8614,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8665,OverrideDelta=76)
   EventLinks(0)=(DrawX=8714,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8576
   ObjPosY=3608
   ObjComment="Lavafall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_16
   Duration=0.250000
   InputLinks(0)=(DrawY=4853,OverrideDelta=14)
   InputLinks(1)=(DrawY=4874,OverrideDelta=35)
   InputLinks(2)=(DrawY=4895,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=4858,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4890,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1444,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=4816
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_16"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4056
   ObjPosY=4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4136
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2680
   ObjPosY=4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_66
   SizeX=2282
   SizeY=2484
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-6160
   ObjComment="Setup"
   DrawWidth=2282
   DrawHeight=2484
   Name="SequenceFrame_66"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_42
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8784
   ObjPosY=-5128
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_42"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-5128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-5210,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_8')),DrawY=-5220,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5200,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_42'),DrawX=-8739,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=-8689,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=-5256
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_8
   LinkCount=7
   InputLinks(0)=(DrawY=-5174,OverrideDelta=83)
   OutputLinks(0)=(DrawY=-5240,OverrideDelta=17)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_1')),LinkDesc="Link 2",DrawY=-5218,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_2')),LinkDesc="Link 3",DrawY=-5196,OverrideDelta=61)
   OutputLinks(3)=(LinkDesc="Link 4",DrawY=-5174,OverrideDelta=83)
   OutputLinks(4)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_3')),LinkDesc="Link 5",DrawY=-5152,OverrideDelta=105)
   OutputLinks(5)=(Links=((LinkedOp=KFSeqAct_SetTrader'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetTrader_0')),LinkDesc="Link 6",DrawY=-5130,OverrideDelta=127)
   OutputLinks(6)=(LinkDesc="Link 7",DrawY=-5108,OverrideDelta=149)
   VariableLinks(0)=(DrawX=-8542,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=-5280
   DrawWidth=68
   DrawHeight=205
   Name="SeqAct_Switch_8"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-5228,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5208,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9125,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9064,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-8983,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-5296
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_0"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_2
   CollisionType=COLLIDE_NoCollision
   InputLinks(0)=(DrawY=-1710,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_13')),DrawY=-1710,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=10,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=-1744
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_2"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=KFTrigger_ObjectiveLever'KF-ZEDLANDING.TheWorld:PersistentLevel.KFTrigger_ObjectiveLever_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-32
   ObjPosY=-1848
   ObjComment="Flare Activation Trigger"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ChangeCollision Name=SeqAct_ChangeCollision_3
   CollisionType=COLLIDE_TouchAllButWeapons
   InputLinks(0)=(DrawY=-1918,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_14')),DrawY=-1918,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-6,OverrideDelta=36)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-64
   ObjPosY=-1952
   DrawWidth=116
   DrawHeight=61
   Name="SeqAct_ChangeCollision_3"
   ObjectArchetype=SeqAct_ChangeCollision'Engine.Default__SeqAct_ChangeCollision'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_68
   SizeX=1082
   SizeY=575
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-8768
   ObjComment="Section A"
   DrawWidth=1082
   DrawHeight=575
   Name="SequenceFrame_68"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_2
   MaxTriggerCount=0
   MaxWidth=216
   OutputLinks(0)=(DrawY=-8674,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-8651,OverrideDelta=38)
   OutputLinks(2)=(DrawY=-8628,OverrideDelta=61)
   OutputLinks(3)=(DrawY=-8605,OverrideDelta=84)
   OutputLinks(4)=(DrawY=-8582,OverrideDelta=107)
   OutputLinks(5)=(DrawY=-8559,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_SetBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2')),DrawY=-8536,OverrideDelta=153)
   OutputLinks(7)=(DrawY=-8513,OverrideDelta=176)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_SetBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_7')),DrawY=-8490,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2448
   ObjPosY=-8744
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_2"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_79
   SizeX=1713
   SizeY=824
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3016
   ObjPosY=-8888
   ObjComment="Endless / Weekly"
   DrawWidth=1713
   DrawHeight=824
   Name="SequenceFrame_79"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_61
   VarName="Endless"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1720
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_61"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=-8670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_19'),DrawX=-1870,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_16'),DrawX=-1814,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1904
   ObjPosY=-8704
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_16
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Endless"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1824
   ObjPosY=-8592
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_16"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_19
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1920
   ObjPosY=-8592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_19"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=KFSeqAct_StartScriptedPawn Name=KFSeqAct_StartScriptedPawn_0
   bSpawnInactivePawn=True
   InputLinks(0)=(DrawY=-5554,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetScriptedPawnSpeed'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetScriptedPawnSpeed_0')),DrawY=-5564,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5544,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=2683,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_8'),DrawX=2810,OverrideDelta=134)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_7'),DrawX=2957,OverrideDelta=270)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2616
   ObjPosY=-5600
   DrawWidth=429
   DrawHeight=101
   Name="KFSeqAct_StartScriptedPawn_0"
   ObjectArchetype=KFSeqAct_StartScriptedPawn'KFGame.Default__KFSeqAct_StartScriptedPawn'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_7
   FloatValue=400.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2936
   ObjPosY=-5432
   ObjComment="Health"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_7"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFScriptedPawnSpawner'KF-ZEDLANDING.TheWorld:PersistentLevel.KFScriptedPawnSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=-5432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_451
   ObjValue=KFScriptedPawnSpawner'KF-ZEDLANDING.TheWorld:PersistentLevel.KFScriptedPawnSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3592
   ObjPosY=-1928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_451"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_33
   SizeX=3013
   SizeY=2339
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4568
   ObjPosY=-2248
   ObjComment="Obj 6 - Escort"
   DrawWidth=3013
   DrawHeight=2339
   Name="SequenceFrame_33"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-9115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_335',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_217',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_219',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_225',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_227',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_229',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_230',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_231',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_232',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_233',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_234',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_235',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_236',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_237',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_238',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_239',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_240',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_254',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_255',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_256',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_257',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_258',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_259',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_260',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_266',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_267',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_268',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_269',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_243',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_244',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_261'),DrawX=830,OverrideDelta=16)
   VariableLinks(1)=(DrawX=881,OverrideDelta=76)
   EventLinks(0)=(DrawX=930,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=792
   ObjPosY=-9152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_3
   MaxTriggerCount=0
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1)),ActivateDelay=0.500000,DrawY=-9042,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-9019,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1)),DrawY=-8996,OverrideDelta=61)
   OutputLinks(3)=(DrawY=-8973,OverrideDelta=84)
   OutputLinks(4)=(DrawY=-8950,OverrideDelta=107)
   OutputLinks(5)=(DrawY=-8927,OverrideDelta=130)
   OutputLinks(6)=(DrawY=-8904,OverrideDelta=153)
   OutputLinks(7)=(DrawY=-8881,OverrideDelta=176)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_0'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=-8858,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-480
   ObjPosY=-9112
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_3"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_335
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=808
   ObjPosY=-8984
   ObjComment="Flare Controls"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_335"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_80
   SizeX=2949
   SizeY=1798
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-648
   ObjPosY=-9272
   ObjComment="Lights"
   DrawWidth=2949
   DrawHeight=1798
   Name="SequenceFrame_80"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_8
   FloatValue=200.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2776
   ObjPosY=-5424
   ObjComment="Health"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_8"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_7
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2168
   ObjPosY=-8336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_7"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_40
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2072
   ObjPosY=-8336
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_40"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_7
   InputLinks(0)=(DrawY=-8414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_7'),DrawX=-2118,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_40'),DrawX=-2062,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2152
   ObjPosY=-8448
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_7"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_9
   VarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1856
   ObjPosY=-8424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_9"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_29
   SizeX=3953
   SizeY=2873
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2480
   ObjPosY=-6024
   ObjComment="Obj 2 - Exterminate"
   DrawWidth=3953
   DrawHeight=2873
   Name="SequenceFrame_29"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   SizeX=3960
   SizeY=3236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6728
   ObjPosY=-6128
   ObjComment="Obj 1 - Weld and Repair"
   DrawWidth=3960
   DrawHeight=3236
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_44
   SizeX=3361
   SizeY=2893
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5440
   ObjPosY=-6184
   ObjComment="Obj 4 - Transport"
   DrawWidth=3361
   DrawHeight=2893
   Name="SequenceFrame_44"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=4946
   SizeY=1595
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1224
   ObjPosY=-2368
   ObjComment="Flares"
   DrawWidth=4946
   DrawHeight=1595
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_281
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2896
   ObjPosY=712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_281"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZedLanding_OBJ_Flare'
   InputLinks(0)=(DrawY=370,OverrideDelta=11)
   OutputLinks(0)=(DrawY=370,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_293'),DrawX=3104,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3056
   ObjPosY=336
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_293
   ObjValue=TargetPoint'KF-ZEDLANDING.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3080
   ObjPosY=424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_293"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_1
   InputLinks(0)=(DrawY=-5356,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5336,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5346,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_177'),DrawX=-8191,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8232
   ObjPosY=-5392
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_1"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_177
   ObjValue=KFTraderTrigger'KF-ZEDLANDING.TheWorld:PersistentLevel.KFTraderTrigger_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-5248
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_177"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_2
   InputLinks(0)=(DrawY=-5116,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5096,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5106,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_179'),DrawX=-8039,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=-5152
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_2"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_179
   ObjValue=KFTraderTrigger'KF-ZEDLANDING.TheWorld:PersistentLevel.KFTraderTrigger_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=-5016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_179"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_180
   ObjValue=KFTraderTrigger'KF-ZEDLANDING.TheWorld:PersistentLevel.KFTraderTrigger_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-4808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_180"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_3
   InputLinks(0)=(DrawY=-4908,OverrideDelta=13)
   InputLinks(1)=(DrawY=-4888,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-4898,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_180'),DrawX=-8183,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8224
   ObjPosY=-4944
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_3"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=KFSeqAct_SetTrader Name=KFSeqAct_SetTrader_0
   InputLinks(0)=(DrawY=-4644,OverrideDelta=13)
   InputLinks(1)=(DrawY=-4624,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-4634,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_178'),DrawX=-8175,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-4680
   DrawWidth=83
   DrawHeight=101
   Name="KFSeqAct_SetTrader_0"
   ObjectArchetype=KFSeqAct_SetTrader'KFGame.Default__KFSeqAct_SetTrader'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_178
   ObjValue=KFTraderTrigger'KF-ZEDLANDING.TheWorld:PersistentLevel.KFTraderTrigger_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-4544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_178"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_31
   SizeX=1603
   SizeY=1229
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7568
   ObjPosY=-2736
   ObjComment="Obj 8 - Boss"
   DrawWidth=1603
   DrawHeight=1229
   Name="SequenceFrame_31"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_2
   Originator=KFRepairableActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFRepairableActor_0'
   MaxWidth=308
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_95'),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_12')),DrawY=-3580,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_75'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_95',InputLinkIdx=1),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_3')),DrawY=-3560,OverrideDelta=33)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5360
   ObjPosY=-3648
   ObjName="KFRepairableActor_0 Repairable Actor Events"
   DrawWidth=194
   Name="KFSeqEvent_RepairableActor_2"
   ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
End Object

Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_3
   Originator=KFRepairableActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFRepairableActor_6'
   MaxWidth=308
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_96'),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_7')),DrawY=-4340,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_74'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_96',InputLinkIdx=1),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_2')),DrawY=-4320,OverrideDelta=33)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5384
   ObjPosY=-4408
   ObjName="KFRepairableActor_6 Repairable Actor Events"
   DrawWidth=194
   Name="KFSeqEvent_RepairableActor_3"
   ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
End Object

Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_4
   Originator=KFRepairableActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFRepairableActor_5'
   MaxWidth=308
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_97'),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_5')),DrawY=-5132,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_73'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_97',InputLinkIdx=1),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1')),DrawY=-5112,OverrideDelta=33)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5272
   ObjPosY=-5200
   ObjName="KFRepairableActor_5 Repairable Actor Events"
   DrawWidth=194
   Name="KFSeqEvent_RepairableActor_4"
   ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
End Object

Begin Object Class=KFSeqEvent_RepairableActor Name=KFSeqEvent_RepairableActor_1
   Originator=KFRepairableActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFRepairableActor_2'
   MaxWidth=308
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_94'),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_8')),DrawY=-5836,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_72'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_94',InputLinkIdx=1),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_4')),DrawY=-5816,OverrideDelta=33)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5160
   ObjPosY=-5904
   ObjName="KFRepairableActor_2 Repairable Actor Events"
   DrawWidth=194
   Name="KFSeqEvent_RepairableActor_1"
   ObjectArchetype=KFSeqEvent_RepairableActor'KFGame.Default__KFSeqEvent_RepairableActor'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_26
   EventName="LeverReady1"
   InputLinks(0)=(DrawY=-790,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-790,OverrideDelta=11)
   VariableLinks(0)=(DrawX=331,OverrideDelta=99)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=200
   ObjPosY=-824
   ObjComment="LeverReady1"
   DrawWidth=262
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_26"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_31
   EventName="LeverPulled1"
   InputLinks(0)=(DrawY=-902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=330,OverrideDelta=98)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=200
   ObjPosY=-936
   ObjComment="LeverPulled1"
   DrawWidth=260
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_31"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_60
   InputLinks(0)=(DrawY=581,OverrideDelta=14)
   InputLinks(1)=(DrawY=602,OverrideDelta=35)
   InputLinks(2)=(DrawY=623,OverrideDelta=56)
   OutputLinks(0)=(DrawY=602,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281'),DrawX=3158,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3209,OverrideDelta=76)
   EventLinks(0)=(DrawX=3258,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3120
   ObjPosY=544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_60"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_72
   InputLinks(0)=(DrawY=-5691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5649,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_191',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_294',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_193',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_194',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_195',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_196'),DrawX=-4442,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4391,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4342,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4480
   ObjPosY=-5728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_72"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_191
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4680
   ObjPosY=-5512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_191"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_294
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4584
   ObjPosY=-5512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_294"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_193
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4480
   ObjPosY=-5512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_193"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_194
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4384
   ObjPosY=-5512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_194"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-5512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_195"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_196
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4184
   ObjPosY=-5512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_196"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_73
   InputLinks(0)=(DrawY=-4995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_198',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_289',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_200',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_288',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_295'),DrawX=-4314,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4263,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4214,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4352
   ObjPosY=-5032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_73"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=-4848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-4848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_289
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4392
   ObjPosY=-4848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_289"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4288
   ObjPosY=-4848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4192
   ObjPosY=-4848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_288
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=-4848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_288"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_295
   ObjValue=SpotLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.SpotLightToggleable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4704
   ObjPosY=-4848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_295"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_74
   InputLinks(0)=(DrawY=-4187,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4166,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4145,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4166,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_206',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215'),DrawX=-4570,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4519,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4470,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4608
   ObjPosY=-4224
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_74"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_206
   ObjValue=SpotLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.SpotLightToggleable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=-4032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_206"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_75
   InputLinks(0)=(DrawY=-3371,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3350,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3329,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3350,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_270',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_271',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_272',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_273'),DrawX=-4538,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4487,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4438,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4576
   ObjPosY=-3408
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_75"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4704
   ObjPosY=-4024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4608
   ObjPosY=-4024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4504
   ObjPosY=-4024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4408
   ObjPosY=-4024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjValue=SpotLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.SpotLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4824
   ObjPosY=-3184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4304
   ObjPosY=-4032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4200
   ObjPosY=-4032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=528
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_217
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_217"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=728
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=928
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1024
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjValue=SpotLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.SpotLightToggleable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1224
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1328
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_225
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1424
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_225"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_227
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1624
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_227"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1728
   ObjPosY=-8504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
   ObjValue=SpotLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.SpotLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_229"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_230
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=680
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_230"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_231
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=776
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_231"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_232
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=872
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_232"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_233
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=968
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_233"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_234
   ObjValue=SpotLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.SpotLightToggleable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1072
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_234"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_235
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1168
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_235"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_236
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1272
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_236"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_237
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1368
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_237"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_238
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1472
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_238"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_239
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1568
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_239"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_240
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1672
   ObjPosY=-8416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_240"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_2
   Originator=KFObjectiveCollectActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFObjectiveCollectActor_0'
   MaxWidth=330
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_80')),DrawY=-5459,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5437,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_80',InputLinkIdx=1)),DrawY=-5415,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_34')),DrawY=-5393,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5856
   ObjPosY=-5528
   ObjName="KFObjectiveCollectActor_0 Collect Trigger Event"
   DrawWidth=229
   Name="KFSeqEvent_CollectTrigger_2"
   ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
End Object

Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_3
   Originator=KFObjectiveCollectActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFObjectiveCollectActor_6'
   MaxWidth=330
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_81')),DrawY=-4859,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4837,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_81',InputLinkIdx=1)),DrawY=-4815,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_37')),DrawY=-4793,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5856
   ObjPosY=-4928
   ObjName="KFObjectiveCollectActor_6 Collect Trigger Event"
   DrawWidth=229
   Name="KFSeqEvent_CollectTrigger_3"
   ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
End Object

Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_4
   Originator=KFObjectiveCollectActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFObjectiveCollectActor_3'
   MaxWidth=330
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_82')),DrawY=-4283,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4261,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_82',InputLinkIdx=1)),DrawY=-4239,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_33')),DrawY=-4217,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5816
   ObjPosY=-4352
   ObjName="KFObjectiveCollectActor_3 Collect Trigger Event"
   DrawWidth=229
   Name="KFSeqEvent_CollectTrigger_4"
   ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
End Object

Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_5
   Originator=KFObjectiveCollectActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFObjectiveCollectActor_4'
   MaxWidth=330
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84')),DrawY=-5435,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-5413,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_84',InputLinkIdx=1)),DrawY=-5391,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_35')),DrawY=-5369,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7120
   ObjPosY=-5504
   ObjName="KFObjectiveCollectActor_4 Collect Trigger Event"
   DrawWidth=229
   Name="KFSeqEvent_CollectTrigger_5"
   ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
End Object

Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_6
   Originator=KFObjectiveCollectActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFObjectiveCollectActor_5'
   MaxWidth=330
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_85')),DrawY=-4915,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4893,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_85',InputLinkIdx=1)),DrawY=-4871,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_36')),DrawY=-4849,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7120
   ObjPosY=-4984
   ObjName="KFObjectiveCollectActor_5 Collect Trigger Event"
   DrawWidth=229
   Name="KFSeqEvent_CollectTrigger_6"
   ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
End Object

Begin Object Class=KFSeqEvent_CollectTrigger Name=KFSeqEvent_CollectTrigger_7
   Originator=KFObjectiveCollectActor'KF-ZEDLANDING.TheWorld:PersistentLevel.KFObjectiveCollectActor_1'
   MaxWidth=330
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_86')),DrawY=-4339,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4317,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_86',InputLinkIdx=1)),DrawY=-4295,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_32')),DrawY=-4273,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7112
   ObjPosY=-4408
   ObjName="KFObjectiveCollectActor_1 Collect Trigger Event"
   DrawWidth=229
   Name="KFSeqEvent_CollectTrigger_7"
   ObjectArchetype=KFSeqEvent_CollectTrigger'KFGame.Default__KFSeqEvent_CollectTrigger'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_80
   InputLinks(0)=(DrawY=-5563,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5542,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5521,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5542,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_246'),DrawX=6470,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6521,OverrideDelta=76)
   EventLinks(0)=(DrawX=6570,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=-5600
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_80"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_246
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=-5443
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_246"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_81
   InputLinks(0)=(DrawY=-4971,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4950,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4929,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4950,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_248'),DrawX=6438,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6489,OverrideDelta=76)
   EventLinks(0)=(DrawX=6538,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6400
   ObjPosY=-5008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_81"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_82
   InputLinks(0)=(DrawY=-4411,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4390,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4369,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4390,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_247'),DrawX=6446,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6497,OverrideDelta=76)
   EventLinks(0)=(DrawX=6546,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6408
   ObjPosY=-4448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_82"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_84
   InputLinks(0)=(DrawY=-5539,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5518,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5497,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5518,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251'),DrawX=7750,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7801,OverrideDelta=76)
   EventLinks(0)=(DrawX=7850,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7712
   ObjPosY=-5576
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_84"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_85
   InputLinks(0)=(DrawY=-4995,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4974,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4953,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4974,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_249'),DrawX=7766,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7817,OverrideDelta=76)
   EventLinks(0)=(DrawX=7866,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7728
   ObjPosY=-5032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_85"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_86
   InputLinks(0)=(DrawY=-4427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_250'),DrawX=7774,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7825,OverrideDelta=76)
   EventLinks(0)=(DrawX=7874,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7736
   ObjPosY=-4464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_86"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_247
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6408
   ObjPosY=-4304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_247"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_248
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6408
   ObjPosY=-4856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_248"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_249
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7720
   ObjPosY=-4875
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_249"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_250
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7744
   ObjPosY=-4312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_250"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7720
   ObjPosY=-5427
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_70
   InputLinks(0)=(DrawY=-3859,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3838,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3817,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76')),ActivateDelay=1.000000,DrawY=-3838,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=6334,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6385,OverrideDelta=76)
   EventLinks(0)=(DrawX=6434,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6296
   ObjPosY=-3896
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_70"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6296
   ObjPosY=-3728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_23
   EventName="ObjectDelivered"
   MaxWidth=221
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_70')),DrawY=-3838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5934,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5824
   ObjPosY=-3904
   ObjComment="ObjectDelivered"
   DrawWidth=130
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_23"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_34
   EventName="ObjectDelivered"
   InputLinks(0)=(DrawY=-5286,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6533,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6392
   ObjPosY=-5320
   ObjComment="ObjectDelivered"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_34"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_76
   InputLinks(0)=(DrawY=-3827,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3806,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3785,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_76',InputLinkIdx=1)),ActivateDelay=5.500000,DrawY=-3806,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=6702,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6753,OverrideDelta=76)
   EventLinks(0)=(DrawX=6802,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6664
   ObjPosY=-3864
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_76"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6664
   ObjPosY=-3704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_35
   EventName="ObjectDelivered"
   InputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7845,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7704
   ObjPosY=-5304
   ObjComment="ObjectDelivered"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_35"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_36
   EventName="ObjectDelivered"
   InputLinks(0)=(DrawY=-4702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7813,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7672
   ObjPosY=-4736
   ObjComment="ObjectDelivered"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_36"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_37
   EventName="ObjectDelivered"
   InputLinks(0)=(DrawY=-4718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4718,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6501,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6360
   ObjPosY=-4752
   ObjComment="ObjectDelivered"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_37"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_33
   EventName="ObjectDelivered"
   InputLinks(0)=(DrawY=-4142,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4142,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6493,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6352
   ObjPosY=-4176
   ObjComment="ObjectDelivered"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_33"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_32
   EventName="ObjectDelivered"
   InputLinks(0)=(DrawY=-4126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=7805,OverrideDelta=109)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7664
   ObjPosY=-4160
   ObjComment="ObjectDelivered"
   DrawWidth=282
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_32"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_254
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1168
   ObjPosY=-8944
   ObjComment="Data Terminal"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_254"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_255
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1464
   ObjPosY=-8864
   ObjComment="Data Pads"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_255"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_256
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1560
   ObjPosY=-8864
   ObjComment="Data Pads"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_256"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_257
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1664
   ObjPosY=-8864
   ObjComment="Data Pads"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_257"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_258
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=-8864
   ObjComment="Data Pads"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_258"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_259
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1864
   ObjPosY=-8864
   ObjComment="Data Pads"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_259"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_260
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1960
   ObjPosY=-8864
   ObjComment="Data Pads"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_260"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_94
   InputLinks(0)=(DrawY=-5979,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5958,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5937,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5958,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_262'),DrawX=-4530,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4479,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4430,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4568
   ObjPosY=-6016
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_94"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_262
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4552
   ObjPosY=-5856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_262"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_95
   InputLinks(0)=(DrawY=-3651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3609,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3630,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_263'),DrawX=-4554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=-3688
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_95"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_96
   InputLinks(0)=(DrawY=-4435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-4414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_265'),DrawX=-4562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4600
   ObjPosY=-4472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_96"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_97
   InputLinks(0)=(DrawY=-5243,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5222,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5201,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5222,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_264'),DrawX=-4394,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4343,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4294,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4432
   ObjPosY=-5280
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_97"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_263
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4576
   ObjPosY=-3544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_263"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_264
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4424
   ObjPosY=-5120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_264"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_265
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4592
   ObjPosY=-4320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_265"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_266
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1577
   ObjPosY=-8688
   ObjComment="Trader Pods Damaged"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_266"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_267
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1672
   ObjPosY=-8656
   ObjComment="Trader Pods Damaged"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_267"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_268
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1784
   ObjPosY=-8624
   ObjComment="Trader Pods Damaged"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_268"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_269
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=-8592
   ObjComment="Trader Pods Damaged"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_269"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_270
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4696
   ObjPosY=-3176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_270"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_271
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4600
   ObjPosY=-3176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_271"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_272
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-3176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_272"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_273
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4400
   ObjPosY=-3176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_273"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
   NewMaterial=Material'Env_Mat_Lib.Trader.Env_Trader_PM'
   InputLinks(0)=(DrawY=-5694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157'),DrawX=-4843,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4888
   ObjPosY=-5728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_4"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   NewMaterial=Material'Env_Mat_Lib.Trader.Env_Trader_PM'
   InputLinks(0)=(DrawY=-5014,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5014,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),DrawX=-4915,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4960
   ObjPosY=-5048
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
   NewMaterial=Material'Env_Mat_Lib.Trader.Env_Trader_PM'
   InputLinks(0)=(DrawY=-4206,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4206,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163'),DrawX=-5043,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5088
   ObjPosY=-4240
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_2"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
   NewMaterial=Material'Env_Mat_Lib.Trader.Env_Trader_PM'
   InputLinks(0)=(DrawY=-3454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3454,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164'),DrawX=-5019,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=-3488
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_3"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_157
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4736
   ObjPosY=-5632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_157"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4768
   ObjPosY=-4944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_163
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4968
   ObjPosY=-4128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_163"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_164
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4936
   ObjPosY=-3368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_164"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_20
   EventName="ZoneEnabled1"
   InputLinks(0)=(DrawY=-662,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=351,OverrideDelta=103)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-696
   ObjComment="ZoneEnabled1"
   DrawWidth=270
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_20"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_25
   EventName="ZoneDisabled1"
   InputLinks(0)=(DrawY=-510,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-510,OverrideDelta=11)
   VariableLinks(0)=(DrawX=352,OverrideDelta=104)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=-544
   ObjComment="ZoneDisabled1"
   DrawWidth=273
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_25"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqEvent_ActivateTriggerProgress Name=KFSeqEvent_ActivateTriggerProgress_3
   Originator=KFMapObjective_ActivateTrigger'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_ActivateTrigger_1'
   MaxWidth=415
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_31')),DrawY=-755,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_26')),DrawY=-733,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_20')),DrawY=-711,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_25')),DrawY=-689,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-272
   ObjPosY=-824
   ObjName="KFMapObjective_ActivateTrigger_1 Activate Trigger Progress"
   DrawWidth=261
   Name="KFSeqEvent_ActivateTriggerProgress_3"
   ObjectArchetype=KFSeqEvent_ActivateTriggerProgress'KFGame.Default__KFSeqEvent_ActivateTriggerProgress'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_7
   Originator=KFMapObjective_RepairActors'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_RepairActors_1'
   MaxWidth=392
   OutputLinks(0)=(DrawY=-5908,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_41')),DrawY=-5888,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-6348,OverrideDelta=164)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6544
   ObjPosY=-5976
   ObjName="KFMapObjective_RepairActors_1 Map Objective Activated"
   DrawWidth=244
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_7"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_0
   Originator=KFMapObjective_ExterminateWave'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_2'
   MaxWidth=424
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetMonsterProperties'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetMonsterProperties_0')),DrawY=-5788,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=KFSeqAct_SetMonsterProperties'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetMonsterProperties_0',InputLinkIdx=1)),DrawY=-5768,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-2100,OverrideDelta=180)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2312
   ObjPosY=-5856
   ObjName="KFMapObjective_ExterminateWave_2 Map Objective Activated"
   DrawWidth=260
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_0"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_6
   Originator=KFMapObjective_EscortPawns'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_EscortPawns_2'
   MaxWidth=393
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_StartScriptedPawn'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_StartScriptedPawn_0')),DrawY=-5652,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5632,OverrideDelta=33)
   VariableLinks(0)=(DrawX=2188,OverrideDelta=164)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=-5720
   ObjName="KFMapObjective_EscortPawns_2 Map Objective Activated"
   DrawWidth=244
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_6"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_3
   Originator=KFMapObjective_CollectActors'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_CollectActors_0'
   MaxWidth=397
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40'),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_10')),DrawY=-5964,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40',InputLinkIdx=1),(LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_11')),DrawY=-5944,OverrideDelta=33)
   VariableLinks(0)=(DrawX=5758,OverrideDelta=166)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5560
   ObjPosY=-6032
   ObjName="KFMapObjective_CollectActors_0 Map Objective Activated"
   DrawWidth=246
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_3"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_2
   Originator=KFMapObjective_HoldZone'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_HoldZone_0'
   MaxWidth=370
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34')),DrawY=-2212,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34',InputLinkIdx=1)),DrawY=-2192,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-8871,OverrideDelta=153)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9056
   ObjPosY=-2280
   ObjName="KFMapObjective_HoldZone_0 Map Objective Activated"
   DrawWidth=233
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_2"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_9
   Originator=KFMapObjective_EscortPawns'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_EscortPawns_1'
   MaxWidth=393
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_RestartScriptedPawn'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_RestartScriptedPawn_0')),DrawY=-2044,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-2024,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-4252,OverrideDelta=164)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4448
   ObjPosY=-2112
   ObjName="KFMapObjective_EscortPawns_1 Map Objective Activated"
   DrawWidth=244
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_9"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_10
   Originator=KFMapObjective_ActivateTrigger'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_ActivateTrigger_1'
   MaxWidth=411
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_3'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32')),DrawY=-2172,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ChangeCollision'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ChangeCollision_2'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_28'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32',InputLinkIdx=1)),DrawY=-2152,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-363,OverrideDelta=173)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-568
   ObjPosY=-2240
   ObjName="KFMapObjective_ActivateTrigger_1 Map Objective Activated"
   DrawWidth=253
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_10"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_28
   EventName="Obj7Deactivated"
   InputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-392,OverrideDelta=112)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-536
   ObjPosY=-1880
   ObjComment="Obj7Deactivated"
   DrawWidth=288
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_28"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_26
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Opening_intro'
   InputLinks(0)=(DrawY=-7414,ActivateDelay=4.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7414,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1816,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1864
   ObjPosY=-7448
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_26"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Gate Name=SeqAct_Gate_0
   InputLinks(0)=(DrawY=-7435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7413,OverrideDelta=36)
   InputLinks(2)=(DrawY=-7391,OverrideDelta=58)
   InputLinks(3)=(DrawY=-7369,OverrideDelta=80)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_0',InputLinkIdx=2),(LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_26')),DrawY=-7402,OverrideDelta=47)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2080
   ObjPosY=-7472
   DrawWidth=82
   DrawHeight=117
   Name="SeqAct_Gate_0"
   ObjectArchetype=SeqAct_Gate'Engine.Default__SeqAct_Gate'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_46
   SizeX=1274
   SizeY=619
   bDrawBox=True
   FillColor=(B=226,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2664
   ObjPosY=-7760
   ObjComment="Intro VO"
   DrawWidth=1274
   DrawHeight=619
   Name="SequenceFrame_46"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_1
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=216
   OutputLinks(0)=(DrawY=-7522,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-7499,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_0',InputLinkIdx=1)),DrawY=-7476,OverrideDelta=61)
   OutputLinks(3)=(DrawY=-7453,OverrideDelta=84)
   OutputLinks(4)=(DrawY=-7430,OverrideDelta=107)
   OutputLinks(5)=(DrawY=-7407,OverrideDelta=130)
   OutputLinks(6)=(DrawY=-7384,OverrideDelta=153)
   OutputLinks(7)=(DrawY=-7361,OverrideDelta=176)
   OutputLinks(8)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_0')),DrawY=-7338,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2528
   ObjPosY=-7592
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_1"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate1_25ZedDead'
   InputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=-5304
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate1_50ZedDead'
   InputLinks(0)=(DrawY=-5182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5182,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=-5216
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate1_80ZedDead'
   InputLinks(0)=(DrawY=-5086,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1640,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1688
   ObjPosY=-5120
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_ExterminateWavePct Name=KFSeqEvent_ExterminateWavePct_1
   ProgressThresholds(0)=0.250000
   ProgressThresholds(1)=0.500000
   ProgressThresholds(2)=0.750000
   ProgressThresholds(3)=1.000000
   Originator=KFMapObjective_ExterminateWave'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_2'
   MaxWidth=484
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),LinkDesc="Wave Completion Percent: 0.25",DrawY=-5211,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),LinkDesc="Wave Completion Percent: 0.50",DrawY=-5189,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),LinkDesc="Wave Completion Percent: 0.75",DrawY=-5167,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17')),LinkDesc="Wave Completion Percent: 1.00",DrawY=-5145,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2296
   ObjPosY=-5280
   ObjName="KFMapObjective_ExterminateWave_2 Exterminate Wave Completion Pct"
   DrawWidth=355
   Name="KFSeqEvent_ExterminateWavePct_1"
   ObjectArchetype=KFSeqEvent_ExterminateWavePct'kfgamecontent.Default__KFSeqEvent_ExterminateWavePct'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate1_Completed'
   InputLinks(0)=(DrawY=-4990,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4990,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1680
   ObjPosY=-5024
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate2_Completed'
   InputLinks(0)=(DrawY=-1838,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=8640,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-1872
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate2_25ZedDead'
   InputLinks(0)=(DrawY=-2110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=8648,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8600
   ObjPosY=-2144
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate2_50ZedDead'
   InputLinks(0)=(DrawY=-2030,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2030,OverrideDelta=11)
   VariableLinks(0)=(DrawX=8640,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8592
   ObjPosY=-2064
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Exterminate2_80ZedDead'
   InputLinks(0)=(DrawY=-1942,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1942,OverrideDelta=11)
   VariableLinks(0)=(DrawX=8632,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8584
   ObjPosY=-1976
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_5
   Originator=KFMapObjective_ExterminateWave'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_0'
   MaxWidth=424
   OutputLinks(0)=(DrawY=-2436,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-2416,OverrideDelta=33)
   VariableLinks(0)=(DrawX=7980,OverrideDelta=180)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7768
   ObjPosY=-2504
   ObjName="KFMapObjective_ExterminateWave_0 Map Objective Activated"
   DrawWidth=260
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_5"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Hold1_25done'
   InputLinks(0)=(DrawY=-1454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8328,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=-1488
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Hold1_50done'
   InputLinks(0)=(DrawY=-1366,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1366,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8328,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=-1400
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Hold1_80done'
   InputLinks(0)=(DrawY=-1270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8336,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=-1304
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Hold1_Completed'
   InputLinks(0)=(DrawY=-1174,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1174,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8328,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=-1208
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=KFSeqEvent_HoldZoneProgress Name=KFSeqEvent_HoldZoneProgress_0
   ProgressThresholds(0)=0.250000
   ProgressThresholds(1)=0.500000
   ProgressThresholds(2)=0.750000
   ProgressThresholds(3)=0.950000
   ProgressThresholds(4)=1.000000
   Originator=KFMapObjective_HoldZone'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_HoldZone_0'
   MaxWidth=333
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34',InputLinkIdx=1)),DrawY=-1776,OverrideDelta=17)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34')),DrawY=-1754,OverrideDelta=39)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57'),(LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),LinkDesc="Progress Pct: 0.25",DrawY=-1732,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57'),(LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),LinkDesc="Progress Pct: 0.50",DrawY=-1710,OverrideDelta=83)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57'),(LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),LinkDesc="Progress Pct: 0.75",DrawY=-1688,OverrideDelta=105)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_57'),(LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_8')),LinkDesc="Progress Pct: 0.95",DrawY=-1666,OverrideDelta=127)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15')),LinkDesc="Progress Pct: 1.00",DrawY=-1644,OverrideDelta=149)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-1848
   ObjName="KFMapObjective_HoldZone_0 Hold Zone Progress"
   DrawWidth=236
   Name="KFSeqEvent_HoldZoneProgress_0"
   ObjectArchetype=KFSeqEvent_HoldZoneProgress'kfgamecontent.Default__KFSeqEvent_HoldZoneProgress'
End Object

Begin Object Class=KFSeqEvent_ExterminateBossHealthPct Name=KFSeqEvent_ExterminateBossHealthPct_0
   ProgressThresholds(0)=0.750000
   ProgressThresholds(1)=0.500000
   ProgressThresholds(2)=0.250000
   ProgressThresholds(3)=0.000000
   Originator=KFMapObjective_ExterminateWave'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_0'
   MaxWidth=447
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),LinkDesc="Boss Health Percent: 0.75",DrawY=-2003,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20')),LinkDesc="Boss Health Percent: 0.50",DrawY=-1981,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21')),LinkDesc="Boss Health Percent: 0.25",DrawY=-1959,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),LinkDesc="Boss Health Percent: 0.00",DrawY=-1937,OverrideDelta=80)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8048
   ObjPosY=-2072
   ObjName="KFMapObjective_ExterminateWave_0 Exterminate Boss Health Pct"
   DrawWidth=318
   Name="KFSeqEvent_ExterminateBossHealthPct_0"
   ObjectArchetype=KFSeqEvent_ExterminateBossHealthPct'kfgamecontent.Default__KFSeqEvent_ExterminateBossHealthPct'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="Flare1"
   MaxWidth=157
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-1998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4174,OverrideDelta=46)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4096
   ObjPosY=-2064
   ObjComment="Flare1"
   DrawWidth=98
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_40
   EventName="Flare1"
   InputLinks(0)=(DrawY=-2070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2070,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1925,OverrideDelta=77)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1816
   ObjPosY=-2104
   ObjComment="Flare1"
   DrawWidth=218
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_40"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_8
   EventName="Flare2"
   MaxWidth=157
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_48')),DrawY=-1726,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4270,OverrideDelta=46)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4192
   ObjPosY=-1792
   ObjComment="Flare2"
   DrawWidth=98
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_8"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_39
   EventName="Flare2"
   InputLinks(0)=(DrawY=-1958,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1958,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1917,OverrideDelta=77)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-1992
   ObjComment="Flare2"
   DrawWidth=218
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_39"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_17
   EventName="Flare3"
   MaxWidth=157
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_56')),DrawY=-1382,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4270,OverrideDelta=46)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4192
   ObjPosY=-1448
   ObjComment="Flare3"
   DrawWidth=98
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_17"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_18
   EventName="Flare3"
   InputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1917,OverrideDelta=77)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-1880
   ObjComment="Flare3"
   DrawWidth=218
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_18"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_18
   EventName="Flare4"
   MaxWidth=157
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_58')),DrawY=-1822,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5222,OverrideDelta=46)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5144
   ObjPosY=-1888
   ObjComment="Flare4"
   DrawWidth=98
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_18"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_29
   EventName="Flare4"
   InputLinks(0)=(DrawY=-1734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1734,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1917,OverrideDelta=77)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-1768
   ObjComment="Flare4"
   DrawWidth=218
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_29"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_19
   EventName="Flare5"
   MaxWidth=157
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_62'),(LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_9')),DrawY=-1286,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5222,OverrideDelta=46)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5144
   ObjPosY=-1352
   ObjComment="Flare5"
   DrawWidth=98
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_19"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_30
   EventName="Flare5"
   InputLinks(0)=(DrawY=-1622,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1925,OverrideDelta=77)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1816
   ObjPosY=-1656
   ObjComment="Flare5"
   DrawWidth=218
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_30"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_0
   LinkCount=5
   InputLinks(0)=(DrawY=-1846,OverrideDelta=59)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_40')),DrawY=-1890,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_39')),LinkDesc="Link 2",DrawY=-1868,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_18')),LinkDesc="Link 3",DrawY=-1846,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_29')),LinkDesc="Link 4",DrawY=-1824,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_30')),LinkDesc="Link 5",DrawY=-1802,OverrideDelta=103)
   VariableLinks(0)=(DrawX=1650,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1616
   ObjPosY=-1928
   DrawWidth=68
   DrawHeight=157
   Name="SeqAct_Switch_0"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_6
   EventName="LeverPulled1"
   MaxWidth=199
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_0')),DrawY=-1854,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1467,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1368
   ObjPosY=-1920
   ObjComment="LeverPulled1"
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_6"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_59
   InputLinks(0)=(DrawY=429,OverrideDelta=14)
   InputLinks(1)=(DrawY=450,OverrideDelta=35)
   InputLinks(2)=(DrawY=471,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9'),(LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2'),(LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_6')),DrawY=450,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_281',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_241'),DrawX=2630,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2681,OverrideDelta=76)
   EventLinks(0)=(DrawX=2730,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2592
   ObjPosY=392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_59"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-2035,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2014,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1993,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_8')),DrawY=-2014,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=4438,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4489,OverrideDelta=76)
   EventLinks(0)=(DrawX=4538,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4400
   ObjPosY=-2072
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4416
   ObjPosY=-1904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
   InputLinks(0)=(DrawY=-1731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1689,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_9')),DrawY=-1710,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=4494,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4545,OverrideDelta=76)
   EventLinks(0)=(DrawX=4594,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4456
   ObjPosY=-1768
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_48"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_56
   InputLinks(0)=(DrawY=-1419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1377,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_10')),DrawY=-1398,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=4510,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4561,OverrideDelta=76)
   EventLinks(0)=(DrawX=4610,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4472
   ObjPosY=-1456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_56"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_58
   InputLinks(0)=(DrawY=-1867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1825,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_11')),DrawY=-1846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=5486,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5537,OverrideDelta=76)
   EventLinks(0)=(DrawX=5586,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5448
   ObjPosY=-1904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_58"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_62
   InputLinks(0)=(DrawY=-1315,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1294,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1273,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_6')),DrawY=-1294,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=5518,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5569,OverrideDelta=76)
   EventLinks(0)=(DrawX=5618,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5480
   ObjPosY=-1352
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_62"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4456
   ObjPosY=-1616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4472
   ObjPosY=-1296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5432
   ObjPosY=-1736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5456
   ObjPosY=-1184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_8
   InputLinks(0)=(DrawY=-2019,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1998,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1977,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1998,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_154'),DrawX=4766,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4817,OverrideDelta=76)
   EventLinks(0)=(DrawX=4866,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=-2056
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_8"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_9
   InputLinks(0)=(DrawY=-1723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1681,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1702,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_155'),DrawX=4806,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4857,OverrideDelta=76)
   EventLinks(0)=(DrawX=4906,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4768
   ObjPosY=-1760
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_9"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_10
   InputLinks(0)=(DrawY=-1419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1377,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1398,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_158'),DrawX=4806,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4857,OverrideDelta=76)
   EventLinks(0)=(DrawX=4906,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4768
   ObjPosY=-1456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_10"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_11
   InputLinks(0)=(DrawY=-1867,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1846,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1825,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1846,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),DrawX=5774,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5825,OverrideDelta=76)
   EventLinks(0)=(DrawX=5874,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5736
   ObjPosY=-1904
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_11"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_6
   InputLinks(0)=(DrawY=-1307,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1286,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1265,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1286,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204'),DrawX=5822,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5873,OverrideDelta=76)
   EventLinks(0)=(DrawX=5922,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=-1344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_6"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_154
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=-1896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_154"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_155
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4776
   ObjPosY=-1600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_155"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_158
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4768
   ObjPosY=-1288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_158"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5736
   ObjPosY=-1744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5768
   ObjPosY=-1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_31
   EventName="FinalCinematic"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_9'),(LinkedOp=SeqAct_CameraFade'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraFade_1'),(LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_73'),(LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14')),DrawY=5898,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9119,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9224
   ObjPosY=5832
   ObjComment="FinalCinematic"
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_31"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6712
   ObjPosY=4704
   ObjComment="Tail Rotor"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=4720
   ObjComment="Main Rotor"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_13
   EventName="helicopter"
   MaxWidth=182
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_9')),DrawY=4586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7117,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=4520
   ObjComment="Helicopter"
   DrawWidth=111
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_13"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=InterpData Name=InterpData_9
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((OutVal=(X=0.000366,Y=-0.002930,Z=0.000000)),(InVal=0.500000,OutVal=(X=0.000244,Y=-0.001953,Z=0.000000),ArriveTangent=(X=-0.000366,Y=0.002930,Z=0.000000),LeaveTangent=(X=-0.000366,Y=0.002930,Z=0.000000)),(InVal=1.000000)))
         EulerTrack=(Points=((OutVal=(X=360.000000,Y=0.000000,Z=0.000000)),(InVal=0.500000,OutVal=(X=180.000000,Y=0.000000,Z=0.000000),ArriveTangent=(X=-360.000000,Y=0.000000,Z=0.000000),LeaveTangent=(X=-360.000000,Y=0.000000,Z=0.000000)),(InVal=1.000000)))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2.InterpTrackMove_2'
      GroupName="TailRotor"
      GroupColor=(B=131,G=200,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=-0.000122,Y=0.000977,Z=0.000000)),(InVal=0.500000,OutVal=(X=-0.000122,Y=0.000977,Z=0.000000)),(InVal=1.000000,OutVal=(X=0.007446,Y=0.000000,Z=0.000000))))
         EulerTrack=(Points=(,(InVal=0.500000,OutVal=(X=0.000000,Y=0.000000,Z=180.000000)),(InVal=1.000000,OutVal=(X=0.000000,Y=0.000000,Z=360.000000))))
         LookupTrack=(Points=(,(Time=0.500000),(Time=1.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0.InterpTrackMove_0'
      GroupName="MainRotor"
      GroupColor=(B=140,G=194,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_9.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6928
   ObjPosY=4712
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_9"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_9
   PlayRate=4.000000
   bLooping=True
   InputLinks(0)=(DrawY=4534,OverrideDelta=15)
   InputLinks(1)=(DrawY=4556,OverrideDelta=37)
   InputLinks(2)=(DrawY=4578,OverrideDelta=59)
   InputLinks(3)=(DrawY=4600,OverrideDelta=81)
   InputLinks(4)=(DrawY=4622,OverrideDelta=103)
   OutputLinks(0)=(DrawY=4550,OverrideDelta=31)
   OutputLinks(1)=(DrawY=4606,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_9'),DrawX=-6889,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),LinkDesc="MainRotor",MinVars=0,DrawX=-6840,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),LinkDesc="TailRotor",MinVars=0,DrawX=-6789,OverrideDelta=114)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=4496
   DrawWidth=165
   DrawHeight=173
   Name="SeqAct_Interp_9"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_21
   VarName="FinalSequence"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9048
   ObjPosY=2784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_21"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=2618,ActivateDelay=0.100000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2618,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=-9062,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_10'),DrawX=-9006,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=2584
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="FinalSequence"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9016
   ObjPosY=2696
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_10"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=2696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_3"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
   Duration=3.000000
   InputLinks(0)=(DrawY=4845,OverrideDelta=14)
   InputLinks(1)=(DrawY=4866,OverrideDelta=35)
   InputLinks(2)=(DrawY=4887,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=4850,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4882,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7548,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7600
   ObjPosY=4808
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_7"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_6
   Duration=0.200000
   InputLinks(0)=(DrawY=4973,OverrideDelta=14)
   InputLinks(1)=(DrawY=4994,OverrideDelta=35)
   InputLinks(2)=(DrawY=5015,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38',InputLinkIdx=1)),DrawY=4978,OverrideDelta=19)
   OutputLinks(1)=(DrawY=5010,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8020,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=4936
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_6"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_170
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8000
   ObjPosY=5160
   ObjComment="Lower Light"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_170"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8096
   ObjPosY=5160
   ObjComment="Lower Light"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=4957,OverrideDelta=14)
   InputLinks(1)=(DrawY=4978,OverrideDelta=35)
   InputLinks(2)=(DrawY=4999,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7')),DrawY=4978,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170'),DrawX=-7810,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7759,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7710,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=4920
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=4965,OverrideDelta=14)
   InputLinks(1)=(DrawY=4986,OverrideDelta=35)
   InputLinks(2)=(DrawY=5007,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_6')),DrawY=4986,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_170'),DrawX=-8322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=4928
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=3.000000
   InputLinks(0)=(DrawY=4421,OverrideDelta=14)
   InputLinks(1)=(DrawY=4442,OverrideDelta=35)
   InputLinks(2)=(DrawY=4463,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_64')),DrawY=4426,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4458,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8484,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=4384
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_30
   EventName="helicopter"
   MaxWidth=182
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37'),(LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=4834,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9021,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9112
   ObjPosY=4768
   ObjComment="Helicopter"
   DrawWidth=111
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_30"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=PointLightMovable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightMovable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7984
   ObjPosY=4696
   ObjComment="Tail Light"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_130'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8088
   ObjPosY=4696
   ObjComment="Tail Light"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=4541,OverrideDelta=14)
   InputLinks(1)=(DrawY=4562,OverrideDelta=35)
   InputLinks(2)=(DrawY=4583,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=4562,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137'),DrawX=-7826,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7775,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7726,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=4504
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=0.200000
   InputLinks(0)=(DrawY=4549,OverrideDelta=14)
   InputLinks(1)=(DrawY=4570,OverrideDelta=35)
   InputLinks(2)=(DrawY=4591,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36',InputLinkIdx=1)),DrawY=4554,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4586,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8028,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8080
   ObjPosY=4512
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_64
   InputLinks(0)=(DrawY=4557,OverrideDelta=14)
   InputLinks(1)=(DrawY=4578,OverrideDelta=35)
   InputLinks(2)=(DrawY=4599,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3')),DrawY=4578,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137'),DrawX=-8306,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8255,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8206,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8344
   ObjPosY=4520
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_64"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=5059
   SizeY=2634
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9336
   ObjPosY=4328
   ObjComment="Helicopter"
   DrawWidth=5059
   DrawHeight=2634
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   bRewindOnPlay=True
   bForceStartPos=True
   InputLinks(0)=(DrawY=5414,OverrideDelta=15)
   InputLinks(1)=(DrawY=5436,OverrideDelta=37)
   InputLinks(2)=(DrawY=5458,OverrideDelta=59)
   InputLinks(3)=(DrawY=5480,OverrideDelta=81)
   InputLinks(4)=(DrawY=5502,OverrideDelta=103)
   OutputLinks(0)=(DrawY=5416,OverrideDelta=17)
   OutputLinks(1)=(DrawY=5444,OverrideDelta=45)
   OutputLinks(2)=(Links=((LinkedOp=SeqCond_CompareBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),LinkDesc="Hover?",DrawY=5472,OverrideDelta=73)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8'),(LinkedOp=SeqAct_CameraFade'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraFade_0')),LinkDesc="DoorClose",DrawY=5500,OverrideDelta=101)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=-8169,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_167'),LinkDesc="Helicopter",MinVars=0,DrawX=-8104,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_169'),LinkDesc="HelicopterDoor",MinVars=0,DrawX=-8022,OverrideDelta=145)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_10'),LinkDesc="ForceStartPosition",PropertyName="ForceStartPosition",MinVars=0,DrawX=-7931,OverrideDelta=227)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=5376
   DrawWidth=328
   DrawHeight=173
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InVal=33.000000,OutVal=(X=-0.000488,Y=624.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=34.000000,OutVal=(X=-0.000977,Y=466.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InVal=33.000000,InterpMode=CIM_CurveAutoClamped),(InVal=34.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=((Time=33.000000),(Time=34.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_1.InterpTrackMove_0'
      GroupName="HelicopterDoor"
      GroupColor=(B=0,G=212,R=109,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((OutVal=(X=0.000977,Y=0.000000,Z=-0.000488),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=2625.811035,Y=-3734.190430,Z=1661.241455),ArriveTangent=(X=873.905701,Y=-1275.187622,Z=0.000000),LeaveTangent=(X=873.905701,Y=-1275.187622,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=6117.340820,Y=-8926.313477,Z=443.679688),ArriveTangent=(X=1190.920776,Y=-1610.423584,Z=-332.719086),LeaveTangent=(X=1190.920776,Y=-1610.423584,Z=-332.719086),InterpMode=CIM_CurveAutoClamped),(InVal=7.900000,OutVal=(X=7270.402344,Y=-10277.009766,Z=188.224609),ArriveTangent=(X=1193.942505,Y=-1175.683594,Z=-82.940453),LeaveTangent=(X=1193.942505,Y=-1175.683594,Z=-82.940453),InterpMode=CIM_CurveUser),(InVal=8.700000,OutVal=(X=7943.531738,Y=-11310.874023,Z=188.479980),ArriveTangent=(X=412.741516,Y=-674.562439,Z=0.612640),LeaveTangent=(X=412.741516,Y=-674.562439,Z=0.612640),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=8343.530273,Y=-12030.872070,Z=348.480469),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,OutVal=(X=8095.133789,Y=-11512.191406,Z=188.804443),ArriveTangent=(X=0.000000,Y=0.000000,Z=-37.469612),LeaveTangent=(X=0.000000,Y=0.000000,Z=-37.469612),InterpMode=CIM_CurveAutoClamped),(InVal=16.000000,OutVal=(X=8098.407227,Y=-11512.198242,Z=130.787354),ArriveTangent=(X=0.000000,Y=0.000000,Z=-40.000305),LeaveTangent=(X=0.000000,Y=0.000000,Z=-40.000305),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=8095.141113,Y=-11512.196289,Z=28.803223),ArriveTangent=(X=-1.248535,Y=0.000977,Z=0.000000),LeaveTangent=(X=-1.248535,Y=0.000977,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,OutVal=(X=8093.413086,Y=-11512.194336,Z=145.443604),ArriveTangent=(X=0.000000,Y=0.001221,Z=36.589569),LeaveTangent=(X=0.000000,Y=0.001221,Z=36.589569),InterpMode=CIM_CurveAutoClamped),(InVal=22.000000,OutVal=(X=8095.133789,Y=-11512.191406,Z=188.804443),InterpMode=CIM_CurveAutoClamped),(InVal=22.500000,OutVal=(X=8095.133789,Y=-11512.191406,Z=188.804443),InterpMode=CIM_CurveAutoClamped),(InVal=23.000000,OutVal=(X=7680.001953,Y=-10911.999023,Z=-1664.000732),InterpMode=CIM_CurveAutoClamped),(InVal=24.500000,OutVal=(X=7680.001953,Y=-10911.999023,Z=-1664.000732),InterpMode=CIM_CurveAutoClamped),(InVal=28.000000,OutVal=(X=7680.009277,Y=-11248.003906,Z=-944.002563),ArriveTangent=(X=0.000000,Y=-186.318680,Z=392.727020),LeaveTangent=(X=0.000000,Y=-186.318680,Z=392.727020),InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=(X=6656.009277,Y=-11952.003906,Z=495.997803),ArriveTangent=(X=-463.999908,Y=0.000000,Z=0.000000),LeaveTangent=(X=-463.999908,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=5360.009766,Y=-11456.004883,Z=-160.002441),ArriveTangent=(X=-629.332764,Y=303.642487,Z=-331.611816),LeaveTangent=(X=-629.332764,Y=303.642487,Z=-331.611816),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=2880.012695,Y=-9712.007813,Z=-1504.003784),ArriveTangent=(X=-579.555481,Y=643.340576,Z=0.000000),LeaveTangent=(X=-579.555481,Y=643.340576,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=144.010254,Y=-5600.003906,Z=-1152.003418),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=-11.491699,Y=11.008301,Z=31.442871),ArriveTangent=(X=-3.267648,Y=0.000000,Z=2.949445),LeaveTangent=(X=-3.267648,Y=0.000000,Z=2.949445),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=-22.873535,Y=6.877441,Z=36.101074),InterpMode=CIM_CurveAutoClamped),(InVal=7.900000,OutVal=(X=-6.459961,Y=18.852539,Z=34.562988),InterpMode=CIM_CurveUser),(InVal=8.700000,OutVal=(X=10.217285,Y=16.809082,Z=35.705566),ArriveTangent=(X=11.197604,Y=-1.994441,Z=0.000000),LeaveTangent=(X=11.197604,Y=-1.994441,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=22.653809,Y=13.666992,Z=21.555176),ArriveTangent=(X=0.000000,Y=-2.546039,Z=-6.736899),LeaveTangent=(X=0.000000,Y=-2.546039,Z=-6.736899),InterpMode=CIM_CurveAutoClamped),(InVal=14.000000,ArriveTangent=(X=-0.045839,Y=0.000000,Z=-0.045833),LeaveTangent=(X=-0.045839,Y=0.000000,Z=-0.045833),InterpMode=CIM_CurveAutoClamped),(InVal=16.000000,OutVal=(X=-0.043945,Y=2.790527,Z=-0.043945),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=2.812500,Y=0.000000,Z=0.000000),ArriveTangent=(X=0.000000,Y=-2.100887,Z=0.000000),LeaveTangent=(X=0.000000,Y=-2.100887,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=20.000000,OutVal=(X=0.000000,Y=-5.625000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=22.000000,InterpMode=CIM_CurveAutoClamped),(InVal=22.500000,InterpMode=CIM_CurveAutoClamped),(InVal=23.000000,InterpMode=CIM_CurveAutoClamped),(InVal=24.500000,InterpMode=CIM_CurveAutoClamped),(InVal=28.000000,OutVal=(X=-11.755371,Y=16.523438,Z=-3.405762),ArriveTangent=(X=0.000000,Y=3.836401,Z=-2.538510),LeaveTangent=(X=0.000000,Y=3.836401,Z=-2.538510),InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=(X=-0.065918,Y=22.412109,Z=-33.837891),ArriveTangent=(X=0.000000,Y=0.000000,Z=-21.966108),LeaveTangent=(X=0.000000,Y=0.000000,Z=-21.966108),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=-28.081055,Y=-0.241699,Z=-124.035645),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.301057),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.301057),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=-11.206055,Y=-0.065918,Z=-140.712891),ArriveTangent=(X=3.120117,Y=0.023983,Z=0.000000),LeaveTangent=(X=3.120117,Y=0.023983,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=0.000000,Y=0.000000,Z=-140.625000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=4.000000),(Time=7.000000),(Time=7.900000),(Time=8.700000),(Time=10.500000),(Time=14.000000),(Time=16.000000),(Time=18.000000),(Time=20.000000),(Time=22.000000),(Time=22.500000),(Time=23.000000),(Time=24.500000),(Time=28.000000),(Time=30.000000),(Time=33.000000),(Time=36.000000),(Time=42.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_1
         EventTrack(0)=(Time=22.000000,EventName="Hover?")
         EventTrack(1)=(Time=33.000000,EventName="DoorClose")
         bFireEventsWhenJumpingForwards=True
         Name="InterpTrackEvent_1"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_2
         AkEvents(0)=(Time=23.995918,Event=AkEvent'WW_ENV_Zed_Landing.Stop_ZedLanding_OBJ_Heli_Exterior')
         AkEvents(1)=(Time=41.926506,Event=AkEvent'WW_ENV_Zed_Landing.Stop_ZedLanding_OBJ_Heli_Interior')
         Name="InterpTrackAkEvent_2"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      Begin Object Class=InterpTrackAkEvent Name=InterpTrackAkEvent_1
         AkEvents(0)=(Time=0.024691,Event=AkEvent'WW_ENV_Zed_Landing.Play_ZedLanding_OBJ_Heli_Interior')
         AkEvents(1)=(Time=23.995918,Event=AkEvent'WW_ENV_Zed_Landing.Play_ZedLanding_OBJ_Heli_Interior')
         Name="InterpTrackAkEvent_1"
         ObjectArchetype=InterpTrackAkEvent'AkAudio.Default__InterpTrackAkEvent'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackEvent_1'
      InterpTracks(2)=InterpTrackAkEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackAkEvent_1'
      InterpTracks(3)=InterpTrackAkEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackAkEvent_2'
      GroupName="helicopter"
      GroupColor=(B=0,G=109,R=212,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=42.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=42.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=5600
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_167
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8112
   ObjPosY=5600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_167"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_73
   Duration=6.000000
   InputLinks(0)=(DrawY=5981,OverrideDelta=14)
   InputLinks(1)=(DrawY=6002,OverrideDelta=35)
   InputLinks(2)=(DrawY=6023,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_MovePawnsNotInVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_MovePawnsNotInVolume_0'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_63')),DrawY=5986,OverrideDelta=19)
   OutputLinks(1)=(DrawY=6018,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8804,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=5944
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_73"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=1820
   SizeY=1671
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9520
   ObjPosY=1528
   ObjComment="End Camera"
   DrawWidth=1820
   DrawHeight=1671
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_32
   EventName="FinalCinematic"
   MaxWidth=211
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=2602,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9287,OverrideDelta=73)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=2536
   ObjComment="FinalCinematic"
   DrawWidth=125
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_32"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_39
   VarName="AllPlayersDead"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=2208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_39"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_9
   InputLinks(0)=(DrawY=2234,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2234,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_32'),DrawX=-8990,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_28'),DrawX=-8934,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=2200
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_9"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_28
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="AllPlayersDead"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8944
   ObjPosY=2312
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_28"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_32
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=2312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_32"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=KFSeqEvent_PlayerDied Name=KFSeqEvent_PlayerDied_0
   MaxWidth=120
   OutputLinks(0)=(DrawY=2244,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_9')),DrawY=2264,OverrideDelta=33)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9272
   ObjPosY=2176
   DrawWidth=121
   Name="KFSeqEvent_PlayerDied_0"
   ObjectArchetype=KFSeqEvent_PlayerDied'KFGame.Default__KFSeqEvent_PlayerDied'
End Object

Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_0
   Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      OscillationDuration=20.000000
      RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
      Name="CameraShake_0"
      ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   End Object
   Shake=CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0.CameraShake_0'
   ShakeScale=0.100000
   InputLinks(0)=(DrawY=6052,OverrideDelta=13)
   InputLinks(1)=(DrawY=6072,OverrideDelta=33)
   OutputLinks(0)=(DrawY=6062,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_4'),DrawX=-7978,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7912,OverrideDelta=76)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_RandomFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_0'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=-7848,OverrideDelta=148)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8016
   ObjPosY=6016
   DrawWidth=204
   DrawHeight=101
   Name="SeqAct_CameraShake_0"
   ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8024
   ObjPosY=6176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_4"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_0
   Min=0.250000
   Max=0.500000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7872
   ObjPosY=6160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_0"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=KFSeqAct_MovePawnsNotInVolume Name=KFSeqAct_MovePawnsNotInVolume_0
   bCheckOverlap=False
   bFadeIn=False
   InputLinks(0)=(DrawY=6074,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_CameraShake'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraShake_0'),(LinkedOp=SeqAct_CameraFade'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_CameraFade_2')),DrawY=6074,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_7'),DrawX=-8575,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159'),DrawX=-8518,OverrideDelta=67)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-8441,OverrideDelta=130)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=6040
   ObjComment="Move Players Away from Heli Landing Area"
   DrawWidth=220
   DrawHeight=77
   Name="KFSeqAct_MovePawnsNotInVolume_0"
   ObjectArchetype=KFSeqAct_MovePawnsNotInVolume'KFGame.Default__KFSeqAct_MovePawnsNotInVolume'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_7
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=6160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_7"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=TriggerVolume'KF-ZEDLANDING.TheWorld:PersistentLevel.TriggerVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8512
   ObjPosY=6160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=KFPathnode'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPathnode_122'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8384
   ObjPosY=6168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Gate Name=SeqAct_Gate_2
   bOpen=False
   AutoCloseCount=1
   CurrentCloseCount=1
   InputLinks(0)=(DrawY=1813,OverrideDelta=14)
   InputLinks(1)=(DrawY=1835,OverrideDelta=36)
   InputLinks(2)=(DrawY=1857,OverrideDelta=58)
   InputLinks(3)=(DrawY=1879,OverrideDelta=80)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_4')),DrawY=1846,OverrideDelta=47)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8888
   ObjPosY=1776
   DrawWidth=82
   DrawHeight=117
   Name="SeqAct_Gate_2"
   ObjectArchetype=SeqAct_Gate'Engine.Default__SeqAct_Gate'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_2')),ActivateDelay=0.200000,DrawY=1948,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_2')),ActivateDelay=0.200000,DrawY=1968,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9261,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9200,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-9119,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=1880
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_0"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=KFSeqEvent_MapObjectiveActivated Name=KFSeqEvent_MapObjectiveActivated_8
   Originator=KFMapObjective_ExterminateWave'KF-ZEDLANDING.TheWorld:PersistentLevel.KFMapObjective_ExterminateWave_0'
   MaxWidth=424
   OutputLinks(0)=(DrawY=1700,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_2',InputLinkIdx=1)),DrawY=1720,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9156,OverrideDelta=180)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9368
   ObjPosY=1632
   ObjName="KFMapObjective_ExterminateWave_0 Map Objective Activated"
   DrawWidth=260
   DrawHeight=152
   Name="KFSeqEvent_MapObjectiveActivated_8"
   ObjectArchetype=KFSeqEvent_MapObjectiveActivated'KFGame.Default__KFSeqEvent_MapObjectiveActivated'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_19
   EventName="FinalCinematic"
   InputLinks(0)=(DrawY=1754,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1754,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8256,OverrideDelta=104)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8392
   ObjPosY=1720
   ObjComment="FinalCinematic"
   DrawWidth=272
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_19"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_4
   InputLinks(0)=(DrawY=1726,OverrideDelta=23)
   OutputLinks(0)=(DrawY=1716,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_19')),DrawY=1736,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_34'),DrawX=-8579,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=-8529,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8608
   ObjPosY=1680
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_4"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=1808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="AllPlayersDead"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8624
   ObjPosY=1808
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_34"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_9
   EventName="helicopter"
   InputLinks(0)=(DrawY=-998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5585,OverrideDelta=89)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5464
   ObjPosY=-1032
   ObjComment="Helicopter"
   DrawWidth=243
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_9"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=KFSeqAct_SetScriptedPawnSpeed Name=KFSeqAct_SetScriptedPawnSpeed_1
   InputLinks(0)=(DrawY=-2078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2078,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_451'),DrawX=-2975,OverrideDelta=67)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3064
   ObjPosY=-2112
   DrawWidth=179
   DrawHeight=61
   Name="KFSeqAct_SetScriptedPawnSpeed_1"
   ObjectArchetype=KFSeqAct_SetScriptedPawnSpeed'kfgamecontent.Default__KFSeqAct_SetScriptedPawnSpeed'
End Object

Begin Object Class=KFSeqAct_SetScriptedPawnSpeed Name=KFSeqAct_SetScriptedPawnSpeed_0
   InputLinks(0)=(DrawY=-5574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5574,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=3273,OverrideDelta=67)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3184
   ObjPosY=-5608
   DrawWidth=179
   DrawHeight=61
   Name="KFSeqAct_SetScriptedPawnSpeed_0"
   ObjectArchetype=KFSeqAct_SetScriptedPawnSpeed'kfgamecontent.Default__KFSeqAct_SetScriptedPawnSpeed'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_169
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8000
   ObjPosY=5600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_169"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_CameraFade Name=SeqAct_CameraFade_1
   FadeTime=2.000000
   InputLinks(0)=(DrawY=5846,OverrideDelta=23)
   OutputLinks(0)=(DrawY=5836,OverrideDelta=13)
   OutputLinks(1)=(DrawY=5856,OverrideDelta=33)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=5800
   ObjComment="Fade Out"
   DrawWidth=80
   DrawHeight=69
   Name="SeqAct_CameraFade_1"
   ObjectArchetype=SeqAct_CameraFade'Engine.Default__SeqAct_CameraFade'
End Object

Begin Object Class=SeqAct_CameraFade Name=SeqAct_CameraFade_2
   FadeOpacity=0.000000
   FadeTime=3.000000
   InputLinks(0)=(DrawY=5966,OverrideDelta=23)
   OutputLinks(0)=(DrawY=5956,OverrideDelta=13)
   OutputLinks(1)=(DrawY=5976,OverrideDelta=33)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8224
   ObjPosY=5920
   ObjComment="Fade In"
   DrawWidth=80
   DrawHeight=69
   Name="SeqAct_CameraFade_2"
   ObjectArchetype=SeqAct_CameraFade'Engine.Default__SeqAct_CameraFade'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   InputLinks(0)=(DrawY=6358,OverrideDelta=15)
   InputLinks(1)=(DrawY=6380,OverrideDelta=37)
   InputLinks(2)=(DrawY=6402,OverrideDelta=59)
   InputLinks(3)=(DrawY=6424,OverrideDelta=81)
   InputLinks(4)=(DrawY=6446,OverrideDelta=103)
   OutputLinks(0)=(DrawY=6374,OverrideDelta=31)
   OutputLinks(1)=(DrawY=6430,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-7928,OverrideDelta=17)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90'),LinkDesc="CamTrack_Main",MinVars=0,DrawX=-7860,OverrideDelta=64)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=6320
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="CamTrack_Main",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=203,G=126,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackEvent Name=InterpTrackEvent_0
         Name="InterpTrackEvent_0"
         ObjectArchetype=InterpTrackEvent'Engine.Default__InterpTrackEvent'
      End Object
      InterpTracks(0)=InterpTrackEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackEvent_0'
      GroupName="CamTrack_Main"
      GroupColor=(B=0,G=109,R=212,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=40.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=40.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=6528
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=CameraActor'KF-ZEDLANDING.TheWorld:PersistentLevel.CameraActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=6528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_10
   VarName="StartTime"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=5592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_10"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_9
   InputLinks(0)=(DrawY=5498,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),ActivateDelay=4.000000,DrawY=5498,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_6'),DrawX=-8558,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_35'),DrawX=-8502,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=5464
   ObjComment="Set Matinee to skip to Ending Sequence"
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_9"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_6
   FloatValue=23.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=5560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_6"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_CameraFade Name=SeqAct_CameraFade_0
   FadeTime=2.000000
   InputLinks(0)=(DrawY=5710,ActivateDelay=3.000000,OverrideDelta=23)
   OutputLinks(0)=(DrawY=5700,OverrideDelta=13)
   OutputLinks(1)=(DrawY=5720,OverrideDelta=33)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7592
   ObjPosY=5664
   ObjComment="Fade Out"
   DrawWidth=80
   DrawHeight=69
   Name="SeqAct_CameraFade_0"
   ObjectArchetype=SeqAct_CameraFade'Engine.Default__SeqAct_CameraFade'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=1853
   SizeY=674
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=4464
   ObjComment="Swaying Foliage"
   DrawWidth=1853
   DrawHeight=674
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_29
   EventName="helicopter"
   MaxWidth=182
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_20')),DrawY=4698,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6157,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6248
   ObjPosY=4632
   ObjComment="Helicopter"
   DrawWidth=111
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_29"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_20
   Duration=6.000000
   InputLinks(0)=(DrawY=4621,OverrideDelta=14)
   InputLinks(1)=(DrawY=4642,OverrideDelta=35)
   InputLinks(2)=(DrawY=4663,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_11'),(LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=4626,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4658,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5764,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5816
   ObjPosY=4584
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_20"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_11
   InputLinks(0)=(DrawY=4686,OverrideDelta=15)
   InputLinks(1)=(DrawY=4708,OverrideDelta=37)
   InputLinks(2)=(DrawY=4730,OverrideDelta=59)
   InputLinks(3)=(DrawY=4752,OverrideDelta=81)
   InputLinks(4)=(DrawY=4774,OverrideDelta=103)
   OutputLinks(0)=(DrawY=4702,OverrideDelta=31)
   OutputLinks(1)=(DrawY=4758,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11'),DrawX=-5193,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146'),LinkDesc="Bamboo",MinVars=0,DrawX=-5136,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),LinkDesc="Trees",MinVars=0,DrawX=-5076,OverrideDelta=130)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_149'),LinkDesc="Grass",MinVars=0,DrawX=-5023,OverrideDelta=183)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147'),LinkDesc="Ferns",MinVars=0,DrawX=-4971,OverrideDelta=235)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=4648
   DrawWidth=287
   DrawHeight=157
   Name="SeqAct_Interp_11"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_11
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_4
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_JungleTreeSwaying_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1686.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1969.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1042.StaticMeshComponent_368',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1799.StaticMeshComponent_415',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_80.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1958.StaticMeshComponent_484',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1812.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_459.StaticMeshComponent_392',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_473.StaticMeshComponent_394',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_710.StaticMeshComponent_398',MaterialIndex=1)))
         Materials(1)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_Bamboo_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1957.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1765.StaticMeshComponent_390'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2011.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1798.StaticMeshComponent_414'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_77.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1945.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_136.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2062.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2051.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2057.StaticMeshComponent_679'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_239.StaticMeshComponent_359')))
         Materials(2)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_FernsSwaying_MIC')
         ParamName="Scalar_Wind_Alpha_Speed"
         FloatTrack=(Points=((InVal=0.900000,InterpMode=CIM_CurveAutoClamped),(InVal=0.910000,OutVal=1.500000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_4"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_7.InterpTrackFloatMaterialParam_4'
      GroupName="Ferns"
      GroupColor=(B=74,G=224,R=0,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_4
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_JungleTreeSwaying_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1686.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1969.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1042.StaticMeshComponent_368',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1799.StaticMeshComponent_415',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_80.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1958.StaticMeshComponent_484',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1812.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_459.StaticMeshComponent_392',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_473.StaticMeshComponent_394',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_710.StaticMeshComponent_398',MaterialIndex=1)))
         Materials(1)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_Bamboo_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1957.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1765.StaticMeshComponent_390'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2011.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1798.StaticMeshComponent_414'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_77.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1945.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_136.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2062.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2051.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2057.StaticMeshComponent_679'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_239.StaticMeshComponent_359')))
         Materials(2)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_GrassSwaying_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2063.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2013.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2017.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2018.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2020.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2015.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2021.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2022.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1881.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1448.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2049.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1307.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1294.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2016.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1244.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1247.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1248.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1250.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1251.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1252.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2146.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1255.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1256.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1257.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1258.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2065.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1260.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1261.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1262.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1265.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1253.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1266.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1267.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1268.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1269.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1270.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1295.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1296.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1297.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1298.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1302.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1303.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1304.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1305.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1229.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1309.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1310.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1312.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1318.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1490.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2042.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2207.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2249.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2262.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1748.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2344.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1751.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1377.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2367.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2430.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1402.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1640.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1644.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1653.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1667.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1669.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1670.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1674.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1712.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1713.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1714.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1723.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1726.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1731.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1759.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1747.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1342.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1634.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1750.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1547.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2461.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1746.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1882.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1952.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1960.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1968.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2024.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1450.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1451.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1452.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1454.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1455.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1456.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1457.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_988.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1495.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1465.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1466.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1492.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1468.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1469.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1471.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1472.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1473.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1489.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1485.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1487.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2066.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1491.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1321.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_3187.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1467.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1496.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1499.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1500.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2121.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2184.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1464.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2134.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2137.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2179.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2132.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1635.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1254.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2188.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2187.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1507.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1749.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2181.StaticMeshComponent_557'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1493.StaticMeshComponent_557')))
         ParamName="Scalar_Wind_Alpha_Speed"
         FloatTrack=(Points=((InVal=0.600000,InterpMode=CIM_CurveAutoClamped),(InVal=0.610000,OutVal=1.500000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_4"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_6.InterpTrackFloatMaterialParam_4'
      GroupName="Grass"
      GroupColor=(B=0,G=197,R=136,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_4
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_JungleTreeSwaying_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1686.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1969.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1042.StaticMeshComponent_368',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1799.StaticMeshComponent_415',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_80.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1958.StaticMeshComponent_484',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1812.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_459.StaticMeshComponent_392',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_473.StaticMeshComponent_394',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_710.StaticMeshComponent_398',MaterialIndex=1)))
         Materials(1)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_Bamboo_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1957.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1765.StaticMeshComponent_390'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2011.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1798.StaticMeshComponent_414'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_77.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1945.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_136.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2062.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2051.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2057.StaticMeshComponent_679'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_239.StaticMeshComponent_359')))
         ParamName="Scalar_Wind_Alpha_Speed"
         FloatTrack=(Points=((InVal=0.300000,InterpMode=CIM_CurveAutoClamped),(InVal=0.310000,OutVal=1.500000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_4"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_5.InterpTrackFloatMaterialParam_4'
      GroupName="Trees"
      GroupColor=(B=0,G=197,R=136,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_2
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_Bamboo_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1957.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1765.StaticMeshComponent_390'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2011.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1798.StaticMeshComponent_414'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_77.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1945.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_136.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2062.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2051.StaticMeshComponent_359'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_2057.StaticMeshComponent_679'),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_239.StaticMeshComponent_359')))
         Materials(1)=(TargetMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.Env_ZedLanding_JungleTreeSwaying_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1686.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1969.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1042.StaticMeshComponent_368',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1799.StaticMeshComponent_415',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_80.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1958.StaticMeshComponent_484',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_1812.StaticMeshComponent_304',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_459.StaticMeshComponent_392',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_473.StaticMeshComponent_394',MaterialIndex=1),(Primitive=StaticMeshComponent'KF-ZEDLANDING.TheWorld:PersistentLevel.StaticMeshActor_710.StaticMeshComponent_398',MaterialIndex=1)))
         ParamName="Scalar_Wind_Alpha_Speed"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.010000,OutVal=1.500000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_2"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_0.InterpTrackFloatMaterialParam_2'
      GroupName="Bamboo"
      GroupColor=(B=210,G=0,R=115,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_5'
   InterpGroups(2)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_6'
   InterpGroups(3)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpGroup_7'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_11.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5224
   ObjPosY=4848
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_11"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=MaterialInstanceActor'KF-ZEDLANDING.TheWorld:PersistentLevel.MaterialInstanceActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5064
   ObjPosY=4896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=MaterialInstanceActor'KF-ZEDLANDING.TheWorld:PersistentLevel.MaterialInstanceActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5144
   ObjPosY=4904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=MaterialInstanceActor'KF-ZEDLANDING.TheWorld:PersistentLevel.MaterialInstanceActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=4840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_149
   ObjValue=MaterialInstanceActor'KF-ZEDLANDING.TheWorld:PersistentLevel.MaterialInstanceActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4968
   ObjPosY=4872
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_149"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=2683
   SizeY=1437
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1256
   ObjPosY=-600
   ObjComment="Button"
   DrawWidth=2683
   DrawHeight=1437
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=1138
   SizeY=729
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-416
   ObjPosY=-1088
   ObjComment="Zone Status"
   DrawWidth=1138
   DrawHeight=729
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=1712
   SizeY=954
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-648
   ObjPosY=-2360
   ObjComment="Setup"
   DrawWidth=1712
   DrawHeight=954
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_6
   InputLinks(0)=(DrawY=418,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_59')),DrawY=418,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_15'),DrawX=2194,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_8'),DrawX=2250,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2160
   ObjPosY=384
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_6"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Lever1Active"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2232
   ObjPosY=496
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_8"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_15
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_15"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_12
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=-120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_12"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Lever1Active"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=-120
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_7"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_5
   InputLinks(0)=(DrawY=-198,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_5')),DrawY=-198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_12'),DrawX=1858,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_7'),DrawX=1914,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1824
   ObjPosY=-232
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_5"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_11
   VarName="Lever1Active"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1584
   ObjPosY=160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_11"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="Lever1Active"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2104
   ObjPosY=-304
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_6"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_10
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2192
   ObjPosY=-304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_10"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_5
   InputLinks(0)=(DrawY=-370,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=-380,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-360,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_6'),DrawX=2157,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_10'),DrawX=2207,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2128
   ObjPosY=-416
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_5"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_Gate Name=SeqAct_Gate_5
   InputLinks(0)=(DrawY=-43,OverrideDelta=14)
   InputLinks(1)=(DrawY=-21,OverrideDelta=36)
   InputLinks(2)=(DrawY=1,OverrideDelta=58)
   InputLinks(3)=(DrawY=23,OverrideDelta=80)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35')),DrawY=-10,OverrideDelta=47)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2272
   ObjPosY=-80
   DrawWidth=82
   DrawHeight=117
   Name="SeqAct_Gate_5"
   ObjectArchetype=SeqAct_Gate'Engine.Default__SeqAct_Gate'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_176
   ObjValue=TargetPoint'KF-ZEDLANDING.TheWorld:PersistentLevel.TargetPoint_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1600
   ObjPosY=16
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_176"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_ObjectiveMode.Play_ObjectiveMode_Console_Ready'
   InputLinks(0)=(DrawY=-30,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-30,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_176'),DrawX=1640,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1592
   ObjPosY=-64
   ObjComment="Lever Ready"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=133,OverrideDelta=14)
   InputLinks(1)=(DrawY=154,OverrideDelta=35)
   InputLinks(2)=(DrawY=175,OverrideDelta=56)
   OutputLinks(0)=(DrawY=154,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=2710,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2761,OverrideDelta=76)
   EventLinks(0)=(DrawX=2810,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=96
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2696
   ObjPosY=256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_41
   EventName="ZoneDisabled1"
   MaxWidth=212
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_5',InputLinkIdx=2),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35',InputLinkIdx=1)),DrawY=258,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2010,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1904
   ObjPosY=192
   ObjComment="ZoneDisabled1"
   DrawWidth=126
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_41"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_40
   EventName="ZoneEnabled1"
   MaxWidth=209
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_5'),(LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_5',InputLinkIdx=1)),DrawY=-422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1856,OverrideDelta=72)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1752
   ObjPosY=-488
   ObjComment="ZoneEnabled1"
   DrawWidth=124
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_40"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_33
   EventName="Obj7Deactivated"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Gate'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Gate_5',InputLinkIdx=2),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35',InputLinkIdx=1)),ActivateDelay=0.100000,DrawY=74,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1913,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1800
   ObjPosY=8
   ObjComment="Obj7Deactivated"
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_33"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_38
   EventName="LeverReady1"
   MaxWidth=201
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_10'),(LinkedOp=SeqAct_SetBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_5')),DrawY=-174,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1644,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1544
   ObjPosY=-240
   ObjComment="LeverReady1"
   DrawWidth=120
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_38"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_37
   EventName="LeverPulled1"
   MaxWidth=199
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_6')),DrawY=522,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1907,OverrideDelta=67)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1808
   ObjPosY=456
   ObjComment="LeverPulled1"
   DrawWidth=119
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_37"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_10
   LinkCount=5
   bAutoDisableLinks=True
   InputLinks(0)=(DrawY=34,OverrideDelta=59)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),DrawY=-10,OverrideDelta=15)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),LinkDesc="Link 2",DrawY=12,OverrideDelta=37)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),LinkDesc="Link 3",DrawY=34,OverrideDelta=59)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),LinkDesc="Link 4",DrawY=56,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),LinkDesc="Link 5",DrawY=78,OverrideDelta=103)
   VariableLinks(0)=(DrawX=1474,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1440
   ObjPosY=-48
   DrawWidth=68
   DrawHeight=157
   Name="SeqAct_Switch_10"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   bReplicateToClients=True
   Event=AkEvent'WW_VOX_OBJ_ZedLanding.Play_VOX_OBJ_ZedLanding_Ending_Outro'
   InputLinks(0)=(DrawY=5658,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5658,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8928,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8976
   ObjPosY=5624
   ObjComment="VO"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZedLanding_OBJ_Heli_Door_Close'
   InputLinks(0)=(DrawY=5634,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5634,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_168'),DrawX=-7392,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=5600
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_168
   ObjValue=TargetPoint'KF-ZEDLANDING.TheWorld:PersistentLevel.TargetPoint_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=5736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_168"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_RestartScriptedPawn Name=KFSeqAct_RestartScriptedPawn_0
   InputLinks(0)=(DrawY=-2066,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetScriptedPawnSpeed'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetScriptedPawnSpeed_1')),DrawY=-2076,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-2056,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),DrawX=-3767,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_451'),DrawX=-3573,OverrideDelta=210)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_3'),DrawX=-3408,OverrideDelta=404)
   VariableLinks(3)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_15'),DrawX=-3261,OverrideDelta=540)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3872
   ObjPosY=-2112
   DrawWidth=699
   DrawHeight=101
   Name="KFSeqAct_RestartScriptedPawn_0"
   ObjectArchetype=KFSeqAct_RestartScriptedPawn'KFGame.Default__KFSeqAct_RestartScriptedPawn'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=KFScriptedPawnSpawner'KF-ZEDLANDING.TheWorld:PersistentLevel.KFScriptedPawnSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3808
   ObjPosY=-1936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_15
   FloatValue=400.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3272
   ObjPosY=-1944
   ObjComment="Health"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_15"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_3
   FloatValue=400.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3432
   ObjPosY=-1936
   ObjComment="Health"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_3"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-2459,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2438,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2417,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2438,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-8466,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8415,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8366,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8504
   ObjPosY=-2496
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPickupFactory_Ammo'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPickupFactory_Ammo_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8552
   ObjPosY=-2328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFPickupFactory_Ammo'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPickupFactory_Ammo_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8456
   ObjPosY=-2328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=-2275,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2254,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2233,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2254,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134'),DrawX=374,OverrideDelta=16)
   VariableLinks(1)=(DrawX=425,OverrideDelta=76)
   EventLinks(0)=(DrawX=474,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=336
   ObjPosY=-2312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFPickupFactory_Ammo'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPickupFactory_Ammo_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=320
   ObjPosY=-2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=KFPickupFactory_Ammo'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPickupFactory_Ammo_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=416
   ObjPosY=-2160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZedLanding_OBJ_Vegetation_rustle'
   InputLinks(0)=(DrawY=4762,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4762,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5520,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5568
   ObjPosY=4728
   ObjComment="Vegetation Rustle"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=0.100000
   InputLinks(0)=(DrawY=541,OverrideDelta=14)
   InputLinks(1)=(DrawY=562,OverrideDelta=35)
   InputLinks(2)=(DrawY=583,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_60',InputLinkIdx=1)),DrawY=546,OverrideDelta=19)
   OutputLinks(1)=(DrawY=578,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2956,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2904
   ObjPosY=504
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_2
   InputLinks(0)=(DrawY=2582,OverrideDelta=23)
   OutputLinks(0)=(DrawY=2572,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=2592,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_11'),DrawX=1301,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=1351,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1272
   ObjPosY=2536
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_2"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1344
   ObjPosY=2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_4"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_11
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1257
   ObjPosY=2664
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_11"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=-5955,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5934,ActivateDelay=12.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5913,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5934,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),DrawX=6470,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6521,OverrideDelta=76)
   EventLinks(0)=(DrawX=6570,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=-5992
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6432
   ObjPosY=-5832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-2000
   ObjComment="Data Terminal Light"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=-2131,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2110,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2089,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2110,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),DrawX=-8442,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8391,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8342,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-2168
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_12
   FloatValue=14.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=5360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_12"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_10
   InputLinks(0)=(DrawY=5298,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),ActivateDelay=0.100000,DrawY=5298,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_12'),DrawX=-7406,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_2'),DrawX=-7350,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7440
   ObjPosY=5264
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_10"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_278
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-120
   ObjPosY=-8736
   ObjComment="Trader Pods"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_278"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_277
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-48
   ObjPosY=-8736
   ObjComment="Trader Pods"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_277"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_276
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-288
   ObjPosY=-8736
   ObjComment="Trader Pods"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_276"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_275
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-200
   ObjPosY=-8736
   ObjComment="Trader Pods"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_275"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   NewMaterial=MaterialInstanceConstant'ENV_Trader_MAT.Env_Trader_Damage_MIC'
   InputLinks(0)=(DrawY=-8838,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_5',InputLinkIdx=1)),DrawY=-8838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_275',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_276',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_278',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_277'),DrawX=-83,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=-8872
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_Switch Name=SeqAct_Switch_1
   LinkCount=5
   bAutoDisableLinks=True
   InputLinks(0)=(DrawY=2202,OverrideDelta=59)
   OutputLinks(0)=(DrawY=2158,OverrideDelta=15)
   OutputLinks(1)=(LinkDesc="Link 2",DrawY=2180,OverrideDelta=37)
   OutputLinks(2)=(LinkDesc="Link 3",DrawY=2202,OverrideDelta=59)
   OutputLinks(3)=(LinkDesc="Link 4",DrawY=2224,OverrideDelta=81)
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),LinkDesc="Link 5",ActivateDelay=5.000000,DrawY=2246,OverrideDelta=103)
   VariableLinks(0)=(DrawX=1890,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1856
   ObjPosY=2120
   DrawWidth=68
   DrawHeight=157
   Name="SeqAct_Switch_1"
   ObjectArchetype=SeqAct_Switch'Engine.Default__SeqAct_Switch'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_39
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="objective"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1656
   ObjPosY=2232
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_39"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_41
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1744
   ObjPosY=2232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_41"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_3
   InputLinks(0)=(DrawY=2150,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Switch'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Switch_1')),DrawY=2140,OverrideDelta=13)
   OutputLinks(1)=(DrawY=2160,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_39'),DrawX=1701,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_41'),DrawX=1751,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1672
   ObjPosY=2104
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_3"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="StartTime"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7352
   ObjPosY=5360
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="StartTime"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8496
   ObjPosY=5560
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_35"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="FinalSequence"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7720
   ObjPosY=5456
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_1"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_8
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7632
   ObjPosY=5464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_8"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=5374,OverrideDelta=23)
   OutputLinks(0)=(DrawY=5364,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_10'),(LinkedOp=SeqAct_Interp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=2)),DrawY=5384,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_1'),DrawX=-7675,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_8'),DrawX=-7625,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7704
   ObjPosY=5328
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_8
   NewMaterial=MaterialInstanceConstant'Env_Mat_Lib.Trader.Env_Trader_Damage_Obj_Highlight_INST'
   InputLinks(0)=(DrawY=-6006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_157'),DrawX=-4755,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-6040
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_8"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_5
   NewMaterial=MaterialInstanceConstant'Env_Mat_Lib.Trader.Env_Trader_Damage_Obj_Highlight_INST'
   InputLinks(0)=(DrawY=-5262,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5262,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),DrawX=-4755,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4800
   ObjPosY=-5296
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_5"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_7
   NewMaterial=MaterialInstanceConstant'Env_Mat_Lib.Trader.Env_Trader_Damage_Obj_Highlight_INST'
   InputLinks(0)=(DrawY=-4470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-4470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_163'),DrawX=-4867,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4912
   ObjPosY=-4504
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_7"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_12
   NewMaterial=MaterialInstanceConstant'Env_Mat_Lib.Trader.Env_Trader_Damage_Obj_Highlight_INST'
   InputLinks(0)=(DrawY=-3702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3702,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_164'),DrawX=-4827,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-3736
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_12"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_10
   NewMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.ENV_DataTerminal_01_Obj_Highlight_INST'
   InputLinks(0)=(DrawY=-6022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6022,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_205'),DrawX=6173,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6128
   ObjPosY=-6056
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_10"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_11
   NewMaterial=MaterialInstanceConstant'ENV_OBJ_MAT.dataterminal.ENV_DataTerminal_01_MIC'
   InputLinks(0)=(DrawY=-5854,ActivateDelay=12.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5854,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_205'),DrawX=6109,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6064
   ObjPosY=-5888
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_11"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_205
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6232
   ObjPosY=-5888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_205"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_5
   InputLinks(0)=(DrawY=-8835,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8814,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8793,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8814,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_173',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_174',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_175',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_181',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_182',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_183',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_184',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_185',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_186',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_187',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_188',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_189',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_190',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_192',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199'),DrawX=198,OverrideDelta=16)
   VariableLinks(1)=(DrawX=249,OverrideDelta=76)
   EventLinks(0)=(DrawX=298,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=160
   ObjPosY=-8872
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_5"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_173
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-208
   ObjPosY=-8536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_173"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_174
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-112
   ObjPosY=-8536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_174"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_175
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-16
   ObjPosY=-8536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_175"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_181
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=-8536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_181"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_182
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=176
   ObjPosY=-8536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_182"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_183
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=272
   ObjPosY=-8536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_183"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_184
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-176
   ObjPosY=-8456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_184"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_185
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-80
   ObjPosY=-8456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_185"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_186
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8
   ObjPosY=-8456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_186"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_187
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=-8456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_187"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_188
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=208
   ObjPosY=-8456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_188"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_189
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=304
   ObjPosY=-8456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_189"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_190
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=360
   ObjPosY=-8528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_190"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_192
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=-8456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_192"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=296
   ObjPosY=-8680
   ObjComment="Data Terminal"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_6
   InputLinks(0)=(DrawY=158,OverrideDelta=15)
   InputLinks(1)=(DrawY=180,OverrideDelta=37)
   InputLinks(2)=(DrawY=202,OverrideDelta=59)
   InputLinks(3)=(DrawY=224,OverrideDelta=81)
   InputLinks(4)=(DrawY=246,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_61',InputLinkIdx=1)),DrawY=174,OverrideDelta=31)
   OutputLinks(1)=(DrawY=230,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_6'),DrawX=3308,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242'),LinkDesc="Flare",MinVars=0,DrawX=3356,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3256
   ObjPosY=120
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_6"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_6
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="Brightness"
         FloatTrack=(Points=((OutVal=0.100000,InterpMode=CIM_CurveAutoClamped),(InVal=19.000000,OutVal=3.000000,InterpMode=CIM_CurveAutoClamped),(InVal=23.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackFloatProp'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_1.InterpTrackFloatProp_2'
      GroupName="Flare"
      GroupColor=(B=157,G=181,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=23.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_6.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=23.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3256
   ObjPosY=320
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_6"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_172
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=680
   ObjPosY=-1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_172"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_13
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_MAT.lab.ENV_BioticsLab_Centrifuge_MIC'
   InputLinks(0)=(DrawY=-1694,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_18')),DrawY=-1694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208'),DrawX=245,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=200
   ObjPosY=-1728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_13"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_14
   InputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_17')),DrawY=-1926,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_208'),DrawX=285,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=-1960
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_14"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_17
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1910,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_15')),DrawY=-1910,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207'),DrawX=509,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=-1944
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_17"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_18
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_MAT.lab.ENV_BioticsLab_GloveBox_MIC'
   MaterialIndex=1
   InputLinks(0)=(DrawY=-1678,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_16')),DrawY=-1678,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_207'),DrawX=469,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=-1712
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_18"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_207
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=-1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_207"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_208
   ObjValue=InterpActor'KF-ZEDLANDING.TheWorld:PersistentLevel.InterpActor_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=288
   ObjPosY=-1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_208"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_16
   NewMaterial=MaterialInstanceConstant'ENV_BioticsLab_MAT.lab.ENV_BioticsLab_LargeMicroscope_MIC'
   InputLinks(0)=(DrawY=-1694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_172'),DrawX=717,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=672
   ObjPosY=-1728
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_16"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_15
   InputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1926,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_172'),DrawX=757,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=712
   ObjPosY=-1960
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_15"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_242
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3368
   ObjPosY=312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_242"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_61
   InputLinks(0)=(DrawY=173,OverrideDelta=14)
   InputLinks(1)=(DrawY=194,OverrideDelta=35)
   InputLinks(2)=(DrawY=215,OverrideDelta=56)
   OutputLinks(0)=(DrawY=194,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_242'),DrawX=3566,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3617,OverrideDelta=76)
   EventLinks(0)=(DrawX=3666,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_61"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_241
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_241"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_243
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=-8760
   ObjComment="Flare"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_243"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_244
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1032
   ObjPosY=-8760
   ObjComment="Flare Blast"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_244"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_261
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1176
   ObjPosY=-8752
   ObjComment="Data Delivery"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_261"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_63
   InputLinks(0)=(DrawY=6325,OverrideDelta=14)
   InputLinks(1)=(DrawY=6346,OverrideDelta=35)
   InputLinks(2)=(DrawY=6367,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_SetPawnIconVisibility'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_SetPawnIconVisibility_0',InputLinkIdx=1)),DrawY=6346,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_165'),DrawX=-8554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=6288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_63"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_165
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=6432
   ObjComment="Rotor Debris"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_165"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_SetPawnIconVisibility Name=KFSeqAct_SetPawnIconVisibility_0
   InputLinks(0)=(DrawY=6380,OverrideDelta=13)
   InputLinks(1)=(DrawY=6400,OverrideDelta=33)
   OutputLinks(0)=(DrawY=6390,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8304
   ObjPosY=6344
   DrawWidth=165
   DrawHeight=69
   Name="KFSeqAct_SetPawnIconVisibility_0"
   ObjectArchetype=KFSeqAct_SetPawnIconVisibility'KFGame.Default__KFSeqAct_SetPawnIconVisibility'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_166
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5376
   ObjPosY=-8632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_166"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5472
   ObjPosY=-8632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_245
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5576
   ObjPosY=-8632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_245"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_274
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5424
   ObjPosY=-8544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_274"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_279
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5528
   ObjPosY=-8544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_279"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_280
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5624
   ObjPosY=-8544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_280"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_282
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5328
   ObjPosY=-8224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_282"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_283
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5432
   ObjPosY=-8224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_283"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_284
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5528
   ObjPosY=-8224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_284"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_285
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5360
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_285"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_286
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5456
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_286"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_287
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5560
   ObjPosY=-8136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_287"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_291
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4840
   ObjPosY=-8112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_291"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_292
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=-8112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_292"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_301
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5040
   ObjPosY=-8112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_301"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_304
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4896
   ObjPosY=-8024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_304"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_305
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4992
   ObjPosY=-8024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_305"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_306
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5096
   ObjPosY=-8024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_306"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_308
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4280
   ObjPosY=-7784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_308"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_309
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4384
   ObjPosY=-7784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_309"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_310
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4480
   ObjPosY=-7784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_310"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_311
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_311"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_312
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_312"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_313
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=-7688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_313"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=-7936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=176
   ObjPosY=-7936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=-7936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=-8016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=136
   ObjPosY=-8016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFPlayerStart'KF-ZEDLANDING.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=32
   ObjPosY=-8016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-8171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8129,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8150,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=134,OverrideDelta=16)
   VariableLinks(1)=(DrawX=185,OverrideDelta=76)
   EventLinks(0)=(DrawX=234,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=96
   ObjPosY=-8208
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_36
   EventName="SpawnsOff"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=1)),DrawY=-8022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-194,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-288
   ObjPosY=-8088
   ObjComment="SpawnsOFF"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_36"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_15
   EventName="Obj1Deactivated"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_4'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_72')),DrawY=-5542,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5103,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5216
   ObjPosY=-5608
   ObjComment="Obj1Deactivated"
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_15"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_41
   EventName="Obj1Deactivated"
   InputLinks(0)=(DrawY=-5902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5848,OverrideDelta=112)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5992
   ObjPosY=-5936
   ObjComment="Obj1Deactivated"
   DrawWidth=288
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_41"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_20
   EventName="Obj1Deactivated"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_1'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_73')),DrawY=-4878,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5167,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5280
   ObjPosY=-4944
   ObjComment="Obj1Deactivated"
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_20"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_22
   EventName="Obj1Deactivated"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_2'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_74')),DrawY=-4094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5327,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5440
   ObjPosY=-4160
   ObjComment="Obj1Deactivated"
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_22"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_14
   EventName="Obj1Deactivated"
   MaxWidth=227
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMaterial'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMaterial_3'),(LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_75')),DrawY=-3366,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5287,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5400
   ObjPosY=-3432
   ObjComment="Obj1Deactivated"
   DrawWidth=133
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_14"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_253
   ObjValue=PointLightToggleable'KF-ZEDLANDING.TheWorld:PersistentLevel.PointLightToggleable_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7800
   ObjPosY=-1544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_253"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_24
   Duration=5.500000
   InputLinks(0)=(DrawY=-1739,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1718,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1697,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_93',InputLinkIdx=1)),DrawY=-1734,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1702,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7476,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7528
   ObjPosY=-1776
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_24"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_93
   InputLinks(0)=(DrawY=-1667,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1646,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1625,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_24')),DrawY=-1646,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_253'),DrawX=-7762,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7711,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7662,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7800
   ObjPosY=-1704
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_93"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=Emitter'KF-ZEDLANDING.TheWorld:PersistentLevel.Emitter_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-1656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_57
   InputLinks(0)=(DrawY=-1787,ActivateDelay=2.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1745,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_93')),ActivateDelay=1.000000,DrawY=-1766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-8170,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8119,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8070,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8208
   ObjPosY=-1824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_57"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqAct_SetMonsterProperties Name=KFSeqAct_SetMonsterProperties_0
   MonsterProperties(0)=(Type=EMonsterProperties_Sprinting,bFutureZeds=True,bCurrentZeds=True)
   InputLinks(0)=(DrawY=-5788,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5768,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5778,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-1743,OverrideDelta=59)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1824
   ObjPosY=-5824
   DrawWidth=162
   DrawHeight=85
   Name="KFSeqAct_SetMonsterProperties_0"
   ObjectArchetype=KFSeqAct_SetMonsterProperties'KFGame.Default__KFSeqAct_SetMonsterProperties'
End Object

Begin Object Class=KFSeqEvent_TraderClosed Name=KFSeqEvent_TraderClosed_0
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_3')),DrawY=2058,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1331,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1392,OverrideDelta=86)
   VariableLinks(2)=(DrawX=1473,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1288
   ObjPosY=1992
   DrawWidth=144
   DrawHeight=144
   Name="KFSeqEvent_TraderClosed_0"
   ObjectArchetype=KFSeqEvent_TraderClosed'KFGame.Default__KFSeqEvent_TraderClosed'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_8
   bRewindOnPlay=True
   InputLinks(0)=(DrawY=-2042,OverrideDelta=15)
   InputLinks(1)=(DrawY=-2020,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1998,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1976,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1954,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-2026,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1970,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_8'),DrawX=-7841,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),LinkDesc="NewSkeletalMeshGroup",MinVars=0,DrawX=-7769,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7872
   ObjPosY=-2080
   ObjComment="Open Data Terminal"
   DrawWidth=159
   DrawHeight=173
   Name="SeqAct_Interp_8"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_8
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackAnimControl Name=InterpTrackAnimControl_0
         AnimSeqs(0)=(AnimSeqName="Open",AnimPlayRate=1.000000)
         AnimSeqs(1)=(StartTime=3.333031,AnimSeqName="Open_Idle",AnimPlayRate=0.646347)
         AnimSeqs(2)=(StartTime=8.490000,AnimSeqName="Close",AnimPlayRate=1.000000)
         Name="InterpTrackAnimControl_0"
         ObjectArchetype=InterpTrackAnimControl'Engine.Default__InterpTrackAnimControl'
      End Object
      InterpTracks(0)=InterpTrackAnimControl'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_0.InterpTrackAnimControl_0'
      GroupName="NewSkeletalMeshGroup"
      GroupColor=(B=157,G=181,R=0,A=255)
      GroupAnimSets(0)=AnimSet'ENV_OBJ_ANIM_ANIM.ENV_Data_Terminal_ANIM'
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=12.000000
   InterpGroups(0)=InterpGroup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence.InterpData_8.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=12.000000
   BakeAndPruneStatus(0)=(AnimSetName="ENV_OBJ_ANIM_ANIM.ENV_Data_Terminal_ANIM")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-1872
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_8"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=SkeletalMeshActor'KF-ZEDLANDING.TheWorld:PersistentLevel.SkeletalMeshActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZEDLANDING.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=-1864
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   OscillationDuration=20.000000
   RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
   Name="CameraShake_0"
   ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
End Object
