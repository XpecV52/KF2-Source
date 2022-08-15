Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=173,OverrideDelta=14)
   OutputLinks(1)=(DrawY=194,OverrideDelta=35)
   OutputLinks(2)=(DrawY=215,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=104
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_EvacuationPoint.WwiseDefaultBank_WW_ENV_EvacuationPoint'
   InputLinks(0)=(DrawY=164,OverrideDelta=13)
   InputLinks(1)=(DrawY=184,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=174,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-176
   ObjPosY=128
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=189,OverrideDelta=14)
   InputLinks(1)=(DrawY=211,OverrideDelta=36)
   InputLinks(2)=(DrawY=233,OverrideDelta=58)
   InputLinks(3)=(DrawY=255,OverrideDelta=80)
   OutputLinks(0)=(DrawY=222,OverrideDelta=47)
   VariableLinks(0)=(DrawX=93,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=16
   ObjPosY=152
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_27')),DrawY=538,OverrideDelta=11)
   OutputLinks(1)=(DrawY=562,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=583,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=282,OverrideDelta=106)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=144
   ObjPosY=472
   ObjName="TriggerVolume_0 Touch"
   ObjComment="Concrete01"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_27
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Concrete'
   InputLinks(0)=(DrawY=546,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=430,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=384
   ObjPosY=512
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_27"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=248
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   ReTriggerDelay=2.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=538,OverrideDelta=11)
   OutputLinks(1)=(DrawY=562,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=583,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=714,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=472
   ObjName="TriggerVolume_2 Touch"
   ObjComment="Paper01"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=538,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=966,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=920
   ObjPosY=504
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_36'
   MaxTriggerCount=0
   ReTriggerDelay=2.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3')),DrawY=762,OverrideDelta=11)
   OutputLinks(1)=(DrawY=554,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=575,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=1186,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=696
   ObjName="TriggerVolume_36 Touch"
   ObjComment="Paper02"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=728
   ObjPosY=808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=778,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=934,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=888
   ObjPosY=744
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   ReTriggerDelay=2.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_29')),DrawY=1026,OverrideDelta=11)
   OutputLinks(1)=(DrawY=562,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=583,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=1658,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=960
   ObjName="TriggerVolume_16 Touch"
   ObjComment="Paper03"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=720
   ObjPosY=1080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_29
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=1018,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_3'),DrawX=942,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=896
   ObjPosY=984
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_29"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1688
   ObjPosY=592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   ReTriggerDelay=2.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),DrawY=538,OverrideDelta=11)
   OutputLinks(1)=(DrawY=554,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=575,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2138,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1584
   ObjPosY=472
   ObjName="TriggerVolume_6 Touch"
   ObjComment="WoodPlanks01"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_WoodPlanks'
   InputLinks(0)=(DrawY=538,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=1846,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1800
   ObjPosY=504
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-264
   ObjPosY=600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),DrawY=538,OverrideDelta=11)
   OutputLinks(1)=(DrawY=514,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=535,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2666,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-376
   ObjPosY=472
   ObjName="TriggerVolume_5 Touch"
   ObjComment="TrashPile01"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=538,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-90,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=504
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_28'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=794,OverrideDelta=11)
   OutputLinks(1)=(DrawY=786,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=807,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2666,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-376
   ObjPosY=728
   ObjName="TriggerVolume_28 Touch"
   ObjComment="TrashPile02"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-272
   ObjPosY=840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=802,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-106,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-152
   ObjPosY=768
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=1074,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1066,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1087,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2650,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=1008
   ObjName="TriggerVolume_9 Touch"
   ObjComment="TrashPile03"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=1128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=1090,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-106,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-152
   ObjPosY=1056
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),DrawY=1314,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1306,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1327,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2610,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=1248
   ObjName="TriggerVolume_3 Touch"
   ObjComment="TrashPile04"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=1368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=1314,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-98,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-144
   ObjPosY=1280
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=1616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=1562,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1538,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1559,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2658,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-408
   ObjPosY=1496
   ObjName="TriggerVolume_11 Touch"
   ObjComment="TrashPile05"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=1562,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9'),DrawX=-82,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=1528
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=1858,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1874,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1895,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2658,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=1792
   ObjName="TriggerVolume_12 Touch"
   ObjComment="TrashPile06"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-288
   ObjPosY=1912
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=1858,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-90,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=1824
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=2176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),DrawY=2122,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2130,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2151,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2666,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=2056
   ObjName="TriggerVolume_13 Touch"
   ObjComment="TrashPile07"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=2138,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=-66,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-112
   ObjPosY=2104
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13')),DrawY=2378,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2426,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2447,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2690,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=2312
   ObjName="TriggerVolume_14 Touch"
   ObjComment="TrashPile08"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=2432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=2362,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-122,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-168
   ObjPosY=2328
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14')),DrawY=2618,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2666,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2687,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2734,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=2552
   ObjName="TriggerVolume_15 Touch"
   ObjComment="TrashPile09"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-280
   ObjPosY=2672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=2634,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),DrawX=-90,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=2600
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_17'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15')),DrawY=2842,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2826,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2847,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2670,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=2776
   ObjName="TriggerVolume_17 Touch"
   ObjComment="TrashPile10"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-280
   ObjPosY=2888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=2850,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=-98,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-144
   ObjPosY=2816
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_18'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),DrawY=3066,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3066,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3087,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2678,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=3000
   ObjName="TriggerVolume_18 Touch"
   ObjComment="TrashPile11"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-280
   ObjPosY=3112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=3074,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),DrawX=-90,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-136
   ObjPosY=3040
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17')),DrawY=3282,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3322,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3343,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2718,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-392
   ObjPosY=3216
   ObjName="TriggerVolume_19 Touch"
   ObjComment="TrashPile12"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=3336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=3282,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-58,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-104
   ObjPosY=3248
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_21'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),DrawY=3514,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3538,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3559,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2718,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-400
   ObjPosY=3448
   ObjName="TriggerVolume_21 Touch"
   ObjComment="TrashPile13"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_17"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-296
   ObjPosY=3568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=3530,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-82,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-128
   ObjPosY=3496
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=3754,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3746,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3767,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2662,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-408
   ObjPosY=3688
   ObjName="TriggerVolume_22 Touch"
   ObjComment="TrashPile14"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-304
   ObjPosY=3816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_TrashPile'
   InputLinks(0)=(DrawY=3762,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=-98,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-144
   ObjPosY=3728
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_23'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_24')),DrawY=530,OverrideDelta=11)
   OutputLinks(1)=(DrawY=554,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=575,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=3078,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=464
   ObjName="TriggerVolume_23 Touch"
   ObjComment="BodyBag01"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_19"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_23'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1240
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_24
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_BodyBag'
   InputLinks(0)=(DrawY=530,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=1446,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1400
   ObjPosY=496
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_24"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_24'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21')),DrawY=778,OverrideDelta=11)
   OutputLinks(1)=(DrawY=770,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=791,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=3142,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1136
   ObjPosY=712
   ObjName="TriggerVolume_24 Touch"
   ObjComment="BodyBag02"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_20"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1240
   ObjPosY=832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_BodyBag'
   InputLinks(0)=(DrawY=794,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=1478,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=760
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_21
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_25'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),DrawY=1074,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1050,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1071,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=3182,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=1008
   ObjName="TriggerVolume_25 Touch"
   ObjComment="BodyBag03"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_21"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1232
   ObjPosY=1104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_BodyBag'
   InputLinks(0)=(DrawY=1058,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1034,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21'),DrawX=1470,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1424
   ObjPosY=1024
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_22
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_26'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_23')),DrawY=1346,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1338,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1359,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=3182,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1120
   ObjPosY=1280
   ObjName="TriggerVolume_26 Touch"
   ObjComment="BodyBag04"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_22"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1240
   ObjPosY=1368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_23
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_BodyBag'
   InputLinks(0)=(DrawY=1322,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1034,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=1438,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1392
   ObjPosY=1288
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_23"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_23
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=1578,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1554,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1575,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=3174,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1128
   ObjPosY=1512
   ObjName="TriggerVolume_20 Touch"
   ObjComment="BodyBag05"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_23"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1240
   ObjPosY=1616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_BodyBag'
   InputLinks(0)=(DrawY=1578,OverrideDelta=11)
   OutputLinks(0)=(DrawY=1034,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=1430,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1384
   ObjPosY=1544
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_24
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_29'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_25')),DrawY=514,OverrideDelta=11)
   OutputLinks(1)=(DrawY=530,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=551,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=3662,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2016
   ObjPosY=448
   ObjName="TriggerVolume_29 Touch"
   ObjComment="Chainlink01"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_24"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2144
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Chainlink'
   InputLinks(0)=(DrawY=538,OverrideDelta=11)
   OutputLinks(0)=(DrawY=538,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=2312,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2264
   ObjPosY=504
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_25"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_25
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_31'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_26')),DrawY=522,OverrideDelta=11)
   OutputLinks(1)=(DrawY=530,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=551,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4222,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2536
   ObjPosY=456
   ObjName="TriggerVolume_31 Touch"
   ObjComment="PlantLarge01"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_25"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_26
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_PlantLg'
   InputLinks(0)=(DrawY=538,OverrideDelta=11)
   OutputLinks(0)=(DrawY=538,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),DrawX=2840,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2792
   ObjPosY=504
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_26"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_26
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_30'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20')),DrawY=522,OverrideDelta=11)
   OutputLinks(1)=(DrawY=538,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=559,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4702,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3024
   ObjPosY=456
   ObjName="TriggerVolume_30 Touch"
   ObjComment="PlantSmall01"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_26"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_PlantSm'
   InputLinks(0)=(DrawY=530,OverrideDelta=11)
   OutputLinks(0)=(DrawY=530,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),DrawX=3328,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3280
   ObjPosY=496
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3072
   ObjPosY=584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=264
   ObjPosY=824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_27
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_28')),DrawY=786,OverrideDelta=11)
   OutputLinks(1)=(DrawY=786,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=807,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=286,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=144
   ObjPosY=720
   ObjName="TriggerVolume_4 Touch"
   ObjComment="Concrete02"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_27"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_28
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Concrete'
   InputLinks(0)=(DrawY=810,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=438,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=392
   ObjPosY=776
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_28"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_28
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=1066,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1018,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1039,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=222,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=152
   ObjPosY=1000
   ObjName="TriggerVolume_10 Touch"
   ObjComment="Concrete03"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_28"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=272
   ObjPosY=1120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Concrete'
   InputLinks(0)=(DrawY=1066,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=422,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=376
   ObjPosY=1032
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_29
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_27'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_30')),DrawY=1306,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1362,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1383,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=706,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=1240
   ObjName="TriggerVolume_27 Touch"
   ObjComment="Paper04"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_29"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=728
   ObjPosY=1368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_30
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=1306,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),DrawX=958,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=1272
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_30"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_30
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_32'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_31')),DrawY=1546,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1570,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1591,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=706,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=1480
   ObjName="TriggerVolume_32 Touch"
   ObjComment="Paper05"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_30"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=728
   ObjPosY=1592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_31
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=1570,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=926,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=880
   ObjPosY=1536
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_31"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_31
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_33'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_32')),DrawY=1786,OverrideDelta=11)
   OutputLinks(1)=(DrawY=1810,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=1831,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=730,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=1720
   ObjName="TriggerVolume_33 Touch"
   ObjComment="Paper06"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_31"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=720
   ObjPosY=1824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_32
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=1810,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=910,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=864
   ObjPosY=1776
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_32"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_32
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_34'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33')),DrawY=2010,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2034,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2055,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=738,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=632
   ObjPosY=1944
   ObjName="TriggerVolume_34 Touch"
   ObjComment="Paper07"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_32"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=2064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_33
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=2026,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=918,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=872
   ObjPosY=1992
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_33"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_33
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_35'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_34')),DrawY=2250,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2258,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2279,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=762,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=2184
   ObjName="TriggerVolume_35 Touch"
   ObjComment="Paper08"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_33"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=746
   ObjPosY=2304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_34
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=2258,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=926,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=880
   ObjPosY=2224
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_34"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_34
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_35')),DrawY=2490,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2514,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2535,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=722,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=2424
   ObjName="TriggerVolume_7 Touch"
   ObjComment="Paper09"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_34"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=2544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_35
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=2522,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34'),DrawX=934,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=888
   ObjPosY=2488
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_35"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_35
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_37'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=2746,OverrideDelta=11)
   OutputLinks(1)=(DrawY=2762,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=2783,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=746,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=2680
   ObjName="TriggerVolume_37 Touch"
   ObjComment="Paper10"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_35"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=2792
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_36
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=2746,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=950,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=2712
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_36"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_36
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_39'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_37')),DrawY=2978,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3026,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3047,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=762,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=2912
   ObjName="TriggerVolume_39 Touch"
   ObjComment="Paper11"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_36"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=3040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_37
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=2994,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=934,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=888
   ObjPosY=2960
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_37"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_37
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_38')),DrawY=3218,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3234,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3255,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=754,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=3152
   ObjName="TriggerVolume_8 Touch"
   ObjComment="Paper12"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_37"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=3272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_38
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=3250,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3250,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=950,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=3216
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_38"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_38
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_40'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_39')),DrawY=3474,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3498,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3519,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=742,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=640
   ObjPosY=3408
   ObjName="TriggerVolume_40 Touch"
   ObjComment="Paper13"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_38"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=3528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_39
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=3498,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3250,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=958,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=3464
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_39"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_39
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_41'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_40')),DrawY=3706,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3706,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=3727,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=782,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=3640
   ObjName="TriggerVolume_41 Touch"
   ObjComment="Paper14"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_39"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=3776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_40
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=3722,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3250,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=942,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=896
   ObjPosY=3688
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_40"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_40
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_42'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_41')),DrawY=3962,OverrideDelta=11)
   OutputLinks(1)=(DrawY=3994,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4015,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=734,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=3896
   ObjName="TriggerVolume_42 Touch"
   ObjComment="Paper15"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_40"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_42'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=4024
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_41
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=3962,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3250,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=950,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=3928
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_41"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_41
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_43'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_42')),DrawY=4194,OverrideDelta=11)
   OutputLinks(1)=(DrawY=4242,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4263,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=742,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=4128
   ObjName="TriggerVolume_43 Touch"
   ObjComment="Paper16"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_41"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=4264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_42
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=4210,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3250,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=926,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=880
   ObjPosY=4176
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_42"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_42
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_46'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_43')),DrawY=4434,OverrideDelta=11)
   OutputLinks(1)=(DrawY=4482,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4503,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=774,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=648
   ObjPosY=4368
   ObjName="TriggerVolume_46 Touch"
   ObjComment="Paper17"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_42"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=760
   ObjPosY=4488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_43
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=4458,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3250,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=942,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=896
   ObjPosY=4424
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_43"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_43
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_45'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_44')),DrawY=4666,OverrideDelta=11)
   OutputLinks(1)=(DrawY=4690,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4711,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=750,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=4600
   ObjName="TriggerVolume_45 Touch"
   ObjComment="Paper18"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_43"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=752
   ObjPosY=4720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_44
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=4698,OverrideDelta=11)
   OutputLinks(0)=(DrawY=3250,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=934,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=888
   ObjPosY=4664
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_44"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_44
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_38'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_45')),DrawY=4898,OverrideDelta=11)
   OutputLinks(1)=(DrawY=4922,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=4943,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=726,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=4832
   ObjName="TriggerVolume_38 Touch"
   ObjComment="Paper19"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_44"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=728
   ObjPosY=4952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_45
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=4898,OverrideDelta=11)
   OutputLinks(0)=(DrawY=4898,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=952,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=4864
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_45"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_45
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_47'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_46')),DrawY=5130,OverrideDelta=11)
   OutputLinks(1)=(DrawY=5178,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5199,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=734,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=5064
   ObjName="TriggerVolume_47 Touch"
   ObjComment="Paper20"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_45"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=5192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_46
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=5130,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5130,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_45'),DrawX=952,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=904
   ObjPosY=5096
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_46"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_46
   Originator=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_44'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=5370,OverrideDelta=11)
   OutputLinks(1)=(DrawY=5402,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=5423,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=750,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=624
   ObjPosY=5304
   ObjName="TriggerVolume_44 Touch"
   ObjComment="Paper21"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_46"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Paper'
   InputLinks(0)=(DrawY=5378,OverrideDelta=11)
   OutputLinks(0)=(DrawY=5378,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=960,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=912
   ObjPosY=5344
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=TriggerVolume'SND_EvacuationPoint.TheWorld:PersistentLevel.TriggerVolume_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_EvacuationPoint.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=736
   ObjPosY=5424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object
