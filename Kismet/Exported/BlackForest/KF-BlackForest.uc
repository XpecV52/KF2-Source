Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=1149
   SizeY=599
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=40
   ObjPosY=-992
   ObjComment="Dynamic Fog / Lighting"
   DrawWidth=1149
   DrawHeight=599
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-747,OverrideDelta=14)
   InputLinks(1)=(DrawY=-726,OverrideDelta=35)
   InputLinks(2)=(DrawY=-705,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-726,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=2422,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2473,OverrideDelta=76)
   EventLinks(0)=(DrawX=2522,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=-784
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-755,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-734,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-713,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2226,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=-824
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2088
   ObjPosY=-872
   ObjComment="Portal Spawns - Mill Interior"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2352
   ObjPosY=-624
   ObjComment="PARENT - Mill Wall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3160
   ObjPosY=-640
   ObjComment="PARENT - Mill Water Tree"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2896
   ObjPosY=-888
   ObjComment="Portal Spawns - Mill Water"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-729,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3034,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=-840
   ObjName="TriggerVolume_3 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-763,OverrideDelta=14)
   InputLinks(1)=(DrawY=-742,OverrideDelta=35)
   InputLinks(2)=(DrawY=-721,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-742,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=3230,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3281,OverrideDelta=76)
   EventLinks(0)=(DrawX=3330,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3192
   ObjPosY=-800
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=53,OverrideDelta=14)
   InputLinks(1)=(DrawY=74,OverrideDelta=35)
   InputLinks(2)=(DrawY=95,OverrideDelta=56)
   OutputLinks(0)=(DrawY=74,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=4766,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4817,OverrideDelta=76)
   EventLinks(0)=(DrawX=4866,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4728
   ObjPosY=16
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=53,OverrideDelta=14)
   OutputLinks(1)=(DrawY=74,OverrideDelta=35)
   OutputLinks(2)=(DrawY=95,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4570,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4488
   ObjPosY=-16
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=821
   SizeY=653
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4472
   ObjPosY=-48
   ObjComment="Portal Spawns - Rock 3"
   DrawWidth=821
   DrawHeight=653
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4696
   ObjPosY=152
   ObjComment="PARENT - Rock 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=ExponentialHeightFog'KF-BLACKFOREST.TheWorld:PersistentLevel.ExponentialHeightFog_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=480
   ObjPosY=-544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Tabs(0)=(ViewStartInput=-9.874817,ViewEndInput=16.543646,ViewStartOutput=-421297.250000,ViewEndOutput=442860.593750)
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_2
         PropertyName="HeightFogComponent0.LightInscatteringColor"
         VectorTrack=(Points=((OutVal=(X=0.130352,Y=0.069727,Z=0.056374),InterpMode=CIM_CurveAutoClamped),(InVal=15.006410,OutVal=(X=0.014311,Y=0.020951,Z=0.038473))))
         TrackTitle="LightInscatteringColor"
         Name="InterpTrackColorProp_2"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0.InterpTrackColorProp_2'
      GroupName="Fog"
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackAkRTPC Name=InterpTrackAkRTPC_0
         Param="TOD"
         FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=14.994046,OutVal=100.000000,InterpMode=CIM_CurveAutoClamped)))
         Name="InterpTrackAkRTPC_0"
         ObjectArchetype=InterpTrackAkRTPC'AkAudio.Default__InterpTrackAkRTPC'
      End Object
      InterpTracks(0)=InterpTrackAkRTPC'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_2.InterpTrackAkRTPC_0'
      GroupName="SFX"
      GroupColor=(B=161,G=178,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="DominantDirectionalLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.585973,Y=0.293216,Z=0.133209),InterpMode=CIM_CurveAutoClamped),(InVal=14.994044,OutVal=(X=0.219520,Y=0.373615,Z=0.585973),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_0
         PropertyName="DominantDirectionalLightComponent0.Brightness"
         FloatTrack=(Points=((OutVal=2.500000,InterpMode=CIM_CurveAutoClamped),(InVal=15.079178,OutVal=0.250000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="Brightness"
         Name="InterpTrackFloatProp_0"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_2
         PropertyName="DominantDirectionalLightComponent0.BloomScale"
         FloatTrack=(Points=((OutVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=15.036611,OutVal=2.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="BloomScale"
         Name="InterpTrackFloatProp_2"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_3.InterpTrackColorProp_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_3.InterpTrackFloatProp_0'
      InterpTracks(2)=InterpTrackFloatProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_3.InterpTrackFloatProp_2'
      GroupName="Main_Light"
      GroupColor=(B=126,G=0,R=203,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_0
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.585973,Y=0.293216,Z=0.133209),InterpMode=CIM_CurveAutoClamped),(InVal=14.994044,OutVal=(X=0.219520,Y=0.373615,Z=0.585973),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_0"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_6.InterpTrackColorProp_0'
      GroupName="Mill_Light_01"
      GroupColor=(B=0,G=159,R=179,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_1
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.585973,Y=0.293216,Z=0.133209),InterpMode=CIM_CurveAutoClamped),(InVal=14.994044,OutVal=(X=0.219520,Y=0.373615,Z=0.585973),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_1"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_7.InterpTrackColorProp_1'
      GroupName="Mill_Light_02"
      GroupColor=(B=0,G=231,R=30,A=255)
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_2
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.585973,Y=0.293216,Z=0.133209),InterpMode=CIM_CurveAutoClamped),(InVal=14.994044,OutVal=(X=0.219520,Y=0.373615,Z=0.585973),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_2"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_8.InterpTrackColorProp_2'
      GroupName="Mill_Light_03"
      GroupColor=(B=92,G=0,R=218,A=255)
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_3
         PropertyName="SpotLightComponent0.LightColor"
         VectorTrack=(Points=((OutVal=(X=0.585973,Y=0.293216,Z=0.133209),InterpMode=CIM_CurveAutoClamped),(InVal=14.994044,OutVal=(X=0.219520,Y=0.373615,Z=0.585973),InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_3"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_9.InterpTrackColorProp_3'
      GroupName="Mill_Light_04"
      GroupColor=(B=0,G=172,R=167,A=255)
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      GroupColor=(B=195,G=0,R=140,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=59.986534
   InterpGroups(0)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroupDirector_0'
   InterpGroups(2)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_3'
   InterpGroups(4)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_6'
   InterpGroups(5)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_7'
   InterpGroups(6)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_8'
   InterpGroups(7)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_9'
   CurveEdSetup=InterpCurveEdSetup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=59.986534
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=376
   ObjPosY=-560
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   PlayRate=0.020000
   bClientSideOnly=True
   InputLinks(0)=(DrawY=-802,OverrideDelta=15)
   InputLinks(1)=(DrawY=-780,OverrideDelta=37)
   InputLinks(2)=(DrawY=-758,OverrideDelta=59)
   InputLinks(3)=(DrawY=-736,OverrideDelta=81)
   InputLinks(4)=(DrawY=-714,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-786,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-730,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=463,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="Fog",MinVars=0,DrawX=507,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="SFX",MinVars=0,DrawX=548,OverrideDelta=103)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),LinkDesc="Main_Light",MinVars=0,DrawX=596,OverrideDelta=145)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),LinkDesc="Mill_Light_01",MinVars=0,DrawX=659,OverrideDelta=199)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Mill_Light_02",MinVars=0,DrawX=731,OverrideDelta=271)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),LinkDesc="Mill_Light_03",MinVars=0,DrawX=803,OverrideDelta=343)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),LinkDesc="Mill_Light_04",MinVars=0,DrawX=875,OverrideDelta=415)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=432
   ObjPosY=-840
   ObjComment="Fog"
   DrawWidth=487
   DrawHeight=173
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(DrawY=-859,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2')),DrawY=-838,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-817,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=120
   ObjPosY=-928
   ObjComment="Start transitioning to nighttime when the match starts rather than in the customization screen"
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   ObjPosY=1104
   ObjComment="Portal Spawns - Tree 1"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=1245,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1266,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1287,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2138,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2056
   ObjPosY=1176
   ObjName="TriggerVolume_6 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=1253,OverrideDelta=14)
   InputLinks(1)=(DrawY=1274,OverrideDelta=35)
   InputLinks(2)=(DrawY=1295,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1274,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=2334,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2385,OverrideDelta=76)
   EventLinks(0)=(DrawX=2434,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2296
   ObjPosY=1216
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=1261,OverrideDelta=14)
   InputLinks(1)=(DrawY=1282,OverrideDelta=35)
   InputLinks(2)=(DrawY=1303,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1282,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=3230,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3281,OverrideDelta=76)
   EventLinks(0)=(DrawX=3330,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3192
   ObjPosY=1224
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=1253,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1274,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1295,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3034,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2952
   ObjPosY=1184
   ObjName="TriggerVolume_5 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2880
   ObjPosY=1112
   ObjComment="Portal Spawns - Trees 2 and 3"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3160
   ObjPosY=1384
   ObjComment="PARENT - Tree 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4056
   ObjPosY=1368
   ObjComment="PARENT - Tree 4"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3776
   ObjPosY=1096
   ObjComment="Portal Spawns - Tree 4"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=1237,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1258,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1279,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3930,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3848
   ObjPosY=1168
   ObjName="TriggerVolume_7 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=1245,OverrideDelta=14)
   InputLinks(1)=(DrawY=1266,OverrideDelta=35)
   InputLinks(2)=(DrawY=1287,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1266,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=4126,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4177,OverrideDelta=76)
   EventLinks(0)=(DrawX=4226,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4088
   ObjPosY=1208
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=1245,OverrideDelta=14)
   InputLinks(1)=(DrawY=1266,OverrideDelta=35)
   InputLinks(2)=(DrawY=1287,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1266,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=4974,OverrideDelta=16)
   VariableLinks(1)=(DrawX=5025,OverrideDelta=76)
   EventLinks(0)=(DrawX=5074,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4936
   ObjPosY=1208
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=1237,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1258,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1279,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4778,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4696
   ObjPosY=1168
   ObjName="TriggerVolume_8 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4624
   ObjPosY=1096
   ObjComment="Portal Spawns - Tree 5"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4904
   ObjPosY=1368
   ObjComment="PARENT - Tree 5"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2288
   ObjPosY=144
   ObjComment="PARENT - Rock 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=878
   SizeY=662
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2064
   ObjPosY=-64
   ObjComment="Portal Spawns - Rock 1"
   DrawWidth=878
   DrawHeight=662
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=37,OverrideDelta=14)
   OutputLinks(1)=(DrawY=58,OverrideDelta=35)
   OutputLinks(2)=(DrawY=79,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2162,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2080
   ObjPosY=-32
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(DrawY=58,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=2358,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2409,OverrideDelta=76)
   EventLinks(0)=(DrawX=2458,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2304
   ObjPosY=1392
   ObjComment="PARENT - Tree 1"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=45,OverrideDelta=14)
   InputLinks(1)=(DrawY=66,OverrideDelta=35)
   InputLinks(2)=(DrawY=87,OverrideDelta=56)
   OutputLinks(0)=(DrawY=66,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=3398,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3449,OverrideDelta=76)
   EventLinks(0)=(DrawX=3498,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3360
   ObjPosY=8
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=45,OverrideDelta=14)
   OutputLinks(1)=(DrawY=66,OverrideDelta=35)
   OutputLinks(2)=(DrawY=87,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3206,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3120
   ObjPosY=-24
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=1122
   SizeY=411
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3104
   ObjPosY=-56
   ObjComment="Portal Spawns - Rock 2"
   DrawWidth=1122
   DrawHeight=411
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3328
   ObjPosY=144
   ObjComment="PARENT - Rock 2"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=1973,OverrideDelta=14)
   InputLinks(1)=(DrawY=1994,OverrideDelta=35)
   InputLinks(2)=(DrawY=2015,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=3198,OverrideDelta=16)
   VariableLinks(1)=(DrawX=3249,OverrideDelta=76)
   EventLinks(0)=(DrawX=3298,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3160
   ObjPosY=1936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12')),DrawY=1965,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1986,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2007,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3006,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2920
   ObjPosY=1896
   ObjName="TriggerVolume_12 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2848
   ObjPosY=1824
   ObjComment="Portal Spawns - Tree 7"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3128
   ObjPosY=2096
   ObjComment="PARENT - Tree 7"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2328
   ObjPosY=2096
   ObjComment="PARENT - Tree 6"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2048
   ObjPosY=1824
   ObjComment="Portal Spawns - Tree 6"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=1965,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1986,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2007,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2206,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2120
   ObjPosY=1896
   ObjName="TriggerVolume_13 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=1973,OverrideDelta=14)
   InputLinks(1)=(DrawY=1994,OverrideDelta=35)
   InputLinks(2)=(DrawY=2015,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=2398,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2449,OverrideDelta=76)
   EventLinks(0)=(DrawX=2498,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2360
   ObjPosY=1936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=632
   SizeY=395
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3736
   ObjPosY=1816
   ObjComment="Portal Spawns - Tree 8"
   DrawWidth=632
   DrawHeight=395
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=1957,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1978,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1999,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3890,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3808
   ObjPosY=1888
   ObjName="TriggerVolume_2 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=1965,OverrideDelta=14)
   InputLinks(1)=(DrawY=1986,OverrideDelta=35)
   InputLinks(2)=(DrawY=2007,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1986,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),DrawX=4086,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4137,OverrideDelta=76)
   EventLinks(0)=(DrawX=4186,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4048
   ObjPosY=1928
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3336
   ObjPosY=1384
   ObjComment="CHILD - Tree 3"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4056
   ObjPosY=2096
   ObjComment="PARENT - Tree 8"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=216
   ObjComment="CHILD - Tree 9"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-BLACKFOREST.TheWorld:PersistentLevel.KFSpawner_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3552
   ObjPosY=216
   ObjComment="CHILD - Tree 10"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   InputLinks(0)=(DrawY=-66,OverrideDelta=15)
   InputLinks(1)=(DrawY=-44,OverrideDelta=37)
   InputLinks(2)=(DrawY=-22,OverrideDelta=59)
   InputLinks(3)=(OverrideDelta=81)
   InputLinks(4)=(DrawY=22,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1')),DrawY=-50,OverrideDelta=31)
   OutputLinks(1)=(DrawY=6,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=433,OverrideDelta=18)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),LinkDesc="FlythroughCamera",MinVars=0,DrawX=500,OverrideDelta=65)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=-104
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(ViewStartInput=-388.898071,ViewEndInput=791.232056,ViewStartOutput=-0.802931,ViewEndOutput=7.252565)
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
         PosTrack=(Points=((OutVal=(X=0.001465,Y=0.000183,Z=0.000092),InterpMode=CIM_CurveAuto),(InVal=4.000000,OutVal=(X=584.021973,Y=-385.060852,Z=-19.047211),ArriveTangent=(X=195.186295,Y=-127.344299,Z=1.764738),LeaveTangent=(X=195.186295,Y=-127.344299,Z=1.764738),InterpMode=CIM_CurveAuto),(InVal=8.500000,OutVal=(X=1659.084961,Y=-1082.426270,Z=15.000366),ArriveTangent=(X=172.355652,Y=-55.532425,Z=-2.179329),LeaveTangent=(X=172.355652,Y=-55.532425,Z=-2.179329),InterpMode=CIM_CurveAuto),(InVal=12.000000,OutVal=(X=1962.867188,Y=-829.320251,Z=-36.481842),ArriveTangent=(X=44.161903,Y=131.191925,Z=-1.656542),LeaveTangent=(X=44.161903,Y=131.191925,Z=-1.656542),InterpMode=CIM_CurveAuto),(InVal=15.500000,OutVal=(X=1968.218262,Y=-164.082825,Z=3.404572),ArriveTangent=(X=-184.725845,Y=362.489075,Z=12.444486),LeaveTangent=(X=-184.725845,Y=362.489075,Z=12.444486),InterpMode=CIM_CurveUser),(InVal=19.000000,OutVal=(X=1341.211914,Y=576.716492,Z=80.418213),ArriveTangent=(X=-164.502121,Y=247.924164,Z=2.766027),LeaveTangent=(X=-164.502121,Y=247.924164,Z=2.766027),InterpMode=CIM_CurveAuto),(InVal=21.500000,OutVal=(X=981.205566,Y=1323.462158,Z=20.000732),ArriveTangent=(X=-179.807404,Y=266.802795,Z=-31.648302),LeaveTangent=(X=-179.807404,Y=266.802795,Z=-31.648302),InterpMode=CIM_CurveAuto),(InVal=23.500000,OutVal=(X=532.078613,Y=1777.329102,Z=-61.999146),ArriveTangent=(X=-38.187176,Y=199.791290,Z=-12.444397),LeaveTangent=(X=-38.187176,Y=199.791290,Z=-12.444397),InterpMode=CIM_CurveAuto),(InVal=26.000000,OutVal=(X=809.363281,Y=2222.522949,Z=-35.999054),ArriveTangent=(X=119.568558,Y=132.280960,Z=6.600037),LeaveTangent=(X=119.568558,Y=132.280960,Z=6.600037),InterpMode=CIM_CurveAuto),(InVal=28.500000,OutVal=(X=1129.921387,Y=2438.733887,Z=-28.998962),ArriveTangent=(X=151.984589,Y=128.911407,Z=10.222263),LeaveTangent=(X=151.984589,Y=128.911407,Z=10.222263),InterpMode=CIM_CurveAuto),(InVal=30.500000,OutVal=(X=1493.293945,Y=2802.624268,Z=10.001129),ArriveTangent=(X=246.004013,Y=155.272079,Z=32.222263),LeaveTangent=(X=246.004013,Y=155.272079,Z=32.222263),InterpMode=CIM_CurveAuto),(InVal=33.000000,OutVal=(X=2236.939453,Y=3137.458252,Z=116.001221),ArriveTangent=(X=267.678070,Y=172.983887,Z=22.333364),LeaveTangent=(X=267.678070,Y=172.983887,Z=22.333364),InterpMode=CIM_CurveAuto),(InVal=36.500000,OutVal=(X=3099.362305,Y=3840.527588,Z=144.001312),ArriveTangent=(X=270.794678,Y=30.666443,Z=-2.124977),LeaveTangent=(X=270.794678,Y=30.666443,Z=-2.124977),InterpMode=CIM_CurveAuto),(InVal=41.000000,OutVal=(X=4403.296875,Y=3382.789795,Z=99.001404),ArriveTangent=(X=246.695557,Y=-31.078918,Z=-13.124966),LeaveTangent=(X=246.695557,Y=-31.078918,Z=-13.124966),InterpMode=CIM_CurveAuto),(InVal=44.500000,OutVal=(X=5072.926758,Y=3591.896240,Z=39.001587),ArriveTangent=(X=86.334686,Y=156.272079,Z=-7.285688),LeaveTangent=(X=86.334686,Y=156.272079,Z=-7.285688),InterpMode=CIM_CurveAuto),(InVal=48.000000,OutVal=(X=5007.639648,Y=4476.694336,Z=48.001587),ArriveTangent=(X=93.820839,Y=231.931534,Z=-9.692294),LeaveTangent=(X=93.820839,Y=231.931534,Z=-9.692294),InterpMode=CIM_CurveAuto),(InVal=51.000000,OutVal=(X=5682.762207,Y=5099.451172,Z=-23.998322),ArriveTangent=(X=243.440994,Y=104.865868,Z=-3.714260),LeaveTangent=(X=243.440994,Y=104.865868,Z=-3.714260),InterpMode=CIM_CurveAuto),(InVal=55.000000,OutVal=(X=6711.726563,Y=5210.755371,Z=22.001770),ArriveTangent=(X=220.287125,Y=66.098709,Z=19.428598),LeaveTangent=(X=220.287125,Y=66.098709,Z=19.428598),InterpMode=CIM_CurveAuto),(InVal=58.000000,OutVal=(X=7224.771973,Y=5562.142090,Z=112.001862),ArriveTangent=(X=241.761566,Y=139.739426,Z=33.000031),LeaveTangent=(X=241.761566,Y=139.739426,Z=33.000031),InterpMode=CIM_CurveAuto),(InVal=61.000000,OutVal=(X=8162.295898,Y=6049.191895,Z=220.001953),ArriveTangent=(X=217.954407,Y=193.022766,Z=43.230801),LeaveTangent=(X=217.954407,Y=193.022766,Z=43.230801),InterpMode=CIM_CurveAuto),(InVal=64.500000,OutVal=(X=8641.475586,Y=6816.790039,Z=393.002045),ArriveTangent=(X=171.878769,Y=180.633804,Z=14.285741),LeaveTangent=(X=171.878769,Y=180.633804,Z=14.285741),InterpMode=CIM_CurveAuto),(InVal=68.000000,OutVal=(X=9365.447266,Y=7313.628418,Z=320.002136),ArriveTangent=(X=269.700073,Y=105.803894,Z=-15.624977),LeaveTangent=(X=269.700073,Y=105.803894,Z=-15.624977),InterpMode=CIM_CurveAuto),(InVal=72.500000,OutVal=(X=10799.076172,Y=7663.221191,Z=268.002228),ArriveTangent=(X=247.583740,Y=132.598450,Z=-10.624977),LeaveTangent=(X=247.583740,Y=132.598450,Z=-10.624977),InterpMode=CIM_CurveAuto),(InVal=76.000000,OutVal=(X=11346.117188,Y=8374.416016,Z=235.002319),ArriveTangent=(X=228.867767,Y=96.745232,Z=-4.470567),LeaveTangent=(X=228.867767,Y=96.745232,Z=-4.470567),InterpMode=CIM_CurveAuto),(InVal=81.000000,OutVal=(X=12744.452148,Y=8485.555664,Z=230.002411),ArriveTangent=(X=260.723297,Y=-107.238441,Z=17.888910),LeaveTangent=(X=260.723297,Y=-107.238441,Z=17.888910),InterpMode=CIM_CurveAuto),(InVal=85.000000,OutVal=(X=13692.626953,Y=7409.270020,Z=396.002502),ArriveTangent=(X=15.471163,Y=-214.865692,Z=20.588257),LeaveTangent=(X=15.471163,Y=-214.865692,Z=20.588257),InterpMode=CIM_CurveAuto),(InVal=89.500000,OutVal=(X=12875.957031,Y=6659.197266,Z=405.002594),ArriveTangent=(X=-188.176300,Y=-238.816925,Z=-42.315769),LeaveTangent=(X=-188.176300,Y=-238.816925,Z=-42.315769),InterpMode=CIM_CurveAuto),(InVal=94.500000,OutVal=(X=11904.952148,Y=5140.509277,Z=-5.997314),ArriveTangent=(X=-234.699463,Y=-221.119812,Z=-50.374977),LeaveTangent=(X=-234.699463,Y=-221.119812,Z=-50.374977),InterpMode=CIM_CurveAuto),(InVal=97.500000,OutVal=(X=10998.361328,Y=4890.238770,Z=2.002777),ArriveTangent=(X=-332.337158,Y=-47.456055,Z=5.696552),LeaveTangent=(X=-332.337158,Y=-47.456055,Z=5.696552),InterpMode=CIM_CurveAuto),(InVal=101.000000,OutVal=(X=9744.760742,Y=4832.044922,Z=31.030273),ArriveTangent=(X=-120.274010,Y=-160.230148,Z=-45.529343),LeaveTangent=(X=-120.274010,Y=-160.230148,Z=-45.529343),InterpMode=CIM_CurveAuto),(InVal=106.000000,OutVal=(X=9976.032227,Y=3528.282471,Z=-384.996643),ArriveTangent=(X=-89.353073,Y=-183.822922,Z=-32.638817),LeaveTangent=(X=-89.353073,Y=-183.822922,Z=-32.638817),InterpMode=CIM_CurveAuto),(InVal=112.000000,OutVal=(X=8761.876953,Y=2809.992920,Z=-327.996704),ArriveTangent=(X=-206.298218,Y=-143.590637,Z=5.789486),LeaveTangent=(X=-206.298218,Y=-143.590637,Z=5.789486),InterpMode=CIM_CurveAuto),(InVal=115.500000,OutVal=(X=8016.199219,Y=2164.171387,Z=-329.996521),ArriveTangent=(X=-117.302742,Y=-227.532623,Z=-6.933293),LeaveTangent=(X=-117.302742,Y=-227.532623,Z=-6.933293),InterpMode=CIM_CurveAuto),(InVal=119.500000,OutVal=(X=7882.106445,Y=1103.498291,Z=-379.996399),ArriveTangent=(X=-4.529072,Y=-223.235855,Z=0.153903),LeaveTangent=(X=-4.529072,Y=-223.235855,Z=0.153903),InterpMode=CIM_CurveAuto),(InVal=122.000000,OutVal=(X=7986.760254,Y=713.138367,Z=-328.996155),ArriveTangent=(X=104.632820,Y=-168.880600,Z=-14.307665),LeaveTangent=(X=104.632820,Y=-168.880600,Z=-14.307665),InterpMode=CIM_CurveAuto),(InVal=126.000000,OutVal=(X=8562.219727,Y=5.774414,Z=-472.996216),ArriveTangent=(X=154.766266,Y=-147.970779,Z=-26.999992),LeaveTangent=(X=154.766266,Y=-147.970779,Z=-26.999992),InterpMode=CIM_CurveAuto),(InVal=129.000000,OutVal=(X=9070.124023,Y=-322.657043,Z=-517.996094),ArriveTangent=(X=217.294769,Y=-62.884655,Z=-14.666636),LeaveTangent=(X=217.294769,Y=-62.884655,Z=-14.666636),InterpMode=CIM_CurveAuto),(InVal=132.000000,OutVal=(X=9865.988281,Y=-371.533508,Z=-560.996033),ArriveTangent=(X=293.166443,Y=-13.158134,Z=-7.142831),LeaveTangent=(X=293.166443,Y=-13.158134,Z=-7.142831),InterpMode=CIM_CurveAuto),(InVal=136.000000,OutVal=(X=11122.289063,Y=-414.763977,Z=-567.995911),ArriveTangent=(X=241.395798,Y=105.133339,Z=-0.999965),LeaveTangent=(X=241.395798,Y=105.133339,Z=-0.999965),InterpMode=CIM_CurveAuto),(InVal=139.000000,OutVal=(X=11555.758789,Y=364.399841,Z=-567.995789),ArriveTangent=(X=189.417084,Y=202.362625,Z=15.272772),LeaveTangent=(X=189.417084,Y=202.362625,Z=15.272772),InterpMode=CIM_CurveAuto),(InVal=141.500000,OutVal=(X=12164.083008,Y=698.230408,Z=-483.995667),ArriveTangent=(X=247.860809,Y=75.632683,Z=42.000046),LeaveTangent=(X=247.860809,Y=75.632683,Z=42.000046),InterpMode=CIM_CurveAuto),(InVal=144.500000,OutVal=(X=12918.993164,Y=780.379578,Z=-336.995544),ArriveTangent=(X=270.195801,Y=59.185722,Z=35.833366),LeaveTangent=(X=270.195801,Y=59.185722,Z=35.833366),InterpMode=CIM_CurveAuto),(InVal=147.500000,OutVal=(X=13785.257813,Y=1053.344727,Z=-268.995483),ArriveTangent=(X=260.298492,Y=16.745472,Z=35.272762),LeaveTangent=(X=260.298492,Y=16.745472,Z=35.272762),InterpMode=CIM_CurveAuto),(InVal=150.000000,OutVal=(X=14350.634766,Y=872.479675,Z=-142.995361),ArriveTangent=(X=217.866135,Y=-135.478622,Z=41.818226),LeaveTangent=(X=217.866135,Y=-135.478622,Z=41.818226),InterpMode=CIM_CurveAuto),(InVal=153.000000,OutVal=(X=14983.521484,Y=308.212341,Z=-38.995239),ArriveTangent=(X=88.020439,Y=-199.168198,Z=42.000034),LeaveTangent=(X=88.020439,Y=-199.168198,Z=42.000034),InterpMode=CIM_CurveAuto),(InVal=156.500000,OutVal=(X=14922.767578,Y=-422.113586,Z=130.004852),ArriveTangent=(X=-15.629232,Y=-219.184052,Z=22.166698),LeaveTangent=(X=-15.629232,Y=-219.184052,Z=22.166698),InterpMode=CIM_CurveAuto),(InVal=159.000000,OutVal=(X=14889.746094,Y=-1006.891907,Z=94.004944),ArriveTangent=(X=-24.530500,Y=-223.187088,Z=-23.692266),LeaveTangent=(X=-24.530500,Y=-223.187088,Z=-23.692266),InterpMode=CIM_CurveAuto),(InVal=163.000000,OutVal=(X=14763.319336,Y=-1872.829590,Z=-23.994873),ArriveTangent=(X=-30.784182,Y=-214.454849,Z=-26.285677),LeaveTangent=(X=-30.784182,Y=-214.454849,Z=-26.285677),InterpMode=CIM_CurveAuto),(InVal=166.000000,OutVal=(X=14674.256836,Y=-2508.075684,Z=-89.994781),ArriveTangent=(X=-103.332184,Y=-211.487869,Z=-14.769203),LeaveTangent=(X=-103.332184,Y=-211.487869,Z=-14.769203),InterpMode=CIM_CurveAuto),(InVal=169.500000,OutVal=(X=14091.660156,Y=-3247.500732,Z=-119.994690),ArriveTangent=(X=-197.544220,Y=-182.948196,Z=-8.545416),LeaveTangent=(X=-197.544220,Y=-182.948196,Z=-8.545416),InterpMode=CIM_CurveAuto),(InVal=171.500000,OutVal=(X=13587.763672,Y=-3514.290771,Z=-136.994568),ArriveTangent=(X=-212.867966,Y=-119.543556,Z=12.600055),LeaveTangent=(X=-212.867966,Y=-119.543556,Z=12.600055),InterpMode=CIM_CurveAuto),(InVal=174.500000,OutVal=(X=13027.320313,Y=-3845.218506,Z=-56.994415),ArriveTangent=(X=-231.157608,Y=-107.909149,Z=0.153884),LeaveTangent=(X=-231.157608,Y=-107.909149,Z=0.153884),InterpMode=CIM_CurveAuto),(InVal=178.000000,OutVal=(X=12085.239258,Y=-4215.700195,Z=-135.994324),ArriveTangent=(X=-138.809998,Y=-96.787285,Z=-21.999979),LeaveTangent=(X=-138.809998,Y=-96.787285,Z=-21.999979),InterpMode=CIM_CurveAuto),(InVal=181.500000,OutVal=(X=12055.650391,Y=-4522.729492,Z=-210.994263),ArriveTangent=(X=-74.596611,Y=-187.494522,Z=-30.923040),LeaveTangent=(X=-74.596611,Y=-187.494522,Z=-30.923040),InterpMode=CIM_CurveAuto),(InVal=184.500000,OutVal=(X=11600.361328,Y=-5434.414551,Z=-336.994080),ArriveTangent=(X=-172.391418,Y=-230.507050,Z=-20.266626),LeaveTangent=(X=-172.391418,Y=-230.507050,Z=-20.266626),InterpMode=CIM_CurveAuto),(InVal=189.000000,OutVal=(X=10762.714844,Y=-6251.532227,Z=-362.993958),ArriveTangent=(X=-171.467972,Y=-15.180730,Z=-9.333302),LeaveTangent=(X=-171.467972,Y=-15.180730,Z=-9.333302),InterpMode=CIM_CurveAuto),(InVal=192.000000,OutVal=(X=10314.351563,Y=-5548.270020,Z=-406.993835),ArriveTangent=(X=-219.574707,Y=197.703949,Z=-0.166636),LeaveTangent=(X=-219.574707,Y=197.703949,Z=-0.166636),InterpMode=CIM_CurveAuto),(InVal=195.000000,OutVal=(X=9445.266602,Y=-5065.308594,Z=-363.993774),ArriveTangent=(X=-233.978027,Y=130.158127,Z=18.833364),LeaveTangent=(X=-233.978027,Y=130.158127,Z=18.833364),InterpMode=CIM_CurveAuto),(InVal=198.000000,OutVal=(X=8910.483398,Y=-4767.321289,Z=-293.993652),ArriveTangent=(X=-104.128632,Y=159.126511,Z=40.571465),LeaveTangent=(X=-104.128632,Y=159.126511,Z=40.571465),InterpMode=CIM_CurveAuto),(InVal=202.000000,OutVal=(X=8716.366211,Y=-3951.423096,Z=-79.993530),ArriveTangent=(X=-43.774834,Y=220.485672,Z=30.571461),LeaveTangent=(X=-43.774834,Y=220.485672,Z=30.571461),InterpMode=CIM_CurveAuto),(InVal=205.000000,OutVal=(X=8604.059570,Y=-3223.921631,Z=-79.993439),ArriveTangent=(X=-82.025040,Y=158.181915,Z=0.000033),LeaveTangent=(X=-82.025040,Y=158.181915,Z=0.000033),InterpMode=CIM_CurveAuto),(InVal=207.500000,OutVal=(X=8265.228516,Y=-3081.422607,Z=-79.993347),ArriveTangent=(X=-128.054199,Y=-68.132568,Z=2.166697),LeaveTangent=(X=-128.054199,Y=-68.132568,Z=2.166697),InterpMode=CIM_CurveAuto),(InVal=211.000000,OutVal=(X=7835.734375,Y=-3632.717041,Z=-66.993256),ArriveTangent=(X=-149.559433,Y=-161.448883,Z=1.538490),LeaveTangent=(X=-149.559433,Y=-161.448883,Z=1.538490),InterpMode=CIM_CurveAuto),(InVal=214.000000,OutVal=(X=7293.092285,Y=-4130.840332,Z=-69.993164),ArriveTangent=(X=-213.843506,Y=-51.867027,Z=0.666697),LeaveTangent=(X=-213.843506,Y=-51.867027,Z=0.666697),InterpMode=CIM_CurveAuto),(InVal=217.000000,OutVal=(X=6552.673340,Y=-3943.919189,Z=-62.993073),ArriveTangent=(X=-244.925964,Y=-32.722126,Z=-28.727240),LeaveTangent=(X=-244.925964,Y=-32.722126,Z=-28.727240),InterpMode=CIM_CurveAuto),(InVal=219.500000,OutVal=(X=5945.999512,Y=-4310.812012,Z=-227.992981),ArriveTangent=(X=-89.592125,Y=-181.340988,Z=-69.777748),LeaveTangent=(X=-89.592125,Y=-181.340988,Z=-69.777748),InterpMode=CIM_CurveAuto),(InVal=221.500000,OutVal=(X=6149.508789,Y=-4759.953613,Z=-376.992920),ArriveTangent=(X=202.907715,Y=-86.686279,Z=-61.749954),LeaveTangent=(X=202.907715,Y=-86.686279,Z=-61.749954),InterpMode=CIM_CurveAuto),(InVal=223.500000,OutVal=(X=6757.630371,Y=-4657.557129,Z=-474.992798),ArriveTangent=(X=310.834686,Y=33.178993,Z=-28.857075),LeaveTangent=(X=310.834686,Y=33.178993,Z=-28.857075),InterpMode=CIM_CurveAuto),(InVal=225.000000,OutVal=(X=7237.430176,Y=-4643.827148,Z=-477.992676),ArriveTangent=(X=214.611664,Y=-67.746910,Z=2.333415),LeaveTangent=(X=214.611664,Y=-67.746910,Z=2.333415),InterpMode=CIM_CurveAuto),(InVal=226.500000,OutVal=(X=7401.465332,Y=-4860.797852,Z=-467.992554),ArriveTangent=(X=-92.386581,Y=-154.314178,Z=24.000071),LeaveTangent=(X=-92.386581,Y=-154.314178,Z=24.000071),InterpMode=CIM_CurveAuto),(InVal=228.500000,OutVal=(X=6914.077148,Y=-5183.926758,Z=-393.992432),ArriveTangent=(X=-222.081421,Y=-150.319458,Z=22.500061),LeaveTangent=(X=-222.081421,Y=-150.319458,Z=22.500061),InterpMode=CIM_CurveAuto),(InVal=230.500000,OutVal=(X=6513.139648,Y=-5462.075684,Z=-377.992310),ArriveTangent=(X=-110.185768,Y=-219.825195,Z=-4.666613),LeaveTangent=(X=-110.185768,Y=-219.825195,Z=-4.666613),InterpMode=CIM_CurveAuto),(InVal=233.000000,OutVal=(X=6418.241211,Y=-6173.140137,Z=-414.992188),ArriveTangent=(X=-46.061081,Y=-250.219818,Z=-6.181774),LeaveTangent=(X=-46.061081,Y=-250.219818,Z=-6.181774),InterpMode=CIM_CurveAuto),(InVal=236.000000,OutVal=(X=6259.803711,Y=-6838.284668,Z=-411.992065),ArriveTangent=(X=-155.619873,Y=-142.223480,Z=4.333374),LeaveTangent=(X=-155.619873,Y=-142.223480,Z=4.333374),InterpMode=CIM_CurveAuto),(InVal=239.000000,OutVal=(X=5484.521973,Y=-7026.480957,Z=-388.991943),ArriveTangent=(X=-242.799896,Y=5.541903,Z=7.272772),LeaveTangent=(X=-242.799896,Y=5.541903,Z=7.272772),InterpMode=CIM_CurveAuto),(InVal=241.500000,OutVal=(X=4924.404297,Y=-6807.804199,Z=-371.991821),ArriveTangent=(X=-255.330566,Y=38.414845,Z=-18.199951),LeaveTangent=(X=-255.330566,Y=38.414845,Z=-18.199951),InterpMode=CIM_CurveAuto),(InVal=244.000000,OutVal=(X=4207.869141,Y=-6834.406738,Z=-479.991699),ArriveTangent=(X=-198.103195,Y=205.532715,Z=-23.333294),LeaveTangent=(X=-198.103195,Y=205.532715,Z=-23.333294),InterpMode=CIM_CurveAuto),(InVal=247.500000,OutVal=(X=3735.785156,Y=-5574.607910,Z=-511.991577),ArriveTangent=(X=-44.791992,Y=276.464539,Z=-5.333293),LeaveTangent=(X=-44.791992,Y=276.464539,Z=-5.333293),InterpMode=CIM_CurveAuto),(InVal=250.000000,OutVal=(X=3939.117188,Y=-5175.619629,Z=-511.991455),ArriveTangent=(X=121.655472,Y=204.076950,Z=-21.799963),LeaveTangent=(X=121.655472,Y=204.076950,Z=-21.799963),InterpMode=CIM_CurveAuto),(InVal=252.500000,OutVal=(X=4344.062500,Y=-4554.223145,Z=-620.991394),ArriveTangent=(X=82.099419,Y=229.137451,Z=-46.199963),LeaveTangent=(X=82.099419,Y=229.137451,Z=-46.199963),InterpMode=CIM_CurveAuto),(InVal=255.000000,OutVal=(X=4349.614258,Y=-4029.932373,Z=-742.991272),ArriveTangent=(X=-81.965919,Y=196.767532,Z=-14.599976),LeaveTangent=(X=-81.965919,Y=196.767532,Z=-14.599976),InterpMode=CIM_CurveAuto),(InVal=257.500000,OutVal=(X=3934.232910,Y=-3570.385498,Z=-693.991272),ArriveTangent=(X=-37.958912,Y=234.110992,Z=42.923088),LeaveTangent=(X=-37.958912,Y=234.110992,Z=42.923088),InterpMode=CIM_CurveAuto),(InVal=261.500000,OutVal=(X=4102.881348,Y=-2508.210938,Z=-463.991211),ArriveTangent=(X=37.692188,Y=261.061005,Z=35.466694),LeaveTangent=(X=37.692188,Y=261.061005,Z=35.466694),InterpMode=CIM_CurveAuto),(InVal=265.000000,OutVal=(X=4216.924316,Y=-1612.427979,Z=-427.991089),ArriveTangent=(X=113.231445,Y=275.271637,Z=16.727318),LeaveTangent=(X=113.231445,Y=275.271637,Z=16.727318),InterpMode=CIM_CurveAuto),(InVal=267.000000,OutVal=(X=4725.654297,Y=-994.217102,Z=-371.990967),ArriveTangent=(X=258.998535,Y=220.501999,Z=12.800049),LeaveTangent=(X=258.998535,Y=220.501999,Z=12.800049),InterpMode=CIM_CurveAuto),(InVal=270.000000,OutVal=(X=5511.916992,Y=-509.917908,Z=-363.990845),ArriveTangent=(X=182.940430,Y=160.299881,Z=3.636408),LeaveTangent=(X=182.940430,Y=160.299881,Z=3.636408),InterpMode=CIM_CurveAuto),(InVal=272.500000,OutVal=(X=5731.826660,Y=-112.567810,Z=-351.990723),ArriveTangent=(X=-47.748047,Y=152.812073,Z=36.200050),LeaveTangent=(X=-47.748047,Y=152.812073,Z=36.200050),InterpMode=CIM_CurveAuto),(InVal=275.000000,OutVal=(X=5273.176758,Y=254.142456,Z=-182.990601),ArriveTangent=(X=-237.731445,Y=87.100258,Z=51.272774),LeaveTangent=(X=-237.731445,Y=87.100258,Z=51.272774),InterpMode=CIM_CurveAuto),(InVal=278.000000,OutVal=(X=4424.303711,Y=366.483582,Z=-69.990479),ArriveTangent=(X=-280.109192,Y=1.811268,Z=29.454590),LeaveTangent=(X=-280.109192,Y=1.811268,Z=29.454590),InterpMode=CIM_CurveAuto),(InVal=280.500000,OutVal=(X=3732.576172,Y=264.104431,Z=-20.990356),ArriveTangent=(X=-275.761719,Y=-74.542580,Z=10.600043),LeaveTangent=(X=-275.761719,Y=-74.542580,Z=10.600043),InterpMode=CIM_CurveAuto),(InVal=283.000000,OutVal=(X=3045.495117,Y=-6.229309,Z=-16.990265),ArriveTangent=(X=-129.504791,Y=-110.540825,Z=7.800037),LeaveTangent=(X=-129.504791,Y=-110.540825,Z=7.800037),InterpMode=CIM_CurveAuto),(InVal=285.500000,OutVal=(X=3085.052246,Y=-288.599670,Z=18.009827),ArriveTangent=(X=97.151901,Y=-76.962761,Z=48.181919),LeaveTangent=(X=97.151901,Y=-76.962761,Z=48.181919),InterpMode=CIM_CurveAuto),(InVal=288.500000,OutVal=(X=3579.830566,Y=-429.524475,Z=248.010284),ArriveTangent=(X=214.415588,Y=-185.627716,Z=90.666763),LeaveTangent=(X=214.415588,Y=-185.627716,Z=90.666763),InterpMode=CIM_CurveUser),(InVal=290.500000,OutVal=(X=3876.967773,Y=-692.491760,Z=280.010193),ArriveTangent=(X=324.728760,Y=-77.117340,Z=19.200037),LeaveTangent=(X=324.728760,Y=-77.117340,Z=19.200037),InterpMode=CIM_CurveUser),(InVal=292.500000,OutVal=(X=4126.676758,Y=-431.957825,Z=272.010101),ArriveTangent=(X=-46.792862,Y=134.683517,Z=-7.328104),LeaveTangent=(X=-46.792862,Y=134.683517,Z=-7.328104),InterpMode=CIM_CurveAuto),(InVal=295.000000,OutVal=(X=3666.399902,Y=-86.415955,Z=247.033722),InterpMode=CIM_CurveAuto)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAuto),(InVal=4.000000,OutVal=(X=0.000000,Y=-0.878906,Z=-62.578125),ArriveTangent=(X=0.000000,Y=-0.454963,Z=-14.455422),LeaveTangent=(X=0.000000,Y=-0.454963,Z=-14.455422),InterpMode=CIM_CurveAuto),(InVal=8.500000,OutVal=(X=0.000000,Y=-3.867188,Z=-122.871094),ArriveTangent=(X=0.000000,Y=-0.285645,Z=12.546387),LeaveTangent=(X=0.000000,Y=-0.285645,Z=12.546387),InterpMode=CIM_CurveAuto),(InVal=12.000000,OutVal=(X=0.000000,Y=-3.164063,Z=37.792969),ArriveTangent=(X=0.000000,Y=0.552455,Z=36.261162),LeaveTangent=(X=0.000000,Y=0.552455,Z=36.261162),InterpMode=CIM_CurveAuto),(InVal=15.500000,OutVal=(X=0.000000,Y=0.000000,Z=130.957031),ArriveTangent=(X=0.000000,Y=0.195313,Z=13.945313),LeaveTangent=(X=0.000000,Y=0.195313,Z=13.945313),InterpMode=CIM_CurveUser),(InVal=19.000000,OutVal=(X=0.000000,Y=-2.285156,Z=100.546875),ArriveTangent=(X=0.000000,Y=-1.083984,Z=-0.820313),LeaveTangent=(X=0.000000,Y=-1.083984,Z=-0.820313),InterpMode=CIM_CurveAuto),(InVal=21.500000,OutVal=(X=0.000000,Y=-6.503906,Z=126.035156),ArriveTangent=(X=0.000000,Y=0.312500,Z=-6.953125),LeaveTangent=(X=0.000000,Y=0.312500,Z=-6.953125),InterpMode=CIM_CurveAuto),(InVal=23.500000,OutVal=(X=0.000000,Y=-0.878906,Z=69.257813),ArriveTangent=(X=0.000000,Y=1.479492,Z=-39.804688),LeaveTangent=(X=0.000000,Y=1.479492,Z=-39.804688),InterpMode=CIM_CurveAuto),(InVal=26.000000,OutVal=(X=0.000000,Y=0.153809,Z=-53.085938),ArriveTangent=(X=0.000000,Y=1.230469,Z=-7.207031),LeaveTangent=(X=0.000000,Y=1.230469,Z=-7.207031),InterpMode=CIM_CurveAuto),(InVal=28.500000,OutVal=(X=0.000000,Y=5.273438,Z=33.222656),ArriveTangent=(X=0.000000,Y=0.937500,Z=17.031250),LeaveTangent=(X=0.000000,Y=0.937500,Z=17.031250),InterpMode=CIM_CurveAuto),(InVal=30.500000,OutVal=(X=0.000000,Y=4.372559,Z=23.554688),ArriveTangent=(X=0.000000,Y=-0.200195,Z=-0.625000),LeaveTangent=(X=0.000000,Y=-0.200195,Z=-0.625000),InterpMode=CIM_CurveAuto),(InVal=33.000000,OutVal=(X=0.000000,Y=4.372559,Z=30.410156),ArriveTangent=(X=0.000000,Y=-0.552979,Z=-10.693359),LeaveTangent=(X=0.000000,Y=-0.552979,Z=-10.693359),InterpMode=CIM_CurveAuto),(InVal=36.500000,OutVal=(X=0.000000,Y=1.054688,Z=-40.605469),ArriveTangent=(X=0.000000,Y=-1.447449,Z=-6.262207),LeaveTangent=(X=0.000000,Y=-1.447449,Z=-6.262207),InterpMode=CIM_CurveAuto),(InVal=41.000000,OutVal=(X=0.000000,Y=-7.207031,Z=-19.687500),ArriveTangent=(X=0.000000,Y=-0.615234,Z=14.348145),LeaveTangent=(X=0.000000,Y=-0.615234,Z=14.348145),InterpMode=CIM_CurveAuto),(InVal=44.500000,OutVal=(X=0.000000,Y=-3.867188,Z=74.179688),ArriveTangent=(X=0.000000,Y=0.100446,Z=9.542411),LeaveTangent=(X=0.000000,Y=0.100446,Z=9.542411),InterpMode=CIM_CurveAuto),(InVal=48.000000,OutVal=(X=0.000000,Y=-6.503906,Z=47.109375),ArriveTangent=(X=0.000000,Y=0.594952,Z=-10.195313),LeaveTangent=(X=0.000000,Y=0.594952,Z=-10.195313),InterpMode=CIM_CurveAuto),(InVal=51.000000,OutVal=(X=0.000000,Y=0.000000,Z=7.910156),ArriveTangent=(X=0.000000,Y=0.803571,Z=-15.970983),LeaveTangent=(X=0.000000,Y=0.803571,Z=-15.970983),InterpMode=CIM_CurveAuto),(InVal=55.000000,OutVal=(X=0.000000,Y=-0.878906,Z=-64.687500),ArriveTangent=(X=0.000000,Y=-0.125558,Z=2.837612),LeaveTangent=(X=0.000000,Y=-0.125558,Z=2.837612),InterpMode=CIM_CurveAuto),(InVal=58.000000,OutVal=(X=0.000000,Y=-0.878906,Z=27.773438),ArriveTangent=(X=0.000000,Y=0.000000,Z=15.615234),LeaveTangent=(X=0.000000,Y=0.000000,Z=15.615234),InterpMode=CIM_CurveAuto),(InVal=61.000000,OutVal=(X=0.000000,Y=-0.878906,Z=29.003906),ArriveTangent=(X=0.000000,Y=-0.919471,Z=-11.168871),LeaveTangent=(X=0.000000,Y=-0.919471,Z=-11.168871),InterpMode=CIM_CurveAuto),(InVal=64.500000,OutVal=(X=0.000000,Y=-6.855469,Z=-44.824219),ArriveTangent=(X=0.000000,Y=-0.853795,Z=-3.264509),LeaveTangent=(X=0.000000,Y=-0.853795,Z=-3.264509),InterpMode=CIM_CurveAuto),(InVal=68.000000,OutVal=(X=0.000000,Y=-6.855469,Z=6.152344),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.184570),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.184570),InterpMode=CIM_CurveAuto),(InVal=72.500000,OutVal=(X=0.000000,Y=-6.855469,Z=28.652344),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.361816),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.361816),InterpMode=CIM_CurveAuto),(InVal=76.000000,OutVal=(X=0.000000,Y=-6.855469,Z=-20.742188),ArriveTangent=(X=0.000000,Y=0.496324,Z=-18.798254),LeaveTangent=(X=0.000000,Y=0.496324,Z=-18.798254),InterpMode=CIM_CurveAuto),(InVal=81.000000,OutVal=(X=0.000000,Y=-2.636719,Z=-131.132813),ArriveTangent=(X=0.000000,Y=0.273438,Z=-16.171875),LeaveTangent=(X=0.000000,Y=0.273438,Z=-16.171875),InterpMode=CIM_CurveAuto),(InVal=85.000000,OutVal=(X=0.000000,Y=-4.394531,Z=-166.289063),ArriveTangent=(X=0.000000,Y=-1.075368,Z=1.137408),LeaveTangent=(X=0.000000,Y=-1.075368,Z=1.137408),InterpMode=CIM_CurveAuto),(InVal=89.500000,OutVal=(X=0.000000,Y=-11.777344,Z=-121.464844),ArriveTangent=(X=0.000000,Y=0.351563,Z=2.682977),LeaveTangent=(X=0.000000,Y=0.351563,Z=2.682977),InterpMode=CIM_CurveAuto),(InVal=94.500000,OutVal=(X=0.000000,Y=-1.054688,Z=-140.800781),ArriveTangent=(X=0.000000,Y=1.340332,Z=-7.141113),LeaveTangent=(X=0.000000,Y=1.340332,Z=-7.141113),InterpMode=CIM_CurveAuto),(InVal=97.500000,OutVal=(X=0.000000,Y=-1.054688,Z=-178.593750),ArriveTangent=(X=0.000000,Y=-0.757212,Z=1.595553),LeaveTangent=(X=0.000000,Y=-0.757212,Z=1.595553),InterpMode=CIM_CurveAuto),(InVal=101.000000,OutVal=(X=0.000000,Y=-5.976563,Z=-130.429688),ArriveTangent=(X=0.000000,Y=-1.137408,Z=14.848346),LeaveTangent=(X=0.000000,Y=-1.137408,Z=14.848346),InterpMode=CIM_CurveAuto),(InVal=106.000000,OutVal=(X=0.000000,Y=-10.722656,Z=-52.382813),ArriveTangent=(X=0.000000,Y=0.015980,Z=-0.271662),LeaveTangent=(X=0.000000,Y=0.015980,Z=-0.271662),InterpMode=CIM_CurveAuto),(InVal=112.000000,OutVal=(X=0.000000,Y=-5.800781,Z=-133.417969),ArriveTangent=(X=0.000000,Y=0.037007,Z=-7.049753),LeaveTangent=(X=0.000000,Y=0.037007,Z=-7.049753),InterpMode=CIM_CurveAuto),(InVal=115.500000,OutVal=(X=0.000000,Y=-10.371094,Z=-119.355469),ArriveTangent=(X=0.000000,Y=-0.234375,Z=0.609375),LeaveTangent=(X=0.000000,Y=-0.234375,Z=0.609375),InterpMode=CIM_CurveAuto),(InVal=119.500000,OutVal=(X=0.000000,Y=-7.558594,Z=-128.847656),ArriveTangent=(X=0.000000,Y=0.459736,Z=11.682693),LeaveTangent=(X=0.000000,Y=0.459736,Z=11.682693),InterpMode=CIM_CurveAuto),(InVal=122.000000,OutVal=(X=0.000000,Y=-7.382813,Z=-43.417969),ArriveTangent=(X=0.000000,Y=0.027043,Z=11.358173),LeaveTangent=(X=0.000000,Y=0.027043,Z=11.358173),InterpMode=CIM_CurveAuto),(InVal=126.000000,OutVal=(X=0.000000,Y=-7.382813,Z=-55.019531),ArriveTangent=(X=0.000000,Y=0.326451,Z=-13.610492),LeaveTangent=(X=0.000000,Y=0.326451,Z=-13.610492),InterpMode=CIM_CurveAuto),(InVal=129.000000,OutVal=(X=0.000000,Y=-5.097656,Z=-138.691406),ArriveTangent=(X=0.000000,Y=0.820313,Z=8.583984),LeaveTangent=(X=0.000000,Y=0.820313,Z=8.583984),InterpMode=CIM_CurveAuto),(InVal=132.000000,OutVal=(X=0.000000,Y=-2.460938,Z=-3.515625),ArriveTangent=(X=0.000000,Y=-0.301339,Z=25.086496),LeaveTangent=(X=0.000000,Y=-0.301339,Z=25.086496),InterpMode=CIM_CurveAuto),(InVal=136.000000,OutVal=(X=0.000000,Y=-7.207031,Z=36.914063),ArriveTangent=(X=0.000000,Y=0.301339,Z=6.252790),LeaveTangent=(X=0.000000,Y=0.301339,Z=6.252790),InterpMode=CIM_CurveAuto),(InVal=139.000000,OutVal=(X=0.000000,Y=-0.351563,Z=40.253906),ArriveTangent=(X=0.000000,Y=1.310369,Z=-5.049716),LeaveTangent=(X=0.000000,Y=1.310369,Z=-5.049716),InterpMode=CIM_CurveAuto),(InVal=141.500000,OutVal=(X=0.000000,Y=0.000000,Z=9.140625),ArriveTangent=(X=0.000000,Y=0.415483,Z=-11.409801),LeaveTangent=(X=0.000000,Y=0.415483,Z=-11.409801),InterpMode=CIM_CurveAuto),(InVal=144.500000,OutVal=(X=0.000000,Y=1.933594,Z=-22.500000),ArriveTangent=(X=0.000000,Y=0.322266,Z=-4.775391),LeaveTangent=(X=0.000000,Y=0.322266,Z=-4.775391),InterpMode=CIM_CurveAuto),(InVal=147.500000,OutVal=(X=0.000000,Y=1.933594,Z=-19.511719),ArriveTangent=(X=0.000000,Y=1.438210,Z=-4.730114),LeaveTangent=(X=0.000000,Y=1.438210,Z=-4.730114),InterpMode=CIM_CurveAuto),(InVal=150.000000,OutVal=(X=0.000000,Y=9.843750,Z=-48.515625),ArriveTangent=(X=0.000000,Y=0.351563,Z=-14.062500),LeaveTangent=(X=0.000000,Y=0.351563,Z=-14.062500),InterpMode=CIM_CurveAuto),(InVal=153.000000,OutVal=(X=0.000000,Y=3.867188,Z=-96.855469),ArriveTangent=(X=0.000000,Y=-2.325721,Z=-18.200121),LeaveTangent=(X=0.000000,Y=-2.325721,Z=-18.200121),InterpMode=CIM_CurveAuto),(InVal=156.500000,OutVal=(X=0.000000,Y=-5.273438,Z=-166.816406),ArriveTangent=(X=0.000000,Y=-1.201172,Z=-1.933594),LeaveTangent=(X=0.000000,Y=-1.201172,Z=-1.933594),InterpMode=CIM_CurveAuto),(InVal=159.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-108.457031),ArriveTangent=(X=0.000000,Y=-0.378606,Z=10.736178),LeaveTangent=(X=0.000000,Y=-0.378606,Z=10.736178),InterpMode=CIM_CurveAuto),(InVal=163.000000,OutVal=(X=0.000000,Y=-7.734375,Z=-97.031250),ArriveTangent=(X=0.000000,Y=-0.276228,Z=-2.712054),LeaveTangent=(X=0.000000,Y=-0.276228,Z=-2.712054),InterpMode=CIM_CurveAuto),(InVal=166.000000,OutVal=(X=0.000000,Y=-5.273438,Z=-127.441406),ArriveTangent=(X=0.000000,Y=0.811298,Z=-5.381611),LeaveTangent=(X=0.000000,Y=0.811298,Z=-5.381611),InterpMode=CIM_CurveAuto),(InVal=169.500000,OutVal=(X=0.000000,Y=-2.460938,Z=-132.011719),ArriveTangent=(X=0.000000,Y=1.022727,Z=-9.556108),LeaveTangent=(X=0.000000,Y=1.022727,Z=-9.556108),InterpMode=CIM_CurveAuto),(InVal=171.500000,OutVal=(X=0.000000,Y=0.351563,Z=-180.000000),ArriveTangent=(X=0.000000,Y=0.773438,Z=-27.527344),LeaveTangent=(X=0.000000,Y=0.773438,Z=-27.527344),InterpMode=CIM_CurveAuto),(InVal=174.500000,OutVal=(X=0.000000,Y=1.406250,Z=-269.648438),ArriveTangent=(X=0.000000,Y=-0.594952,Z=-12.034255),LeaveTangent=(X=0.000000,Y=-0.594952,Z=-12.034255),InterpMode=CIM_CurveAuto),(InVal=178.000000,OutVal=(X=0.000000,Y=-3.515625,Z=-258.222656),ArriveTangent=(X=0.000000,Y=-1.155134,Z=22.952009),LeaveTangent=(X=0.000000,Y=-1.155134,Z=22.952009),InterpMode=CIM_CurveAuto),(InVal=181.500000,OutVal=(X=0.000000,Y=-6.679688,Z=-108.984375),ArriveTangent=(X=0.000000,Y=-0.486779,Z=19.849760),LeaveTangent=(X=0.000000,Y=-0.486779,Z=19.849760),InterpMode=CIM_CurveAuto),(InVal=184.500000,OutVal=(X=0.000000,Y=-6.679688,Z=-129.199219),ArriveTangent=(X=0.000000,Y=0.585938,Z=-24.093752),LeaveTangent=(X=0.000000,Y=0.585938,Z=-24.093752),InterpMode=CIM_CurveAuto),(InVal=189.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-289.687500),ArriveTangent=(X=0.000000,Y=0.328125,Z=-15.585938),LeaveTangent=(X=0.000000,Y=0.328125,Z=-15.585938),InterpMode=CIM_CurveAuto),(InVal=192.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-246.093750),ArriveTangent=(X=0.000000,Y=-0.322266,Z=17.226563),LeaveTangent=(X=0.000000,Y=-0.322266,Z=17.226563),InterpMode=CIM_CurveAuto),(InVal=195.000000,OutVal=(X=0.000000,Y=-4.218750,Z=-186.328125),ArriveTangent=(X=0.000000,Y=1.666260,Z=-2.226563),LeaveTangent=(X=0.000000,Y=1.666260,Z=-2.226563),InterpMode=CIM_CurveAuto),(InVal=198.000000,OutVal=(X=0.000000,Y=5.778809,Z=-259.453125),ArriveTangent=(X=0.000000,Y=-0.251116,Z=-7.734375),LeaveTangent=(X=0.000000,Y=-0.251116,Z=-7.734375),InterpMode=CIM_CurveAuto),(InVal=202.000000,OutVal=(X=0.000000,Y=-5.976563,Z=-240.468750),ArriveTangent=(X=0.000000,Y=-1.679339,Z=-3.088728),LeaveTangent=(X=0.000000,Y=-1.679339,Z=-3.088728),InterpMode=CIM_CurveAuto),(InVal=205.000000,OutVal=(X=0.000000,Y=-5.976563,Z=-281.074219),ArriveTangent=(X=0.000000,Y=-0.543324,Z=9.044744),LeaveTangent=(X=0.000000,Y=-0.543324,Z=9.044744),InterpMode=CIM_CurveAuto),(InVal=207.500000,OutVal=(X=0.000000,Y=-8.964844,Z=-190.722656),ArriveTangent=(X=0.000000,Y=-0.439453,Z=24.638672),LeaveTangent=(X=0.000000,Y=-0.439453,Z=24.638672),InterpMode=CIM_CurveAuto),(InVal=211.000000,OutVal=(X=0.000000,Y=-8.613281,Z=-133.242188),ArriveTangent=(X=0.000000,Y=0.135216,Z=0.108173),LeaveTangent=(X=0.000000,Y=0.135216,Z=0.108173),InterpMode=CIM_CurveAuto),(InVal=214.000000,OutVal=(X=0.000000,Y=-8.085938,Z=-190.019531),ArriveTangent=(X=0.000000,Y=0.322266,Z=-3.222656),LeaveTangent=(X=0.000000,Y=0.322266,Z=-3.222656),InterpMode=CIM_CurveAuto),(InVal=217.000000,OutVal=(X=0.000000,Y=-6.679688,Z=-152.578125),ArriveTangent=(X=0.000000,Y=0.223722,Z=18.760654),LeaveTangent=(X=0.000000,Y=0.223722,Z=18.760654),InterpMode=CIM_CurveAuto),(InVal=219.500000,OutVal=(X=0.000000,Y=-6.855469,Z=-86.835938),ArriveTangent=(X=0.000000,Y=0.429688,Z=30.078125),LeaveTangent=(X=0.000000,Y=0.429688,Z=30.078125),InterpMode=CIM_CurveAuto),(InVal=221.500000,OutVal=(X=0.000000,Y=-4.746094,Z=-17.226563),ArriveTangent=(X=0.000000,Y=1.406250,Z=20.522461),LeaveTangent=(X=0.000000,Y=1.406250,Z=20.522461),InterpMode=CIM_CurveAuto),(InVal=223.500000,OutVal=(X=0.000000,Y=-1.230469,Z=-4.746094),ArriveTangent=(X=0.000000,Y=0.703125,Z=-13.560268),LeaveTangent=(X=0.000000,Y=0.703125,Z=-13.560268),InterpMode=CIM_CurveAuto),(InVal=225.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-64.687500),ArriveTangent=(X=0.000000,Y=-0.878906,Z=-48.632813),LeaveTangent=(X=0.000000,Y=-0.878906,Z=-48.632813),InterpMode=CIM_CurveAuto),(InVal=226.500000,OutVal=(X=0.000000,Y=-3.867188,Z=-150.644531),ArriveTangent=(X=0.000000,Y=-0.251116,Z=-21.545759),LeaveTangent=(X=0.000000,Y=-0.251116,Z=-21.545759),InterpMode=CIM_CurveAuto),(InVal=228.500000,OutVal=(X=0.000000,Y=-3.164063,Z=-140.097656),ArriveTangent=(X=0.000000,Y=-0.131836,Z=7.031250),LeaveTangent=(X=0.000000,Y=-0.131836,Z=7.031250),InterpMode=CIM_CurveAuto),(InVal=230.500000,OutVal=(X=0.000000,Y=-4.394531,Z=-122.519531),ArriveTangent=(X=0.000000,Y=-0.273438,Z=10.117188),LeaveTangent=(X=0.000000,Y=-0.273438,Z=10.117188),InterpMode=CIM_CurveAuto),(InVal=233.000000,OutVal=(X=0.000000,Y=-4.394531,Z=-94.570313),ArriveTangent=(X=0.000000,Y=0.767045,Z=-22.819603),LeaveTangent=(X=0.000000,Y=0.767045,Z=-22.819603),InterpMode=CIM_CurveAuto),(InVal=236.000000,OutVal=(X=0.000000,Y=-0.175781,Z=-248.027344),ArriveTangent=(X=0.000000,Y=0.703125,Z=-33.603516),LeaveTangent=(X=0.000000,Y=0.703125,Z=-33.603516),InterpMode=CIM_CurveAuto),(InVal=239.000000,OutVal=(X=0.000000,Y=-0.175781,Z=-296.191406),ArriveTangent=(X=0.000000,Y=0.095881,Z=13.902699),LeaveTangent=(X=0.000000,Y=0.095881,Z=13.902699),InterpMode=CIM_CurveAuto),(InVal=241.500000,OutVal=(X=0.000000,Y=0.351563,Z=-171.562500),ArriveTangent=(X=0.000000,Y=-0.070313,Z=26.121094),LeaveTangent=(X=0.000000,Y=-0.070313,Z=26.121094),InterpMode=CIM_CurveAuto),(InVal=244.000000,OutVal=(X=0.000000,Y=-0.527344,Z=-165.585938),ArriveTangent=(X=0.000000,Y=-0.146484,Z=-3.427734),LeaveTangent=(X=0.000000,Y=-0.146484,Z=-3.427734),InterpMode=CIM_CurveAuto),(InVal=247.500000,OutVal=(X=0.000000,Y=-0.527344,Z=-192.128906),ArriveTangent=(X=0.000000,Y=-0.146484,Z=-24.697266),LeaveTangent=(X=0.000000,Y=-0.146484,Z=-24.697266),InterpMode=CIM_CurveAuto),(InVal=250.000000,OutVal=(X=0.000000,Y=-1.406250,Z=-313.769531),ArriveTangent=(X=0.000000,Y=-1.582031,Z=-20.953125),LeaveTangent=(X=0.000000,Y=-1.582031,Z=-20.953125),InterpMode=CIM_CurveAuto),(InVal=252.500000,OutVal=(X=0.000000,Y=-8.437500,Z=-296.894531),ArriveTangent=(X=0.000000,Y=0.808594,Z=17.156250),LeaveTangent=(X=0.000000,Y=0.808594,Z=17.156250),InterpMode=CIM_CurveAuto),(InVal=255.000000,OutVal=(X=0.000000,Y=2.636719,Z=-227.988281),ArriveTangent=(X=0.000000,Y=2.702637,Z=7.171875),LeaveTangent=(X=0.000000,Y=2.702637,Z=7.171875),InterpMode=CIM_CurveAuto),(InVal=257.500000,OutVal=(X=0.000000,Y=5.075684,Z=-261.035156),ArriveTangent=(X=0.000000,Y=-0.649038,Z=-8.140024),LeaveTangent=(X=0.000000,Y=-0.649038,Z=-8.140024),InterpMode=CIM_CurveAuto),(InVal=261.500000,OutVal=(X=0.000000,Y=-1.582031,Z=-280.898438),ArriveTangent=(X=0.000000,Y=-0.887695,Z=-6.351563),LeaveTangent=(X=0.000000,Y=-0.887695,Z=-6.351563),InterpMode=CIM_CurveAuto),(InVal=265.000000,OutVal=(X=0.000000,Y=-1.582031,Z=-308.671875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.392045),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.392045),InterpMode=CIM_CurveAuto),(InVal=267.000000,OutVal=(X=0.000000,Y=-1.582031,Z=-316.054688),ArriveTangent=(X=0.000000,Y=-0.140625,Z=-12.621094),LeaveTangent=(X=0.000000,Y=-0.140625,Z=-12.621094),InterpMode=CIM_CurveAuto),(InVal=270.000000,OutVal=(X=0.000000,Y=-2.285156,Z=-371.777344),ArriveTangent=(X=0.000000,Y=1.534091,Z=9.843750),LeaveTangent=(X=0.000000,Y=1.534091,Z=9.843750),InterpMode=CIM_CurveAuto),(InVal=272.500000,OutVal=(X=0.000000,Y=6.855469,Z=-261.914063),ArriveTangent=(X=0.000000,Y=2.039063,Z=33.890625),LeaveTangent=(X=0.000000,Y=2.039063,Z=33.890625),InterpMode=CIM_CurveAuto),(InVal=275.000000,OutVal=(X=0.000000,Y=7.910156,Z=-202.324219),ArriveTangent=(X=0.000000,Y=0.191761,Z=14.893466),LeaveTangent=(X=0.000000,Y=0.191761,Z=14.893466),InterpMode=CIM_CurveAuto),(InVal=278.000000,OutVal=(X=0.000000,Y=7.910156,Z=-180.000000),ArriveTangent=(X=0.000000,Y=-0.862926,Z=8.725142),LeaveTangent=(X=0.000000,Y=-0.862926,Z=8.725142),InterpMode=CIM_CurveAuto),(InVal=280.500000,OutVal=(X=0.000000,Y=3.164063,Z=-154.335938),ArriveTangent=(X=0.000000,Y=-2.671875,Z=11.074219),LeaveTangent=(X=0.000000,Y=-2.671875,Z=11.074219),InterpMode=CIM_CurveAuto),(InVal=283.000000,OutVal=(X=0.000000,Y=-5.449219,Z=-124.628906),ArriveTangent=(X=0.000000,Y=3.656250,Z=27.246094),LeaveTangent=(X=0.000000,Y=3.656250,Z=27.246094),InterpMode=CIM_CurveAuto),(InVal=285.500000,OutVal=(X=0.000000,Y=21.445313,Z=-18.105469),ArriveTangent=(X=0.000000,Y=0.735085,Z=1.629972),LeaveTangent=(X=0.000000,Y=0.735085,Z=1.629972),InterpMode=CIM_CurveAuto),(InVal=288.500000,OutVal=(X=0.000000,Y=-1.406250,Z=-115.664063),ArriveTangent=(X=0.000000,Y=-7.734375,Z=-9.902344),LeaveTangent=(X=0.000000,Y=-7.734375,Z=-9.902344),InterpMode=CIM_CurveUser),(InVal=290.500000,OutVal=(X=0.000000,Y=-1.757813,Z=-47.812500),ArriveTangent=(X=0.000000,Y=-0.210938,Z=60.750000),LeaveTangent=(X=0.000000,Y=-0.210938,Z=60.750000),InterpMode=CIM_CurveUser),(InVal=292.500000,OutVal=(X=0.000000,Y=-1.933594,Z=36.210938),ArriveTangent=(X=0.000000,Y=-0.156250,Z=40.742188),LeaveTangent=(X=0.000000,Y=-0.156250,Z=40.742188),InterpMode=CIM_CurveAuto),(InVal=295.000000,OutVal=(X=0.000000,Y=-2.460938,Z=135.527344),InterpMode=CIM_CurveAuto)))
         LookupTrack=(Points=(,(Time=4.000000),(Time=8.500000),(Time=12.000000),(Time=15.500000),(Time=19.000000),(Time=21.500000),(Time=23.500000),(Time=26.000000),(Time=28.500000),(Time=30.500000),(Time=33.000000),(Time=36.500000),(Time=41.000000),(Time=44.500000),(Time=48.000000),(Time=51.000000),(Time=55.000000),(Time=58.000000),(Time=61.000000),(Time=64.500000),(Time=68.000000),(Time=72.500000),(Time=76.000000),(Time=81.000000),(Time=85.000000),(Time=89.500000),(Time=94.500000),(Time=97.500000),(Time=101.000000),(Time=106.000000),(Time=112.000000),(Time=115.500000),(Time=119.500000),(Time=122.000000),(Time=126.000000),(Time=129.000000),(Time=132.000000),(Time=136.000000),(Time=139.000000),(Time=141.500000),(Time=144.500000),(Time=147.500000),(Time=150.000000),(Time=153.000000),(Time=156.500000),(Time=159.000000),(Time=163.000000),(Time=166.000000),(Time=169.500000),(Time=171.500000),(Time=174.500000),(Time=178.000000),(Time=181.500000),(Time=184.500000),(Time=189.000000),(Time=192.000000),(Time=195.000000),(Time=198.000000),(Time=202.000000),(Time=205.000000),(Time=207.500000),(Time=211.000000),(Time=214.000000),(Time=217.000000),(Time=219.500000),(Time=221.500000),(Time=223.500000),(Time=225.000000),(Time=226.500000),(Time=228.500000),(Time=230.500000),(Time=233.000000),(Time=236.000000),(Time=239.000000),(Time=241.500000),(Time=244.000000),(Time=247.500000),(Time=250.000000),(Time=252.500000),(Time=255.000000),(Time=257.500000),(Time=261.500000),(Time=265.000000),(Time=267.000000),(Time=270.000000),(Time=272.500000),(Time=275.000000),(Time=278.000000),(Time=280.500000),(Time=283.000000),(Time=285.500000),(Time=288.500000),(Time=290.500000),(Time=292.500000),(Time=295.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_0'
      InterpTracks(1)=InterpTrackFloatProp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackFloatProp_0'
      GroupName="FlythroughCamera"
      GroupColor=(B=213,G=105,R=0,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="FlythroughCamera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=69,G=225,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=295.000000
   InterpGroups(0)=InterpGroup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionStart=284.500000
   EdSectionEnd=295.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=400
   ObjPosY=88
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=CameraActor'KF-BLACKFOREST.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=512
   ObjPosY=88
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=18,OverrideDelta=11)
   VariableLinks(0)=(DrawX=167,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=-48
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=266,OverrideDelta=11)
   OutputLinks(0)=(DrawY=266,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=296,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=232
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-54,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-54,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=744,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=680
   ObjPosY=-88
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=456
   ObjPosY=336
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
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=40
   ObjPosY=-136
   ObjComment="Benchmark"
   DrawWidth=805
   DrawHeight=572
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=DominantDirectionalLight'KF-BLACKFOREST.TheWorld:PersistentLevel.DominantDirectionalLight_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=-528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_14'
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=349,OverrideDelta=14)
   OutputLinks(1)=(DrawY=370,OverrideDelta=35)
   OutputLinks(2)=(DrawY=391,OverrideDelta=56)
   VariableLinks(0)=(DrawX=4598,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4512
   ObjPosY=280
   ObjName="TriggerVolume_14 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=357,OverrideDelta=14)
   InputLinks(1)=(DrawY=378,OverrideDelta=35)
   InputLinks(2)=(DrawY=399,OverrideDelta=56)
   OutputLinks(0)=(DrawY=378,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=4878,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4929,OverrideDelta=76)
   EventLinks(0)=(DrawX=4978,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4840
   ObjPosY=320
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=Emitter'KF-BLACKFOREST.TheWorld:PersistentLevel.Emitter_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4848
   ObjPosY=456
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=561
   SizeY=293
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4512
   ObjPosY=256
   ObjComment="Looping emitter"
   DrawWidth=561
   DrawHeight=293
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_15'
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),DrawY=357,OverrideDelta=14)
   OutputLinks(1)=(DrawY=378,OverrideDelta=35)
   OutputLinks(2)=(DrawY=399,OverrideDelta=56)
   VariableLinks(0)=(DrawX=2198,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=288
   ObjName="TriggerVolume_15 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=349,OverrideDelta=14)
   InputLinks(1)=(DrawY=370,OverrideDelta=35)
   InputLinks(2)=(DrawY=391,OverrideDelta=56)
   OutputLinks(0)=(DrawY=370,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=2422,OverrideDelta=16)
   VariableLinks(1)=(DrawX=2473,OverrideDelta=76)
   EventLinks(0)=(DrawX=2522,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=312
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=Emitter'KF-BLACKFOREST.TheWorld:PersistentLevel.Emitter_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=448
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_17
   SizeX=505
   SizeY=277
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=264
   ObjComment="Looping emitter"
   DrawWidth=505
   DrawHeight=277
   Name="SequenceFrame_17"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   ClassProximityTypes(2)=Class'KFGame.KFPawn'
   Originator=TriggerVolume'KF-BLACKFOREST.TheWorld:PersistentLevel.TriggerVolume_16'
   bPlayerOnly=False
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),DrawY=125,OverrideDelta=14)
   OutputLinks(1)=(DrawY=146,OverrideDelta=35)
   OutputLinks(2)=(DrawY=167,OverrideDelta=56)
   VariableLinks(0)=(DrawX=3798,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=56
   ObjName="TriggerVolume_16 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=109,OverrideDelta=14)
   InputLinks(1)=(DrawY=130,OverrideDelta=35)
   InputLinks(2)=(DrawY=151,OverrideDelta=56)
   OutputLinks(0)=(DrawY=130,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=4014,OverrideDelta=16)
   VariableLinks(1)=(DrawX=4065,OverrideDelta=76)
   EventLinks(0)=(DrawX=4114,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3976
   ObjPosY=72
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'KF-BLACKFOREST.TheWorld:PersistentLevel.Emitter_248'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3976
   ObjPosY=200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_18
   SizeX=497
   SizeY=292
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=16
   ObjComment="Looping emitter"
   DrawWidth=497
   DrawHeight=292
   Name="SequenceFrame_18"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=SpotLight'KF-BLACKFOREST.TheWorld:PersistentLevel.SpotLight_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=-544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=SpotLight'KF-BLACKFOREST.TheWorld:PersistentLevel.SpotLight_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=832
   ObjPosY=-544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=SpotLight'KF-BLACKFOREST.TheWorld:PersistentLevel.SpotLight_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=-552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=SpotLight'KF-BLACKFOREST.TheWorld:PersistentLevel.SpotLight_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=976
   ObjPosY=-568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=1746
   SizeY=636
   bDrawBox=True
   FillColor=(B=125,G=255,R=123,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1952
   ObjPosY=-1000
   ObjComment="Portal Spawns - Mill "
   DrawWidth=1746
   DrawHeight=636
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=3532
   SizeY=946
   bDrawBox=True
   FillColor=(B=125,G=255,R=123,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1952
   ObjPosY=-232
   ObjComment="Portal Spawns - Rocks"
   DrawWidth=3532
   DrawHeight=946
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=3542
   SizeY=1522
   bDrawBox=True
   FillColor=(B=125,G=255,R=123,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1944
   ObjPosY=896
   ObjComment="Portal Spawns - Trees"
   DrawWidth=3542
   DrawHeight=1522
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_24
   InputLinks(0)=(DrawY=925,OverrideDelta=14)
   InputLinks(1)=(DrawY=946,OverrideDelta=35)
   InputLinks(2)=(DrawY=967,OverrideDelta=56)
   OutputLinks(0)=(DrawY=946,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=198,OverrideDelta=16)
   VariableLinks(1)=(DrawX=249,OverrideDelta=76)
   EventLinks(0)=(DrawX=298,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=160
   ObjPosY=888
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_24"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=40
   ObjPosY=1088
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=128
   ObjPosY=1088
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=1088
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=1088
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=24
   ObjPosY=1160
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=112
   ObjPosY=1160
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=1160
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=312
   ObjPosY=1160
   ObjComment="Cave"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=1325,OverrideDelta=14)
   InputLinks(1)=(DrawY=1346,OverrideDelta=35)
   InputLinks(2)=(DrawY=1367,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1346,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=182,OverrideDelta=16)
   VariableLinks(1)=(DrawX=233,OverrideDelta=76)
   EventLinks(0)=(DrawX=282,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=144
   ObjPosY=1288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=1448
   ObjComment="Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=192
   ObjPosY=1448
   ObjComment="Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8
   ObjPosY=1504
   ObjComment="Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=1504
   ObjComment="Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=184
   ObjPosY=1504
   ObjComment="Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=1504
   ObjComment="Waterfall"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=1661,OverrideDelta=14)
   InputLinks(1)=(DrawY=1682,OverrideDelta=35)
   InputLinks(2)=(DrawY=1703,OverrideDelta=56)
   OutputLinks(0)=(DrawY=1682,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=142,OverrideDelta=16)
   VariableLinks(1)=(DrawX=193,OverrideDelta=76)
   EventLinks(0)=(DrawX=242,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=1624
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=32
   ObjPosY=1792
   ObjComment="Forest"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=136
   ObjPosY=1792
   ObjComment="Forest"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=1792
   ObjComment="Forest"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=1856
   ObjComment="Forest"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=112
   ObjPosY=1856
   ObjComment="Forest"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=216
   ObjPosY=1856
   ObjComment="Forest"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=2093,OverrideDelta=14)
   InputLinks(1)=(DrawY=2114,OverrideDelta=35)
   InputLinks(2)=(DrawY=2135,OverrideDelta=56)
   OutputLinks(0)=(DrawY=2114,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=190,OverrideDelta=16)
   VariableLinks(1)=(DrawX=241,OverrideDelta=76)
   EventLinks(0)=(DrawX=290,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=152
   ObjPosY=2056
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=1101,OverrideDelta=14)
   InputLinks(1)=(DrawY=1122,OverrideDelta=35)
   InputLinks(2)=(DrawY=1143,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),ActivateDelay=1.000000,DrawY=1122,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-1114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-1063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-1014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1152
   ObjPosY=1064
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=1469,OverrideDelta=14)
   OutputLinks(1)=(DrawY=1490,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=1511,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1576
   ObjPosY=1400
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=1512,OverrideDelta=25)
   InputLinks(1)=(DrawY=1556,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_24')),DrawY=1501,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),LinkDesc="Link 2",DrawY=1523,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),LinkDesc="Link 3",DrawY=1545,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17')),LinkDesc="Link 4",DrawY=1567,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-1132,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1176
   ObjPosY=1464
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=176
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=2240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=2328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=184
   ObjPosY=2328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=KFPlayerStart'KF-BLACKFOREST.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-BLACKFOREST.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=280
   ObjPosY=2328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
