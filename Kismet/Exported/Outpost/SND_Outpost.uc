Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),ActivateDelay=2.000000,DrawY=477,OverrideDelta=14)
   OutputLinks(1)=(DrawY=498,OverrideDelta=35)
   OutputLinks(2)=(DrawY=519,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-240
   ObjPosY=408
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=1882
   SizeY=1322
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-264
   ObjPosY=112
   ObjComment="Ambient Audio"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="MetalDetectorEntranceLeftActivated"
   bClientSideOnly=True
   MaxWidth=471
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=202,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68'),DrawX=2131,OverrideDelta=203)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=136
   DrawWidth=255
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Security_Metal_Detector_Alarm'
   InputLinks(0)=(DrawY=194,OverrideDelta=11)
   OutputLinks(0)=(DrawY=194,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=2432,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=160
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Note'SND_Outpost.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2400
   ObjPosY=241
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=644
   SizeY=229
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1864
   ObjPosY=104
   ObjComment="Metal Detector Entrance Left"
   DrawWidth=644
   DrawHeight=229
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="MetalDetectorEntranceRightActivated"
   bClientSideOnly=True
   MaxWidth=478
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),DrawY=546,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69'),DrawX=2127,OverrideDelta=207)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1888
   ObjPosY=480
   DrawWidth=259
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Security_Metal_Detector_Alarm'
   InputLinks(0)=(DrawY=538,OverrideDelta=11)
   OutputLinks(0)=(DrawY=538,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66'),DrawX=2416,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2368
   ObjPosY=504
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=Note'SND_Outpost.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2384
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=636
   SizeY=228
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1856
   ObjPosY=448
   ObjComment="Metal Detector Entrance Right"
   DrawWidth=636
   DrawHeight=228
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_5
   EventName="MetalDetectorCICActivated"
   bClientSideOnly=True
   MaxWidth=409
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=906,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_70'),DrawX=2084,OverrideDelta=172)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1880
   ObjPosY=840
   DrawWidth=224
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_5"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Security_Metal_Detector_Alarm'
   InputLinks(0)=(DrawY=898,OverrideDelta=11)
   OutputLinks(0)=(DrawY=898,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67'),DrawX=2400,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2352
   ObjPosY=864
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=Note'SND_Outpost.TheWorld:PersistentLevel.Note_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2368
   ObjPosY=945
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=628
   SizeY=229
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1848
   ObjPosY=808
   ObjComment="Metal Detector CIC"
   DrawWidth=628
   DrawHeight=229
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2044
   ObjPosY=284
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2039
   ObjPosY=628
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_70
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1997
   ObjPosY=988
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_70"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=453,OverrideDelta=14)
   InputLinks(1)=(DrawY=475,OverrideDelta=36)
   InputLinks(2)=(DrawY=497,OverrideDelta=58)
   InputLinks(3)=(DrawY=519,OverrideDelta=80)
   OutputLinks(0)=(DrawY=486,OverrideDelta=47)
   VariableLinks(0)=(DrawX=197,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=120
   ObjPosY=416
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object
