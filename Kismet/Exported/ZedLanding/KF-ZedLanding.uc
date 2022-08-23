Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   PlayRate=0.015000
   bRewindOnPlay=True
   bClientSideOnly=True
   InputLinks(0)=(DrawY=270,OverrideDelta=15)
   InputLinks(1)=(DrawY=292,OverrideDelta=37)
   InputLinks(2)=(DrawY=314,OverrideDelta=59)
   InputLinks(3)=(DrawY=336,OverrideDelta=81)
   InputLinks(4)=(DrawY=358,OverrideDelta=103)
   OutputLinks(0)=(DrawY=277,OverrideDelta=22)
   OutputLinks(1)=(DrawY=314,OverrideDelta=59)
   OutputLinks(2)=(LinkDesc="ExtinguishFlames",DrawY=351,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=704,OverrideDelta=25)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),LinkDesc="Ocean",MinVars=0,DrawX=757,OverrideDelta=72)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),LinkDesc="Beach",MinVars=0,DrawX=814,OverrideDelta=130)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=232
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
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.Water.Env_Ocean_Water_Ocean_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_23.StaticMeshComponent_868')))
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackFloatMaterialParam'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1.InterpTrackFloatMaterialParam_0'
      GroupName="ocean"
      GroupColor=(B=152,G=0,R=186,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.Landscape.LMAT_ENV_ZedLanding_LandscapeMaterialBase_MIC',AffectedMaterialRefs=((Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_443'),(Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_444'),(Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_448'),(Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_449'),(Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_453'),(Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_454'),(Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_458'),(Primitive=LandscapeComponent'KF-ZedLanding.TheWorld:PersistentLevel.Landscape_2.LandscapeComponent_459')))
         ParamName="Scalar_Water_Offset"
         FloatTrack=(Points=((OutVal=-280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=5.610449,OutVal=-280.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=-200.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_0"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0.InterpTrackFloatMaterialParam_0'
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
   InterpGroups(0)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_1'
   InterpGroups(1)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=60.007412
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=440
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=696
   ObjPosY=464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=237,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=258,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3')),DrawY=279,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=168
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=1141
   SizeY=468
   bDrawBox=True
   FillColor=(B=125,G=255,R=123,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=936
   ObjPosY=936
   ObjComment="Portal Spawns"
   DrawWidth=1141
   DrawHeight=468
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=1069,OverrideDelta=14)
   InputLinks(1)=(DrawY=1090,OverrideDelta=35)
   InputLinks(2)=(DrawY=1111,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1090,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=1270,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1321,OverrideDelta=76)
   EventLinks(0)=(DrawX=1370,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1232
   ObjPosY=1032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-ZedLanding.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=1069,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1090,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1111,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1074,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=992
   ObjPosY=1000
   ObjName="TriggerVolume_4 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-ZedLanding.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1200
   ObjPosY=1176
   ObjComment="PARENT - Rock 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-ZedLanding.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1728
   ObjPosY=1176
   ObjComment="PARENT - Rock 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-ZedLanding.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=1069,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1090,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1111,OverrideDelta=56)
   VariableLinks(0)=(DrawX=1606,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=1000
   ObjName="TriggerVolume_18 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=1069,OverrideDelta=14)
   InputLinks(1)=(DrawY=1090,OverrideDelta=35)
   InputLinks(2)=(DrawY=1111,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1090,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=1798,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1849,OverrideDelta=76)
   EventLinks(0)=(DrawX=1898,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=1032
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFSpawner'KF-ZedLanding.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1840
   ObjPosY=1208
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
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
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=1)),LinkDesc="AshEmitters",DrawY=2532,OverrideDelta=61)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0'),(LinkedOp=SeqAct_AkPostEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1'),(LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_15'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=1)),LinkDesc="EruptionDestructible",DrawY=2555,OverrideDelta=84)
   OutputLinks(4)=(LinkDesc="FlowingLavaInterp",DrawY=2578,OverrideDelta=107)
   OutputLinks(5)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4',InputLinkIdx=1),(LinkedOp=SeqAct_ToggleHidden'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2')),LinkDesc="CaveLavaPain",DrawY=2601,OverrideDelta=130)
   OutputLinks(6)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32')),LinkDesc="LavaFlowStart",DrawY=2624,OverrideDelta=153)
   OutputLinks(7)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),LinkDesc="CaveLavaLights",DrawY=2647,OverrideDelta=176)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=1703,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="Fog",MinVars=0,DrawX=1747,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="CaveLava1",MinVars=0,DrawX=1794,OverrideDelta=103)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75'),LinkDesc="CaveLava2",MinVars=0,DrawX=1849,OverrideDelta=158)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="WindDirectionalSource",MinVars=0,DrawX=1942,OverrideDelta=213)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="VolcanoFlow_Progression",MinVars=0,DrawX=2072,OverrideDelta=344)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="VolcanoFlow_LavaSpeckle",MinVars=0,DrawX=2205,OverrideDelta=473)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Sounds",MinVars=0,DrawX=2305,OverrideDelta=609)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),LinkDesc="CaveLavaLights",MinVars=0,DrawX=2380,OverrideDelta=673)
   VariableLinks(9)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),LinkDesc="CaveWater1",MinVars=0,DrawX=2455,OverrideDelta=759)
   VariableLinks(10)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),LinkDesc="CaveWater2",MinVars=0,DrawX=2519,OverrideDelta=823)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_8.InterpTrackMove_2'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_6.InterpTrackMove_1'
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
      InterpTracks(0)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_5.InterpTrackFloatProp_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_5.InterpTrackFloatProp_1'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackFloatProp_0'
      InterpTracks(2)=InterpTrackColorProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackColorProp_0'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackFloatProp_1'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackMove_1'
      GroupName="CaveLava2"
      GroupColor=(B=177,G=0,R=163,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_0
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.volcano.ENV_Lava_Mat_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZedLanding.TheWorld:PersistentLevel.StaticMeshActor_270.StaticMeshComponent_48')))
         ParamName="Scalar_Progression"
         FloatTrack=(Points=((OutVal=-1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=499.119415,OutVal=18.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_0"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2.InterpTrackFloatMaterialParam_0'
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
      InterpTracks(0)=InterpTrackAkEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_11.InterpTrackAkEvent_1'
      InterpTracks(1)=InterpTrackAkEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_11.InterpTrackAkEvent_0'
      GroupName="Sounds"
      GroupColor=(B=226,G=0,R=69,A=255)
      bCollapsed=True
      Name="InterpGroup_11"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_10
      Begin Object Class=InterpTrackFloatMaterialParam Name=InterpTrackFloatMaterialParam_1
         Materials(0)=(TargetMaterial=MaterialInstanceConstant'ENV_ZedLanding_MAT.volcano.ENV_ZedLanding_Volcano_MIC',AffectedMaterialRefs=((Primitive=StaticMeshComponent'KF-ZedLanding.TheWorld:PersistentLevel.StaticMeshActor_142.StaticMeshComponent_25'),(Primitive=StaticMeshComponent'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_7.StaticMeshComponent_59')))
         ParamName="Volcano_Lava_Mask"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=299.236481,OutVal=20.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackFloatMaterialParam_1"
         ObjectArchetype=InterpTrackFloatMaterialParam'Engine.Default__InterpTrackFloatMaterialParam'
      End Object
      InterpTracks(0)=InterpTrackFloatMaterialParam'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_10.InterpTrackFloatMaterialParam_1'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_1.InterpTrackMove_1'
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
      InterpTracks(0)=InterpTrackEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackEvent_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackFloatProp_3'
      GroupName="Fog"
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(Curves=((CurveObject=InterpTrackFloatMaterialParam'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2.InterpTrackFloatMaterialParam_0',CurveColor=(B=69,G=225,R=0,A=255),CurveName="VolcanoFlow_Progression_Float Material Param"),(CurveObject=InterpTrackFloatMaterialParam'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_10.InterpTrackFloatMaterialParam_1',CurveColor=(B=186,G=151,R=0,A=255),CurveName="VolcanoFlow_LavaSpeckle_Float Material Param")))
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   InterpLength=1000.002441
   InterpGroups(0)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3'
   InterpGroups(3)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_5'
   InterpGroups(4)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_2'
   InterpGroups(5)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_10'
   InterpGroups(6)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_11'
   InterpGroups(7)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4'
   InterpGroups(8)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_6'
   InterpGroups(9)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_8'
   CurveEdSetup=InterpCurveEdSetup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1000.002441
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1600
   ObjPosY=2776
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=ExponentialHeightFog'KF-ZedLanding.TheWorld:PersistentLevel.ExponentialHeightFog_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1704
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=3603
   SizeY=2501
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1048
   ObjPosY=1816
   ObjComment="Dynamic Fog / Lighting"
   DrawWidth=3603
   DrawHeight=2501
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_TraderOpened Name=KFSeqEvent_TraderOpened_1
   MaxTriggerCount=0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareFloat_0')),LinkDesc="Start Objective Logic",DrawY=2586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1115,OverrideDelta=16)
   VariableLinks(1)=(DrawX=1176,OverrideDelta=86)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Float'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=1257,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1072
   ObjPosY=2520
   DrawWidth=202
   DrawHeight=144
   Name="KFSeqEvent_TraderOpened_1"
   ObjectArchetype=KFSeqEvent_TraderOpened'KFGame.Default__KFSeqEvent_TraderOpened'
End Object

Begin Object Class=Sequence Name=Tremble_Handler
   Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7272
      ObjPosY=344
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Player_1"
      ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_9
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Falloff"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=9032
      ObjPosY=40
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_9"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_8
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Max"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6920
      ObjPosY=-104
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_8"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_7
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Med"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6088
      ObjPosY=56
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_7"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_6
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Min"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=5288
      ObjPosY=-120
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_6"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Med"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=7592
      ObjPosY=72
      ObjColor=(B=255,G=0,R=0,A=255)
      DrawWidth=32
      DrawHeight=32
      Name="SeqVar_Named_2"
      ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
   End Object
   Begin Object Class=SeqVar_Named Name=SeqVar_Named_10
      ExpectedType=Class'Engine.SeqVar_Float'
      FindVarName="Mag_Min"
      ObjInstanceVersion=1
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_1')),DrawY=-174,OverrideDelta=11)
      VariableLinks(0)=(DrawX=4851,OverrideDelta=75)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_9.CameraShake_0'
      ShakeScale=0.100000
      InputLinks(0)=(DrawY=-180,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-160,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_10')),DrawY=-170,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=8531,OverrideDelta=16)
      VariableLinks(1)=(DrawX=8597,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_10'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8661,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_8.CameraShake_0'
      ShakeScale=0.100000
      InputLinks(0)=(DrawY=-196,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-176,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_9')),DrawY=-186,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=8227,OverrideDelta=16)
      VariableLinks(1)=(DrawX=8293,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_10'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8357,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_7.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_4')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=7379,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7445,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_2'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=7509,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_6.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_7')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=7115,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7181,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_2'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=7245,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_5.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-204,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-184,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_8')),DrawY=-194,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=7923,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7989,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_2'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8053,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_4.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-212,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-192,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_5')),DrawY=-202,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=7659,OverrideDelta=16)
      VariableLinks(1)=(DrawX=7725,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_2'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=7789,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_3.CameraShake_0'
      ShakeScale=0.250000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_6')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=6819,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6885,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_8'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6949,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_2.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-252,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-232,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_12')),DrawY=-242,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=6275,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6341,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_7'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6405,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=6237
      ObjPosY=-288
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_2"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_14
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_14.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-260,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-240,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_2')),DrawY=-250,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=6003,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6069,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_7'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6133,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_13.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-268,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-248,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_14')),DrawY=-258,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=5715,OverrideDelta=16)
      VariableLinks(1)=(DrawX=5781,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_7'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=5845,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_12.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-228,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-208,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_3')),DrawY=-218,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=6523,OverrideDelta=16)
      VariableLinks(1)=(DrawX=6589,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_7'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=6653,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_11.CameraShake_0'
      ShakeScale=0.150000
      InputLinks(0)=(DrawY=-252,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-232,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_13')),DrawY=-242,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=5459,OverrideDelta=16)
      VariableLinks(1)=(DrawX=5525,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_7'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=5589,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_10.CameraShake_0'
      ShakeScale=0.050000
      InputLinks(0)=(DrawY=-172,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-152,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_0')),DrawY=-162,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=8811,OverrideDelta=16)
      VariableLinks(1)=(DrawX=8877,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_9'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=8941,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
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
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_1.CameraShake_0'
      ShakeScale=0.100000
      InputLinks(0)=(DrawY=-244,OverrideDelta=13)
      InputLinks(1)=(DrawY=-224,OverrideDelta=33)
      OutputLinks(0)=(Links=((LinkedOp=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_11')),DrawY=-234,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=5190,OverrideDelta=16)
      VariableLinks(1)=(DrawX=5256,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_6'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=5320,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=5152
      ObjPosY=-280
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_1"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   Begin Object Class=SeqAct_CameraShake Name=SeqAct_CameraShake_0
      Begin Object Class=CameraShake Name=CameraShake_0 Archetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
         OscillationDuration=1.000000
         RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
         Name="CameraShake_0"
         ObjectArchetype=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
      End Object
      Shake=CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_0.CameraShake_0'
      ShakeScale=0.050000
      InputLinks(0)=(DrawY=-148,ActivateDelay=0.200000,OverrideDelta=13)
      InputLinks(1)=(DrawY=-128,OverrideDelta=33)
      OutputLinks(0)=(DrawY=-138,OverrideDelta=23)
      VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'),DrawX=9083,OverrideDelta=16)
      VariableLinks(1)=(DrawX=9149,OverrideDelta=76)
      VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_9'),LinkDesc="ShakeScale",PropertyName="ShakeScale",MinVars=0,DrawX=9213,OverrideDelta=148)
      ObjInstanceVersion=2
      ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler'
      ObjPosX=9045
      ObjPosY=-184
      DrawWidth=204
      DrawHeight=101
      Name="SeqAct_CameraShake_0"
      ObjectArchetype=SeqAct_CameraShake'Engine.Default__SeqAct_CameraShake'
   End Object
   SequenceObjects(0)=SeqEvent_RemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqEvent_RemoteEvent_0'
   SequenceObjects(1)=SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_9'
   SequenceObjects(2)=SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_10'
   SequenceObjects(3)=SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_2'
   SequenceObjects(4)=SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_8'
   SequenceObjects(5)=SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_7'
   SequenceObjects(6)=SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Named_6'
   SequenceObjects(7)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_2'
   SequenceObjects(8)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_14'
   SequenceObjects(9)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_13'
   SequenceObjects(10)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_12'
   SequenceObjects(11)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_0'
   SequenceObjects(12)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_10'
   SequenceObjects(13)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_9'
   SequenceObjects(14)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_4'
   SequenceObjects(15)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_7'
   SequenceObjects(16)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_8'
   SequenceObjects(17)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_5'
   SequenceObjects(18)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_6'
   SequenceObjects(19)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_3'
   SequenceObjects(20)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_11'
   SequenceObjects(21)=SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqVar_Player_1'
   SequenceObjects(22)=SeqAct_CameraShake'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.Tremble_Handler.SeqAct_CameraShake_1'
   DefaultViewX=-1010
   DefaultViewY=282
   DefaultViewZoom=0.166952
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_1')),DrawY=5138,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_58'),DrawX=1954,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_19'),DrawX=2010,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_7')),DrawY=4954,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_57'),DrawX=1962,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_18'),DrawX=2018,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_6')),DrawY=4778,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_56'),DrawX=1954,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_17'),DrawX=2010,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=4744
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_5"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_16
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=4664
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_16"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_4
   InputLinks(0)=(DrawY=4602,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_5'),(LinkedOp=SeqAct_AkPostEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=4602,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_55'),DrawX=1962,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_16'),DrawX=2018,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=5330,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1970,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1832
   ObjPosY=5296
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_1"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_3
   FloatValue=0.050000
   VarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3048
   ObjPosY=4728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_3"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_4
   FloatValue=0.250000
   VarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=4690,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3')),DrawY=4711,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_4')),DrawY=4642,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4674,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_0'),DrawX=1604,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1552
   ObjPosY=4600
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_0
   Min=90.000000
   Max=240.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1568
   ObjPosY=4768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_0"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   VarName="Breakout"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3176
   ObjPosY=4720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=805
   SizeY=572
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-192
   ObjPosY=1504
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=1976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=1586,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1586,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=504,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=440
   ObjPosY=1552
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=1906,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1906,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=64,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=1872
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=1658,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-65,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-160
   ObjPosY=1592
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KF-ZedLanding.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=272
   ObjPosY=1728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   InputLinks(0)=(DrawY=1574,OverrideDelta=15)
   InputLinks(1)=(DrawY=1596,OverrideDelta=37)
   InputLinks(2)=(DrawY=1618,OverrideDelta=59)
   InputLinks(3)=(DrawY=1640,OverrideDelta=81)
   InputLinks(4)=(DrawY=1662,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=1590,OverrideDelta=31)
   OutputLinks(1)=(DrawY=1646,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=193,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="FlythroughCamera",MinVars=0,DrawX=260,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=160
   ObjPosY=1536
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=3333,OverrideDelta=14)
   InputLinks(1)=(DrawY=3354,OverrideDelta=35)
   InputLinks(2)=(DrawY=3375,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3354,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=3078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3129,OverrideDelta=76)
   EventLinks(0)=(DrawX=3178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=3296
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=DynamicPhysicsVolume'KF-ZedLanding.TheWorld:PersistentLevel.DynamicPhysicsVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=3504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=DynamicPhysicsVolume'KF-ZedLanding.TheWorld:PersistentLevel.DynamicPhysicsVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=DynamicPhysicsVolume'KF-ZedLanding.TheWorld:PersistentLevel.DynamicPhysicsVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3176
   ObjPosY=3496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_32
   SizeX=2670
   SizeY=1632
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1800
   ObjPosY=2392
   ObjComment="Random Start Location"
   DrawWidth=2670
   DrawHeight=1632
   Name="SequenceFrame_32"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=3093,OverrideDelta=14)
   InputLinks(1)=(DrawY=3114,OverrideDelta=35)
   InputLinks(2)=(DrawY=3135,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3114,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=486,OverrideDelta=16)
   VariableLinks(1)=(DrawX=537,OverrideDelta=76)
   EventLinks(0)=(DrawX=586,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=448
   ObjPosY=3056
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=3181,OverrideDelta=14)
   InputLinks(1)=(DrawY=3202,OverrideDelta=35)
   InputLinks(2)=(DrawY=3223,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3202,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=38,OverrideDelta=16)
   VariableLinks(1)=(DrawX=89,OverrideDelta=76)
   EventLinks(0)=(DrawX=138,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosY=3144
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=2661,OverrideDelta=14)
   InputLinks(1)=(DrawY=2682,OverrideDelta=35)
   InputLinks(2)=(DrawY=2703,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2682,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=502,OverrideDelta=16)
   VariableLinks(1)=(DrawX=553,OverrideDelta=76)
   EventLinks(0)=(DrawX=602,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=2624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=2685,OverrideDelta=14)
   InputLinks(1)=(DrawY=2706,OverrideDelta=35)
   InputLinks(2)=(DrawY=2727,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2706,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_61',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=94,OverrideDelta=16)
   VariableLinks(1)=(DrawX=145,OverrideDelta=76)
   EventLinks(0)=(DrawX=194,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=56
   ObjPosY=2648
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=2888,OverrideDelta=25)
   InputLinks(1)=(DrawY=2932,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22')),DrawY=2877,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),LinkDesc="Link 2",DrawY=2899,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),LinkDesc="Link 3",DrawY=2921,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),LinkDesc="Link 4",DrawY=2943,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-300,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-344
   ObjPosY=2840
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=2853,OverrideDelta=14)
   OutputLinks(1)=(DrawY=2874,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_11')),DrawY=2895,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-872
   ObjPosY=2784
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-80
   ObjPosY=3432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=3432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=112
   ObjPosY=3432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-120
   ObjPosY=3344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-24
   ObjPosY=3344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=3344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=360
   ObjPosY=3272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=3272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=560
   ObjPosY=3272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=3352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=504
   ObjPosY=3352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=3352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=2800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=2800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=2800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=2880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=2880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=2880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=2840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=96
   ObjPosY=2840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=192
   ObjPosY=2840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=40
   ObjPosY=2920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_61
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=136
   ObjPosY=2920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_61"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=2920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SpawnsOff"
   MaxWidth=188
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=2610,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-346,OverrideDelta=62)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-440
   ObjPosY=2544
   ObjComment="SpawnsOff"
   DrawWidth=114
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_11
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=2938,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=2938,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-516,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-640
   ObjPosY=2904
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_11"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_PlayerSpawned Name=SeqEvent_PlayerSpawned_0
   MaxTriggerCount=0
   MaxWidth=156
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1')),DrawY=3554,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-1336,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1266,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1384
   ObjPosY=3488
   DrawWidth=98
   DrawHeight=144
   Name="SeqEvent_PlayerSpawned_0"
   ObjectArchetype=SeqEvent_PlayerSpawned'Engine.Default__SeqEvent_PlayerSpawned'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=3381,OverrideDelta=14)
   InputLinks(1)=(DrawY=3402,OverrideDelta=35)
   InputLinks(2)=(DrawY=3423,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3402,OverrideDelta=35)
   VariableLinks(0)=(DrawX=-1346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1295,OverrideDelta=76)
   EventLinks(0)=(LinkedEvents=(SeqEvent_PlayerSpawned'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqEvent_PlayerSpawned_0'),DrawX=-1246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1384
   ObjPosY=3344
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_10
   EventName="SpawnsOff"
   InputLinks(0)=(DrawY=3498,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=3498,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-796,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-920
   ObjPosY=3464
   ObjComment="SpawnsOff"
   DrawWidth=249
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_10"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=3477,OverrideDelta=14)
   InputLinks(1)=(DrawY=3498,OverrideDelta=35)
   InputLinks(2)=(DrawY=3519,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3498,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56'),DrawX=-546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-584
   ObjPosY=3440
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=20.000000
   InputLinks(0)=(DrawY=3493,OverrideDelta=14)
   InputLinks(1)=(DrawY=3514,OverrideDelta=35)
   InputLinks(2)=(DrawY=3535,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_10')),DrawY=3498,OverrideDelta=19)
   OutputLinks(1)=(DrawY=3530,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-1052,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1104
   ObjPosY=3456
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxWidth=136
   OutputLinks(0)=(DrawY=3365,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3386,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=3407,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1608
   ObjPosY=3296
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-408
   ObjPosY=3704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-504
   ObjPosY=3704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-608
   ObjPosY=3704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-448
   ObjPosY=3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-552
   ObjPosY=3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFPlayerStart'KF-ZedLanding.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-648
   ObjPosY=3624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=3341,OverrideDelta=14)
   InputLinks(1)=(DrawY=3362,OverrideDelta=35)
   InputLinks(2)=(DrawY=3383,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3362,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=3382,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3433,OverrideDelta=76)
   EventLinks(0)=(DrawX=3482,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3344
   ObjPosY=3304
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=DynamicBlockingVolume'KF-ZedLanding.TheWorld:PersistentLevel.DynamicBlockingVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3328
   ObjPosY=3456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjValue=DynamicBlockingVolume'KF-ZedLanding.TheWorld:PersistentLevel.DynamicBlockingVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39',InputLinkIdx=1)),LinkDesc="Waterfall_OFF",DrawY=3991,OverrideDelta=96)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=3639,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),LinkDesc="NewSkeletalMeshGroup",MinVars=0,DrawX=3711,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),LinkDesc="LavaRiver",MinVars=0,DrawX=3783,OverrideDelta=159)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),LinkDesc="LavaLight1",MinVars=0,DrawX=3835,OverrideDelta=207)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),LinkDesc="LavaLight2",MinVars=0,DrawX=3891,OverrideDelta=263)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),LinkDesc="LavaLight3",MinVars=0,DrawX=3947,OverrideDelta=319)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),LinkDesc="LavaLight4",MinVars=0,DrawX=4003,OverrideDelta=375)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),LinkDesc="LavaLight_Falls",MinVars=0,DrawX=4073,OverrideDelta=431)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),LinkDesc="LavaLight0",MinVars=0,DrawX=4144,OverrideDelta=516)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_9.InterpTrackMove_3'
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
      InterpTracks(0)=InterpTrackAnimControl'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackAnimControl_1'
      InterpTracks(1)=InterpTrackEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackEvent_0'
      InterpTracks(2)=InterpTrackAkEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackAkEvent_0'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackMove_8'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackFloatProp_12'
      InterpTracks(2)=InterpTrackColorProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackColorProp_6'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15.InterpTrackFloatProp_13'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackMove_6'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackFloatProp_8'
      InterpTracks(2)=InterpTrackColorProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackColorProp_4'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13.InterpTrackFloatProp_9'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackMove_5'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackFloatProp_6'
      InterpTracks(2)=InterpTrackColorProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackColorProp_3'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12.InterpTrackFloatProp_7'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackMove_4'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackFloatProp_4'
      InterpTracks(2)=InterpTrackColorProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackColorProp_2'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11.InterpTrackFloatProp_5'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackFloatProp_2'
      InterpTracks(2)=InterpTrackColorProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackColorProp_1'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1.InterpTrackFloatProp_3'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_0'
      InterpTracks(2)=InterpTrackColorProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackColorProp_0'
      InterpTracks(3)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackFloatProp_1'
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
   InterpGroups(0)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2'
   InterpGroups(1)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_9'
   InterpGroups(2)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_11'
   InterpGroups(3)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_12'
   InterpGroups(4)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_13'
   InterpGroups(5)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_15'
   InterpGroups(6)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(7)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=32.000000
   BakeAndPruneStatus(0)=(AnimSetName="VFX_textures.LavaPathBaked_Anims")
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=2971,OverrideDelta=29)
   VariableLinks(1)=(bHidden=True,DrawX=3025,OverrideDelta=76)
   EventLinks(0)=(DrawX=3074,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=2792
   DrawWidth=103
   DrawHeight=85
   Name="SeqAct_ToggleHidden_0"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=3264
   ObjComment="Cave Pain Volumes"
   DrawWidth=1061
   DrawHeight=398
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=SkeletalMeshActor'KF-ZedLanding.TheWorld:PersistentLevel.SkeletalMeshActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3648
   ObjPosY=4080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=3909,OverrideDelta=14)
   InputLinks(1)=(DrawY=3930,OverrideDelta=35)
   InputLinks(2)=(DrawY=3951,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38',InputLinkIdx=1)),DrawY=3930,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=2590,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2641,OverrideDelta=76)
   EventLinks(0)=(DrawX=2690,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=3872
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2472
   ObjPosY=4000
   ObjComment="Stream Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=4008
   ObjComment="Lava Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=3949,OverrideDelta=14)
   InputLinks(1)=(DrawY=3970,ActivateDelay=3.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3991,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_43')),DrawY=3970,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),DrawX=4382,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4433,OverrideDelta=76)
   EventLinks(0)=(DrawX=4482,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4344
   ObjPosY=3912
   ObjComment="River Splashes 1 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_2
   ConsoleEventName="Start"
   MaxWidth=153
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=2394,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1204,OverrideDelta=44)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=2328
   DrawWidth=96
   DrawHeight=128
   Name="SeqEvent_Console_2"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_3
   InputLinks(0)=(DrawY=4005,OverrideDelta=14)
   InputLinks(1)=(DrawY=4026,OverrideDelta=35)
   InputLinks(2)=(DrawY=4047,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_49')),DrawY=4026,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=7062,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7113,OverrideDelta=76)
   EventLinks(0)=(DrawX=7162,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7024
   ObjPosY=3968
   ObjComment="River Mesh - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_ToggleHidden_3"
   ObjectArchetype=SeqAct_ToggleHidden'Engine.Default__SeqAct_ToggleHidden'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(4)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=2638,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=1472,OverrideDelta=36)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_13'),DrawX=1497,OverrideDelta=61)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=2512
   DrawWidth=105
   DrawHeight=157
   Name="SeqCond_CompareFloat_0"
   ObjectArchetype=SeqCond_CompareFloat'Engine.Default__SeqCond_CompareFloat'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1328
   ObjPosY=2704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_0"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_13
   FloatValue=50.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1464
   ObjPosY=2712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_13"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7368
   ObjPosY=4120
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8624
   ObjPosY=4080
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_72
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5720
   ObjPosY=3896
   ObjComment="LavaFall Left - ON"
   DrawWidth=554
   DrawHeight=339
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_76
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3336
   ObjPosY=2856
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_76"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3440
   ObjPosY=2856
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_259'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3384
   ObjPosY=2912
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3488
   ObjPosY=2912
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_106'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3528
   ObjPosY=2856
   ObjComment="Ash"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_81
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_76',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_81'),DrawX=3478,OverrideDelta=24)
   VariableLinks(1)=(bHidden=True,DrawX=3521,OverrideDelta=76)
   EventLinks(0)=(DrawX=3570,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=2736
   DrawWidth=93
   DrawHeight=85
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_82
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3096
   ObjPosY=2952
   ObjComment="Eruption Particle"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_82"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83'),DrawX=3270,OverrideDelta=16)
   VariableLinks(1)=(bHidden=True,DrawX=3313,OverrideDelta=76)
   EventLinks(0)=(DrawX=3362,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_82'),DrawX=3134,OverrideDelta=24)
   VariableLinks(1)=(bHidden=True,DrawX=3153,OverrideDelta=76)
   EventLinks(0)=(DrawX=3202,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3088
   ObjPosY=2808
   DrawWidth=93
   DrawHeight=85
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5296
   ObjPosY=4064
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5072
   ObjPosY=4080
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5008
   ObjPosY=4080
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_91'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=4096
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_92'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4808
   ObjPosY=4168
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_93'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4720
   ObjPosY=4192
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=4088
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_95'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4576
   ObjPosY=4168
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4656
   ObjPosY=4096
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_97'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=4064
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_98'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4360
   ObjPosY=4064
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_100'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=4136
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_101'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4368
   ObjPosY=4136
   ObjComment="Stream Water"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_103'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1208
   ObjPosY=4512
   ObjComment="Tremble Handler"
   DrawWidth=1186
   DrawHeight=907
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3720
   ObjPosY=2872
   ObjComment="Seagulls"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=318
   SizeY=133
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3688
   ObjPosY=2840
   ObjComment="Seaguls"
   DrawWidth=318
   DrawHeight=133
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3816
   ObjPosY=2872
   ObjComment="Seagulls"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_112'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3496
   ObjPosY=3816
   ObjComment="Lava Flow"
   DrawWidth=726
   DrawHeight=462
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=0.500000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1)),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=2982,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3033,OverrideDelta=76)
   EventLinks(0)=(DrawX=3082,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=3904
   ObjComment="Waterfall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1',InputLinkIdx=1)),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=8030,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8081,OverrideDelta=76)
   EventLinks(0)=(DrawX=8130,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=7366,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7417,OverrideDelta=76)
   EventLinks(0)=(DrawX=7466,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),DrawY=3978,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=5822,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5873,OverrideDelta=76)
   EventLinks(0)=(DrawX=5922,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=3920
   ObjComment="LavaFall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_47"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106'),DrawX=3838,OverrideDelta=16)
   VariableLinks(1)=(bHidden=True,DrawX=3897,OverrideDelta=76)
   EventLinks(0)=(DrawX=3946,bHidden=True,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=5208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_58"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_8
   InputLinks(0)=(DrawY=2589,OverrideDelta=14)
   InputLinks(1)=(DrawY=2610,OverrideDelta=35)
   InputLinks(2)=(DrawY=2631,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_28')),DrawY=2594,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2626,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_31'),DrawX=4796,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4744
   ObjPosY=2552
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_8"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_31
   Min=1.000000
   Max=1.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4760
   ObjPosY=2680
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_31"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_28
   InputLinks(0)=(DrawY=1858,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_29')),DrawY=1858,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_50'),DrawX=4978,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_33'),DrawX=5034,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_30')),DrawY=2034,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_49'),DrawX=4970,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_34'),DrawX=5026,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=2000
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_29"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_34
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Med"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5016
   ObjPosY=2104
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_34"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_30
   InputLinks(0)=(DrawY=2210,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_31')),DrawY=2210,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_48'),DrawX=4978,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_35'),DrawX=5034,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=2176
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_30"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_35
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5016
   ObjPosY=2272
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_35"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_31
   InputLinks(0)=(DrawY=2394,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_7')),DrawY=2394,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_47'),DrawX=4970,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_36'),DrawX=5026,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5016
   ObjPosY=2456
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_36"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_7
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2602,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_5')),DrawY=2602,OverrideDelta=11)
   VariableLinks(0)=(DrawX=5282,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5144
   ObjPosY=2568
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_7"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2586,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6834,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=2378,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_13'),DrawX=6522,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_5'),DrawX=6578,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6488
   ObjPosY=2344
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_3"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6568
   ObjPosY=2256
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_2
   InputLinks(0)=(DrawY=2194,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_3')),DrawY=2194,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_12'),DrawX=6530,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_0'),DrawX=6586,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_2')),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_11'),DrawX=6522,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_3'),DrawX=6578,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_0')),DrawY=1842,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_10'),DrawX=6530,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_4'),DrawX=6586,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6312
   ObjPosY=2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_25"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   InputLinks(0)=(DrawY=2573,OverrideDelta=14)
   InputLinks(1)=(DrawY=2594,OverrideDelta=35)
   InputLinks(2)=(DrawY=2615,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_1')),DrawY=2578,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2610,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_25'),DrawX=6348,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6296
   ObjPosY=2536
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_5
   InputLinks(0)=(DrawY=2573,OverrideDelta=14)
   InputLinks(1)=(DrawY=2594,OverrideDelta=35)
   InputLinks(2)=(DrawY=2615,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_23')),DrawY=2578,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2610,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_24'),DrawX=5572,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5536
   ObjPosY=2664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_24"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_23
   InputLinks(0)=(DrawY=1842,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_22')),DrawY=1842,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_54'),DrawX=5754,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_28'),DrawX=5810,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5720
   ObjPosY=1808
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_23"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_28
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Min"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5784
   ObjPosY=1904
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_28"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_22
   InputLinks(0)=(DrawY=2018,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_21')),DrawY=2018,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_53'),DrawX=5746,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_27'),DrawX=5802,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_20')),DrawY=2194,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_52'),DrawX=5754,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_26'),DrawX=5810,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_5')),DrawY=2378,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_51'),DrawX=5746,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_25'),DrawX=5802,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5792
   ObjPosY=2440
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_25"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_5
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2586,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=2586,OverrideDelta=11)
   VariableLinks(0)=(DrawX=6058,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5920
   ObjPosY=2552
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_5"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=WindDirectionalSource'KF-ZedLanding.TheWorld:PersistentLevel.WindDirectionalSource_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=2728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=2792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Volcano_Explo'
   InputLinks(0)=(DrawY=4114,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4114,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71'),DrawX=5976,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5928
   ObjPosY=4080
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Zed_Landing.Play_ZL_Lava_Explo'
   InputLinks(0)=(DrawY=3842,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3842,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=4160,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4112
   ObjPosY=3808
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_48
   InputLinks(0)=(DrawY=3981,ActivateDelay=8.000000,OverrideDelta=14)
   InputLinks(1)=(DrawY=4002,ActivateDelay=0.500000,OverrideDelta=35)
   InputLinks(2)=(DrawY=4023,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1)),DrawY=4002,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=6430,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6481,OverrideDelta=76)
   EventLinks(0)=(DrawX=6530,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6392
   ObjPosY=3944
   ObjComment="Waterfall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_48"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_3
   ConsoleEventName="Rumble1"
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_4')),DrawY=4522,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1542,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_15')),DrawY=1906,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2702,OverrideDelta=54)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=2464
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="FlythroughCamera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
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
      InterpTracks(0)=InterpTrackMove'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="FlythroughCamera"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=295.000000
   InterpGroups(0)=InterpGroup'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionStart=295.000000
   EdSectionEnd=295.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=144
   ObjPosY=1768
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1760
   ObjPosY=2816
   ObjComment="CaveLava1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1864
   ObjPosY=2816
   ObjComment="CaveLava2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3720
   ObjPosY=3488
   ObjComment="CaveWater2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=304
   ObjPosY=112
   ObjComment="Clientside"
   DrawWidth=818
   DrawHeight=498
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_13
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=2488
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_13"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_12
   InputLinks(0)=(DrawY=2426,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_3')),DrawY=2426,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_38'),DrawX=2994,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_13'),DrawX=3050,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2960
   ObjPosY=2392
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetFloat_12"
   ObjectArchetype=SeqAct_SetFloat'Engine.Default__SeqAct_SetFloat'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_14
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Max"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=2304
   ObjColor=(B=255,G=0,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_14"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_13
   InputLinks(0)=(DrawY=2242,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_12')),DrawY=2242,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_37'),DrawX=3002,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_14'),DrawX=3058,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_13')),DrawY=2066,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_36'),DrawX=2994,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_15'),DrawX=3050,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_14')),DrawY=1890,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_1'),DrawX=3002,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_20'),DrawX=3058,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=2610,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3034,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2896
   ObjPosY=2576
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_3"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   InputLinks(0)=(DrawY=2605,OverrideDelta=14)
   InputLinks(1)=(DrawY=2626,OverrideDelta=35)
   InputLinks(2)=(DrawY=2647,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_16')),DrawY=2610,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2642,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_15'),DrawX=3268,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=2568
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_15
   Min=1.000000
   Max=1.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=2488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_38"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_SetFloat Name=SeqAct_SetFloat_16
   InputLinks(0)=(DrawY=1906,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_17')),DrawY=1906,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_42'),DrawX=3394,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_21'),DrawX=3450,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_18')),DrawY=2074,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_41'),DrawX=3386,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_22'),DrawX=3442,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_19')),DrawY=2250,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_40'),DrawX=3394,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_23'),DrawX=3450,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_4')),DrawY=2434,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_39'),DrawX=3386,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_24'),DrawX=3442,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_7')),DrawY=2634,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3698,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3560
   ObjPosY=2600
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_4"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_6
   EventName="GroundTremble"
   InputLinks(0)=(DrawY=2610,OverrideDelta=11)
   OutputLinks(0)=(DrawY=2610,OverrideDelta=11)
   VariableLinks(0)=(DrawX=4458,OverrideDelta=106)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4320
   ObjPosY=2576
   ObjComment="GroundTremble"
   DrawWidth=276
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_6"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_29
   ExpectedType=Class'Engine.SeqVar_Float'
   FindVarName="Mag_Falloff"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_6')),DrawY=2402,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_43'),DrawX=4146,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_29'),DrawX=4202,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_24')),DrawY=2218,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_44'),DrawX=4154,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_30'),DrawX=4210,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_25')),DrawY=2042,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_45'),DrawX=4146,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_31'),DrawX=4202,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_26')),DrawY=1874,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_46'),DrawX=4154,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_32'),DrawX=4210,OverrideDelta=68)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=2688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_30"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_7
   InputLinks(0)=(DrawY=2597,OverrideDelta=14)
   InputLinks(1)=(DrawY=2618,OverrideDelta=35)
   InputLinks(2)=(DrawY=2639,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetFloat_27')),DrawY=2602,OverrideDelta=19)
   OutputLinks(1)=(DrawY=2634,OverrideDelta=51)
   VariableLinks(0)=(LinkedVariables=(SeqVar_RandomFloat'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_RandomFloat_30'),DrawX=3972,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3920
   ObjPosY=2560
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_7"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_RandomFloat Name=SeqVar_RandomFloat_39
   Min=0.050000
   Max=0.100000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4120
   ObjPosY=2472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_RandomFloat_43"
   ObjectArchetype=SeqVar_RandomFloat'Engine.Default__SeqVar_RandomFloat'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=MaterialInstanceActor'KF-ZedLanding.TheWorld:PersistentLevel.MaterialInstanceActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=816
   ObjPosY=448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ToggleHidden Name=SeqAct_ToggleHidden_2
   InputLinks(0)=(DrawY=3349,OverrideDelta=14)
   InputLinks(1)=(DrawY=3370,OverrideDelta=35)
   InputLinks(2)=(DrawY=3391,OverrideDelta=56)
   OutputLinks(0)=(DrawY=3370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=3670,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3721,OverrideDelta=76)
   EventLinks(0)=(DrawX=3770,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32')),DrawY=3938,OverrideDelta=11)
   VariableLinks(0)=(DrawX=2273,OverrideDelta=41)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51')),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=8286,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8337,OverrideDelta=76)
   EventLinks(0)=(DrawX=8386,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8248
   ObjPosY=3936
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3744
   ObjPosY=4088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2184
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=2904
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=2976
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2376
   ObjPosY=2984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2544
   ObjPosY=2816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=InterpActor'KF-ZedLanding.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=3110,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3161,OverrideDelta=76)
   EventLinks(0)=(DrawX=3210,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=3024
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2840
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2944
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3144
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3344
   ObjPosY=3168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=4160
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3880
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3984
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2432
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_3')),DrawY=4002,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=6702,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6753,OverrideDelta=76)
   EventLinks(0)=(DrawX=6802,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6664
   ObjPosY=3944
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=3973,ActivateDelay=0.250000,OverrideDelta=14)
   InputLinks(1)=(DrawY=3994,OverrideDelta=35)
   InputLinks(2)=(DrawY=4015,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=1)),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=7646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7697,OverrideDelta=76)
   EventLinks(0)=(DrawX=7746,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7608
   ObjPosY=3936
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_104'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8896
   ObjPosY=4080
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7600
   ObjPosY=4120
   ObjComment="Lava Flow"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8008
   ObjPosY=4120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8240
   ObjPosY=4112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6400
   ObjPosY=4096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6664
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=4072
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_88'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5440
   ObjPosY=4064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5368
   ObjPosY=4056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_90'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=4080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=2.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41',InputLinkIdx=1)),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=4678,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4729,OverrideDelta=76)
   EventLinks(0)=(DrawX=4778,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=3904
   ObjComment="River Splashes 2 - OFF"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=3.000000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_42',InputLinkIdx=1)),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=5006,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5057,OverrideDelta=76)
   EventLinks(0)=(DrawX=5106,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_47')),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=5350,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5401,OverrideDelta=76)
   EventLinks(0)=(DrawX=5450,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=7256
   ObjPosY=3904
   ObjComment="LavaFall Far Left - ON"
   DrawWidth=615
   DrawHeight=315
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=3965,ActivateDelay=0.500000,OverrideDelta=14)
   InputLinks(1)=(DrawY=3986,OverrideDelta=35)
   InputLinks(2)=(DrawY=4007,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_48',InputLinkIdx=1)),DrawY=3986,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=6078,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6129,OverrideDelta=76)
   EventLinks(0)=(DrawX=6178,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=6040
   ObjPosY=3928
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=3941,OverrideDelta=14)
   InputLinks(1)=(DrawY=3962,ActivateDelay=0.500000,OverrideDelta=35)
   InputLinks(2)=(DrawY=3983,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=3962,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=3238,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3289,OverrideDelta=76)
   EventLinks(0)=(DrawX=3338,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3200
   ObjPosY=3904
   ObjComment="Splash"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=514
   SizeY=351
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2888
   ObjPosY=3824
   ObjComment="Waterfall Main - OFF"
   DrawWidth=514
   DrawHeight=351
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=410
   SizeY=411
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=8934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8985,OverrideDelta=76)
   EventLinks(0)=(DrawX=9034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=3994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),DrawX=8646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8697,OverrideDelta=76)
   EventLinks(0)=(DrawX=8746,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=5542,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5593,OverrideDelta=76)
   EventLinks(0)=(DrawX=5642,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_46')),DrawY=4554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=5198,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5249,OverrideDelta=76)
   EventLinks(0)=(DrawX=5298,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_45')),DrawY=4554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=4870,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4921,OverrideDelta=76)
   EventLinks(0)=(DrawX=4970,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44')),DrawY=4554,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=4574,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4625,OverrideDelta=76)
   EventLinks(0)=(DrawX=4674,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4536
   ObjPosY=4496
   ObjComment="Lava Splashes 1 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_43"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4432
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4528
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4632
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4888
   ObjPosY=4664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4944
   ObjPosY=4656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4824
   ObjPosY=4744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4896
   ObjPosY=4728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4952
   ObjPosY=4736
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5128
   ObjPosY=4640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5224
   ObjPosY=4640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5456
   ObjPosY=4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5560
   ObjPosY=4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=Emitter'KF-ZedLanding.TheWorld:PersistentLevel.Emitter_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5656
   ObjPosY=4648
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxWidth=136
   OutputLinks(0)=(DrawY=3029,OverrideDelta=14)
   OutputLinks(1)=(DrawY=3050,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=2),(LinkedOp=SeqAct_ToggleHidden'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_0',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4'),(LinkedOp=SeqAct_ToggleHidden'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_2',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11',InputLinkIdx=1)),DrawY=3071,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_26')),DrawY=3642,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=2454,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2505,OverrideDelta=76)
   EventLinks(0)=(DrawX=2554,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2416
   ObjPosY=3584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_26
   InputLinks(0)=(DrawY=3621,OverrideDelta=14)
   InputLinks(1)=(DrawY=3642,OverrideDelta=35)
   InputLinks(2)=(DrawY=3663,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0',InputLinkIdx=2),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34')),DrawY=3642,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=2710,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2761,OverrideDelta=76)
   EventLinks(0)=(DrawX=2810,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2672
   ObjPosY=3584
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_26"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=3645,OverrideDelta=14)
   InputLinks(1)=(DrawY=3666,OverrideDelta=35)
   InputLinks(2)=(DrawY=3687,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_35'),(LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=1)),DrawY=3666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),DrawX=4374,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4425,OverrideDelta=76)
   EventLinks(0)=(DrawX=4474,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4336
   ObjPosY=3608
   ObjComment="River Splashes 1 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=3645,OverrideDelta=14)
   InputLinks(1)=(DrawY=3666,OverrideDelta=35)
   InputLinks(2)=(DrawY=3687,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36')),DrawY=3666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_90',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_88',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=4678,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4729,OverrideDelta=76)
   EventLinks(0)=(DrawX=4778,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4640
   ObjPosY=3608
   ObjComment="River Splashes 2 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=3645,OverrideDelta=14)
   InputLinks(1)=(DrawY=3666,OverrideDelta=35)
   InputLinks(2)=(DrawY=3687,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=3666,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_87',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=4974,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5025,OverrideDelta=76)
   EventLinks(0)=(DrawX=5074,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=3608
   ObjComment="River Splashes 4 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=3637,OverrideDelta=14)
   InputLinks(1)=(DrawY=3658,OverrideDelta=35)
   InputLinks(2)=(DrawY=3679,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_29',InputLinkIdx=1)),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=5318,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5369,OverrideDelta=76)
   EventLinks(0)=(DrawX=5418,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=5280
   ObjPosY=3600
   ObjComment="River Splashes 4 - ON"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=4997,OverrideDelta=14)
   InputLinks(1)=(DrawY=5018,OverrideDelta=35)
   InputLinks(2)=(DrawY=5039,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_27',InputLinkIdx=1)),DrawY=5018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74'),DrawX=4574,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4625,OverrideDelta=76)
   EventLinks(0)=(DrawX=4674,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_28',InputLinkIdx=1)),DrawY=5018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103'),DrawX=4878,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4929,OverrideDelta=76)
   EventLinks(0)=(DrawX=4978,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7',InputLinkIdx=1)),DrawY=5018,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=5182,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5233,OverrideDelta=76)
   EventLinks(0)=(DrawX=5282,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=5510,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5561,OverrideDelta=76)
   EventLinks(0)=(DrawX=5610,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_25')),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_72'),DrawX=5758,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5809,OverrideDelta=76)
   EventLinks(0)=(DrawX=5858,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ToggleHidden'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ToggleHidden_1',InputLinkIdx=1)),DrawY=3674,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=6398,OverrideDelta=16)
   VariableLinks(1)=(DrawX=6449,OverrideDelta=76)
   EventLinks(0)=(DrawX=6498,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_33',InputLinkIdx=1)),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=7038,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7089,OverrideDelta=76)
   EventLinks(0)=(DrawX=7138,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=3659,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=7326,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7377,OverrideDelta=76)
   EventLinks(0)=(DrawX=7426,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24',InputLinkIdx=1)),DrawY=3658,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=7934,OverrideDelta=16)
   VariableLinks(1)=(DrawX=7985,OverrideDelta=76)
   EventLinks(0)=(DrawX=8034,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
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
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=8614,OverrideDelta=16)
   VariableLinks(1)=(DrawX=8665,OverrideDelta=76)
   EventLinks(0)=(DrawX=8714,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8576
   ObjPosY=3608
   ObjComment="Lavafall"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=0.250000
   InputLinks(0)=(DrawY=4853,OverrideDelta=14)
   InputLinks(1)=(DrawY=4874,OverrideDelta=35)
   InputLinks(2)=(DrawY=4895,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=4858,OverrideDelta=19)
   OutputLinks(1)=(DrawY=4890,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1444,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=4816
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4056
   ObjPosY=4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4136
   ObjPosY=4152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2584
   ObjPosY=4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=PointLightMovable'KF-ZedLanding.TheWorld:PersistentLevel.PointLightMovable_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-ZedLanding.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2680
   ObjPosY=4144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
