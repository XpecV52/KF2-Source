Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Lift"
   MaxWidth=140
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0'),(LinkedOp=SeqAct_ActivateRemoteEvent'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_23'),(LinkedOp=SeqAct_Interp'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-9550,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9674,OverrideDelta=38)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9744
   ObjPosY=-9616
   DrawWidth=90
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-9435,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9414,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9393,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9414,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-9026,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8975,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8926,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=-9472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8968
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=-9328
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_23
   EventName="Heat"
   InputLinks(0)=(DrawY=-9182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9182,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9368,OverrideDelta=72)
   ObjInstanceVersion=3
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9472
   ObjPosY=-9216
   ObjComment="Heat"
   DrawWidth=209
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_23"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-9786,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9764,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9742,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9720,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9698,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-9770,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9714,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-9012,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),LinkDesc="Light",MinVars=0,DrawX=-8964,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=-9824
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackColorProp Name=InterpTrackColorProp_1
         PropertyName="PointLightComponent0.LightColor"
         VectorTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=1.000000,Y=0.447871,Z=0.176774),InterpMode=CIM_CurveAutoClamped),(InVal=27.000000,InterpMode=CIM_CurveAutoClamped)))
         TrackTitle="LightColor"
         Name="InterpTrackColorProp_1"
         ObjectArchetype=InterpTrackColorProp'Engine.Default__InterpTrackColorProp'
      End Object
      InterpTracks(0)=InterpTrackColorProp'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2.InterpTrackColorProp_1'
      GroupName="Light"
      GroupColor=(B=213,G=0,R=109,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=27.000000
   InterpGroups(0)=InterpGroup'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_2'
   CurveEdSetup=InterpCurveEdSetup'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=27.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=-9624
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8968
   ObjPosY=-9640
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8664
   ObjPosY=-9632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8760
   ObjPosY=-9632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=-9632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-8955,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8934,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8913,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8934,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7',SeqVar_Object'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-9346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9295,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-8992
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=-9011,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=-8990,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=1)),DrawY=-8969,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9728
   ObjPosY=-9080
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-8792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9304
   ObjPosY=-8792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-8792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=PointLightMovable'LIGHTS-SteamFortress.TheWorld:PersistentLevel.PointLightMovable_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9504
   ObjPosY=-8792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   SizeX=1986
   SizeY=1415
   BorderWidth=5
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'LIGHTS-SteamFortress.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9936
   ObjPosY=-9928
   ObjComment="Rocket lift off lighting"
   DrawWidth=1986
   DrawHeight=1415
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object
