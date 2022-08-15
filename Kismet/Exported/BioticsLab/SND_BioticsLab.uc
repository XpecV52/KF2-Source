Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=-9771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9729,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=-9840
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_BioticsLab.WwiseDefaultBank_WW_ENV_BioticsLab'
   InputLinks(0)=(DrawY=-9702,OverrideDelta=11)
   InputLinks(1)=(DrawY=272,bHidden=True,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=-9702,OverrideDelta=11)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9416
   ObjPosY=-9736
   DrawWidth=98
   DrawHeight=45
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=-9758,OverrideDelta=11)
   InputLinks(1)=(DrawY=211,bHidden=True,OverrideDelta=36)
   InputLinks(2)=(DrawY=233,bHidden=True,OverrideDelta=58)
   InputLinks(3)=(DrawY=255,bHidden=True,OverrideDelta=80)
   OutputLinks(0)=(DrawY=222,bHidden=True,OverrideDelta=47)
   VariableLinks(0)=(bHidden=True,DrawX=789,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-9792
   DrawWidth=154
   DrawHeight=45
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Security_Metal_Detector_Alarm'
   InputLinks(0)=(DrawY=-9750,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-6720,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6768
   ObjPosY=-9784
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="MetalDetectorRightActivated"
   bClientSideOnly=True
   MaxWidth=419
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=-9750,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=-6935,OverrideDelta=177)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7144
   ObjPosY=-9816
   DrawWidth=229
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=Note'SND_BioticsLab.TheWorld:PersistentLevel.Note_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6752
   ObjPosY=-9704
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=532
   SizeY=236
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-9840
   ObjComment="Metal Detector Alarm - Right"
   DrawWidth=532
   DrawHeight=236
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Security_Metal_Detector_Alarm'
   InputLinks(0)=(DrawY=-9454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9454,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=-6712,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6760
   ObjPosY=-9488
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_3
   EventName="MetalDetectorLeftActivated"
   bClientSideOnly=True
   MaxWidth=412
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-9470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=-6930,OverrideDelta=174)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7136
   ObjPosY=-9536
   DrawWidth=226
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_3"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=Note'SND_BioticsLab.TheWorld:PersistentLevel.Note_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6744
   ObjPosY=-9407
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=532
   SizeY=253
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7160
   ObjPosY=-9560
   ObjComment="Metal Detector Alarm - Left"
   DrawWidth=532
   DrawHeight=253
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7032
   ObjPosY=-9656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7018
   ObjPosY=-9388
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
