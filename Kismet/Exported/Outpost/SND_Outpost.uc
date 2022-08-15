Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1'),(LinkedOp=SeqAct_AkStartAmbientSound'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_1'),(LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5'),(LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8'),(LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10'),(LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9'),(LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3'),(LinkedOp=SeqAct_AkPostEvent'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=477,OverrideDelta=14)
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

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_Outpost.ENV_Outpost_Exterior_AirTone_ST_LP_01'
   InputLinks(0)=(DrawY=282,OverrideDelta=11)
   OutputLinks(0)=(DrawY=410,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_47',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_49',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59'),DrawX=126,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=248
   ObjComment="Exterior AirTone 01"
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_Outpost.ENV_Outpost_Exterior_AirTone_ST_LP_02'
   InputLinks(0)=(DrawY=386,OverrideDelta=11)
   OutputLinks(0)=(DrawY=386,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_48',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=352
   ObjComment="Exterior AirTone 02"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
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

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_1
   InputLinks(0)=(DrawY=186,OverrideDelta=11)
   InputLinks(1)=(DrawY=211,bHidden=True,OverrideDelta=36)
   InputLinks(2)=(DrawY=233,bHidden=True,OverrideDelta=58)
   InputLinks(3)=(DrawY=255,bHidden=True,OverrideDelta=80)
   OutputLinks(0)=(DrawY=222,bHidden=True,OverrideDelta=47)
   VariableLinks(0)=(bHidden=True,DrawX=165,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=152
   DrawWidth=154
   DrawHeight=45
   Name="SeqAct_AkStartAmbientSound_1"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_ENV_Outpost.ENV_Outpost_Exterior_Wind_Gust'
   InputLinks(0)=(DrawY=490,OverrideDelta=11)
   OutputLinks(0)=(DrawY=490,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60'),DrawX=128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=456
   ObjComment="Exterior Wind Gusts"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_ENV_Outpost.ENV_Outpost_Interior_Machines_ST_LP'
   InputLinks(0)=(DrawY=1194,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1194,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=1160
   ObjComment="Interior Machine Room"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=224
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=304
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=384
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=464
   ObjPosY=1192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_ENV_Outpost.ENV_Outpost_Exterior_WindTunnel_ST_LP_01'
   InputLinks(0)=(DrawY=602,OverrideDelta=11)
   OutputLinks(0)=(DrawY=602,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62'),DrawX=128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=568
   ObjComment="Exterior Wind Tunnel 01"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=232
   ObjPosY=600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_Outpost.ENV_Outpost_Exterior_WindTunnel_ST_LP_02'
   InputLinks(0)=(DrawY=706,OverrideDelta=11)
   OutputLinks(0)=(DrawY=706,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_50'),DrawX=120,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=672
   ObjComment="Exterior Wind Tunnel 02"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=240
   ObjPosY=712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=568
   ObjPosY=1200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=256
   ObjPosY=1320
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_Outpost.ENV_Outpost_Interior_Garage_ST_LP'
   InputLinks(0)=(DrawY=1322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1322,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=128,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=1288
   ObjComment="Interior Garage"
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=376
   ObjPosY=1312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=336
   ObjPosY=400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=424
   ObjPosY=384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=328
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=520
   ObjPosY=504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=704
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=800
   ObjPosY=496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=440
   ObjPosY=600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=AmbientSoundSimple'SND_Outpost.TheWorld:PersistentLevel.AmbientSoundSimple_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Outpost.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
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
