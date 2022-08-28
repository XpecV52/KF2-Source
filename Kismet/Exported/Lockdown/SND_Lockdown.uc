Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=694
   SizeY=639
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9880
   ObjPosY=-9888
   ObjComment="Audio Banks"
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_4
   InputLinks(0)=(DrawY=-9603,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9581,OverrideDelta=36)
   InputLinks(2)=(DrawY=-9559,OverrideDelta=58)
   InputLinks(3)=(DrawY=-9537,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-9570,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-9315,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9392
   ObjPosY=-9640
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_4"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_4')),ActivateDelay=2.000000,DrawY=-9587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9566,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9545,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9880
   ObjPosY=-9656
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9588,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-8048,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8094
   ObjPosY=-9622
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14')),DrawY=-9582,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9824,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9801,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6690,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8376
   ObjPosY=-9648
   ObjName="TriggerVolume_20 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=-9544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9420,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=-8032,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8078
   ObjPosY=-9454
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-9384
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_23
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_35'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),DrawY=-9414,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9576,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9553,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6698,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-9480
   ObjName="TriggerVolume_35 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_23"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_229
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4416
   ObjPosY=-9296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_229"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_142
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_229'),DrawX=4518,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4472
   ObjPosY=-9360
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_142"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_157
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_142')),DrawY=-9326,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9192,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9169,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=6274,OverrideDelta=114)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4248
   ObjPosY=-9392
   ObjName="TriggerVolume_146 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_157"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_228
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4096
   ObjPosY=-9288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_228"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_156
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_143')),DrawY=-9326,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9264,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9241,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5890,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3928
   ObjPosY=-9392
   ObjName="TriggerVolume_113 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_156"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_227
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4400
   ObjPosY=-9480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_227"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_141
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_227'),DrawX=4510,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4464
   ObjPosY=-9552
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_141"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_155
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_141')),DrawY=-9518,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9400,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9377,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=6282,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4232
   ObjPosY=-9584
   ObjName="TriggerVolume_158 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_155"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_140
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_226'),DrawX=4214,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4168
   ObjPosY=-9552
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_140"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_226
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4104
   ObjPosY=-9480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_226"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_154
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_140')),DrawY=-9518,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9432,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9409,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5878,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3936
   ObjPosY=-9584
   ObjName="TriggerVolume_24 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_154"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_225
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3712
   ObjPosY=-8560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_225"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_139
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_225'),DrawX=3830,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3784
   ObjPosY=-8632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_139"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_153
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_139')),DrawY=-8598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8520,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8497,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5462,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3560
   ObjPosY=-8664
   ObjName="TriggerVolume_156 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_153"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_137
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224'),DrawX=3478,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3432
   ObjPosY=-8632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_137"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_143
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_228'),DrawX=4198,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=4152
   ObjPosY=-9360
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_143"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3376
   ObjPosY=-8560
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_152
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_137')),DrawY=-8598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8480,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8457,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5142,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3216
   ObjPosY=-8664
   ObjName="TriggerVolume_155 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_152"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_223
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_132'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3744
   ObjPosY=-8744
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_223"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_151
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_132'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_138')),DrawY=-8782,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8648,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8625,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5522,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-8848
   ObjName="TriggerVolume_132 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_151"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_135
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8782,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_222'),DrawX=3494,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3448
   ObjPosY=-8816
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_135"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_222
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3392
   ObjPosY=-8752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_222"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_150
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_135')),DrawY=-8782,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8648,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8625,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5250,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3224
   ObjPosY=-8848
   ObjName="TriggerVolume_144 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_150"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_221
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3736
   ObjPosY=-8920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_221"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_134
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8942,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_221'),DrawX=3846,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=-8976
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_134"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_149
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_134')),DrawY=-8942,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8880,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8857,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5510,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3576
   ObjPosY=-9008
   ObjName="TriggerVolume_13 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_149"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_220
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3400
   ObjPosY=-8920
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_220"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_133
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8942,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_220'),DrawX=3510,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3464
   ObjPosY=-8976
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_133"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_148
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_133')),DrawY=-8942,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8864,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8841,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5210,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=-9008
   ObjName="TriggerVolume_136 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_148"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_219
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3752
   ObjPosY=-9112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_219"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_132
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9142,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_219'),DrawX=3862,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3816
   ObjPosY=-9176
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_132"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_147
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_132')),DrawY=-9142,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8976,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8953,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5574,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3584
   ObjPosY=-9208
   ObjName="TriggerVolume_18 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_147"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_218
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3400
   ObjPosY=-9112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_218"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_131
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9142,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_218'),DrawX=3518,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3472
   ObjPosY=-9176
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_131"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_146
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_131')),DrawY=-9142,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9024,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9001,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5190,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=-9208
   ObjName="TriggerVolume_137 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_146"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_130
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_217'),DrawX=3846,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=-9360
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_130"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_217
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3736
   ObjPosY=-9288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_217"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_145
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_130')),DrawY=-9326,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9184,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9161,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5542,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3576
   ObjPosY=-9392
   ObjName="TriggerVolume_134 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_145"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_129
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9326,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_216'),DrawX=3510,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3464
   ObjPosY=-9360
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_129"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_216
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3408
   ObjPosY=-9296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_216"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_144
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_129')),DrawY=-9326,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9216,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9193,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5182,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3240
   ObjPosY=-9392
   ObjName="TriggerVolume_131 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_144"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_128
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_215'),DrawX=3846,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3800
   ObjPosY=-9552
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_128"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_215
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3736
   ObjPosY=-9488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_215"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_143
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_128')),DrawY=-9518,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9408,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9385,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5566,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3576
   ObjPosY=-9584
   ObjName="TriggerVolume_25 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_143"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_127
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_201'),DrawX=3518,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3472
   ObjPosY=-9552
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_127"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_128
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_127')),DrawY=-9518,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9344,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9321,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5278,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3248
   ObjPosY=-9584
   ObjName="TriggerVolume_29 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_128"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_201
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3400
   ObjPosY=-9488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_201"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_126
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(DrawX=3078,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3032
   ObjPosY=-8632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_126"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_200
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=-8576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_200"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_127
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_126')),DrawY=-8598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8496,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8473,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4850,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2816
   ObjPosY=-8664
   ObjName="TriggerVolume_26 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_127"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_115
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_198'),DrawX=2780,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2734
   ObjPosY=-8632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_115"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_138
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8782,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_223'),DrawX=3854,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3808
   ObjPosY=-8816
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_138"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_198
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2640
   ObjPosY=-8568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_198"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_125
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_115')),DrawY=-8598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8488,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8465,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4434,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2480
   ObjPosY=-8664
   ObjName="TriggerVolume_159 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_125"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_125
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8790,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_197'),DrawX=3086,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3040
   ObjPosY=-8824
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_125"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_197
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2968
   ObjPosY=-8760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_197"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_124
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_125')),DrawY=-8790,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8664,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8641,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4834,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2824
   ObjPosY=-8856
   ObjName="TriggerVolume_23 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_124"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_124
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8790,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_214'),DrawX=2788,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2742
   ObjPosY=-8824
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_124"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_123
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8950,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_213'),DrawX=3116,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3070
   ObjPosY=-8984
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_123"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_214
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2664
   ObjPosY=-8768
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_214"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_142
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_124')),DrawY=-8790,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8600,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8577,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4442,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=-8856
   ObjName="TriggerVolume_145 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_142"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_213
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-8928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_213"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_141
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_123')),DrawY=-8950,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8840,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8817,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4850,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2824
   ObjPosY=-9016
   ObjName="TriggerVolume_147 Touch"
   DrawWidth=182
   DrawHeight=176
   Name="SeqEvent_Touch_141"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_212
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2976
   ObjPosY=-9312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_212"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_140
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_113')),DrawY=-9342,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9328,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9305,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=5250,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2800
   ObjPosY=-9408
   ObjName="TriggerVolume_142 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_140"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_211
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_143'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2624
   ObjPosY=-9496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_211"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_139
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_143'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_24')),DrawY=-9518,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9576,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9553,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4306,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2440
   ObjPosY=-9584
   ObjName="TriggerVolume_143 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_139"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_210
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2072
   ObjPosY=-8512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_210"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_138
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_114')),DrawY=-8566,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8528,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8505,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4258,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1904
   ObjPosY=-8632
   ObjName="TriggerVolume_148 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_138"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_209
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_133'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2632
   ObjPosY=-9312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_209"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_137
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_133'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_116')),DrawY=-9342,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9296,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9273,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=4274,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2456
   ObjPosY=-9408
   ObjName="TriggerVolume_133 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_137"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_24
   SizeX=908
   SizeY=815
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=352
   ObjPosY=-9696
   ObjComment="Middle Corridor"
   Name="SequenceFrameWrapped_24"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_122
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8950,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_204'),DrawX=2796,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2750
   ObjPosY=-8984
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_122"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_119
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9150,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_203'),DrawX=3124,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3078
   ObjPosY=-9184
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_119"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_118
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9150,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_202'),DrawX=2780,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2734
   ObjPosY=-9184
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_118"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_204
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_139'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=-8928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_204"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_131
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_139'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_122')),DrawY=-8950,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8048,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8025,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5734,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=-9016
   ObjName="TriggerVolume_139 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_131"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_203
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_140'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-9120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_203"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_130
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_140'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(DrawY=-9150,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8088,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8065,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6150,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2832
   ObjPosY=-9216
   ObjName="TriggerVolume_140 Touch"
   DrawWidth=182
   DrawHeight=176
   Name="SeqEvent_Touch_130"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_202
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2648
   ObjPosY=-9120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_202"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_129
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_17'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_118')),DrawY=-9150,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8128,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8105,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6498,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2488
   ObjPosY=-9216
   ObjName="TriggerVolume_17 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_129"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_113
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9342,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_212'),DrawX=3100,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3054
   ObjPosY=-9376
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_113"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_116
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9342,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_209'),DrawX=2756,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2710
   ObjPosY=-9376
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_116"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_117
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_199'),DrawX=3100,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3054
   ObjPosY=-9552
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_117"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_199
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=3000
   ObjPosY=-9480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_199"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_126
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_117')),DrawY=-9518,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8304,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8281,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7046,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2832
   ObjPosY=-9584
   ObjName="TriggerVolume_112 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_126"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_24
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9518,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_211'),DrawX=2748,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2702
   ObjPosY=-9552
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_24"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_114
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8564,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_210'),DrawX=2184,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2138
   ObjPosY=-8598
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_114"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_112
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8564,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_196'),DrawX=1864,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1818
   ObjPosY=-8598
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_112"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_111
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8756,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_195'),DrawX=2200,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2154
   ObjPosY=-8790
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_111"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_196
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_157'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1696
   ObjPosY=-8528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_196"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_123
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_157'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_112')),DrawY=-8566,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8384,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8361,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7398,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=-8632
   ObjName="TriggerVolume_157 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_123"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_195
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_141'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2096
   ObjPosY=-8728
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_195"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_122
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_141'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_111')),DrawY=-8758,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8696,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8673,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6998,OverrideDelta=58)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=-8824
   ObjName="TriggerVolume_141 Touch"
   DrawWidth=182
   DrawHeight=176
   Name="SeqEvent_Touch_122"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_23
   SizeX=1545
   SizeY=815
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-1272
   ObjPosY=-9696
   ObjComment="Cryo Sleep"
   Name="SequenceFrameWrapped_23"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_22
   SizeX=714
   SizeY=500
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2016
   ObjPosY=-9696
   ObjComment="Cargo Transport"
   Name="SequenceFrameWrapped_22"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_20
   SizeX=976
   SizeY=1229
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3760
   ObjPosY=-9696
   ObjComment="Med Lab"
   Name="SequenceFrameWrapped_20"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_18
   SizeX=5222
   SizeY=1357
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3856
   ObjPosY=-9784
   ObjComment="Paper"
   Name="SequenceFrameWrapped_18"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_9
   SizeX=812
   SizeY=432
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4904
   ObjPosY=-9704
   ObjComment="Center"
   Name="SequenceFrameWrapped_9"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_75
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_PlantLg'
   InputLinks(0)=(DrawY=-9406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_162'),DrawX=-4234,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-9440
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_75"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_78
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_PlantLg'
   InputLinks(0)=(DrawY=-9406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_161'),DrawX=-4554,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4600
   ObjPosY=-9440
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_78"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_63
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_PlantLg'
   InputLinks(0)=(DrawY=-9590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_160'),DrawX=-4258,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4304
   ObjPosY=-9624
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_63"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_77
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_PlantLg'
   InputLinks(0)=(DrawY=-9590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_159'),DrawX=-4554,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4600
   ObjPosY=-9624
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_77"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_162
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4352
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_162"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_90
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_75')),DrawY=-9406,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8784,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8761,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-2674,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4528
   ObjPosY=-9472
   ObjName="TriggerVolume_97 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_90"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_161
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4672
   ObjPosY=-9376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_161"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_89
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_78')),DrawY=-9406,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9064,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9041,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-2666,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4848
   ObjPosY=-9472
   ObjName="TriggerVolume_98 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_89"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_160
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_99'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4360
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_160"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_88
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_99'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_63')),DrawY=-9590,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9272,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9249,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-2610,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4544
   ObjPosY=-9656
   ObjName="TriggerVolume_99 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_88"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_159
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_53'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4664
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_159"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_87
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_53'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_77')),DrawY=-9590,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9504,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9481,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-2698,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4848
   ObjPosY=-9656
   ObjName="TriggerVolume_53 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_87"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_8
   SizeX=3241
   SizeY=1366
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1432
   ObjPosY=-9784
   ObjComment="Wood Planks"
   Name="SequenceFrameWrapped_8"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_7
   SizeX=841
   SizeY=1210
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5832
   ObjPosY=-9704
   ObjComment="Row 4"
   Name="SequenceFrameWrapped_7"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_6
   SizeX=736
   SizeY=1214
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6624
   ObjPosY=-9704
   ObjComment="Row 3"
   Name="SequenceFrameWrapped_6"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_5
   SizeX=840
   SizeY=1214
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-9704
   ObjComment="Row 2"
   Name="SequenceFrameWrapped_5"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_38
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_147'),DrawX=-5100,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5146
   ObjPosY=-8768
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_38"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_61
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8734,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_146'),DrawX=-5404,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5450
   ObjPosY=-8768
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_61"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_60
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),DrawX=-5428,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5474
   ObjPosY=-8936
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_60"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_59
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145'),DrawX=-5116,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5162
   ObjPosY=-8936
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_59"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_58
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-5124,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5170
   ObjPosY=-9104
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_58"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_57
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142'),DrawX=-5446,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5492
   ObjPosY=-9104
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_57"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_56
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),DrawX=-5148,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5194
   ObjPosY=-9280
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_56"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_55
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140'),DrawX=-5454,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5500
   ObjPosY=-9280
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_55"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_54
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=-5146,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-9440
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_54"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_53
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9406,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138'),DrawX=-5446,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5492
   ObjPosY=-9440
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_53"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_62
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137'),DrawX=-5162,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5208
   ObjPosY=-9632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_62"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_51
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-5470,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5516
   ObjPosY=-9632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_51"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_147
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_75'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5216
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_147"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_75
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_75'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_38')),DrawY=-8734,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8392,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8369,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3610,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5424
   ObjPosY=-8800
   ObjName="TriggerVolume_75 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_75"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_146
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_76'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5520
   ObjPosY=-8712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_146"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_74
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_76'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_61')),DrawY=-8734,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8416,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8393,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3954,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5728
   ObjPosY=-8800
   ObjName="TriggerVolume_76 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_74"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_77'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5232
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_73
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_77'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_59')),DrawY=-8902,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8696,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8673,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3682,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5432
   ObjPosY=-8968
   ObjName="TriggerVolume_77 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_73"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_78'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_72
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_78'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_60')),DrawY=-8902,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8760,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8737,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3994,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5736
   ObjPosY=-8968
   ObjName="TriggerVolume_78 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_72"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_79'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5232
   ObjPosY=-9040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_71
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_79'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_58')),DrawY=-9070,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8984,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8961,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3706,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5440
   ObjPosY=-9136
   ObjName="TriggerVolume_79 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_71"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_80'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-9040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_70
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_80'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_57')),DrawY=-9070,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9056,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9033,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4010,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5736
   ObjPosY=-9136
   ObjName="TriggerVolume_80 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_70"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_81'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5248
   ObjPosY=-9216
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_69
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_81'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_56')),DrawY=-9246,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9112,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9089,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3722,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5432
   ObjPosY=-9312
   ObjName="TriggerVolume_81 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_69"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_82'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5552
   ObjPosY=-9208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_68
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_82'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_55')),DrawY=-9246,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9200,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9177,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4034,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5736
   ObjPosY=-9312
   ObjName="TriggerVolume_82 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_68"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_83'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5248
   ObjPosY=-9376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_67
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_83'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_54')),DrawY=-9406,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9400,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9377,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3754,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5440
   ObjPosY=-9472
   ObjName="TriggerVolume_83 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_67"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_84'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-9392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_66
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_84'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_53')),DrawY=-9406,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9456,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9433,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4042,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-9472
   ObjName="TriggerVolume_84 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_66"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_85'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-9544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_65
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_85'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_62')),DrawY=-9598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9696,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9673,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-3786,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5440
   ObjPosY=-9664
   ObjName="TriggerVolume_85 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_65"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_51'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5544
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_64
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_51'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_51')),DrawY=-9598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9696,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9673,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4058,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5744
   ObjPosY=-9664
   ObjName="TriggerVolume_51 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_64"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_39
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8630,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135'),DrawX=-5998,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6044
   ObjPosY=-8664
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_39"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_49
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8630,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134'),DrawX=-6302,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6348
   ObjPosY=-8664
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_49"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_48
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),DrawX=-5998,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6044
   ObjPosY=-8856
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_48"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_47
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8822,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=-6294,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6340
   ObjPosY=-8856
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_47"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_46
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131'),DrawX=-5982,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6028
   ObjPosY=-9040
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_46"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_45
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130'),DrawX=-6286,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6332
   ObjPosY=-9040
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_45"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_64'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6080
   ObjPosY=-8576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_63
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_64'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_39')),DrawY=-8630,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8400,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8377,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4274,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6280
   ObjPosY=-8696
   ObjName="TriggerVolume_64 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_63"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_65'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=-8576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_62
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_65'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_49')),DrawY=-8630,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8424,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8401,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4626,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-8696
   ObjName="TriggerVolume_65 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_62"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_66'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-8776
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_61
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_66'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_48')),DrawY=-8822,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8720,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8697,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4346,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6280
   ObjPosY=-8888
   ObjName="TriggerVolume_66 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_61"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_67'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6368
   ObjPosY=-8784
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_60
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_67'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_47')),DrawY=-8822,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8774,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8776,bHidden=True,OverrideDelta=33)
   VariableLinks(0)=(bHidden=True,DrawX=-4698,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-8888
   ObjName="TriggerVolume_67 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_60"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_68'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6064
   ObjPosY=-8952
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_59
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_68'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_46')),DrawY=-9006,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9040,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9017,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4394,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6272
   ObjPosY=-9072
   ObjName="TriggerVolume_68 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_59"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_44
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9206,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129'),DrawX=-5966,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6012
   ObjPosY=-9240
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_44"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_43
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9206,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=-6302,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6348
   ObjPosY=-9240
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_43"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_42
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=-6006,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6052
   ObjPosY=-9448
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_42"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_41
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126'),DrawX=-6286,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6332
   ObjPosY=-9448
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_41"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_28
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),DrawX=-6014,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6060
   ObjPosY=-9624
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_28"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_40
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),DrawX=-6302,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6348
   ObjPosY=-9624
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_40"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_69'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6360
   ObjPosY=-8968
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_58
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_69'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_45')),DrawY=-9006,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9080,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9057,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4762,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6576
   ObjPosY=-9072
   ObjName="TriggerVolume_69 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_58"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_70'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6088
   ObjPosY=-9176
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_57
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_70'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_44')),DrawY=-9206,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9032,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9009,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4442,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6272
   ObjPosY=-9272
   ObjName="TriggerVolume_70 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_57"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_56
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_71'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_43')),DrawY=-9206,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9072,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9049,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4842,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-9272
   ObjName="TriggerVolume_71 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_56"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_71'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6408
   ObjPosY=-9168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_72'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6080
   ObjPosY=-9360
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_55
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_72'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_42')),DrawY=-9414,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9304,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9281,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4410,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6288
   ObjPosY=-9480
   ObjName="TriggerVolume_72 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_55"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_73'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6392
   ObjPosY=-9376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_54
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_73'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_41')),DrawY=-9414,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9352,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9329,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4786,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-9480
   ObjName="TriggerVolume_73 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_54"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_74'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6120
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_53
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_74'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_28')),DrawY=-9590,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9600,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9577,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4434,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6296
   ObjPosY=-9656
   ObjName="TriggerVolume_74 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_53"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_52'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_52
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_52'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_40')),DrawY=-9590,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9664,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9641,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-4802,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-9656
   ObjName="TriggerVolume_52 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_52"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_26
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=-6790,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6836
   ObjPosY=-8744
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_26"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_37
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8710,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),DrawX=-7086,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7132
   ObjPosY=-8744
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_37"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_36
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),DrawX=-6790,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6836
   ObjPosY=-8928
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_36"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_35
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8894,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),DrawX=-7086,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7132
   ObjPosY=-8928
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_35"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_34
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),DrawX=-6790,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6836
   ObjPosY=-9096
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_34"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_33
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9062,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),DrawX=-7094,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7140
   ObjPosY=-9096
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_33"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_32
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117'),DrawX=-6774,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6820
   ObjPosY=-9280
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_32"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_31
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),DrawX=-7094,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7140
   ObjPosY=-9280
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_31"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_30
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),DrawX=-6798,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6844
   ObjPosY=-9464
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_30"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_29
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112'),DrawX=-7110,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7156
   ObjPosY=-9464
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_29"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=-6814,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6860
   ObjPosY=-9632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_27
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9598,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=-7110,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7156
   ObjPosY=-9632
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_27"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_96'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=-8672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_51
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_96'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_26')),DrawY=-8710,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8056,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8033,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5138,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-8776
   ObjName="TriggerVolume_96 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_51"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_54'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7192
   ObjPosY=-8672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_50
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_54'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_37')),DrawY=-8710,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8112,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8089,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5506,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-8776
   ObjName="TriggerVolume_54 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_50"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_55'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-8856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_49
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_55'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_36')),DrawY=-8894,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8440,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8417,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5186,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-8960
   ObjName="TriggerVolume_55 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_49"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_56'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7192
   ObjPosY=-8856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_48
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_56'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_35')),DrawY=-8894,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8568,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8545,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5562,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7376
   ObjPosY=-8960
   ObjName="TriggerVolume_56 Touch"
   DrawWidth=178
   DrawHeight=152
   Name="SeqEvent_Touch_48"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_57'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6896
   ObjPosY=-9032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_47
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_57'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_34')),DrawY=-9062,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8768,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8745,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5162,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7072
   ObjPosY=-9128
   ObjName="TriggerVolume_57 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_47"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_58'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-9040
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_46
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_58'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_33')),DrawY=-9062,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8832,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8809,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5522,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-9128
   ObjName="TriggerVolume_58 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_46"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_59'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6888
   ObjPosY=-9208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_45
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_59'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_32')),DrawY=-9246,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9096,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9073,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5202,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7072
   ObjPosY=-9312
   ObjName="TriggerVolume_59 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_45"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_60'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7208
   ObjPosY=-9208
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_44
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_60'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_31')),DrawY=-9246,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9136,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9113,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5522,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7392
   ObjPosY=-9312
   ObjName="TriggerVolume_60 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_44"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_43
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_61'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_30')),DrawY=-9430,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9368,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9345,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5242,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-9496
   ObjName="TriggerVolume_61 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_43"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_61'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6904
   ObjPosY=-9392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_62'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-9392
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_38
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_62'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_29')),DrawY=-9430,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9400,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9377,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5554,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-9496
   ObjName="TriggerVolume_62 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_38"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_63'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6920
   ObjPosY=-9568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_34
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_63'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),DrawY=-9598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9656,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9633,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5274,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-9664
   ObjName="TriggerVolume_63 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_34"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-9576
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_33
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_31'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_27')),DrawY=-9598,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9680,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9657,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-5602,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-9664
   ObjName="TriggerVolume_31 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_33"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_2
   SizeX=4576
   SizeY=1356
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8480
   ObjPosY=-9784
   ObjComment="Med Lab Plants"
   Name="SequenceFrameWrapped_2"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8662,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43'),DrawX=-7632,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7678
   ObjPosY=-8696
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_23
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8654,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-8032,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8078
   ObjPosY=-8688
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_23"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8838,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41'),DrawX=-7632,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7678
   ObjPosY=-8872
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-8838,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=-8032,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8078
   ObjPosY=-8872
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9030,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=-7632,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7678
   ObjPosY=-9064
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9028,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-8032,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8078
   ObjPosY=-9062
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9214,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),DrawX=-7640,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7686
   ObjPosY=-9248
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9214,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=-8032,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8078
   ObjPosY=-9248
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_44'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=-8624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_32
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_44'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21')),DrawY=-8662,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8896,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8873,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6234,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-8728
   ObjName="TriggerVolume_44 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_32"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_45'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8144
   ObjPosY=-8624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_31
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_45'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_23')),DrawY=-8654,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8888,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8865,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6690,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-8720
   ObjName="TriggerVolume_45 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_31"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_46'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_30
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_46'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15')),DrawY=-8838,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9072,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9049,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6290,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-8904
   ObjName="TriggerVolume_46 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_30"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_47'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-8800
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_29
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_47'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22')),DrawY=-8838,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9072,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9049,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6634,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-8904
   ObjName="TriggerVolume_47 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_29"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_48'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=-9000
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_28
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_48'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20')),DrawY=-9030,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9264,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9241,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6234,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-9096
   ObjName="TriggerVolume_48 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_28"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_49'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-8992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_27
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_49'
   MaxTriggerCount=0
   bPlayerOnly=False
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),DrawY=-9030,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9264,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9241,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6690,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-9096
   ObjName="TriggerVolume_49 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_27"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_50'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7760
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_26
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_50'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),DrawY=-9214,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9320,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9297,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6282,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7960
   ObjPosY=-9280
   ObjName="TriggerVolume_50 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_26"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_25
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_38'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17')),DrawY=-9206,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9320,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9297,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6722,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8360
   ObjPosY=-9272
   ObjName="TriggerVolume_38 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_25"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9398,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35'),DrawX=-7648,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7694
   ObjPosY=-9432
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7768
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_24
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_32'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13')),DrawY=-9398,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9576,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9553,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6282,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-9464
   ObjName="TriggerVolume_32 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_24"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_PlantRustle'
   InputLinks(0)=(DrawY=-9590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-7638,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7684
   ObjPosY=-9624
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_25"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_21'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7768
   ObjPosY=-9552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_22
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_21'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_25')),DrawY=-9590,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9824,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9801,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-6242,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-9656
   ObjName="TriggerVolume_21 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_22"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_110
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8756,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=1848,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1802
   ObjPosY=-8790
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_110"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_138'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1728
   ObjPosY=-8720
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_21
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_138'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=292
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_110')),DrawY=-8758,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-8968,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-8945,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7594,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=-8824
   ObjName="TriggerVolume_138 Touch"
   DrawWidth=182
   DrawHeight=128
   Name="SeqEvent_Touch_21"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8972,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),DrawX=2232,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2186
   ObjPosY=-9006
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2112
   ObjPosY=-8928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_30'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=-8974,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9168,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9145,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7138,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1920
   ObjPosY=-9040
   ObjName="TriggerVolume_30 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_19"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-8972,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27'),DrawX=1840,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1794
   ObjPosY=-9006
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9172,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),DrawX=2232,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2186
   ObjPosY=-9206
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9172,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),DrawX=1832,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1786
   ObjPosY=-9206
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1720
   ObjPosY=-8936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-8974,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9160,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9137,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7558,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1528
   ObjPosY=-9040
   ObjName="TriggerVolume_9 Touch"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-9174,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9360,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9337,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7090,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=-9240
   ObjName="TriggerVolume_16 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_17"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2104
   ObjPosY=-9144
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=-9128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_15'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),DrawY=-9174,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9398,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9400,bHidden=True,OverrideDelta=33)
   VariableLinks(0)=(bHidden=True,DrawX=-7594,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=-9240
   ObjName="TriggerVolume_15 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9372,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=1832,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1786
   ObjPosY=-9406
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9372,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23'),DrawX=2234,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2188
   ObjPosY=-9406
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9548,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=2234,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2188
   ObjPosY=-9582
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2104
   ObjPosY=-9504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),DrawY=-9518,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9624,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9601,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7054,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1896
   ObjPosY=-9584
   ObjName="TriggerVolume_22 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=2120
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-9374,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9384,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9361,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7554,OverrideDelta=110)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1912
   ObjPosY=-9440
   ObjName="TriggerVolume_12 Touch"
   DrawWidth=178
   DrawHeight=128
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=-9374,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9608,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9585,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7594,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1520
   ObjPosY=-9440
   ObjName="TriggerVolume_11 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=-9526,OverrideDelta=11)
   OutputLinks(1)=(DrawY=-9768,bHidden=True,OverrideDelta=33)
   OutputLinks(2)=(DrawY=-9745,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=-7602,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1496
   ObjPosY=-9592
   ObjName="TriggerVolume_10 Touch"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=TriggerVolume'SND_Lockdown.TheWorld:PersistentLevel.TriggerVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1712
   ObjPosY=-9504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_Lockdown.Play_ENV_Lockdown_Debris_Wood_Movement'
   InputLinks(0)=(DrawY=-9524,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),DrawX=1816,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=1770
   ObjPosY=-9558
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=13501
   SizeY=1524
   ObjInstanceVersion=1
   ParentSequence=Sequence'SND_Lockdown.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-9896
   ObjComment="Sound Triggers"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object
