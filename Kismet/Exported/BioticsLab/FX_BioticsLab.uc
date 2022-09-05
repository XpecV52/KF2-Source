Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_94'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=856
   ObjPosY=200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=952
   ObjPosY=192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0'),(LinkedOp=SeqAct_AkPostEvent'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=58,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=862,OverrideDelta=16)
   VariableLinks(1)=(DrawX=913,OverrideDelta=76)
   EventLinks(0)=(DrawX=962,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'FX_BioticsLab.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=77,OverrideDelta=14)
   OutputLinks(1)=(DrawY=98,OverrideDelta=35)
   OutputLinks(2)=(DrawY=119,OverrideDelta=56)
   VariableLinks(0)=(DrawX=202,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=120
   ObjPosY=8
   ObjName="TriggerVolume_0 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=78,OverrideDelta=23)
   OutputLinks(0)=(DrawY=68,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0')),DrawY=88,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=405,OverrideDelta=16)
   VariableLinks(1)=(DrawX=455,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=376
   ObjPosY=32
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=600
   ObjPosY=240
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   InputLinks(0)=(DrawY=74,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=2)),DrawY=74,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_1'),DrawX=610,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=666,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=576
   ObjPosY=40
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=578
   ObjPosY=121
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=3.000000
   InputLinks(0)=(DrawY=45,OverrideDelta=14)
   InputLinks(1)=(DrawY=66,OverrideDelta=35)
   InputLinks(2)=(DrawY=87,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=50,OverrideDelta=19)
   OutputLinks(1)=(DrawY=82,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1172,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=8
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   InputLinks(0)=(DrawY=34,OverrideDelta=11)
   OutputLinks(0)=(DrawY=34,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_2'),DrawX=1362,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_0'),DrawX=1418,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1328
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1330
   ObjPosY=81
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_2"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=1396
   SizeY=364
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=88
   ObjPosY=-24
   ObjComment="Decontamination Room Spray FX - Entrance"
   DrawWidth=1396
   DrawHeight=364
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_89'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=960
   ObjPosY=688
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'FX_BioticsLab.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=533,OverrideDelta=14)
   OutputLinks(1)=(DrawY=554,OverrideDelta=35)
   OutputLinks(2)=(DrawY=575,OverrideDelta=56)
   VariableLinks(0)=(DrawX=186,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=464
   ObjName="TriggerVolume_1 Touch"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=534,OverrideDelta=23)
   OutputLinks(0)=(DrawY=524,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetBool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_2')),DrawY=544,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=373,OverrideDelta=16)
   VariableLinks(1)=(DrawX=423,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=344
   ObjPosY=488
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_3"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_2
   InputLinks(0)=(DrawY=522,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=2)),DrawY=522,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_4'),DrawX=570,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=626,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=536
   ObjPosY=488
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_2"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_4
   bValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=538
   ObjPosY=569
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_4"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=509,OverrideDelta=14)
   InputLinks(1)=(DrawY=530,OverrideDelta=35)
   InputLinks(2)=(DrawY=551,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1'),(LinkedOp=SeqAct_AkPostEvent'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=530,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=838,OverrideDelta=16)
   VariableLinks(1)=(DrawX=889,OverrideDelta=76)
   EventLinks(0)=(DrawX=938,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=800
   ObjPosY=472
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=3.000000
   InputLinks(0)=(DrawY=501,OverrideDelta=14)
   InputLinks(1)=(DrawY=522,OverrideDelta=35)
   InputLinks(2)=(DrawY=543,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_3')),DrawY=506,OverrideDelta=19)
   OutputLinks(1)=(DrawY=538,OverrideDelta=51)
   VariableLinks(0)=(DrawX=1124,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1072
   ObjPosY=464
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_3
   InputLinks(0)=(DrawY=506,OverrideDelta=11)
   OutputLinks(0)=(DrawY=506,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_5'),DrawX=1274,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Bool'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Bool_3'),DrawX=1330,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1240
   ObjPosY=472
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_3"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1242
   ObjPosY=553
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_5"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=1324
   SizeY=380
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=72
   ObjPosY=432
   ObjComment="Decontamination Room Spray FX - Exit"
   DrawWidth=1324
   DrawHeight=380
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=AmbientSound'FX_BioticsLab.TheWorld:PersistentLevel.AmbientSound_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1224
   ObjPosY=224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=282,OverrideDelta=11)
   OutputLinks(0)=(DrawY=282,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63'),DrawX=1094,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1048
   ObjPosY=248
   ObjComment="playsound"
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=AmbientSound'FX_BioticsLab.TheWorld:PersistentLevel.AmbientSound_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1272
   ObjPosY=696
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_BioticsLab.ENV_Steam_Clean_Blasts'
   InputLinks(0)=(DrawY=698,OverrideDelta=11)
   OutputLinks(0)=(DrawY=698,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=1166,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=664
   ObjComment="playsound"
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_1
   EventName="RemoveBloodSprayFX"
   MaxWidth=258
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1769,OverrideDelta=97)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1640
   ObjPosY=-24
   DrawWidth=149
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_1"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_251
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=-208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_251"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_252
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_171'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=-144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_252"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_2
   InputLinks(0)=(DrawY=-254,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-254,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_251',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_252',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=1966,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1928
   ObjPosY=-288
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_2"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="RemoveBloodFX"
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_2')),DrawY=-254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1750,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1640
   ObjPosY=-320
   DrawWidth=130
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_1
   InputLinks(0)=(DrawY=42,OverrideDelta=11)
   OutputLinks(0)=(DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_193',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_253',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_254',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_257',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13',SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=2206,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2168
   ObjPosY=8
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_1"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2168
   ObjPosY=152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2168
   ObjPosY=88
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_128'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2056
   ObjPosY=-200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2256
   ObjPosY=80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2360
   ObjPosY=80
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_193
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_129'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2256
   ObjPosY=152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_193"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_253
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_116'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2448
   ObjPosY=72
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_253"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_254
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_113'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=72
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_254"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_257
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_115'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2552
   ObjPosY=144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_257"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=5.000000
   InputLinks(0)=(DrawY=37,OverrideDelta=14)
   InputLinks(1)=(DrawY=58,OverrideDelta=35)
   InputLinks(2)=(DrawY=79,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_1')),DrawY=42,OverrideDelta=19)
   OutputLinks(1)=(DrawY=74,OverrideDelta=51)
   VariableLinks(0)=(DrawX=2036,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1984
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_117'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2176
   ObjPosY=256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_134'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2272
   ObjPosY=256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="ClotMotherPoisoned"
   MaxWidth=247
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_0')),DrawY=490,OverrideDelta=11)
   VariableLinks(0)=(DrawX=1763,OverrideDelta=91)
   ObjInstanceVersion=2
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1640
   ObjPosY=424
   DrawWidth=143
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
   InputLinks(0)=(DrawY=490,OverrideDelta=11)
   OutputLinks(0)=(DrawY=490,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=2030,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=456
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_0"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=Emitter'FX_BioticsLab.TheWorld:PersistentLevel.Emitter_221'
   ObjInstanceVersion=1
   ParentSequence=Sequence'FX_BioticsLab.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1992
   ObjPosY=576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
