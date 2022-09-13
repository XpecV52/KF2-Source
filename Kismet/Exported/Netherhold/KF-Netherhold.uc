Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=4
   IncrementAmount=0
   InputLinks(0)=(DrawY=-9480,OverrideDelta=25)
   InputLinks(1)=(DrawY=-9436,OverrideDelta=69)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-9491,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15')),LinkDesc="Link 2",DrawY=-9469,OverrideDelta=36)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),LinkDesc="Link 3",DrawY=-9447,OverrideDelta=58)
   OutputLinks(3)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16')),LinkDesc="Link 4",DrawY=-9425,OverrideDelta=80)
   VariableLinks(0)=(DrawX=-9412,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-9528
   DrawWidth=89
   DrawHeight=149
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqAct_ActivateRemoteEvent Name=SeqAct_ActivateRemoteEvent_0
   EventName="SpawnOFF"
   InputLinks(0)=(DrawY=-9590,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),ActivateDelay=1.000000,DrawY=-9590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9364,OverrideDelta=92)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9488
   ObjPosY=-9624
   ObjComment="SpawnOFF"
   DrawWidth=248
   DrawHeight=61
   Name="SeqAct_ActivateRemoteEvent_0"
   ObjectArchetype=SeqAct_ActivateRemoteEvent'Engine.Default__SeqAct_ActivateRemoteEvent'
End Object

Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_0
   EventName="SpawnOFF"
   MaxWidth=187
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_15',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_16',InputLinkIdx=1)),DrawY=-9382,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9083,OverrideDelta=61)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9176
   ObjPosY=-9448
   ObjComment="SpawnOFF"
   DrawWidth=113
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_0"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxTriggerCount=2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-9467,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9446,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_ActivateRemoteEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ActivateRemoteEvent_0')),DrawY=-9425,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9744
   ObjPosY=-9536
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-8971,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8950,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8929,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8950,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_74',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_75',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_77'),DrawX=-8642,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8591,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8542,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-9008
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_15
   InputLinks(0)=(DrawY=-9291,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9270,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9249,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9270,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_59',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_60',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_62',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_63',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_64',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_65'),DrawX=-8650,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8599,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8550,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=-9328
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_15"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-9635,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9614,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9593,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9614,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_66',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_67',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_71',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_68',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_69',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_73'),DrawX=-8658,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8607,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8558,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-9672
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=-8531,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8510,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8489,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9760
   ObjPosY=-8600
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_Catacombs.WwiseDefaultBank_WW_ENV_Catacombs'
   InputLinks(0)=(DrawY=-8524,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8504,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=-8514,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9480
   ObjPosY=-8560
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=-8579,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8557,OverrideDelta=36)
   InputLinks(2)=(DrawY=-8535,OverrideDelta=58)
   InputLinks(3)=(DrawY=-8513,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-8546,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-9195,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9272
   ObjPosY=-8616
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_17
   ReTriggerDelay=0.500000
   bEnabled=False
   bClientSideOnly=True
   MaxWidth=355
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_8')),DrawY=-6563,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6542,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6521,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9527,OverrideDelta=145)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9704
   ObjPosY=-6632
   ObjName="TriggerVolume_19 Touch"
   ObjComment="Entered Secret Area: The Heart"
   DrawWidth=222
   DrawHeight=176
   Name="SeqEvent_Touch_17"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_8
   DisplayTimeSeconds=1.300000
   DrawTextInfo=(MessageText="Secret area discovered!",MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=0.500000,Y=0.500000),MessageOffset=(X=0.000000,Y=525.000000),MessageColor=(B=255,G=137,R=230,A=255))
   InputLinks(0)=(DrawY=-6460,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6440,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6450,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9305,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9344
   ObjPosY=-6496
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_8"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9408
   ObjPosY=-6336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-9491,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9470,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9449,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7886,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-9560
   ObjName="TriggerVolume_2 Touch"
   ObjComment="Cathedral"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-9507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-7698,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7647,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7598,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7736
   ObjPosY=-9544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_22'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-9376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7232
   ObjPosY=-9376
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-9507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-7178,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7127,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7078,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-9544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_14'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-9491,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9470,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9449,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7362,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7448
   ObjPosY=-9560
   ObjName="TriggerVolume_14 Touch"
   ObjComment="Forge"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_10
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_8')),DrawY=-9107,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9086,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9065,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7898,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7984
   ObjPosY=-9176
   ObjName="TriggerVolume_10 Touch"
   ObjComment="Basement, excavation"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_10"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_8
   InputLinks(0)=(DrawY=-9123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9081,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9102,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_0'),DrawX=-7714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7752
   ObjPosY=-9160
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_8"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7768
   ObjPosY=-8992
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7664
   ObjPosY=-8992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7128
   ObjPosY=-9376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6504
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7216
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-9115,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9094,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-7162,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7111,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7062,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7200
   ObjPosY=-9152
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_16'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-9099,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9078,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9057,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7346,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7432
   ObjPosY=-9168
   ObjName="TriggerVolume_16 Touch"
   ObjComment="Hidden study"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_43'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6600
   ObjPosY=-9376
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-9507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20'),DrawX=-6546,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6495,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6446,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6584
   ObjPosY=-9544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_15
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-9491,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9470,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9449,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6734,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6816
   ObjPosY=-9560
   ObjName="TriggerVolume_4 Touch"
   ObjComment="Hallway"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_15"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Used Name=SeqEvent_Used_0
   bAimToInteract=False
   Originator=Trigger'KF-NETHERHOLD.TheWorld:PersistentLevel.Trigger_0'
   MaxWidth=169
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_39'),(LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_3'),(LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_37')),DrawY=-5372,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-5352,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-9112,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9036,OverrideDelta=96)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9160
   ObjPosY=-5440
   ObjName="Trigger_0 Used"
   ObjComment="Cathedral doors open"
   DrawWidth=116
   DrawHeight=152
   Name="SeqEvent_Used_0"
   ObjectArchetype=SeqEvent_Used'Engine.Default__SeqEvent_Used'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   InputLinks(0)=(DrawY=-5282,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5260,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5238,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5216,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5194,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6'),(LinkedOp=SeqAct_SetBool'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_1')),DrawY=-5266,OverrideDelta=31)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1)),DrawY=-5210,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-8081,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),LinkDesc="Cath_Door_Left_L",MinVars=0,DrawX=-8010,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_13'),LinkDesc="Cath_Door_Left_R",MinVars=0,DrawX=-7914,OverrideDelta=158)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),LinkDesc="Cath_Door_Right_R",MinVars=0,DrawX=-7815,OverrideDelta=254)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),LinkDesc="Cath_Door_Right_L",MinVars=0,DrawX=-7712,OverrideDelta=357)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8112
   ObjPosY=-5320
   DrawWidth=459
   DrawHeight=173
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=0.000244,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.006153)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_2.InterpTrackMove_1'
      GroupName="Cath_Door_Left_L"
      GroupColor=(B=179,G=159,R=0,A=255)
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=-0.000244,Y=0.000122,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.006153)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_3.InterpTrackMove_2'
      GroupName="Cath_Door_Left_R"
      GroupColor=(B=0,G=115,R=209,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_4
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=-0.000488,Y=0.000488,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=0.000000,Y=0.000000,Z=-84.375000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.006153)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_4"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_5.InterpTrackMove_4'
      GroupName="Cath_Door_Right_R"
      GroupColor=(B=0,G=222,R=79,A=255)
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=0.000244,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=3.006153,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=3.006153)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_6.InterpTrackMove_5'
      GroupName="Cath_Door_Right_L"
      GroupColor=(B=231,G=0,R=42,A=255)
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=3.006153
   InterpGroups(0)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_2'
   InterpGroups(1)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_3'
   InterpGroups(2)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_5'
   InterpGroups(3)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_6'
   CurveEdSetup=InterpCurveEdSetup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=3.006153
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8176
   ObjPosY=-5104
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8064
   ObjPosY=-5104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_13
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7968
   ObjPosY=-5112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_13"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-5104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7768
   ObjPosY=-5112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_2
   InputLinks(0)=(DrawY=-5538,OverrideDelta=15)
   InputLinks(1)=(DrawY=-5516,OverrideDelta=37)
   InputLinks(2)=(DrawY=-5494,OverrideDelta=59)
   InputLinks(3)=(DrawY=-5472,OverrideDelta=81)
   InputLinks(4)=(DrawY=-5450,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_2')),DrawY=-5522,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-5466,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2'),DrawX=-8614,OverrideDelta=27)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37'),LinkDesc="Secret_Lever",MinVars=0,DrawX=-8556,OverrideDelta=74)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8656
   ObjPosY=-5576
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_2"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_2
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_2
      Tabs(0)=(Curves=((CurveObject=InterpTrackMoveAxis'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1.InterpTrackMoveAxis_9',CurveColor=(B=217,G=0,R=99,A=255),CurveName="Secret_Lever_RX")),ViewStartInput=-0.055692,ViewEndInput=0.789745,ViewStartOutput=-0.105261,ViewEndOutput=0.178186)
      Name="InterpCurveEdSetup_2"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_10
            MoveAxis=AXIS_RotationY
            LookupTrack=(Points=(,(Time=0.700000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.700000,OutVal=-0.142822,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_10"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_11
            MoveAxis=AXIS_RotationZ
            LookupTrack=(Points=(,(Time=0.700000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.700000,OutVal=0.153809,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_11"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_6
            LookupTrack=(Points=())
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_6"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_7
            MoveAxis=AXIS_TranslationY
            LookupTrack=(Points=())
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Y"
            Name="InterpTrackMoveAxis_7"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_8
            MoveAxis=AXIS_TranslationZ
            LookupTrack=(Points=())
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="Z"
            Name="InterpTrackMoveAxis_8"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         Begin Object Class=InterpTrackMoveAxis Name=InterpTrackMoveAxis_9
            MoveAxis=AXIS_RotationX
            LookupTrack=(Points=(,(Time=0.700000)))
            FloatTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=0.700000,OutVal=-129.418945,InterpMode=CIM_CurveAutoClamped)))
            TrackTitle="X"
            Name="InterpTrackMoveAxis_9"
            ObjectArchetype=InterpTrackMoveAxis'Engine.Default__InterpTrackMoveAxis'
         End Object
         MoveFrame=IMF_RelativeToInitial
         SubTracks(0)=InterpTrackMoveAxis'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1.InterpTrackMoveAxis_6'
         SubTracks(1)=InterpTrackMoveAxis'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1.InterpTrackMoveAxis_7'
         SubTracks(2)=InterpTrackMoveAxis'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1.InterpTrackMoveAxis_8'
         SubTracks(3)=InterpTrackMoveAxis'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1.InterpTrackMoveAxis_9'
         SubTracks(4)=InterpTrackMoveAxis'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1.InterpTrackMoveAxis_10'
         SubTracks(5)=InterpTrackMoveAxis'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1.InterpTrackMoveAxis_11'
         SubTrackGroups(0)=(GroupName="Translation",TrackIndices=(0,1,2))
         SubTrackGroups(1)=(GroupName="Rotation",TrackIndices=(3,4,5))
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9.InterpTrackMove_1'
      GroupName="Secret_Lever"
      GroupColor=(B=217,G=0,R=99,A=255)
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=0.700000
   InterpGroups(0)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpGroup_9'
   CurveEdSetup=InterpCurveEdSetup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_2.InterpCurveEdSetup_2'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=0.700000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8632
   ObjPosY=-5376
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_2"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_2
   Duration=0.500000
   InputLinks(0)=(DrawY=-5467,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5446,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5425,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_2',InputLinkIdx=1),(LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=-5462,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5430,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8404,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8456
   ObjPosY=-5504
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_2"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-5251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5209,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5230,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_9',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_54',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_55'),DrawX=-8634,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8583,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8534,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-5288
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=Trigger'KF-NETHERHOLD.TheWorld:PersistentLevel.Trigger_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=-5112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=-5368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=2.000000
   InputLinks(0)=(DrawY=-5235,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5214,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5193,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_24'),(LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_25'),(LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_3')),DrawY=-5230,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5198,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8236,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8288
   ObjPosY=-5272
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_5'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_10')),DrawY=-9107,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9086,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9065,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6742,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6824
   ObjPosY=-9176
   ObjName="TriggerVolume_5 Touch"
   ObjComment="Lounge Hall"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_10
   InputLinks(0)=(DrawY=-9123,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9102,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9081,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9102,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_18'),DrawX=-6554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-9160
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_10"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_18
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6608
   ObjPosY=-8992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_18"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6416
   ObjPosY=-9376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_2
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_WoodPlanks'
   InputLinks(0)=(DrawY=-9582,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38'),DrawX=-3418,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3464
   ObjPosY=-9616
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_2"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_12
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_11'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_2')),DrawY=-9582,OverrideDelta=11)
   OutputLinks(1)=(DrawY=514,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=535,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2666,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3704
   ObjPosY=-9648
   ObjName="TriggerVolume_11 Touch"
   ObjComment="WineCellarWood"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_12"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3592
   ObjPosY=-9520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-9512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_1')),DrawY=-9574,OverrideDelta=11)
   OutputLinks(1)=(DrawY=514,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=535,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2666,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-9640
   ObjName="TriggerVolume_9 Touch"
   ObjComment="WineCellarVines01"
   DrawWidth=174
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_1
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_Concrete'
   InputLinks(0)=(DrawY=-9574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19'),DrawX=-2994,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3040
   ObjPosY=-9608
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_1"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_19
   Event=AkEvent'WW_ENV_EvacuationPoint.EvacPoint_Triggered_PlantLg'
   InputLinks(0)=(DrawY=-9574,OverrideDelta=11)
   OutputLinks(0)=(DrawY=546,bHidden=True,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-2586,OverrideDelta=24)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2632
   ObjPosY=-9608
   DrawWidth=93
   DrawHeight=61
   Name="SeqAct_AkPostEvent_19"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   bClientSideOnly=True
   MaxWidth=284
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_19')),DrawY=-9574,OverrideDelta=11)
   OutputLinks(1)=(DrawY=514,bHidden=True,OverrideDelta=35)
   OutputLinks(2)=(DrawY=535,bHidden=True,OverrideDelta=56)
   VariableLinks(0)=(bHidden=True,DrawX=2666,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2872
   ObjPosY=-9640
   ObjName="TriggerVolume_12 Touch"
   ObjComment="WineCellarVines02"
   DrawWidth=178
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2760
   ObjPosY=-9512
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-8803,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8782,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8761,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8782,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_44'),DrawX=-7706,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7655,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7606,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7744
   ObjPosY=-8840
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-8787,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8766,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8745,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7894,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7976
   ObjPosY=-8856
   ObjName="TriggerVolume_0 Touch"
   ObjComment="Basement, excavation"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_44
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7776
   ObjPosY=-8672
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_44"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_45
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7664
   ObjPosY=-8672
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_45"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_0
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_8'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0')),DrawY=-8771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8729,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7374,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7456
   ObjPosY=-8840
   ObjName="TriggerVolume_8 Touch"
   ObjComment="Hidden cathedral"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_0"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-8787,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8745,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_46'),DrawX=-7186,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7135,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7086,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7224
   ObjPosY=-8824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_46
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7168
   ObjPosY=-8664
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_46"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_47
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7328
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_47"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_48
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7224
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_48"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_49
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7128
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_49"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_50
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7024
   ObjPosY=-8584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_50"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_86
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6608
   ObjPosY=-8656
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_86"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-8787,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8766,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8745,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8766,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_86'),DrawX=-6554,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6503,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6454,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6592
   ObjPosY=-8824
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_23
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_1'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-8771,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8750,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8729,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6742,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6824
   ObjPosY=-8840
   ObjName="TriggerVolume_1 Touch"
   ObjComment="Hidden storage"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_23"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8736
   ObjPosY=-8856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8640
   ObjPosY=-8856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8536
   ObjPosY=-8848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_74
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8896
   ObjPosY=-8752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_74"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_75
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=-8752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_75"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_77
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=-8752
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_77"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_59
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_59"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_60
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8616
   ObjPosY=-9184
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_60"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_62
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8768
   ObjPosY=-9096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_62"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_63
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-9096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_63"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_64
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8568
   ObjPosY=-9096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_64"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_65
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=-9096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_65"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_66
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-9528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_66"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_67
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_25'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-9528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_67"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_68
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_26'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8576
   ObjPosY=-9528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_68"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_69
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_27'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8472
   ObjPosY=-9528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_69"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_71
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8720
   ObjPosY=-9432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_71"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_73
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8520
   ObjPosY=-9432
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_73"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=-9491,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9470,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9449,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6178,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6264
   ObjPosY=-9560
   ObjName="TriggerVolume_20 Touch"
   ObjComment="Secret lounge"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-9507,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9486,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9465,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9486,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22'),DrawX=-5994,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5943,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5894,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6032
   ObjPosY=-9544
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6056
   ObjPosY=-9376
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5944
   ObjPosY=-9352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_16
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_20'
   ReTriggerDelay=0.500000
   bEnabled=False
   bClientSideOnly=True
   MaxWidth=355
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_8')),DrawY=-6339,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6318,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6297,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9535,OverrideDelta=145)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=-6408
   ObjName="TriggerVolume_20 Touch"
   ObjComment="Entered Secret Area: The Basement"
   DrawWidth=222
   DrawHeight=176
   Name="SeqEvent_Touch_16"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9704
   ObjPosY=-4232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_6
   DisplayTimeSeconds=1.300000
   DrawTextInfo=(MessageText="Uh oh, looks like this secret has already been discovered and is now deactivated.",MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=0.750000,Y=0.750000),MessageOffset=(X=-120.000000,Y=300.000000),MessageColor=(B=255,G=137,R=230,A=255))
   InputLinks(0)=(DrawY=-4484,OverrideDelta=13)
   InputLinks(1)=(DrawY=-4464,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-4474,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=-9201,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9240
   ObjPosY=-4520
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_6"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   ReTriggerDelay=0.500000
   bEnabled=False
   bClientSideOnly=True
   MaxWidth=355
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_6'),(LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_36')),DrawY=-4443,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-4422,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-4401,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=-9543,OverrideDelta=145)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9720
   ObjPosY=-4512
   ObjName="TriggerVolume_22 Touch"
   ObjComment="Secret DEATH area discovered!"
   DrawWidth=222
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_2
   DisplayTimeSeconds=1.300000
   DrawTextInfo=(MessageText="Sorry friend, you're not getting out of this one alive.",MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=0.750000,Y=0.750000),MessageOffset=(X=-75.000000,Y=325.000000),MessageColor=(B=255,G=137,R=230,A=255))
   InputLinks(0)=(DrawY=-4212,OverrideDelta=13)
   InputLinks(1)=(DrawY=-4192,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-4202,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39'),DrawX=-9209,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9248
   ObjPosY=-4248
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_2"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_18
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_35'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Teleport'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Teleport_0'),(LinkedOp=SeqCond_IncrementFloat'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqCond_IncrementFloat_0'),(LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_7')),DrawY=-7587,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7566,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7545,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=-9314,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9400
   ObjPosY=-7656
   ObjName="TriggerVolume_35 Touch"
   ObjComment="Teleporter"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_18"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Teleport Name=SeqAct_Teleport_0
   InputLinks(0)=(DrawY=-7614,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7614,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=-9050,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_91'),DrawX=-8975,OverrideDelta=76)
   VariableLinks(2)=()
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9088
   ObjPosY=-7648
   DrawWidth=166
   DrawHeight=61
   Name="SeqAct_Teleport_0"
   ObjectArchetype=SeqAct_Teleport'Engine.Default__SeqAct_Teleport'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_30
   InputLinks(0)=(DrawY=-7523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_56',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_99'),DrawX=-8562,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8511,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8462,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8600
   ObjPosY=-7560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_30"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_19
   Originator=DynamicTriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicTriggerVolume_7'
   MaxWidth=220
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_30',InputLinkIdx=1),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_40'),(LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_3'),(LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_23'),(LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_21'),(LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_31')),DrawY=-7323,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7302,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7281,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_92'),DrawX=-9234,OverrideDelta=78)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9344
   ObjPosY=-7392
   ObjName="DynamicTriggerVolume_7 Touch"
   ObjComment="Dining hall"
   DrawWidth=155
   DrawHeight=176
   Name="SeqEvent_Touch_19"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_3
   InputLinks(0)=(DrawY=-7610,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7588,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7566,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7544,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7522,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetBool'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetBool_0'),(LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_4')),DrawY=-7594,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7538,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3'),DrawX=-8297,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25'),LinkDesc="Forge_Door_L",MinVars=0,DrawX=-8243,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26'),LinkDesc="Forge_Door_R",MinVars=0,DrawX=-8181,OverrideDelta=124)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28'),LinkDesc="Forge_Door_C_L",MinVars=0,DrawX=-8111,OverrideDelta=186)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29'),LinkDesc="Forge_Door_C_R",MinVars=0,DrawX=-8033,OverrideDelta=264)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8328
   ObjPosY=-7648
   DrawWidth=343
   DrawHeight=173
   Name="SeqAct_Interp_3"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_3
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.397780)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0.InterpTrackMove_0'
      GroupName="Forge_Door_L"
      GroupColor=(B=0,G=217,R=95,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.397780)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_1.InterpTrackMove_1'
      GroupName="Forge_Door_R"
      GroupColor=(B=163,G=176,R=0,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,OutVal=(X=-0.001953,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,OutVal=(X=0.000000,Y=0.000000,Z=-90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.397780)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3.InterpTrackMove_2'
      GroupName="Forge_Door_C_L"
      GroupColor=(B=109,G=0,R=212,A=255)
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_4
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,OutVal=(X=-0.001953,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.397780,OutVal=(X=0.000000,Y=0.000000,Z=90.000000),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.397780)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4.InterpTrackMove_3'
      GroupName="Forge_Door_C_R"
      GroupColor=(B=0,G=191,R=145,A=255)
      Name="InterpGroup_4"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=1.417016
   InterpGroups(0)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_3'
   InterpGroups(3)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpGroup_4'
   CurveEdSetup=InterpCurveEdSetup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_3.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1.413301
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8344
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_3"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8264
   ObjPosY=-7416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8112
   ObjPosY=-7408
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8024
   ObjPosY=-7424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_20
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_21'
   ReTriggerDelay=0.500000
   bEnabled=False
   bClientSideOnly=True
   MaxWidth=355
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_7')),DrawY=-6123,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-6102,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-6081,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9527,OverrideDelta=145)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9704
   ObjPosY=-6192
   ObjName="TriggerVolume_21 Touch"
   ObjComment="Entered Secret Area: Diabolic Experiment"
   DrawWidth=222
   DrawHeight=176
   Name="SeqEvent_Touch_20"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_7
   DisplayTimeSeconds=1.300000
   DrawTextInfo=(MessageText="Secret area within a secret area discovered!",MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=0.500000,Y=0.500000),MessageOffset=(X=-25.000000,Y=525.000000),MessageColor=(B=255,G=137,R=230,A=255))
   InputLinks(0)=(DrawY=-6348,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6328,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6338,OverrideDelta=23)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9169,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9208
   ObjPosY=-6384
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_7"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_16
   InputLinks(0)=(DrawY=-8619,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8598,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8577,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8598,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_78',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_79',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_80',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_83',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_84',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_85'),DrawX=-8642,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8591,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8542,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-8656
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_16"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_78
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=-8496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_78"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_79
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8696
   ObjPosY=-8496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_79"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_80
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8592
   ObjPosY=-8496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_80"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_83
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=-8400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_83"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_84
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8640
   ObjPosY=-8400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_84"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_85
   ObjValue=KFPlayerStart'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPlayerStart_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8544
   ObjPosY=-8400
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_85"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_3'
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_1')),DrawY=-9115,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9094,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9073,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-6174,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6256
   ObjPosY=-9184
   ObjName="TriggerVolume_3 Touch"
   ObjComment="Dining hall"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_1
   InputLinks(0)=(DrawY=-9131,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9110,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9089,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9110,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_89'),DrawX=-5986,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5935,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5886,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6024
   ObjPosY=-9168
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_1"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_87
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5976
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_87"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_88
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5880
   ObjPosY=-8984
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_88"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_89
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6072
   ObjPosY=-8992
   ObjComment="parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_89"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_90
   ObjValue=KFSpawner'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5776
   ObjPosY=-8992
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_90"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_91
   ObjValue=DynamicTriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicTriggerVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-7520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_91"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_92
   ObjValue=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9096
   ObjPosY=-7520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_92"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_0
   MinDamageAmount=1.000000
   DamageThreshold=500.000000
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_0'
   MaxWidth=251
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_17',InputLinkIdx=1)),DrawY=-6606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9253,OverrideDelta=59)
   VariableLinks(1)=(DrawX=-9179,OverrideDelta=139)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9344
   ObjPosY=-6672
   ObjName="KFDestructibleActor_0 Take Damage"
   ObjComment="Secret Area: The Heart Access Wall Destroyed"
   DrawWidth=145
   DrawHeight=144
   Name="SeqEvent_TakeDamage_0"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_17
   InputLinks(0)=(DrawY=-6635,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6614,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6593,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6614,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31'),DrawX=-8986,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8935,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8886,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-6672
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_17"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=PointLight'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLight_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9032
   ObjPosY=-6472
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_9
   ObjValue=PointLight'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLight_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8528
   ObjPosY=-5120
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_9"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_43
   ObjValue=KFDoorActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDoorActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9536
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_43"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_51
   ObjValue=KFDoorActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDoorActor_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_51"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_52
   ObjValue=KFDoorActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDoorActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9336
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_52"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_53
   ObjValue=KFDoorActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDoorActor_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_53"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-9035,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9014,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8993,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9014,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_43',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_51',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_52',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_53'),DrawX=-9346,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9295,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9246,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9384
   ObjPosY=-9072
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxWidth=136
   OutputLinks(0)=(DrawY=-9043,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18',InputLinkIdx=2)),DrawY=-9022,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9001,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9576
   ObjPosY=-9112
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_54
   ObjValue=DynamicTriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicTriggerVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8808
   ObjPosY=-5064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_54"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_55
   ObjValue=DynamicTriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicTriggerVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8712
   ObjPosY=-5064
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_55"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_56
   ObjValue=DynamicTriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicTriggerVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8704
   ObjPosY=-7376
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_56"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_99
   ObjValue=DynamicTriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicTriggerVolume_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8600
   ObjPosY=-7344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_99"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_0
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9182,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-5112,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-9216
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_0"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   InputLinks(0)=(DrawY=-9570,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9548,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9526,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9504,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9482,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2')),DrawY=-9554,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9498,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-4932,OverrideDelta=29)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_151'),LinkDesc="Camera",MinVars=0,DrawX=-4876,OverrideDelta=76)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-9608
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
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=2154.212891,Y=96.478516,Z=370.972900),ArriveTangent=(X=204.521530,Y=18.740723,Z=34.877693),LeaveTangent=(X=204.521530,Y=18.740723,Z=34.877693),InterpMode=CIM_CurveAutoClamped),(InVal=19.500000,OutVal=(X=3988.169922,Y=501.774414,Z=680.114990),ArriveTangent=(X=152.119507,Y=0.000000,Z=12.296068),LeaveTangent=(X=152.119507,Y=0.000000,Z=12.296068),InterpMode=CIM_CurveAutoClamped),(InVal=29.500000,OutVal=(X=5044.483398,Y=-537.659180,Z=738.587769),ArriveTangent=(X=65.130470,Y=-105.589958,Z=0.000000),LeaveTangent=(X=65.130470,Y=-105.589958,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=39.727425,OutVal=(X=5434.264160,Y=-1634.038574,Z=715.502075),ArriveTangent=(X=70.935516,Y=-20.245888,Z=0.000000),LeaveTangent=(X=70.935516,Y=-20.245888,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=6882.244141,Y=-1725.515625,Z=715.571960),ArriveTangent=(X=131.189682,Y=-0.305698,Z=0.016902),LeaveTangent=(X=131.189682,Y=-0.305698,Z=0.016902),InterpMode=CIM_CurveAutoClamped),(InVal=60.500000,OutVal=(X=8159.411621,Y=-1726.812012,Z=1025.318481),ArriveTangent=(X=59.530083,Y=0.000000,Z=0.000000),LeaveTangent=(X=59.530083,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=69.500000,OutVal=(X=8453.041016,Y=-1648.953125,Z=985.149536),ArriveTangent=(X=50.444427,Y=0.000000,Z=0.000000),LeaveTangent=(X=50.444427,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=(X=9209.343750,Y=-2285.551758,Z=1000.413208),ArriveTangent=(X=77.949318,Y=-54.235962,Z=1.790958),LeaveTangent=(X=77.949318,Y=-54.235962,Z=1.790958),InterpMode=CIM_CurveAutoClamped),(InVal=89.500000,OutVal=(X=10012.027344,Y=-2733.672363,Z=1020.968689),ArriveTangent=(X=59.154877,Y=-49.533043,Z=0.594345),LeaveTangent=(X=59.154877,Y=-49.533043,Z=0.594345),InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=(X=10401.200195,Y=-3276.212646,Z=1023.786743),ArriveTangent=(X=29.105135,Y=0.000000,Z=0.526634),LeaveTangent=(X=29.105135,Y=0.000000,Z=0.526634),InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=(X=10608.682617,Y=-2550.436523,Z=1035.663330),ArriveTangent=(X=38.833794,Y=74.912209,Z=0.000000),LeaveTangent=(X=38.833794,Y=74.912209,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=(X=11390.459961,Y=-1777.968506,Z=1016.278076),ArriveTangent=(X=82.715088,Y=0.000000,Z=-2.538980),LeaveTangent=(X=82.715088,Y=0.000000,Z=-2.538980),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=12262.984375,Y=-2345.308838,Z=984.883728),ArriveTangent=(X=85.815506,Y=-13.344683,Z=0.000000),LeaveTangent=(X=85.815506,Y=-13.344683,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=139.500000,OutVal=(X=13063.862305,Y=-2403.347656,Z=1005.018066),ArriveTangent=(X=91.071716,Y=-14.305595,Z=4.446145),LeaveTangent=(X=91.071716,Y=-14.305595,Z=4.446145),InterpMode=CIM_CurveAutoClamped),(InVal=149.500000,OutVal=(X=14038.882813,Y=-3780.849609,Z=1150.458496),ArriveTangent=(X=64.208885,Y=0.000000,Z=5.904224),LeaveTangent=(X=64.208885,Y=0.000000,Z=5.904224),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=14446.968750,Y=-3513.250732,Z=1181.248535),ArriveTangent=(X=0.000000,Y=51.310215,Z=0.000000),LeaveTangent=(X=0.000000,Y=51.310215,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=169.500000,OutVal=(X=12992.041016,Y=-2354.192139,Z=1004.963867),ArriveTangent=(X=0.000000,Y=91.658691,Z=-1.855740),LeaveTangent=(X=0.000000,Y=91.658691,Z=-1.855740),InterpMode=CIM_CurveAutoClamped),(InVal=179.500000,OutVal=(X=13051.163086,Y=-1725.906250,Z=997.278198),ArriveTangent=(X=0.000000,Y=50.081066,Z=-1.073102),LeaveTangent=(X=0.000000,Y=50.081066,Z=-1.073102),InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,OutVal=(X=12878.908203,Y=-1327.530273,Z=982.965271),ArriveTangent=(X=-28.084196,Y=55.636547,Z=0.000000),LeaveTangent=(X=-28.084196,Y=55.636547,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=199.500000,OutVal=(X=12452.921875,Y=-613.175293,Z=1022.133301),ArriveTangent=(X=-61.228115,Y=65.487427,Z=0.000000),LeaveTangent=(X=-61.228115,Y=65.487427,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=209.500000,OutVal=(X=11684.959961,Y=-50.525391,Z=1007.076660),ArriveTangent=(X=-70.843658,Y=59.202862,Z=0.000000),LeaveTangent=(X=-70.843658,Y=59.202862,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=(X=11000.626953,Y=600.483398,Z=1010.612549),ArriveTangent=(X=0.000000,Y=43.726059,Z=0.321846),LeaveTangent=(X=0.000000,Y=43.726059,Z=0.321846),InterpMode=CIM_CurveAutoClamped),(InVal=230.000000,OutVal=(X=11126.097656,Y=880.458008,Z=1013.674500),ArriveTangent=(X=0.000000,Y=36.940655,Z=0.000000),LeaveTangent=(X=0.000000,Y=36.940655,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=239.500000,OutVal=(X=10644.242188,Y=1320.826172,Z=1008.359924),ArriveTangent=(X=-62.757763,Y=50.803322,Z=0.000000),LeaveTangent=(X=-62.757763,Y=50.803322,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=250.000000,OutVal=(X=9870.942383,Y=1896.524414,Z=1020.435791),ArriveTangent=(X=-80.800148,Y=65.105240,Z=0.000000),LeaveTangent=(X=-80.800148,Y=65.105240,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=261.000000,OutVal=(X=8907.039063,Y=2720.588867,Z=1017.172974),ArriveTangent=(X=-71.125572,Y=0.000000,Z=0.000000),LeaveTangent=(X=-71.125572,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=270.500000,OutVal=(X=8412.868164,Y=2399.068359,Z=1020.860413),ArriveTangent=(X=-59.902496,Y=-4.715938,Z=0.000000),LeaveTangent=(X=-59.902496,Y=-4.715938,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,OutVal=(X=7768.891602,Y=2379.858398,Z=1018.524963),ArriveTangent=(X=-60.727951,Y=0.000000,Z=-0.520397),LeaveTangent=(X=-60.727951,Y=0.000000,Z=-0.520397),InterpMode=CIM_CurveAutoClamped),(InVal=289.500000,OutVal=(X=7259.037109,Y=2829.612305,Z=1002.627808),ArriveTangent=(X=0.000000,Y=64.682617,Z=0.000000),LeaveTangent=(X=0.000000,Y=64.682617,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=300.000000,OutVal=(X=7518.742188,Y=3673.510742,Z=1020.019287),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.248621),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.248621),InterpMode=CIM_CurveAutoClamped),(InVal=309.500000,OutVal=(X=6741.558594,Y=3355.973633,Z=1047.600220),ArriveTangent=(X=-62.301414,Y=-48.649399,Z=0.000000),LeaveTangent=(X=-62.301414,Y=-48.649399,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=320.000000,OutVal=(X=6272.713867,Y=2691.411133,Z=1015.111755),ArriveTangent=(X=0.000000,Y=-56.833530,Z=-2.873601),LeaveTangent=(X=0.000000,Y=-56.833530,Z=-2.873601),InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,OutVal=(X=6594.225098,Y=2190.886230,Z=988.691406),ArriveTangent=(X=0.000000,Y=-33.709789,Z=-1.156257),LeaveTangent=(X=0.000000,Y=-33.709789,Z=-1.156257),InterpMode=CIM_CurveAutoClamped),(InVal=339.500000,OutVal=(X=6368.973633,Y=1991.776367,Z=983.002869),ArriveTangent=(X=0.000000,Y=-27.137451,Z=0.000000),LeaveTangent=(X=0.000000,Y=-27.137451,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,OutVal=(X=6746.673340,Y=1648.137207,Z=994.982544),ArriveTangent=(X=48.970417,Y=0.000000,Z=0.000000),LeaveTangent=(X=48.970417,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,OutVal=(X=7372.867188,Y=2262.729492,Z=980.625000),ArriveTangent=(X=64.412209,Y=17.897808,Z=0.000000),LeaveTangent=(X=64.412209,Y=17.897808,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=370.000000,OutVal=(X=8034.917480,Y=2346.281738,Z=986.332397),InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=(X=7232.039551,Y=1467.370605,Z=650.150085),ArriveTangent=(X=-77.523117,Y=-77.318382,Z=0.000000),LeaveTangent=(X=-77.523117,Y=-77.318382,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,OutVal=(X=6484.455078,Y=799.914063,Z=681.587402),ArriveTangent=(X=-55.559921,Y=0.000000,Z=4.333432),LeaveTangent=(X=-55.559921,Y=0.000000,Z=4.333432),InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=(X=6116.938965,Y=901.344238,Z=736.818726),ArriveTangent=(X=-66.747147,Y=0.000000,Z=6.050208),LeaveTangent=(X=-66.747147,Y=0.000000,Z=6.050208),InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,OutVal=(X=4874.065430,Y=118.126953,Z=802.591553),ArriveTangent=(X=0.000000,Y=-47.464321,Z=0.000000),LeaveTangent=(X=0.000000,Y=-47.464321,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,OutVal=(X=5073.509277,Y=-158.045410,Z=773.585083),ArriveTangent=(X=41.187458,Y=-2.247657,Z=-3.495148),LeaveTangent=(X=41.187458,Y=-2.247657,Z=-3.495148),InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=(X=6246.543945,Y=-167.398438,Z=732.688599),ArriveTangent=(X=85.801147,Y=0.000000,Z=0.000000),LeaveTangent=(X=85.801147,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=(X=6807.204102,Y=575.788086,Z=889.941162),ArriveTangent=(X=0.000000,Y=55.797558,Z=0.000000),LeaveTangent=(X=0.000000,Y=55.797558,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=(X=6278.143555,Y=948.552734,Z=718.212219),ArriveTangent=(X=0.000000,Y=47.823586,Z=0.000000),LeaveTangent=(X=0.000000,Y=47.823586,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,OutVal=(X=6845.171875,Y=1532.259766,Z=963.803955),ArriveTangent=(X=46.484520,Y=0.000000,Z=7.230313),LeaveTangent=(X=46.484520,Y=0.000000,Z=7.230313),InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,OutVal=(X=7207.833984,Y=1005.112305,Z=997.621399),ArriveTangent=(X=0.000000,Y=-49.195629,Z=0.000000),LeaveTangent=(X=0.000000,Y=-49.195629,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=480.000000,OutVal=(X=6787.474121,Y=548.347168,Z=973.347656),ArriveTangent=(X=-26.578144,Y=-57.002125,Z=-5.512942),LeaveTangent=(X=-26.578144,Y=-57.002125,Z=-5.512942),InterpMode=CIM_CurveAutoClamped),(InVal=490.000000,OutVal=(X=6629.322754,Y=-134.930176,Z=681.168213),ArriveTangent=(X=0.000000,Y=-30.580406,Z=0.000000),LeaveTangent=(X=0.000000,Y=-30.580406,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=500.000000,OutVal=(X=6893.541504,Y=-292.712402,Z=684.844299),ArriveTangent=(X=45.108566,Y=0.000000,Z=0.000000),LeaveTangent=(X=45.108566,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=510.000000,OutVal=(X=7628.304688,Y=483.180664,Z=602.691528),ArriveTangent=(X=68.303787,Y=0.000000,Z=-0.128709),LeaveTangent=(X=68.303787,Y=0.000000,Z=-0.128709),InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,OutVal=(X=8259.617188,Y=260.738281,Z=602.173096),ArriveTangent=(X=0.000000,Y=-42.949005,Z=0.000000),LeaveTangent=(X=0.000000,Y=-42.949005,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,OutVal=(X=7300.099121,Y=-687.284668,Z=670.160889),ArriveTangent=(X=-10.137554,Y=-65.726479,Z=0.000000),LeaveTangent=(X=-10.137554,Y=-65.726479,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=(X=7257.388184,Y=-1100.801270,Z=656.017090),ArriveTangent=(X=-9.226448,Y=-57.946033,Z=0.000000),LeaveTangent=(X=-9.226448,Y=-57.946033,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,OutVal=(X=6924.291016,Y=-1846.205322,Z=672.468262),InterpMode=CIM_CurveAutoClamped),(InVal=560.000000,OutVal=(X=7364.631836,Y=-967.690430,Z=664.871582),ArriveTangent=(X=39.560448,Y=11.528793,Z=-0.154511),LeaveTangent=(X=39.560448,Y=11.528793,Z=-0.154511),InterpMode=CIM_CurveAutoClamped),(InVal=570.000000,OutVal=(X=7715.500000,Y=-918.467773,Z=664.185730),ArriveTangent=(X=50.267872,Y=11.536442,Z=-0.168318),LeaveTangent=(X=50.267872,Y=11.536442,Z=-0.168318),InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,OutVal=(X=8369.989258,Y=-30.816406,Z=621.377747),ArriveTangent=(X=46.168926,Y=0.000000,Z=-1.466543),LeaveTangent=(X=46.168926,Y=0.000000,Z=-1.466543),InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=(X=8663.894531,Y=-311.145996,Z=614.314026),ArriveTangent=(X=0.000000,Y=-45.874622,Z=0.000000),LeaveTangent=(X=0.000000,Y=-45.874622,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,OutVal=(X=8072.845703,Y=-1003.976563,Z=765.643921),ArriveTangent=(X=0.000000,Y=-62.028553,Z=17.852533),LeaveTangent=(X=0.000000,Y=-62.028553,Z=17.852533),InterpMode=CIM_CurveAutoClamped),(InVal=610.000000,OutVal=(X=8283.564453,Y=-1551.717041,Z=971.364685),ArriveTangent=(X=34.617290,Y=0.000000,Z=4.908355),LeaveTangent=(X=34.617290,Y=0.000000,Z=4.908355),InterpMode=CIM_CurveAutoClamped),(InVal=620.000000,OutVal=(X=8809.776367,Y=-1039.906250,Z=993.587158),ArriveTangent=(X=48.439697,Y=0.000000,Z=2.886441),LeaveTangent=(X=48.439697,Y=0.000000,Z=2.886441),InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=(X=9252.358398,Y=-1175.566406,Z=1029.093506),ArriveTangent=(X=0.000000,Y=-29.015633,Z=0.000000),LeaveTangent=(X=0.000000,Y=-29.015633,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,OutVal=(X=8976.623047,Y=-2163.256836,Z=1018.568542),InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=(X=9401.003906,Y=-1749.557129,Z=1026.492554),ArriveTangent=(X=0.000000,Y=66.732666,Z=1.115677),LeaveTangent=(X=0.000000,Y=66.732666,Z=1.115677),InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,OutVal=(X=9375.792969,Y=-764.902832,Z=1040.882080),ArriveTangent=(X=-6.140404,Y=98.147728,Z=0.000000),LeaveTangent=(X=-6.140404,Y=98.147728,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=(X=8252.000977,Y=213.397461,Z=991.805176),ArriveTangent=(X=0.000000,Y=79.150635,Z=0.000000),LeaveTangent=(X=0.000000,Y=79.150635,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=(X=8936.507813,Y=818.109863,Z=1004.580017),ArriveTangent=(X=57.229836,Y=54.380199,Z=0.000000),LeaveTangent=(X=57.229836,Y=54.380199,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=690.000000,OutVal=(X=9396.597656,Y=1301.001465,Z=999.076843),ArriveTangent=(X=42.899513,Y=0.000000,Z=0.000000),LeaveTangent=(X=42.899513,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,OutVal=(X=9794.498047,Y=843.174805,Z=999.516479),ArriveTangent=(X=0.000000,Y=-60.494312,Z=0.104048),LeaveTangent=(X=0.000000,Y=-60.494312,Z=0.104048),InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,OutVal=(X=9224.823242,Y=91.115234,Z=1008.869507),ArriveTangent=(X=0.000000,Y=-81.262253,Z=0.326774),LeaveTangent=(X=0.000000,Y=-81.262253,Z=0.326774),InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=(X=9991.944336,Y=-782.070313,Z=1010.450134),ArriveTangent=(X=64.590378,Y=-67.322876,Z=0.000000),LeaveTangent=(X=64.590378,Y=-67.322876,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=(X=10516.630859,Y=-1255.342285,Z=991.863892),ArriveTangent=(X=0.000000,Y=-46.263817,Z=0.000000),LeaveTangent=(X=0.000000,Y=-46.263817,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=740.000000,OutVal=(X=10043.895508,Y=-1707.346680,Z=995.518311),ArriveTangent=(X=0.000000,Y=-46.178967,Z=0.505307),LeaveTangent=(X=0.000000,Y=-46.178967,Z=0.505307),InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,OutVal=(X=10526.083008,Y=-2178.921631,Z=1001.970032),ArriveTangent=(X=77.207481,Y=0.000000,Z=0.945828),LeaveTangent=(X=77.207481,Y=0.000000,Z=0.945828),InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,OutVal=(X=11652.243164,Y=-1381.785645,Z=1014.434875),ArriveTangent=(X=0.000000,Y=66.891983,Z=0.000000),LeaveTangent=(X=0.000000,Y=66.891983,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,OutVal=(X=11156.971680,Y=-841.082031,Z=1004.774414),ArriveTangent=(X=-58.025246,Y=0.000000,Z=0.000000),LeaveTangent=(X=-58.025246,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,OutVal=(X=10491.738281,Y=-1259.659180,Z=1008.841309),ArriveTangent=(X=-49.607216,Y=0.000000,Z=0.000000),LeaveTangent=(X=-49.607216,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,OutVal=(X=10162.724609,Y=-785.570313,Z=999.785339),ArriveTangent=(X=0.000000,Y=86.828766,Z=0.000000),LeaveTangent=(X=0.000000,Y=86.828766,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,OutVal=(X=10277.982422,Y=865.206055,Z=1020.908447),ArriveTangent=(X=0.000000,Y=109.195671,Z=1.709041),LeaveTangent=(X=0.000000,Y=109.195671,Z=1.709041),InterpMode=CIM_CurveAutoClamped),(InVal=810.500000,OutVal=(X=9618.585938,Y=1561.101563,Z=1034.820679),ArriveTangent=(X=-75.168472,Y=0.000000,Z=0.000000),LeaveTangent=(X=-75.168472,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=819.500000,OutVal=(X=8812.197266,Y=860.138672,Z=1016.848633),ArriveTangent=(X=-54.905403,Y=0.000000,Z=-1.682605),LeaveTangent=(X=-54.905403,Y=0.000000,Z=-1.682605),InterpMode=CIM_CurveAutoClamped),(InVal=830.000000,OutVal=(X=8481.598633,Y=1188.056641,Z=1002.009888),ArriveTangent=(X=-45.528629,Y=0.000000,Z=-0.164430),LeaveTangent=(X=-45.528629,Y=0.000000,Z=-0.164430),InterpMode=CIM_CurveAutoClamped),(InVal=840.000000,OutVal=(X=7878.860352,Y=871.791992,Z=1001.303711),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.146042),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.146042),InterpMode=CIM_CurveAutoClamped),(InVal=850.000000,OutVal=(X=7895.408203,Y=1686.521484,Z=997.117188),ArriveTangent=(X=4.026680,Y=0.000000,Z=0.000000),LeaveTangent=(X=4.026680,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,OutVal=(X=8608.069336,Y=1095.796875,Z=1029.170532),ArriveTangent=(X=45.835609,Y=0.000000,Z=0.000000),LeaveTangent=(X=45.835609,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=870.000000,OutVal=(X=8883.429688,Y=1303.562988,Z=637.505920),ArriveTangent=(X=39.134033,Y=0.000000,Z=-22.839542),LeaveTangent=(X=39.134033,Y=0.000000,Z=-22.839542),InterpMode=CIM_CurveAutoClamped),(InVal=880.000000,OutVal=(X=9390.750000,Y=825.448242,Z=507.097137),ArriveTangent=(X=53.408886,Y=-10.918713,Z=-10.895528),LeaveTangent=(X=53.408886,Y=-10.918713,Z=-10.895528),InterpMode=CIM_CurveAutoClamped),(InVal=890.000000,OutVal=(X=9951.607422,Y=776.299805,Z=419.595367),ArriveTangent=(X=57.329151,Y=0.000000,Z=0.000000),LeaveTangent=(X=57.329151,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=(X=10537.333008,Y=1333.944336,Z=445.563721),ArriveTangent=(X=42.898922,Y=0.000000,Z=1.764946),LeaveTangent=(X=42.898922,Y=0.000000,Z=1.764946),InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,OutVal=(X=10817.929688,Y=647.404785,Z=456.524994),ArriveTangent=(X=0.000000,Y=-52.751221,Z=0.285862),LeaveTangent=(X=0.000000,Y=-52.751221,Z=0.285862),InterpMode=CIM_CurveAutoClamped),(InVal=920.000000,OutVal=(X=10326.122070,Y=278.919922,Z=457.835846),ArriveTangent=(X=-16.889652,Y=-44.512768,Z=0.000000),LeaveTangent=(X=-16.889652,Y=-44.512768,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=930.000000,OutVal=(X=10244.729492,Y=-242.850586,Z=419.448639),ArriveTangent=(X=-17.771433,Y=-25.520788,Z=0.000000),LeaveTangent=(X=-17.771433,Y=-25.520788,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=940.000000,OutVal=(X=9557.691406,Y=-378.451660,Z=469.867371),ArriveTangent=(X=-53.328564,Y=-20.816725,Z=8.080782),LeaveTangent=(X=-53.328564,Y=-20.816725,Z=8.080782),InterpMode=CIM_CurveAutoClamped),(InVal=950.000000,OutVal=(X=9178.158203,Y=-664.237793,Z=587.910034),ArriveTangent=(X=0.000000,Y=-31.075855,Z=7.571021),LeaveTangent=(X=0.000000,Y=-31.075855,Z=7.571021),InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,OutVal=(X=9253.738281,Y=-999.968750,Z=633.321899),ArriveTangent=(X=17.088238,Y=-14.047429,Z=9.699856),LeaveTangent=(X=17.088238,Y=-14.047429,Z=9.699856),InterpMode=CIM_CurveAutoClamped),(InVal=970.000000,OutVal=(X=10121.666016,Y=-1071.024902,Z=960.992554),ArriveTangent=(X=20.494240,Y=0.000000,Z=1.979879),LeaveTangent=(X=20.494240,Y=0.000000,Z=1.979879),InterpMode=CIM_CurveAutoClamped),(InVal=980.000000,OutVal=(X=10214.323242,Y=-510.297852,Z=969.144897),InterpMode=CIM_CurveAutoClamped),(InVal=990.000000,OutVal=(X=10179.920898,Y=-1088.314453,Z=949.721069),ArriveTangent=(X=-8.168247,Y=-5.017054,Z=-4.539232),LeaveTangent=(X=-8.168247,Y=-5.017054,Z=-4.539232),InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,OutVal=(X=9401.959961,Y=-1109.249023,Z=614.688782),ArriveTangent=(X=-69.608742,Y=-3.065918,Z=-0.927355),LeaveTangent=(X=-69.608742,Y=-3.065918,Z=-0.927355),InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,OutVal=(X=8787.746094,Y=-1149.632813,Z=610.931580),ArriveTangent=(X=0.000000,Y=-9.024461,Z=-0.754997),LeaveTangent=(X=0.000000,Y=-9.024461,Z=-0.754997),InterpMode=CIM_CurveAutoClamped),(InVal=1020.000000,OutVal=(X=9339.607422,Y=-1563.747803,Z=591.757690),ArriveTangent=(X=0.000000,Y=-57.445457,Z=0.000000),LeaveTangent=(X=0.000000,Y=-57.445457,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1030.000000,OutVal=(X=8962.876953,Y=-2298.541992,Z=594.106750),ArriveTangent=(X=-14.302367,Y=0.000000,Z=0.333145),LeaveTangent=(X=-14.302367,Y=0.000000,Z=0.333145),InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,OutVal=(X=8892.351563,Y=-1265.137207,Z=598.420593),ArriveTangent=(X=-18.461287,Y=53.890572,Z=0.513895),LeaveTangent=(X=-18.461287,Y=53.890572,Z=0.513895),InterpMode=CIM_CurveAutoClamped),(InVal=1044.811890,OutVal=(X=8446.002930,Y=-1098.834961,Z=601.718506),ArriveTangent=(X=-23.597162,Y=50.774441,Z=1.400944),LeaveTangent=(X=-23.597162,Y=50.774441,Z=1.400944),InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,OutVal=(X=8391.078125,Y=-753.384277,Z=623.121948),ArriveTangent=(X=0.000000,Y=45.184429,Z=0.000000),LeaveTangent=(X=0.000000,Y=45.184429,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,OutVal=(X=9053.826172,Y=-412.568848,Z=574.757568),ArriveTangent=(X=42.610931,Y=34.885620,Z=-5.987442),LeaveTangent=(X=42.610931,Y=34.885620,Z=-5.987442),InterpMode=CIM_CurveAutoClamped),(InVal=1070.000000,OutVal=(X=9309.764648,Y=-55.671875,Z=503.373108),ArriveTangent=(X=18.720905,Y=54.633827,Z=-6.745311),LeaveTangent=(X=18.720905,Y=54.633827,Z=-6.745311),InterpMode=CIM_CurveAutoClamped),(InVal=1080.000000,OutVal=(X=9432.096680,Y=691.543945,Z=439.851349),ArriveTangent=(X=0.000000,Y=68.819809,Z=0.000000),LeaveTangent=(X=0.000000,Y=68.819809,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1089.500000,OutVal=(X=8857.934570,Y=1286.314453,Z=639.156555),ArriveTangent=(X=-55.254688,Y=55.590382,Z=27.891138),LeaveTangent=(X=-55.254688,Y=55.590382,Z=27.891138),InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,OutVal=(X=8327.002930,Y=1803.351563,Z=997.674072),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=10.500000,OutVal=(X=0.000000,Y=12.128906,Z=3.515625),InterpMode=CIM_CurveAutoClamped),(InVal=19.500000,OutVal=(X=0.000000,Y=7.734375,Z=-26.015625),ArriveTangent=(X=0.000000,Y=-0.718827,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.718827,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=29.500000,OutVal=(X=0.000000,Y=-1.757813,Z=27.421875),InterpMode=CIM_CurveAutoClamped),(InVal=39.727425,OutVal=(X=0.000000,Y=-0.197754,Z=-9.206543),ArriveTangent=(X=0.000000,Y=0.171494,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.171494,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=50.000000,OutVal=(X=0.000000,Y=1.757813,Z=12.480469),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.316848),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.316848),InterpMode=CIM_CurveAutoClamped),(InVal=60.500000,OutVal=(X=0.000000,Y=-6.679688,Z=62.050781),InterpMode=CIM_CurveAutoClamped),(InVal=69.500000,OutVal=(X=0.000000,Y=0.703125,Z=-45.175781),ArriveTangent=(X=0.000000,Y=0.534897,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.534897,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=80.000000,OutVal=(X=0.000000,Y=4.042969,Z=83.847656),InterpMode=CIM_CurveAutoClamped),(InVal=89.500000,OutVal=(X=0.000000,Y=3.515625,Z=41.132813),ArriveTangent=(X=0.000000,Y=-0.118021,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.118021,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=100.000000,OutVal=(X=0.000000,Y=-1.230469,Z=76.289063),InterpMode=CIM_CurveAutoClamped),(InVal=110.000000,OutVal=(X=0.000000,Y=3.339844,Z=48.515625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.862437),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.862437),InterpMode=CIM_CurveAutoClamped),(InVal=120.000000,OutVal=(X=0.000000,Y=0.703125,Z=-34.804688),InterpMode=CIM_CurveAutoClamped),(InVal=130.000000,OutVal=(X=0.000000,Y=9.492188,Z=-16.523438),InterpMode=CIM_CurveAutoClamped),(InVal=139.500000,OutVal=(X=0.000000,Y=4.394531,Z=-42.539063),InterpMode=CIM_CurveAutoClamped),(InVal=149.500000,OutVal=(X=0.000000,Y=8.964844,Z=-5.449219),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.999868),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.999868),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=0.000000,Y=-3.867188,Z=150.292969),InterpMode=CIM_CurveAutoClamped),(InVal=169.500000,OutVal=(X=0.000000,Y=0.878906,Z=94.042969),InterpMode=CIM_CurveAutoClamped),(InVal=179.500000,OutVal=(X=0.000000,Y=-0.351563,Z=149.765625),ArriveTangent=(X=0.000000,Y=0.000000,Z=5.359184),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.359184),InterpMode=CIM_CurveAutoClamped),(InVal=190.000000,OutVal=(X=0.000000,Y=5.273438,Z=203.906250),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.692630),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.692630),InterpMode=CIM_CurveAutoClamped),(InVal=199.500000,OutVal=(X=0.000000,Y=2.460938,Z=226.757813),ArriveTangent=(X=0.000000,Y=-0.333534,Z=0.130373),LeaveTangent=(X=0.000000,Y=-0.333534,Z=0.130373),InterpMode=CIM_CurveAutoClamped),(InVal=209.500000,OutVal=(X=0.000000,Y=-1.230469,Z=227.285156),InterpMode=CIM_CurveAutoClamped),(InVal=220.000000,OutVal=(X=0.000000,Y=3.164063,Z=135.351563),InterpMode=CIM_CurveAutoClamped),(InVal=230.000000,OutVal=(X=0.000000,Y=1.054688,Z=143.261719),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.240159),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.240159),InterpMode=CIM_CurveAutoClamped),(InVal=239.500000,OutVal=(X=0.000000,Y=5.625000,Z=159.785156),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.164443),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.164443),InterpMode=CIM_CurveAutoClamped),(InVal=250.000000,OutVal=(X=0.000000,Y=2.636719,Z=225.000000),ArriveTangent=(X=0.000000,Y=-0.100002,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.100002,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=261.000000,OutVal=(X=0.000000,Y=2.109375,Z=212.343750),InterpMode=CIM_CurveAutoClamped),(InVal=270.500000,OutVal=(X=0.000000,Y=2.988281,Z=219.550781),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.734715),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.734715),InterpMode=CIM_CurveAutoClamped),(InVal=280.000000,OutVal=(X=0.000000,Y=0.175781,Z=313.066406),ArriveTangent=(X=0.000000,Y=0.000000,Z=12.036389),LeaveTangent=(X=0.000000,Y=0.000000,Z=12.036389),InterpMode=CIM_CurveAutoClamped),(InVal=289.500000,OutVal=(X=0.000000,Y=1.230469,Z=448.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=13.297852),LeaveTangent=(X=0.000000,Y=0.000000,Z=13.297852),InterpMode=CIM_CurveAutoClamped),(InVal=300.000000,OutVal=(X=0.000000,Y=-2.285156,Z=579.023438),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.534552),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.534552),InterpMode=CIM_CurveAutoClamped),(InVal=309.500000,OutVal=(X=0.000000,Y=-0.351563,Z=595.019531),ArriveTangent=(X=0.000000,Y=0.210938,Z=3.343458),LeaveTangent=(X=0.000000,Y=0.210938,Z=3.343458),InterpMode=CIM_CurveAutoClamped),(InVal=320.000000,OutVal=(X=0.000000,Y=1.933594,Z=688.007813),InterpMode=CIM_CurveAutoClamped),(InVal=330.000000,OutVal=(X=0.000000,Y=-0.878906,Z=589.394531),InterpMode=CIM_CurveAutoClamped),(InVal=339.500000,OutVal=(X=0.000000,Y=2.460938,Z=678.691406),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.595703),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.595703),InterpMode=CIM_CurveAutoClamped),(InVal=350.000000,OutVal=(X=0.000000,Y=-1.406250,Z=761.308594),InterpMode=CIM_CurveAutoClamped),(InVal=360.000000,OutVal=(X=0.000000,Y=3.164063,Z=681.855469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.226563),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.226563),InterpMode=CIM_CurveAutoClamped),(InVal=370.000000,OutVal=(X=0.000000,Y=0.878906,Z=596.777344),ArriveTangent=(X=0.000000,Y=-0.126205,Z=-2.978576),LeaveTangent=(X=0.000000,Y=-0.126205,Z=-2.978576),InterpMode=CIM_CurveAutoClamped),(InVal=380.000000,OutVal=(X=0.000000,Y=0.175781,Z=582.363281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-2.954412),LeaveTangent=(X=0.000000,Y=0.000000,Z=-2.954412),InterpMode=CIM_CurveAutoClamped),(InVal=390.000000,OutVal=(X=0.000000,Y=9.316406,Z=500.976563),InterpMode=CIM_CurveAutoClamped),(InVal=400.000000,OutVal=(X=0.000000,Y=4.394531,Z=583.417969),ArriveTangent=(X=0.000000,Y=-0.766206,Z=7.875000),LeaveTangent=(X=0.000000,Y=-0.766206,Z=7.875000),InterpMode=CIM_CurveAutoClamped),(InVal=410.000000,OutVal=(X=0.000000,Y=-6.328125,Z=658.476563),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.103516),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.103516),InterpMode=CIM_CurveAutoClamped),(InVal=420.000000,OutVal=(X=0.000000,Y=-2.460938,Z=745.488281),ArriveTangent=(X=0.000000,Y=0.500977,Z=6.401260),LeaveTangent=(X=0.000000,Y=0.500977,Z=6.401260),InterpMode=CIM_CurveAutoClamped),(InVal=430.000000,OutVal=(X=0.000000,Y=3.691406,Z=787.500000),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.957031),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.957031),InterpMode=CIM_CurveAutoClamped),(InVal=440.000000,OutVal=(X=0.000000,Y=-9.316406,Z=844.628906),InterpMode=CIM_CurveAutoClamped),(InVal=450.000000,OutVal=(X=0.000000,Y=5.097656,Z=767.988281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.349609),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.349609),InterpMode=CIM_CurveAutoClamped),(InVal=460.000000,OutVal=(X=0.000000,Y=4.746094,Z=677.636719),ArriveTangent=(X=0.000000,Y=-0.083251,Z=-9.254883),LeaveTangent=(X=0.000000,Y=-0.083251,Z=-9.254883),InterpMode=CIM_CurveAutoClamped),(InVal=470.000000,OutVal=(X=0.000000,Y=-2.812500,Z=582.890625),ArriveTangent=(X=0.000000,Y=-0.958008,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.958008,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=480.000000,OutVal=(X=0.000000,Y=-14.414063,Z=598.183594),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.231859),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.231859),InterpMode=CIM_CurveAutoClamped),(InVal=490.000000,OutVal=(X=0.000000,Y=4.042969,Z=701.191406),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.578125),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.578125),InterpMode=CIM_CurveAutoClamped),(InVal=500.000000,OutVal=(X=0.000000,Y=-3.339844,Z=769.746094),InterpMode=CIM_CurveAutoClamped),(InVal=510.000000,OutVal=(X=0.000000,Y=-1.054688,Z=683.085938),ArriveTangent=(X=0.000000,Y=0.228516,Z=-9.421875),LeaveTangent=(X=0.000000,Y=0.228516,Z=-9.421875),InterpMode=CIM_CurveAutoClamped),(InVal=520.000000,OutVal=(X=0.000000,Y=1.230469,Z=581.308594),InterpMode=CIM_CurveAutoClamped),(InVal=530.000000,OutVal=(X=0.000000,Y=-0.351563,Z=640.195313),InterpMode=CIM_CurveAutoClamped),(InVal=540.000000,OutVal=(X=0.000000,Y=3.867188,Z=586.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.635574),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.635574),InterpMode=CIM_CurveAutoClamped),(InVal=550.000000,OutVal=(X=0.000000,Y=1.406250,Z=412.734375),ArriveTangent=(X=0.000000,Y=-0.228516,Z=-5.427620),LeaveTangent=(X=0.000000,Y=-0.228516,Z=-5.427620),InterpMode=CIM_CurveAutoClamped),(InVal=560.000000,OutVal=(X=0.000000,Y=-0.703125,Z=387.070313),InterpMode=CIM_CurveAutoClamped),(InVal=570.000000,OutVal=(X=0.000000,Y=3.515625,Z=422.753906),InterpMode=CIM_CurveAutoClamped),(InVal=580.000000,OutVal=(X=0.000000,Y=-1.054688,Z=316.757813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-9.369141),LeaveTangent=(X=0.000000,Y=0.000000,Z=-9.369141),InterpMode=CIM_CurveAutoClamped),(InVal=590.000000,OutVal=(X=0.000000,Y=4.570313,Z=235.371094),ArriveTangent=(X=0.000000,Y=0.971175,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.971175,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=600.000000,OutVal=(X=0.000000,Y=20.742188,Z=286.875000),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.083154),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.083154),InterpMode=CIM_CurveAutoClamped),(InVal=610.000000,OutVal=(X=0.000000,Y=0.878906,Z=401.308594),InterpMode=CIM_CurveAutoClamped),(InVal=620.000000,OutVal=(X=0.000000,Y=4.218750,Z=316.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.127930),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.127930),InterpMode=CIM_CurveAutoClamped),(InVal=630.000000,OutVal=(X=0.000000,Y=-1.230469,Z=258.750000),InterpMode=CIM_CurveAutoClamped),(InVal=640.000000,OutVal=(X=0.000000,Y=-1.230469,Z=358.242188),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.861328),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.861328),InterpMode=CIM_CurveAutoClamped),(InVal=650.000000,OutVal=(X=0.000000,Y=2.460938,Z=455.976563),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.270411),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.270411),InterpMode=CIM_CurveAutoClamped),(InVal=660.000000,OutVal=(X=0.000000,Y=2.109375,Z=493.593750),InterpMode=CIM_CurveAutoClamped),(InVal=670.000000,OutVal=(X=0.000000,Y=2.109375,Z=407.285156),InterpMode=CIM_CurveAutoClamped),(InVal=680.000000,OutVal=(X=0.000000,Y=0.351563,Z=500.976563),ArriveTangent=(X=0.000000,Y=-0.158203,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.158203,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=690.000000,OutVal=(X=0.000000,Y=-1.054688,Z=301.113281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.808878),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.808878),InterpMode=CIM_CurveAutoClamped),(InVal=700.000000,OutVal=(X=0.000000,Y=-0.703125,Z=233.261719),InterpMode=CIM_CurveAutoClamped),(InVal=710.000000,OutVal=(X=0.000000,Y=-2.109375,Z=326.777344),ArriveTangent=(X=0.000000,Y=-0.088726,Z=8.780273),LeaveTangent=(X=0.000000,Y=-0.088726,Z=8.780273),InterpMode=CIM_CurveAutoClamped),(InVal=720.000000,OutVal=(X=0.000000,Y=-2.636719,Z=408.867188),InterpMode=CIM_CurveAutoClamped),(InVal=730.000000,OutVal=(X=0.000000,Y=-1.406250,Z=236.250000),ArriveTangent=(X=0.000000,Y=0.184570,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.184570,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=740.000000,OutVal=(X=0.000000,Y=1.054688,Z=319.042969),ArriveTangent=(X=0.000000,Y=0.193359,Z=8.657227),LeaveTangent=(X=0.000000,Y=0.193359,Z=8.657227),InterpMode=CIM_CurveAutoClamped),(InVal=750.000000,OutVal=(X=0.000000,Y=2.460938,Z=409.394531),ArriveTangent=(X=0.000000,Y=0.000000,Z=9.193359),LeaveTangent=(X=0.000000,Y=0.000000,Z=9.193359),InterpMode=CIM_CurveAutoClamped),(InVal=760.000000,OutVal=(X=0.000000,Y=0.878906,Z=502.910156),ArriveTangent=(X=0.000000,Y=0.000000,Z=8.375977),LeaveTangent=(X=0.000000,Y=0.000000,Z=8.375977),InterpMode=CIM_CurveAutoClamped),(InVal=770.000000,OutVal=(X=0.000000,Y=5.625000,Z=576.914063),InterpMode=CIM_CurveAutoClamped),(InVal=780.000000,OutVal=(X=0.000000,Y=-1.054688,Z=496.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-7.672852),LeaveTangent=(X=0.000000,Y=0.000000,Z=-7.672852),InterpMode=CIM_CurveAutoClamped),(InVal=790.000000,OutVal=(X=0.000000,Y=2.285156,Z=423.457031),InterpMode=CIM_CurveAutoClamped),(InVal=800.000000,OutVal=(X=0.000000,Y=1.054688,Z=479.355469),ArriveTangent=(X=0.000000,Y=-0.217077,Z=7.940168),LeaveTangent=(X=0.000000,Y=-0.217077,Z=7.940168),InterpMode=CIM_CurveAutoClamped),(InVal=810.500000,OutVal=(X=0.000000,Y=-2.988281,Z=586.230469),InterpMode=CIM_CurveAutoClamped),(InVal=819.500000,OutVal=(X=0.000000,Y=-0.175781,Z=488.496094),ArriveTangent=(X=0.000000,Y=0.279447,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.279447,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=830.000000,OutVal=(X=0.000000,Y=2.460938,Z=572.167969),ArriveTangent=(X=0.000000,Y=0.205793,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.205793,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=840.000000,OutVal=(X=0.000000,Y=4.042969,Z=452.988281),ArriveTangent=(X=0.000000,Y=0.000000,Z=-12.656250),LeaveTangent=(X=0.000000,Y=0.000000,Z=-12.656250),InterpMode=CIM_CurveAutoClamped),(InVal=850.000000,OutVal=(X=0.000000,Y=-0.175781,Z=319.042969),ArriveTangent=(X=0.000000,Y=-0.697610,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.697610,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=860.000000,OutVal=(X=0.000000,Y=-10.898438,Z=403.593750),InterpMode=CIM_CurveAutoClamped),(InVal=870.000000,OutVal=(X=0.000000,Y=-9.492188,Z=307.089844),InterpMode=CIM_CurveAutoClamped),(InVal=880.000000,OutVal=(X=0.000000,Y=-12.832031,Z=381.621094),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.363970),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.363970),InterpMode=CIM_CurveAutoClamped),(InVal=890.000000,OutVal=(X=0.000000,Y=4.042969,Z=399.023438),InterpMode=CIM_CurveAutoClamped),(InVal=900.000000,OutVal=(X=0.000000,Y=2.460938,Z=235.898438),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.172167),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.172167),InterpMode=CIM_CurveAutoClamped),(InVal=910.000000,OutVal=(X=0.000000,Y=4.746094,Z=205.488281),InterpMode=CIM_CurveAutoClamped),(InVal=920.000000,OutVal=(X=0.000000,Y=-4.218750,Z=280.019531),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.924961),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.924961),InterpMode=CIM_CurveAutoClamped),(InVal=930.000000,OutVal=(X=0.000000,Y=1.054688,Z=310.078125),ArriveTangent=(X=0.000000,Y=0.839268,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.839268,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=940.000000,OutVal=(X=0.000000,Y=13.183594,Z=207.773438),InterpMode=CIM_CurveAutoClamped),(InVal=950.000000,OutVal=(X=0.000000,Y=12.304688,Z=312.011719),ArriveTangent=(X=0.000000,Y=-0.169102,Z=4.947421),LeaveTangent=(X=0.000000,Y=-0.169102,Z=4.947421),InterpMode=CIM_CurveAutoClamped),(InVal=960.000000,OutVal=(X=0.000000,Y=8.613281,Z=338.027344),ArriveTangent=(X=0.000000,Y=-0.613017,Z=4.715177),LeaveTangent=(X=0.000000,Y=-0.613017,Z=4.715177),InterpMode=CIM_CurveAutoClamped),(InVal=970.000000,OutVal=(X=0.000000,Y=-0.878906,Z=425.390625),ArriveTangent=(X=0.000000,Y=-0.412488,Z=0.000000),LeaveTangent=(X=0.000000,Y=-0.412488,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=980.000000,OutVal=(X=0.000000,Y=-2.988281,Z=255.410156),ArriveTangent=(X=0.000000,Y=-0.396603,Z=-8.643591),LeaveTangent=(X=0.000000,Y=-0.396603,Z=-8.643591),InterpMode=CIM_CurveAutoClamped),(InVal=990.000000,OutVal=(X=0.000000,Y=-11.074219,Z=208.828125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.746094),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.746094),InterpMode=CIM_CurveAutoClamped),(InVal=1000.000000,OutVal=(X=0.000000,Y=4.570313,Z=160.488281),InterpMode=CIM_CurveAutoClamped),(InVal=1010.000000,OutVal=(X=0.000000,Y=-1.230469,Z=303.398438),InterpMode=CIM_CurveAutoClamped),(InVal=1020.000000,OutVal=(X=0.000000,Y=3.164063,Z=232.558594),ArriveTangent=(X=0.000000,Y=0.000000,Z=-10.921937),LeaveTangent=(X=0.000000,Y=0.000000,Z=-10.921937),InterpMode=CIM_CurveAutoClamped),(InVal=1030.000000,OutVal=(X=0.000000,Y=-1.230469,Z=81.738281),InterpMode=CIM_CurveAutoClamped),(InVal=1040.000000,OutVal=(X=0.000000,Y=0.000000,Z=143.261719),InterpMode=CIM_CurveAutoClamped),(InVal=1044.811890,OutVal=(X=0.000000,Y=-1.186523,Z=77.871094),ArriveTangent=(X=0.000000,Y=-0.430541,Z=-10.019531),LeaveTangent=(X=0.000000,Y=-0.430541,Z=-10.019531),InterpMode=CIM_CurveAutoClamped),(InVal=1050.000000,OutVal=(X=0.000000,Y=-5.097656,Z=43.066406),InterpMode=CIM_CurveAutoClamped),(InVal=1060.000000,OutVal=(X=0.000000,Y=-4.394531,Z=55.195313),ArriveTangent=(X=0.000000,Y=0.000000,Z=2.199099),LeaveTangent=(X=0.000000,Y=0.000000,Z=2.199099),InterpMode=CIM_CurveAutoClamped),(InVal=1070.000000,OutVal=(X=0.000000,Y=-10.546875,Z=95.976563),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.007813),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.007813),InterpMode=CIM_CurveAutoClamped),(InVal=1080.000000,OutVal=(X=0.000000,Y=17.929688,Z=135.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=6.392743),LeaveTangent=(X=0.000000,Y=0.000000,Z=6.392743),InterpMode=CIM_CurveAutoClamped),(InVal=1089.500000,OutVal=(X=0.000000,Y=10.195313,Z=225.000000),ArriveTangent=(X=0.000000,Y=-1.207072,Z=0.000000),LeaveTangent=(X=0.000000,Y=-1.207072,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=1100.000000,OutVal=(X=0.000000,Y=-6.679688,Z=139.394531),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.366896),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=10.500000),(Time=19.500000),(Time=29.500000),(Time=39.727425),(Time=50.000000),(Time=60.500000),(Time=69.500000),(Time=80.000000),(Time=89.500000),(Time=100.000000),(Time=110.000000),(Time=120.000000),(Time=130.000000),(Time=139.500000),(Time=149.500000),(Time=160.000000),(Time=169.500000),(Time=179.500000),(Time=190.000000),(Time=199.500000),(Time=209.500000),(Time=220.000000),(Time=230.000000),(Time=239.500000),(Time=250.000000),(Time=261.000000),(Time=270.500000),(Time=280.000000),(Time=289.500000),(Time=300.000000),(Time=309.500000),(Time=320.000000),(Time=330.000000),(Time=339.500000),(Time=350.000000),(Time=360.000000),(Time=370.000000),(Time=380.000000),(Time=390.000000),(Time=400.000000),(Time=410.000000),(Time=420.000000),(Time=430.000000),(Time=440.000000),(Time=450.000000),(Time=460.000000),(Time=470.000000),(Time=480.000000),(Time=490.000000),(Time=500.000000),(Time=510.000000),(Time=520.000000),(Time=530.000000),(Time=540.000000),(Time=550.000000),(Time=560.000000),(Time=570.000000),(Time=580.000000),(Time=590.000000),(Time=600.000000),(Time=610.000000),(Time=620.000000),(Time=630.000000),(Time=640.000000),(Time=650.000000),(Time=660.000000),(Time=670.000000),(Time=680.000000),(Time=690.000000),(Time=700.000000),(Time=710.000000),(Time=720.000000),(Time=730.000000),(Time=740.000000),(Time=750.000000),(Time=760.000000),(Time=770.000000),(Time=780.000000),(Time=790.000000),(Time=800.000000),(Time=810.500000),(Time=819.500000),(Time=830.000000),(Time=840.000000),(Time=850.000000),(Time=860.000000),(Time=870.000000),(Time=880.000000),(Time=890.000000),(Time=900.000000),(Time=910.000000),(Time=920.000000),(Time=930.000000),(Time=940.000000),(Time=950.000000),(Time=960.000000),(Time=970.000000),(Time=980.000000),(Time=990.000000),(Time=1000.000000),(Time=1010.000000),(Time=1020.000000),(Time=1030.000000),(Time=1040.000000),(Time=1044.811890),(Time=1050.000000),(Time=1060.000000),(Time=1070.000000),(Time=1080.000000),(Time=1089.500000),(Time=1100.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_1'
      GroupName="Camera"
      GroupColor=(B=0,G=191,R=145,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_0
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_0
         CutTrack(0)=(TargetCamGroup="Camera",ShotNumber=10)
         Name="InterpTrackDirector_0"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0.InterpTrackDirector_0'
      GroupColor=(B=115,G=209,R=0,A=255)
      Name="InterpGroupDirector_0"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=1105.000000
   InterpGroups(0)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   InterpGroups(1)=InterpGroupDirector'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroupDirector_0'
   CurveEdSetup=InterpCurveEdSetup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=1105.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5008
   ObjPosY=-9352
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_151
   ObjValue=CameraActor'KF-NETHERHOLD.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-9352
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_151"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_1
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9566,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-9566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_0'),DrawX=-5152,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5216
   ObjPosY=-9600
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_1"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9550,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_1'),DrawX=-4616,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4680
   ObjPosY=-9584
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_0
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-9480
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_0"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_0
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_1'),(LinkedOp=SeqAct_ConsoleCommand'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_0')),DrawY=-9566,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5409,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5504
   ObjPosY=-9632
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_0"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4656
   ObjPosY=-9264
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_1"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1156
   SizeY=655
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5536
   ObjPosY=-9688
   ObjComment="Benchmark"
   DrawWidth=1156
   DrawHeight=655
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=124
   SizeY=124
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-6480
   ObjComment="Switch to "PointLight Toggleable" if this light doesn't turn off"
   DrawWidth=124
   DrawHeight=124
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=602
   SizeY=428
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9712
   ObjPosY=-4544
   ObjComment="Secret Area: Death Trap"
   DrawWidth=602
   DrawHeight=428
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_3
   SizeX=2127
   SizeY=692
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9744
   ObjPosY=-5624
   ObjComment="Secret Area: The Church"
   DrawWidth=2127
   DrawHeight=692
   Name="SequenceFrame_3"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_4
   SizeX=921
   SizeY=716
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-6696
   ObjComment="Secret Areas: Normal"
   DrawWidth=921
   DrawHeight=716
   Name="SequenceFrame_4"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_5
   SizeX=1828
   SizeY=684
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9752
   ObjPosY=-7696
   ObjComment="Secret Area: Dining Hall"
   DrawWidth=1828
   DrawHeight=684
   Name="SequenceFrame_5"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_6
   SizeX=3507
   SizeY=3990
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9888
   ObjPosY=-7936
   ObjComment="Secret Areas"
   DrawWidth=3507
   DrawHeight=3990
   Name="SequenceFrame_6"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_7
   SizeX=1225
   SizeY=260
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3728
   ObjPosY=-9672
   ObjComment="Ambient Sound Triggers"
   DrawWidth=1225
   DrawHeight=260
   Name="SequenceFrame_7"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_8
   SizeX=2332
   SizeY=1100
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8008
   ObjPosY=-9584
   ObjComment="Portal Spawns: All Spawn Portals work as intended. Unlinked variables are childs of other spawners."
   DrawWidth=2332
   DrawHeight=1100
   Name="SequenceFrame_8"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_9
   SizeX=1412
   SizeY=1396
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9784
   ObjPosY=-9696
   ObjComment="Level Runtimes"
   DrawWidth=1412
   DrawHeight=1396
   Name="SequenceFrame_9"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=KFSpawnVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawnVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-5392
   ObjComment="Secret Chapel Spawning Volume Activated"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_95
   ObjValue=KFSpawnVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawnVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-5312
   ObjComment="Secret Chapel Spawning Volume Activated"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_95"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_101
   ObjValue=KFSpawnVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawnVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7560
   ObjPosY=-5232
   ObjComment="Secret Chapel Spawning Volume Activated"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_101"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-5523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_101',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_95',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_93',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-7282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7320
   ObjPosY=-5560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_11
   SizeX=612
   SizeY=500
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7584
   ObjPosY=-5600
   ObjComment="Secret Chapel Spawning Volumes"
   DrawWidth=612
   DrawHeight=500
   Name="SequenceFrame_11"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_24
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_35')),DrawY=-5147,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_36')),DrawY=-5126,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5105,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-4166,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4248
   ObjPosY=-5216
   ObjName="TriggerVolume_7 Touch"
   ObjComment="Garden Area"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_24"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_108
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3232
   ObjPosY=-4928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_108"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_35
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5188,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5168,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5178,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-4017,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-5224
   ObjComment="You have entered The Garden"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_35"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_36
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5032,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5042,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-4017,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4056
   ObjPosY=-5088
   ObjComment="You have left The Garden"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_36"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_32
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_6'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_22')),DrawY=-5139,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_21')),DrawY=-5118,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5097,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-3718,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3800
   ObjPosY=-5208
   ObjName="TriggerVolume_6 Touch"
   ObjComment="Basement Area - Cellar"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_32"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_33
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_29'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_17')),DrawY=-5139,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_18')),DrawY=-5118,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5097,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-3386,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3472
   ObjPosY=-5208
   ObjName="TriggerVolume_29 Touch"
   ObjComment="Basement Area - Hall"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_33"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_34
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_28'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_19')),DrawY=-5139,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_20')),DrawY=-5118,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5097,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-3074,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3160
   ObjPosY=-5208
   ObjName="TriggerVolume_28 Touch"
   ObjComment="Basement Area - Hellfire Pit"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_34"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_35
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_25'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_12')),DrawY=-5139,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_9')),DrawY=-5118,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5097,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_108'),DrawX=-2794,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2880
   ObjPosY=-5208
   ObjName="TriggerVolume_25 Touch"
   ObjComment="Basement Area - Cages"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_35"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_12
   SizeX=1260
   SizeY=261
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3816
   ObjPosY=-5240
   ObjComment="Area Names: Basement"
   DrawWidth=1260
   DrawHeight=261
   Name="SequenceFrame_12"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_36
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_27'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_23')),DrawY=-6027,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_24')),DrawY=-6006,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5985,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-3810,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-6096
   ObjName="TriggerVolume_27 Touch"
   ObjComment="Main Floor Area: The Church"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_36"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_21
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5032,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5042,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3545,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3584
   ObjPosY=-5088
   ObjComment="You have left The Basement Cellar"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_21"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_22
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5188,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5168,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5178,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3545,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3584
   ObjPosY=-5224
   ObjComment="You have entered The Basement Cellar"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_22"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_18
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5032,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5042,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3225,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-5088
   ObjComment="You have left The Basement Hall"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_18"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_17
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5188,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5168,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5178,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3225,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3264
   ObjPosY=-5224
   ObjComment="You have entered The Basement Hall"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_17"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_20
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5032,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5042,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2913,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2952
   ObjPosY=-5088
   ObjComment="You have left The Hellfire Pit"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_20"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_19
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5188,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5168,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5178,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2913,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2952
   ObjPosY=-5224
   ObjComment="You have entered The Hellfire Pit"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_19"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_9
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5052,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5032,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5042,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2641,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2680
   ObjPosY=-5088
   ObjComment="You have left The Basement Cages"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_9"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_12
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5188,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5168,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5178,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2641,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2680
   ObjPosY=-5224
   ObjComment="You have entered The Basement Cages"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_12"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_23
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-6076,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6056,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6066,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3649,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=-6112
   ObjComment="You have entered The Church"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_23"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_24
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5940,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5920,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5930,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3649,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3688
   ObjPosY=-5976
   ObjComment="You have left The Church"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_24"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_37
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_26'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_26')),DrawY=-6027,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_25')),DrawY=-6006,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5985,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-3442,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3528
   ObjPosY=-6096
   ObjName="TriggerVolume_26 Touch"
   ObjComment="Main Floor Area: Tentacle Room"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_37"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_25
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5924,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5904,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5914,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3289,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3328
   ObjPosY=-5960
   ObjComment="You have left The Tentacle Room"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_25"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_26
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-6060,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6040,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6050,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3289,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3328
   ObjPosY=-6096
   ObjComment="You have entered The Tentacle Room"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_26"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_38
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_31'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_28')),DrawY=-6035,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_27')),DrawY=-6014,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5993,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_58'),DrawX=-3106,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3192
   ObjPosY=-6104
   ObjName="TriggerVolume_31 Touch"
   ObjComment="Main Floor Area: The Lounge"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_38"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_39
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_34'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_30')),DrawY=-5675,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_29')),DrawY=-5654,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5633,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=-4018,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4104
   ObjPosY=-5744
   ObjName="TriggerVolume_34 Touch"
   ObjComment="Main Floor Area: The Idol Hall"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_39"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_40
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_30'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_32')),DrawY=-5667,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_31')),DrawY=-5646,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5625,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=-3610,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3696
   ObjPosY=-5736
   ObjName="TriggerVolume_30 Touch"
   ObjComment="Main Floor Area: Priest Hall"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_40"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_41
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_32'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_33')),DrawY=-5675,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_34')),DrawY=-5654,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5633,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=-3226,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-5744
   ObjName="TriggerVolume_32 Touch"
   ObjComment="Main Floor Area: Main Staircase"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_41"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_28
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-6076,OverrideDelta=13)
   InputLinks(1)=(DrawY=-6056,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-6066,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2969,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3008
   ObjPosY=-6112
   ObjComment="You have entered The Lounge"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_28"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_27
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5940,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5920,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5930,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2969,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3008
   ObjPosY=-5976
   ObjComment="You have left The Lounge"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_27"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_30
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5708,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5688,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5698,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3849,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-5744
   ObjComment="You have entered The Idol Hall"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_30"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_29
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5572,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5552,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5562,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3849,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3888
   ObjPosY=-5608
   ObjComment="You have entered The Idol Hall"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_29"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_32
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5700,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5680,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5690,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3441,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3480
   ObjPosY=-5736
   ObjComment="You have entered The Priest Hall"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_32"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_31
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5564,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5544,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5554,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3441,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3480
   ObjPosY=-5600
   ObjComment="You have entered The Priest Hall"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_31"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_33
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5716,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5696,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5706,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3089,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3128
   ObjPosY=-5752
   ObjComment="You have entered The Main Staircase"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_33"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_34
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5580,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5560,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5570,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-3089,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3128
   ObjPosY=-5616
   ObjComment="You have entered The Main Staircase"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_34"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_42
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_33'
   MaxTriggerCount=0
   ReTriggerDelay=1.000000
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_15')),DrawY=-5675,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_16')),DrawY=-5654,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-5633,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_110'),DrawX=-2858,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2944
   ObjPosY=-5744
   ObjName="TriggerVolume_33 Touch"
   ObjComment="Main Floor Area: The Terrace"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_42"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_16
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5572,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5552,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5562,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2697,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2736
   ObjPosY=-5608
   ObjComment="You have entered The Terrace"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_16"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqAct_DrawText Name=SeqAct_DrawText_15
   DrawTextInfo=(MessageFont=Font'UI_Canvas_Fonts.Font_General',MessageFontScale=(X=2.000000,Y=2.500000),MessageOffset=(X=-75.000000,Y=-100.000000),MessageColor=(B=68,G=78,R=255,A=255))
   InputLinks(0)=(DrawY=-5708,OverrideDelta=13)
   InputLinks(1)=(DrawY=-5688,OverrideDelta=33)
   OutputLinks(0)=(DrawY=-5698,OverrideDelta=23)
   VariableLinks(0)=(DrawX=-2697,OverrideDelta=17)
   VariableLinks(1)=()
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2736
   ObjPosY=-5744
   ObjComment="You have entered The Terrace"
   DrawWidth=78
   DrawHeight=85
   Name="SeqAct_DrawText_15"
   ObjectArchetype=SeqAct_DrawText'Engine.Default__SeqAct_DrawText'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_110
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3472
   ObjPosY=-5464
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_110"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_58
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3472
   ObjPosY=-5856
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_58"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_13
   SizeX=362
   SizeY=281
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4301
   ObjPosY=-5256
   ObjComment="Area Names: The Garden"
   DrawWidth=362
   DrawHeight=281
   Name="SequenceFrame_13"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_14
   SizeX=1522
   SizeY=772
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4128
   ObjPosY=-6136
   ObjComment="Area Names: Main Floor"
   DrawWidth=1522
   DrawHeight=772
   Name="SequenceFrame_14"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_15
   SizeX=2256
   SizeY=1594
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4488
   ObjPosY=-6328
   ObjComment="Area Names"
   DrawWidth=2256
   DrawHeight=1594
   Name="SequenceFrame_15"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_0
   MaxWidth=216
   OutputLinks(0)=(DrawY=-3674,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-3651,OverrideDelta=38)
   OutputLinks(2)=(DrawY=-3628,OverrideDelta=61)
   OutputLinks(3)=(DrawY=-3605,OverrideDelta=84)
   OutputLinks(4)=(DrawY=-3582,OverrideDelta=107)
   OutputLinks(5)=(DrawY=-3559,OverrideDelta=130)
   OutputLinks(6)=(DrawY=-3536,OverrideDelta=153)
   OutputLinks(7)=(DrawY=-3513,OverrideDelta=176)
   OutputLinks(8)=(DrawY=-3490,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=104
   ObjPosY=-3744
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_0"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_6
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32',InputLinkIdx=1)),DrawY=-3547,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3526,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_32',InputLinkIdx=1)),DrawY=-3505,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=408
   ObjPosY=-3616
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_6"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31',InputLinkIdx=1)),DrawY=-3308,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31',InputLinkIdx=1)),DrawY=-3288,OverrideDelta=33)
   VariableLinks(0)=(DrawX=123,OverrideDelta=16)
   VariableLinks(1)=(DrawX=184,OverrideDelta=86)
   VariableLinks(2)=(DrawX=265,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=-3376
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_0"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=KFSeqEvent_WaveProgress Name=KFSeqEvent_WaveProgress_0
   MaxWidth=151
   OutputLinks(0)=(DrawY=-3099,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-3078,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-3057,OverrideDelta=56)
   VariableLinks(0)=(DrawX=211,OverrideDelta=43)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=136
   ObjPosY=-3168
   DrawWidth=146
   DrawHeight=176
   Name="KFSeqEvent_WaveProgress_0"
   ObjectArchetype=KFSeqEvent_WaveProgress'KFGame.Default__KFSeqEvent_WaveProgress'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_0
   MaxWidth=248
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=-2884,OverrideDelta=13)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_31')),DrawY=-2864,OverrideDelta=33)
   VariableLinks(0)=(DrawX=123,OverrideDelta=16)
   VariableLinks(1)=(DrawX=184,OverrideDelta=86)
   VariableLinks(2)=(DrawX=265,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=80
   ObjPosY=-2952
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_0"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_31
   InputLinks(0)=(DrawY=-3219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3177,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3198,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_140',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_141'),DrawX=646,OverrideDelta=16)
   VariableLinks(1)=(DrawX=697,OverrideDelta=76)
   EventLinks(0)=(DrawX=746,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=608
   ObjPosY=-3256
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_31"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_140
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=616
   ObjPosY=-3048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_140"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_141
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=720
   ObjPosY=-3048
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_141"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_21
   SizeX=860
   SizeY=1020
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=48
   ObjPosY=-3768
   ObjComment="HellfirePit Blocking for Trader Time"
   DrawWidth=860
   DrawHeight=1020
   Name="SequenceFrame_21"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_36
   Duration=1.400000
   InputLinks(0)=(DrawY=-4227,OverrideDelta=14)
   InputLinks(1)=(DrawY=-4206,OverrideDelta=35)
   InputLinks(2)=(DrawY=-4185,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_DrawText'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_DrawText_2')),DrawY=-4222,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-4190,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9372,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9424
   ObjPosY=-4264
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_36"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=PointLight'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLight_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8984
   ObjPosY=-6424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_3
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Splines.PM_SplineMat_Locked_B'
   ParamName="Intensity"
   InputLinks(0)=(DrawY=-7214,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7214,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_3'),DrawX=-8613,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-7248
   ObjComment="Changed Visibility of Locked Area (Dinning Hall) Effect to 0"
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_3"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8640
   ObjPosY=-7112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_3"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_7
   MaxTriggerCount=2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41')),DrawY=-7267,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_2'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_0')),DrawY=-7246,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_2'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_0'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_41')),DrawY=-7225,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7360
   ObjPosY=-7336
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_7"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_2
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Splines.PM_SplineMat_Locked_B'
   ParamName="Intensity"
   InputLinks(0)=(DrawY=-7318,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7318,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_2'),DrawX=-7029,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7088
   ObjPosY=-7352
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_2"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_2
   FloatValue=1.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6904
   ObjPosY=-7296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_2"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_0
   FloatValue=1.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6912
   ObjPosY=-7152
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_0"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_0
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Splines.PM_SplineMat_Locked_A'
   ParamName="Intensity"
   InputLinks(0)=(DrawY=-7182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7182,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_0'),DrawX=-7021,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7080
   ObjPosY=-7216
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_0"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7872
   ObjPosY=-5424
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_1"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_1
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Splines.PM_SplineMat_Locked_A'
   ParamName="Intensity"
   InputLinks(0)=(DrawY=-5526,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5526,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_1'),DrawX=-7845,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7904
   ObjPosY=-5560
   ObjComment="Changed Visibility of Locked Area (Secret Chapel) Effect to 0"
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_1"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_19
   SizeX=649
   SizeY=597
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7416
   ObjPosY=-7368
   ObjComment="Locked Secret Area Material Visibility"
   DrawWidth=649
   DrawHeight=597
   Name="SequenceFrame_19"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_0
   VarName="bDinningHallDoorsOpened"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2280
   ObjPosY=-9600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_0"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SeqVar_Bool Name=SeqVar_Bool_1
   VarName="bChurchDoorsOpened"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2104
   ObjPosY=-9600
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Bool_1"
   ObjectArchetype=SeqVar_Bool'Engine.Default__SeqVar_Bool'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_20
   SizeX=391
   SizeY=205
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2352
   ObjPosY=-9648
   ObjComment="Seasonal Variables"
   DrawWidth=391
   DrawHeight=205
   Name="SequenceFrame_20"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_0
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bDinningHallDoorsOpened"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7832
   ObjPosY=-7520
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_0"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_0
   DefaultValue=True
   InputLinks(0)=(DrawY=-7582,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_0')),DrawY=-7582,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7862,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_0'),DrawX=-7806,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7896
   ObjPosY=-7616
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_0"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_0
   InputLinks(0)=(DrawY=-7578,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ProgressSeasonalObjective'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ProgressSeasonalObjective_2')),DrawY=-7588,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-7568,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_1'),DrawX=-7651,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7601,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7680
   ObjPosY=-7624
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_0"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_1
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bChurchDoorsOpened"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7680
   ObjPosY=-7496
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_1"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=KFSeqAct_ProgressSeasonalObjective Name=KFSeqAct_ProgressSeasonalObjective_2
   ObjectiveIndex=3
   EventIndex=3
   InputLinks(0)=(DrawY=-7582,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7582,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7421,OverrideDelta=77)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7520
   ObjPosY=-7616
   DrawWidth=198
   DrawHeight=61
   Name="KFSeqAct_ProgressSeasonalObjective_2"
   ObjectArchetype=KFSeqAct_ProgressSeasonalObjective'kfgamecontent.Default__KFSeqAct_ProgressSeasonalObjective'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_27
   SizeX=634
   SizeY=259
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7912
   ObjPosY=-7672
   ObjComment="Check for Purple Miasma Seasonal Objective"
   DrawWidth=634
   DrawHeight=259
   Name="SequenceFrame_27"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_SetBool Name=SeqAct_SetBool_1
   DefaultValue=True
   InputLinks(0)=(DrawY=-4998,OverrideDelta=11)
   OutputLinks(0)=(Links=((LinkedOp=SeqCond_CompareBool'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqCond_CompareBool_1')),DrawY=-4998,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7470,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_2'),DrawX=-7414,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-5032
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetBool_1"
   ObjectArchetype=SeqAct_SetBool'Engine.Default__SeqAct_SetBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bChurchDoorsOpened"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7504
   ObjPosY=-4936
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=SeqCond_CompareBool Name=SeqCond_CompareBool_1
   InputLinks(0)=(DrawY=-5002,OverrideDelta=23)
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ProgressSeasonalObjective'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ProgressSeasonalObjective_0')),DrawY=-5012,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-4992,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Named'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Named_3'),DrawX=-7259,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7209,OverrideDelta=59)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7288
   ObjPosY=-5048
   DrawWidth=115
   DrawHeight=85
   Name="SeqCond_CompareBool_1"
   ObjectArchetype=SeqCond_CompareBool'Engine.Default__SeqCond_CompareBool'
End Object

Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Bool'
   FindVarName="bDinningHallDoorsOpened"
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7288
   ObjPosY=-4936
   ObjColor=(B=0,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object

Begin Object Class=KFSeqAct_ProgressSeasonalObjective Name=KFSeqAct_ProgressSeasonalObjective_0
   ObjectiveIndex=3
   EventIndex=3
   InputLinks(0)=(DrawY=-5006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5006,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-6997,OverrideDelta=77)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-5040
   DrawWidth=198
   DrawHeight=61
   Name="KFSeqAct_ProgressSeasonalObjective_0"
   ObjectArchetype=KFSeqAct_ProgressSeasonalObjective'kfgamecontent.Default__KFSeqAct_ProgressSeasonalObjective'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_23
   SizeX=661
   SizeY=218
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7528
   ObjPosY=-5056
   ObjComment="Check for Purple Miasma seasonal objective"
   DrawWidth=661
   DrawHeight=218
   Name="SequenceFrame_23"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFSpawnVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawnVolume_426'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-5416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFSpawnVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawnVolume_420'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-5256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_93
   ObjValue=KFSpawnVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.KFSpawnVolume_126'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7096
   ObjPosY=-5336
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_93"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_5
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1)),DrawY=-5523,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1)),DrawY=-5502,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6',InputLinkIdx=1)),DrawY=-5481,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7544
   ObjPosY=-5592
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_5"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_4
   FloatValue=6.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8016
   ObjPosY=-7088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_4"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqVar_Float Name=SeqVar_Float_5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8088
   ObjPosY=-7088
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Float_5"
   ObjectArchetype=SeqVar_Float'Engine.Default__SeqVar_Float'
End Object

Begin Object Class=SeqCond_IncrementFloat Name=SeqCond_IncrementFloat_0
   InputLinks(0)=(DrawY=-7198,OverrideDelta=59)
   OutputLinks(0)=(DrawY=-7242,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-7220,OverrideDelta=37)
   OutputLinks(2)=(DrawY=-7198,OverrideDelta=59)
   OutputLinks(3)=(DrawY=-7176,OverrideDelta=81)
   OutputLinks(4)=(DrawY=-7154,OverrideDelta=103)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Float'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_5'),DrawX=-8035,OverrideDelta=33)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Float'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Float_4'),DrawX=-8010,OverrideDelta=58)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=-7280
   DrawWidth=100
   DrawHeight=157
   Name="SeqCond_IncrementFloat_0"
   ObjectArchetype=SeqCond_IncrementFloat'Engine.Default__SeqCond_IncrementFloat'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_98
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=728
   ObjPosY=-3568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_98"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_32
   InputLinks(0)=(DrawY=-3707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3665,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3686,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_98'),DrawX=702,OverrideDelta=16)
   VariableLinks(1)=(DrawX=753,OverrideDelta=76)
   EventLinks(0)=(DrawX=802,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=664
   ObjPosY=-3744
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_32"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_2
   MaxWidth=248
   OutputLinks(0)=(DrawY=-3668,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-3648,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_1'),DrawX=-4837,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4776,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-4695,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4880
   ObjPosY=-3736
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_2"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_25
   SizeX=3507
   SizeY=3406
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6016
   ObjPosY=-3904
   ObjComment="Magic Circle"
   DrawWidth=3507
   DrawHeight=3406
   Name="SequenceFrame_25"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_1
   InputLinks(0)=(DrawY=-3646,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3646,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_96'),DrawX=-3267,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-3680
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_1"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_1
   IntValue=1
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4864
   ObjPosY=-3528
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_1"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_2
   IntValue=2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4856
   ObjPosY=-3224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_2"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_2
   InputLinks(0)=(DrawY=-3350,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3350,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_112'),DrawX=-3267,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-3384
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_2"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_3
   MaxWidth=248
   OutputLinks(0)=(DrawY=-3364,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-3344,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_2'),DrawX=-4829,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4768,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-4687,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4872
   ObjPosY=-3432
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_3"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_3
   IntValue=3
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4848
   ObjPosY=-2896
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_3"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_3
   InputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_102',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_103',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_104'),DrawX=-3267,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-3056
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_3"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_4
   MaxWidth=248
   OutputLinks(0)=(DrawY=-3036,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-3016,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_3'),DrawX=-4821,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4760,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-4679,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4864
   ObjPosY=-3104
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_4"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_4
   IntValue=4
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4624
   ObjPosY=-2592
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_4"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_4
   InputLinks(0)=(DrawY=-2718,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2718,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_100',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_105',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_106',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_111'),DrawX=-3243,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-2752
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_4"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_5
   MaxWidth=248
   OutputLinks(0)=(DrawY=-2724,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-2704,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_4'),DrawX=-4605,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4544,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-4463,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4648
   ObjPosY=-2792
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_5"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Int Name=SeqVar_Int_0
   IntValue=5
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4840
   ObjPosY=-2280
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Int_0"
   ObjectArchetype=SeqVar_Int'Engine.Default__SeqVar_Int'
End Object

Begin Object Class=SeqAct_SetMaterial Name=SeqAct_SetMaterial_0
   InputLinks(0)=(DrawY=-2390,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2390,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_94'),DrawX=-3235,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3280
   ObjPosY=-2424
   DrawWidth=90
   DrawHeight=61
   Name="SeqAct_SetMaterial_0"
   ObjectArchetype=SeqAct_SetMaterial'Engine.Default__SeqAct_SetMaterial'
End Object

Begin Object Class=KFSeqEvent_WaveEnd Name=KFSeqEvent_WaveEnd_1
   MaxWidth=248
   OutputLinks(0)=(DrawY=-2420,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-2400,OverrideDelta=33)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Int'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Int_0'),DrawX=-4813,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4752,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-4671,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4856
   ObjPosY=-2488
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveEnd_1"
   ObjectArchetype=KFSeqEvent_WaveEnd'KFGame.Default__KFSeqEvent_WaveEnd'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_94
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-2288
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_94"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_96
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3304
   ObjPosY=-3552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_96"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_100
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_100"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_102
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-2944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_102"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_103
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3216
   ObjPosY=-2944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_103"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_104
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3112
   ObjPosY=-2944
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_104"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_105
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3192
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_105"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_106
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3096
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_106"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_111
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3000
   ObjPosY=-2632
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_111"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_112
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3288
   ObjPosY=-3256
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_112"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_5
   InputLinks(0)=(DrawY=-2010,OverrideDelta=15)
   InputLinks(1)=(DrawY=-1988,OverrideDelta=37)
   InputLinks(2)=(DrawY=-1966,OverrideDelta=59)
   InputLinks(3)=(DrawY=-1944,OverrideDelta=81)
   InputLinks(4)=(DrawY=-1922,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_1'),(LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5',InputLinkIdx=3)),DrawY=-1994,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-1938,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5'),DrawX=-4497,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_113'),LinkDesc="Magic_Circle_Letters",MinVars=0,DrawX=-4420,OverrideDelta=63)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_118'),LinkDesc="Magic_Circle_2ndStage",MinVars=0,DrawX=-4305,OverrideDelta=170)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_115'),LinkDesc="Magic_Circle_3rdStage",MinVars=0,DrawX=-4183,OverrideDelta=293)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_116'),LinkDesc="Magic_Circle_4thStage",MinVars=0,DrawX=-4063,OverrideDelta=413)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_119'),LinkDesc="Magic_Circle_5thStage",MinVars=0,DrawX=-3942,OverrideDelta=534)
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_120'),LinkDesc="Magic_Circle_6thStage",MinVars=0,DrawX=-3821,OverrideDelta=655)
   VariableLinks(7)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_122'),LinkDesc="Magic_Circle_7thStage",MinVars=0,DrawX=-3700,OverrideDelta=776)
   VariableLinks(8)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_124'),LinkDesc="Magic_Circle_8thStage",MinVars=0,DrawX=-3579,OverrideDelta=897)
   VariableLinks(9)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_125'),LinkDesc="Magic_Circle_9thStage",MinVars=0,DrawX=-3458,OverrideDelta=1018)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4528
   ObjPosY=-2048
   DrawWidth=1139
   DrawHeight=173
   Name="SeqAct_Interp_5"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_5
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Tabs(0)=(ViewStartInput=-0.889188,ViewEndInput=8.258521,ViewStartOutput=-2.680021,ViewEndOutput=0.979063)
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(OutVal=(X=-0.000732,Y=0.000000,Z=0.000732),ArriveTangent=(X=-0.000159,Y=0.000000,Z=0.000000),LeaveTangent=(X=-0.000159,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000977,Y=0.000031,Z=-79.999023),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0.InterpTrackMove_0'
      GroupName="Magic_Circle_Letters"
      GroupColor=(B=213,G=105,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-160.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_1.InterpTrackMove_1'
      GroupName="Magic_Circle_2ndStage"
      GroupColor=(B=149,G=188,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_2
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_2
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-160.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_2"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_2.InterpTrackMove_2'
      GroupName="Magic_Circle_3rdStage"
      GroupColor=(B=226,G=0,R=69,A=255)
      bCollapsed=True
      Name="InterpGroup_2"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_3
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-160.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3.InterpTrackMove_3'
      GroupName="Magic_Circle_4thStage"
      GroupColor=(B=70,G=0,R=225,A=255)
      bCollapsed=True
      Name="InterpGroup_3"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_5
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_5
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-240.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_5"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_5.InterpTrackMove_5'
      GroupName="Magic_Circle_5thStage"
      GroupColor=(B=0,G=207,R=118,A=255)
      bCollapsed=True
      Name="InterpGroup_5"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_6
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_6
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-240.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_6"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_6.InterpTrackMove_6'
      GroupName="Magic_Circle_6thStage"
      GroupColor=(B=153,G=184,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_6"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_7
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_7
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-240.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_7"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_7.InterpTrackMove_7'
      GroupName="Magic_Circle_7thStage"
      GroupColor=(B=115,G=209,R=0,A=255)
      bCollapsed=True
      Name="InterpGroup_7"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_8
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_8
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-240.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_8"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_8.InterpTrackMove_8'
      GroupName="Magic_Circle_8thStage"
      GroupColor=(B=0,G=159,R=179,A=255)
      bCollapsed=True
      Name="InterpGroup_8"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_9
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_9
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=-0.000244,Y=0.000031,Z=-320.000000),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=5.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_9"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_9.InterpTrackMove_9'
      GroupName="Magic_Circle_9thStage"
      GroupColor=(B=0,G=176,R=163,A=255)
      Name="InterpGroup_9"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_0'
   InterpGroups(1)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_1'
   InterpGroups(2)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_2'
   InterpGroups(3)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_3'
   InterpGroups(4)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_5'
   InterpGroups(5)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_6'
   InterpGroups(6)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_7'
   InterpGroups(7)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_8'
   InterpGroups(8)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpGroup_9'
   CurveEdSetup=InterpCurveEdSetup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_5.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=5.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4528
   ObjPosY=-1848
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_5"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_113
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4448
   ObjPosY=-1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_113"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_115
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4208
   ObjPosY=-1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_115"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_116
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4088
   ObjPosY=-1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_116"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_118
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4336
   ObjPosY=-1824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_118"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_119
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3928
   ObjPosY=-1840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_119"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_120
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_18'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3824
   ObjPosY=-1840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_120"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_122
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_19'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3728
   ObjPosY=-1840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_122"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_124
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3624
   ObjPosY=-1840
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_124"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_125
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3464
   ObjPosY=-1816
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_125"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_34
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_01_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-3670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3670,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4461,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4520
   ObjPosY=-3704
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_34"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_35
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_02_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-3366,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3366,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4453,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4512
   ObjPosY=-3400
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_35"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_36
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_03_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-3126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3126,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4437,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-3160
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_36"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_37
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_06_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-2766,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4221,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-2800
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_37"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_38
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_10_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-2358,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2358,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4437,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-2392
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_38"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_39
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_04_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-3014,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4437,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-3048
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_39"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_40
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_05_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4437,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4496
   ObjPosY=-2936
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_40"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_41
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_07_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-2662,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2662,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4221,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-2696
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_41"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_42
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_08_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-2558,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2558,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4221,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-2592
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_42"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_43
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_09_INST_INST'
   ParamName="MagicCircle_Alpha"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-2454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4221,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4280
   ObjPosY=-2488
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_43"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=KFSeqEvent_WaveStart Name=KFSeqEvent_WaveStart_1
   MaxWidth=248
   OutputLinks(0)=(DrawY=-1876,OverrideDelta=13)
   OutputLinks(1)=(DrawY=-1856,OverrideDelta=33)
   VariableLinks(0)=(DrawX=-5061,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5000,OverrideDelta=86)
   VariableLinks(2)=(DrawX=-4919,OverrideDelta=139)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5104
   ObjPosY=-1944
   DrawWidth=175
   DrawHeight=168
   Name="KFSeqEvent_WaveStart_1"
   ObjectArchetype=KFSeqEvent_WaveStart'KFGame.Default__KFSeqEvent_WaveStart'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_44
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_09_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-832
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_44"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_45
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_08_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-936
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_45"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_46
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_07_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-1006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1006,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-1040
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_46"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_47
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_05_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-1230,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1230,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-1264
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_47"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_48
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_04_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-1342,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1342,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-1376
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_48"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_49
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_10_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-686,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-720
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_49"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_50
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_06_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-1110,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1110,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-1144
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_50"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_51
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_03_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-1454,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-1488
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_51"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_52
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_02_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-1582,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1582,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-1616
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_52"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_53
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_01_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=20.000000
   InputLinks(0)=(DrawY=-1702,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1702,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-4661,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4720
   ObjPosY=-1736
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_53"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_54
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_01_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-1670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1670,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-1704
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_54"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_55
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_02_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-1550,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1550,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-1584
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_55"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_56
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_03_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-1422,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1422,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-1456
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_56"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_57
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_06_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-1078,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1078,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-1112
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_57"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_58
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_10_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-654,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-654,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-688
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_58"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_59
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_04_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-1310,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1310,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-1344
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_59"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_60
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_05_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-1198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-1232
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_60"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_61
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_07_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-974,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-974,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-1008
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_61"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_62
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_08_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-870,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-870,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-904
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_62"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_63
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_09_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   ScalarValue=1.000000
   InputLinks(0)=(DrawY=-766,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-766,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3109,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3168
   ObjPosY=-800
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_63"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_40
   Duration=0.000000
   InputLinks(0)=(DrawY=-1171,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1150,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1129,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_53'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_48'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_51'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_52'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_47'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_50'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_46'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_45'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_44'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_49')),DrawY=-1166,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1134,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4932,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4984
   ObjPosY=-1208
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_40"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_1
   Duration=0.500000
   InputLinks(0)=(DrawY=-1163,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1142,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1121,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_54'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_55'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_56'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_59'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_60'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_57'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_61'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_62'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_63'),(LinkedOp=SeqAct_SetMatInstScalarParam'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_SetMatInstScalarParam_58'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_36'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_34',InputLinkIdx=1)),DrawY=-1158,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1126,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-3372,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3424
   ObjPosY=-1200
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_1"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_38
   Duration=15.000000
   InputLinks(0)=(DrawY=-1907,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1886,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1865,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_5')),DrawY=-1902,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1870,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-4652,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4704
   ObjPosY=-1944
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_38"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_8
   MaxTriggerCount=0
   MaxWidth=136
   OutputLinks(0)=(DrawY=-3003,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-2982,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-2961,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5920
   ObjPosY=-3072
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_8"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_23
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_09_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-2624
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_23"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_22
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_08_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-2694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-2728
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_22"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_21
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_07_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-2832
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_21"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_20
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_05_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-3056
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_20"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_19
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_04_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-3134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-3168
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_19"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_18
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_10_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-2478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-2512
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_18"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_17
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_06_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-2936
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_17"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_16
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_03_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-3246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-3280
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_16"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_15
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_02_INST_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-3366,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3366,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-3400
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_15"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_14
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_01_INST'
   ParamName="MagicCircle_Alpha"
   InputLinks(0)=(DrawY=-3478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5501,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5560
   ObjPosY=-3512
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_14"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_33
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_01_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-3478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-3512
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_33"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_32
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_02_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-3374,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-3408
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_32"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_31
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_03_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-3246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-3280
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_31"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_30
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_06_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-2936
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_30"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_29
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_10_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-2478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-2512
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_29"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_28
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_04_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-3134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-3168
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_28"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_27
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_05_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-3056
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_27"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_26
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_07_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-2832
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_26"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_25
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_08_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-2694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-2728
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_25"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_24
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_09_INST_INST'
   ParamName="Emissive_Intensity"
   ScalarValue=5.000000
   InputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5317,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5376
   ObjPosY=-2624
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_24"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_8
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_09_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2590,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-2624
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_8"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_13
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_08_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-2694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2694,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-2728
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_13"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_12
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_07_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2798,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-2832
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_12"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_7
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_05_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3022,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-3056
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_7"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_10
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_04_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-3134,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-3168
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_10"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_4
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_10_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-2478,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2478,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-2512
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_4"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_11
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_06_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-2902,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-2936
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_11"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_9
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_03_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-3246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3246,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-3280
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_9"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_6
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_02_INST_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-3374,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3374,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-3408
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_6"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_SetMatInstScalarParam Name=SeqAct_SetMatInstScalarParam_5
   MatInst=MaterialInstanceConstant'ENV_Netherhold_MAT.Env_MagicCircle_01_INST'
   ParamName="Emissive_Main_to_Sub"
   InputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-3494,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-5133,OverrideDelta=39)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-3528
   DrawWidth=119
   DrawHeight=77
   Name="SeqAct_SetMatInstScalarParam_5"
   ObjectArchetype=SeqAct_SetMatInstScalarParam'Engine.Default__SeqAct_SetMatInstScalarParam'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_39
   Duration=10.000000
   InputLinks(0)=(DrawY=-1203,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1182,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1161,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_40')),DrawY=-1198,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-1166,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-5188,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5240
   ObjPosY=-1240
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_39"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_129
   ObjValue=PointLightToggleable'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLightToggleable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5792
   ObjPosY=-2192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_129"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_130
   ObjValue=PointLightToggleable'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5696
   ObjPosY=-2192
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_130"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_35
   InputLinks(0)=(DrawY=-2355,OverrideDelta=14)
   InputLinks(1)=(DrawY=-2334,OverrideDelta=35)
   InputLinks(2)=(DrawY=-2313,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-2334,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_129',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_130'),DrawX=-5714,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5663,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5614,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5752
   ObjPosY=-2392
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_35"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_33
   InputLinks(0)=(DrawY=-3675,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3654,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3633,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3654,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_127'),DrawX=-4186,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4135,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4086,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4224
   ObjPosY=-3712
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_33"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_127
   ObjValue=PointLightToggleable'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4208
   ObjPosY=-3544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_127"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_36
   InputLinks(0)=(DrawY=-1939,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1918,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1897,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1918,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_126'),DrawX=-3186,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-3135,OverrideDelta=76)
   EventLinks(0)=(DrawX=-3086,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3224
   ObjPosY=-1976
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_36"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_128
   ObjValue=PointLightToggleable'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLightToggleable_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2936
   ObjPosY=-1832
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_128"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_126
   ObjValue=PointLightToggleable'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLightToggleable_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3184
   ObjPosY=-1824
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_126"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_34
   InputLinks(0)=(DrawY=-1939,OverrideDelta=14)
   InputLinks(1)=(DrawY=-1918,OverrideDelta=35)
   InputLinks(2)=(DrawY=-1897,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-1918,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_128'),DrawX=-2922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-2871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-2822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-2960
   ObjPosY=-1976
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_34"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_131
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-3304
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_131"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_38
   InputLinks(0)=(DrawY=-3419,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3398,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3377,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3398,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_131'),DrawX=-9434,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9383,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9334,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9472
   ObjPosY=-3456
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_38"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Destroyed Name=SeqEvent_Destroyed_9
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_226'
   bPlayerOnly=False
   MaxWidth=245
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38',InputLinkIdx=1)),DrawY=-3398,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9702,OverrideDelta=90)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-3464
   ObjName="KFDestructibleActor_226 Destroyed"
   DrawWidth=142
   DrawHeight=128
   Name="SeqEvent_Destroyed_9"
   ObjectArchetype=SeqEvent_Destroyed'Engine.Default__SeqEvent_Destroyed'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_2
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=-3714,OverrideDelta=15)
   OutputLinks(1)=(DrawY=-3691,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_38'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37')),DrawY=-3668,OverrideDelta=61)
   OutputLinks(3)=(DrawY=-3645,OverrideDelta=84)
   OutputLinks(4)=(DrawY=-3622,OverrideDelta=107)
   OutputLinks(5)=(DrawY=-3599,OverrideDelta=130)
   OutputLinks(6)=(DrawY=-3576,OverrideDelta=153)
   OutputLinks(7)=(DrawY=-3553,OverrideDelta=176)
   OutputLinks(8)=(DrawY=-3530,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-3784
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_2"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_132
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-3032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_132"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_37
   InputLinks(0)=(DrawY=-3147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-3126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-3105,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-3126,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_132'),DrawX=-9426,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9375,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9326,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9464
   ObjPosY=-3184
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_37"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Destroyed Name=SeqEvent_Destroyed_10
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_248'
   MaxWidth=245
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_37',InputLinkIdx=1)),DrawY=-3134,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9694,OverrideDelta=90)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9816
   ObjPosY=-3200
   ObjName="KFDestructibleActor_248 Destroyed"
   DrawWidth=142
   DrawHeight=128
   Name="SeqEvent_Destroyed_10"
   ObjectArchetype=SeqEvent_Destroyed'Engine.Default__SeqEvent_Destroyed'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_26
   SizeX=593
   SizeY=876
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9848
   ObjPosY=-3808
   ObjComment="Destroyed Trees Volumes"
   DrawWidth=593
   DrawHeight=876
   Name="SequenceFrame_26"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_22
   SizeX=707
   SizeY=367
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7256
   ObjPosY=-7896
   ObjComment="Secret closed"
   DrawWidth=707
   DrawHeight=367
   Name="SequenceFrame_22"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_97
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6984
   ObjPosY=-7624
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_97"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_4
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_3
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,OutVal=(X=-224.000244,Y=0.000000,Z=0.000061),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InterpMode=CIM_CurveAutoClamped),(InVal=0.200000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,,(Time=0.200000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_3"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1.InterpTrackMove_3'
      GroupName="Trap_Lid"
      GroupColor=(B=217,G=0,R=99,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpGroups(0)=InterpGroup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpGroup_1'
   CurveEdSetup=InterpCurveEdSetup'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_4.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7104
   ObjPosY=-7632
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_4"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_4
   InputLinks(0)=(DrawY=-7834,OverrideDelta=15)
   InputLinks(1)=(DrawY=-7812,OverrideDelta=37)
   InputLinks(2)=(DrawY=-7790,OverrideDelta=59)
   InputLinks(3)=(DrawY=-7768,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7746,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-7818,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-7762,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.InterpData_4'),DrawX=-7023,OverrideDelta=34)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_97'),LinkDesc="Trap_Lid",MinVars=0,DrawX=-6972,OverrideDelta=81)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7072
   ObjPosY=-7872
   DrawWidth=154
   DrawHeight=173
   Name="SeqAct_Interp_4"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_4
   Duration=10.000000
   InputLinks(0)=(DrawY=-7843,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7822,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7801,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_4'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_12',InputLinkIdx=1),(LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_22'),(LinkedOp=SeqAct_Destroy'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_1'),(LinkedOp=SeqAct_Delay'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_34')),DrawY=-7838,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7806,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-7188,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7240
   ObjPosY=-7880
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_4"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_137
   ObjValue=KFPickupFactory_ItemDefault'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPickupFactory_ItemDefault_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9024
   ObjPosY=-7136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_137"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_138
   ObjValue=KFPickupFactory_Ammo'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPickupFactory_Ammo_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8856
   ObjPosY=-7104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_138"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_139
   ObjValue=KFPickupFactory_Ammo'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPickupFactory_Ammo_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8792
   ObjPosY=-7136
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_139"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_142
   ObjValue=KFPickupFactory_ItemDefault'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPickupFactory_ItemDefault_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8952
   ObjPosY=-7096
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_142"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_40
   InputLinks(0)=(DrawY=-7219,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7198,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7177,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7198,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_137',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_138',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_142',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_139'),DrawX=-8922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8960
   ObjPosY=-7256
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_40"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_39
   InputLinks(0)=(DrawY=-5139,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5118,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5097,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-5118,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_135',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_136'),DrawX=-9002,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8951,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8902,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9040
   ObjPosY=-5176
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_39"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_136
   ObjValue=KFPickupFactory_Ammo'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPickupFactory_Ammo_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8960
   ObjPosY=-5016
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_136"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_135
   ObjValue=KFPickupFactory_ItemDefault'KF-NETHERHOLD.TheWorld:PersistentLevel.KFPickupFactory_ItemDefault_20'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9120
   ObjPosY=-5032
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_135"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_12
   InputLinks(0)=(DrawY=-7827,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7806,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7785,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-7806,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32'),DrawX=-6794,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6743,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6694,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6832
   ObjPosY=-7864
   ObjComment="Disable Hint Light when secret is closed"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_12"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=PointLight'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLight_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6832
   ObjPosY=-7712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_41
   InputLinks(0)=(DrawY=-6963,OverrideDelta=14)
   InputLinks(1)=(DrawY=-6942,OverrideDelta=35)
   InputLinks(2)=(DrawY=-6921,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-6942,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40'),DrawX=-7114,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7063,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7014,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7152
   ObjPosY=-7000
   ObjComment="Enable Hint Light on level load"
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_41"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=PointLight'KF-NETHERHOLD.TheWorld:PersistentLevel.PointLight_114'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7128
   ObjPosY=-6848
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Destroyed Name=SeqEvent_Destroyed_0
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_30'
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=1)),DrawY=-142,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9546,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9664
   ObjPosY=-208
   ObjName="KFDestructibleActor_30 Destroyed"
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Destroyed_0"
   ObjectArchetype=SeqEvent_Destroyed'Engine.Default__SeqEvent_Destroyed'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_21
   DamageThreshold=50.000000
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_30'
   MaxWidth=259
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20',InputLinkIdx=1)),DrawY=42,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9577,OverrideDelta=63)
   VariableLinks(1)=(DrawX=-9503,OverrideDelta=143)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9672
   ObjPosY=-24
   ObjName="KFDestructibleActor_30 Take Damage"
   DrawWidth=149
   DrawHeight=144
   Name="SeqEvent_TakeDamage_21"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_145
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9312
   ObjPosY=16
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_145"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-99,OverrideDelta=14)
   InputLinks(1)=(DrawY=-78,OverrideDelta=35)
   InputLinks(2)=(DrawY=-57,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-78,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_145'),DrawX=-9290,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9239,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9190,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9328
   ObjPosY=-136
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Destroyed Name=SeqEvent_Destroyed_14
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_29'
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51',InputLinkIdx=1)),DrawY=242,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9562,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=176
   ObjName="KFDestructibleActor_29 Destroyed"
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Destroyed_14"
   ObjectArchetype=SeqEvent_Destroyed'Engine.Default__SeqEvent_Destroyed'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_8
   DamageThreshold=50.000000
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_29'
   MaxWidth=259
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51',InputLinkIdx=1)),DrawY=418,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9601,OverrideDelta=63)
   VariableLinks(1)=(DrawX=-9527,OverrideDelta=143)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9696
   ObjPosY=352
   ObjName="KFDestructibleActor_29 Take Damage"
   DrawWidth=149
   DrawHeight=144
   Name="SeqEvent_TakeDamage_8"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_150
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9280
   ObjPosY=440
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_150"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_51
   InputLinks(0)=(DrawY=269,OverrideDelta=14)
   InputLinks(1)=(DrawY=290,OverrideDelta=35)
   InputLinks(2)=(DrawY=311,OverrideDelta=56)
   OutputLinks(0)=(DrawY=290,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_150'),DrawX=-9282,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9231,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9182,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9320
   ObjPosY=232
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_51"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_152
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9296
   ObjPosY=760
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_152"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_44
   InputLinks(0)=(DrawY=613,OverrideDelta=14)
   InputLinks(1)=(DrawY=634,OverrideDelta=35)
   InputLinks(2)=(DrawY=655,OverrideDelta=56)
   OutputLinks(0)=(DrawY=634,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_152'),DrawX=-9322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9360
   ObjPosY=576
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_44"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Destroyed Name=SeqEvent_Destroyed_15
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_31'
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44',InputLinkIdx=1)),DrawY=618,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9554,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9672
   ObjPosY=552
   ObjName="KFDestructibleActor_31 Destroyed"
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Destroyed_15"
   ObjectArchetype=SeqEvent_Destroyed'Engine.Default__SeqEvent_Destroyed'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_9
   DamageThreshold=50.000000
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_31'
   MaxWidth=259
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44',InputLinkIdx=1)),DrawY=778,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9585,OverrideDelta=63)
   VariableLinks(1)=(DrawX=-9511,OverrideDelta=143)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=712
   ObjName="KFDestructibleActor_31 Take Damage"
   DrawWidth=149
   DrawHeight=144
   Name="SeqEvent_TakeDamage_9"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_153
   ObjValue=DynamicBlockingVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.DynamicBlockingVolume_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9328
   ObjPosY=1112
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_153"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_50
   InputLinks(0)=(DrawY=973,OverrideDelta=14)
   InputLinks(1)=(DrawY=994,OverrideDelta=35)
   InputLinks(2)=(DrawY=1015,OverrideDelta=56)
   OutputLinks(0)=(DrawY=994,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_153'),DrawX=-9322,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9271,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9222,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9360
   ObjPosY=936
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_50"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Destroyed Name=SeqEvent_Destroyed_16
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_21'
   MaxWidth=237
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=1)),DrawY=986,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9562,OverrideDelta=86)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9680
   ObjPosY=920
   ObjName="KFDestructibleActor_21 Destroyed"
   DrawWidth=138
   DrawHeight=128
   Name="SeqEvent_Destroyed_16"
   ObjectArchetype=SeqEvent_Destroyed'Engine.Default__SeqEvent_Destroyed'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_10
   DamageThreshold=50.000000
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_21'
   MaxWidth=259
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50',InputLinkIdx=1)),DrawY=1138,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9593,OverrideDelta=63)
   VariableLinks(1)=(DrawX=-9519,OverrideDelta=143)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9688
   ObjPosY=1072
   ObjName="KFDestructibleActor_21 Take Damage"
   DrawWidth=149
   DrawHeight=144
   Name="SeqEvent_TakeDamage_10"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_30
   SizeX=609
   SizeY=1484
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9720
   ObjPosY=-232
   ObjComment="Church Sofas Blocking Volume"
   DrawWidth=609
   DrawHeight=1484
   Name="SequenceFrame_30"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=KFSeqEvent_LevelLoaded Name=KFSeqEvent_LevelLoaded_1
   MaxWidth=216
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50')),DrawY=286,OverrideDelta=15)
   OutputLinks(1)=(DrawY=309,OverrideDelta=38)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_51'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_44'),(LinkedOp=SeqAct_Toggle'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_50')),DrawY=332,OverrideDelta=61)
   OutputLinks(3)=(DrawY=355,OverrideDelta=84)
   OutputLinks(4)=(DrawY=378,OverrideDelta=107)
   OutputLinks(5)=(DrawY=401,OverrideDelta=130)
   OutputLinks(6)=(DrawY=424,OverrideDelta=153)
   OutputLinks(7)=(DrawY=447,OverrideDelta=176)
   OutputLinks(8)=(DrawY=470,OverrideDelta=199)
   ObjInstanceVersion=5
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9960
   ObjPosY=216
   DrawWidth=217
   Name="KFSeqEvent_LevelLoaded_1"
   ObjectArchetype=KFSeqEvent_LevelLoaded'KFGame.Default__KFSeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_1
   DamageThreshold=0.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_5'
   MaxTriggerCount=0
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_20')),DrawY=-6606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8547,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-8473,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8648
   ObjPosY=-6672
   ObjName="KFFracturedMeshActor_5 Take Damage"
   ObjComment="Heart Wall Damaged"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_1"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_2
   DamageThreshold=250.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_5'
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_8')),DrawY=-6390,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8547,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-8473,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8648
   ObjPosY=-6456
   ObjName="KFFracturedMeshActor_5 Take Damage"
   ObjComment="Heart Wall Destroyed"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_2"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_3
   DamageThreshold=0.000000
   Originator=KFFracturedMeshGlass'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshGlass_60'
   MaxTriggerCount=0
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_11')),DrawY=-6606,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8056,OverrideDelta=72)
   VariableLinks(1)=(DrawX=-7982,OverrideDelta=152)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-6672
   ObjName="KFFracturedMeshGlass_60 Take Damage"
   ObjComment="Study North Wood Wall Damaged"
   DrawWidth=158
   DrawHeight=144
   Name="SeqEvent_TakeDamage_3"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_4
   DamageThreshold=300.000000
   Originator=KFFracturedMeshGlass'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshGlass_60'
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_12')),DrawY=-6430,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8056,OverrideDelta=72)
   VariableLinks(1)=(DrawX=-7982,OverrideDelta=152)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-6496
   ObjName="KFFracturedMeshGlass_60 Take Damage"
   ObjComment="Study North Wood Wall Destroyed"
   DrawWidth=158
   DrawHeight=144
   Name="SeqEvent_TakeDamage_4"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_5
   DamageThreshold=0.000000
   Originator=KFFracturedMeshGlass'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshGlass_44'
   MaxTriggerCount=0
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_14')),DrawY=-6198,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8056,OverrideDelta=72)
   VariableLinks(1)=(DrawX=-7982,OverrideDelta=152)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-6264
   ObjName="KFFracturedMeshGlass_44 Take Damage"
   ObjComment="Study West Wood Wall Damaged"
   DrawWidth=158
   DrawHeight=144
   Name="SeqEvent_TakeDamage_5"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_6
   DamageThreshold=300.000000
   Originator=KFFracturedMeshGlass'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshGlass_44'
   MaxWidth=276
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_13')),DrawY=-6014,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8056,OverrideDelta=72)
   VariableLinks(1)=(DrawX=-7982,OverrideDelta=152)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8160
   ObjPosY=-6080
   ObjName="KFFracturedMeshGlass_44 Take Damage"
   ObjComment="Study West Wood Wall Destroyed"
   DrawWidth=158
   DrawHeight=144
   Name="SeqEvent_TakeDamage_6"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_11
   DamageThreshold=0.000000
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_51'
   MaxTriggerCount=0
   MaxWidth=259
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_10')),DrawY=-6174,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8561,OverrideDelta=63)
   VariableLinks(1)=(DrawX=-8487,OverrideDelta=143)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8656
   ObjPosY=-6240
   ObjName="KFDestructibleActor_51 Take Damage"
   ObjComment="Cages Lid Damaged"
   DrawWidth=149
   DrawHeight=144
   Name="SeqEvent_TakeDamage_11"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_12
   DamageThreshold=250.000000
   Originator=KFDestructibleActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFDestructibleActor_51'
   MaxWidth=259
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_9')),DrawY=-6006,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-8561,OverrideDelta=63)
   VariableLinks(1)=(DrawX=-8487,OverrideDelta=143)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8656
   ObjPosY=-6072
   ObjName="KFDestructibleActor_51 Take Damage"
   ObjComment="Cages Lid Destroyed"
   DrawWidth=149
   DrawHeight=144
   Name="SeqEvent_TakeDamage_12"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_13
   DamageThreshold=0.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_0'
   MaxTriggerCount=0
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_15')),DrawY=-6622,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7555,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-7481,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7656
   ObjPosY=-6688
   ObjName="KFFracturedMeshActor_0 Take Damage"
   ObjComment="Nameless Room Secret Passage North Wall Damaged"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_13"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_14
   DamageThreshold=150.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_0'
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_16')),DrawY=-6454,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7555,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-7481,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7656
   ObjPosY=-6520
   ObjName="KFFracturedMeshActor_0 Take Damage"
   ObjComment="Nameless Room Secret Passage North Wall Destroyed"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_14"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_15
   DamageThreshold=0.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_1'
   MaxTriggerCount=0
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_18')),DrawY=-6254,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7555,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-7481,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7656
   ObjPosY=-6320
   ObjName="KFFracturedMeshActor_1 Take Damage"
   ObjComment="Nameless Room Secret Passage South Wall Damaged"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_15"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_16
   DamageThreshold=150.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_1'
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_17')),DrawY=-6086,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7555,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-7481,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7656
   ObjPosY=-6152
   ObjName="KFFracturedMeshActor_1 Take Damage"
   ObjComment="Nameless Room Secret Passage South Wall Destroyed"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_16"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_17
   DamageThreshold=0.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_4'
   MaxTriggerCount=0
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_5')),DrawY=-6638,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7019,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-6945,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7120
   ObjPosY=-6704
   ObjName="KFFracturedMeshActor_4 Take Damage"
   ObjComment="Nameless Room North Wall Damaged"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_17"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_18
   DamageThreshold=150.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_4'
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_6')),DrawY=-6470,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7019,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-6945,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7120
   ObjPosY=-6536
   ObjName="KFFracturedMeshActor_4 Take Damage"
   ObjComment="Nameless Room North Wall Destroyed"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_18"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_19
   DamageThreshold=0.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_3'
   MaxTriggerCount=0
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_4')),DrawY=-6270,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7019,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-6945,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7120
   ObjPosY=-6336
   ObjName="KFFracturedMeshActor_3 Take Damage"
   ObjComment="Nameless Room South Wall Damaged"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_19"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqEvent_TakeDamage Name=SeqEvent_TakeDamage_20
   DamageThreshold=150.000000
   Originator=KFFracturedMeshActor'KF-NETHERHOLD.TheWorld:PersistentLevel.KFFracturedMeshActor_3'
   MaxWidth=270
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkPostEvent'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkPostEvent_0')),DrawY=-6094,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-7019,OverrideDelta=69)
   VariableLinks(1)=(DrawX=-6945,OverrideDelta=149)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7120
   ObjPosY=-6160
   ObjName="KFFracturedMeshActor_3 Take Damage"
   ObjComment="Nameless Room South Wall Destroyed"
   DrawWidth=155
   DrawHeight=144
   Name="SeqEvent_TakeDamage_20"
   ObjectArchetype=SeqEvent_TakeDamage'Engine.Default__SeqEvent_TakeDamage'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_3
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_Lever'
   InputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-8840,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8888
   ObjPosY=-5600
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_3"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_37'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8864
   ObjPosY=-5496
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_16
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_29'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8296
   ObjPosY=-6536
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_16"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_20
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Light'
   InputLinks(0)=(DrawY=-6606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-8272,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=-6640
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_20"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_8
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Hard'
   InputLinks(0)=(DrawY=-6382,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6382,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_16'),DrawX=-8272,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=-6416
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_8"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_9
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Hatch_Break'
   InputLinks(0)=(DrawY=-5998,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5998,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-8272,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=-6032
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_9"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_10
   bReplicateToClients=True
   InputLinks(0)=(DrawY=-6182,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6182,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-8272,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8320
   ObjPosY=-6216
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_10"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_14
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_WoodWall_Destroy'
   InputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6198,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),DrawX=-7816,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-6232
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_14"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_13
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_WoodWall_Destroy'
   InputLinks(0)=(DrawY=-6006,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6006,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_109'),DrawX=-7816,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-6040
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_13"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_12
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_WoodWall_Destroy'
   InputLinks(0)=(DrawY=-6430,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6430,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=-7816,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-6464
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_12"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_11
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_WoodWall_Destroy'
   InputLinks(0)=(DrawY=-6606,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6606,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_107'),DrawX=-7816,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7864
   ObjPosY=-6640
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_11"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_18
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Light'
   InputLinks(0)=(DrawY=-6246,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6246,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117'),DrawX=-7304,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7352
   ObjPosY=-6280
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_18"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_17
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Hard'
   InputLinks(0)=(DrawY=-6070,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6070,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_117'),DrawX=-7304,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7352
   ObjPosY=-6104
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_17"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_16
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Hard'
   InputLinks(0)=(DrawY=-6446,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6446,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),DrawX=-7304,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7352
   ObjPosY=-6480
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_16"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_15
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Light'
   InputLinks(0)=(DrawY=-6622,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6622,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_114'),DrawX=-7304,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7352
   ObjPosY=-6656
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_15"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_4
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Light'
   InputLinks(0)=(DrawY=-6270,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6270,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=-6760,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-6304
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_4"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_0
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Hard'
   InputLinks(0)=(DrawY=-6094,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6094,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_123'),DrawX=-6760,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-6128
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_0"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_6
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Hard'
   InputLinks(0)=(DrawY=-6470,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6470,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),DrawX=-6760,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-6504
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_6"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_5
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_StoneWall_Destroy_Light'
   InputLinks(0)=(DrawY=-6638,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-6638,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_121'),DrawX=-6760,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6808
   ObjPosY=-6672
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_5"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8296
   ObjPosY=-6104
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_107
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_32'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7840
   ObjPosY=-6544
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_107"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_109
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_31'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7848
   ObjPosY=-6128
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_109"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_114
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_33'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7280
   ObjPosY=-6552
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_114"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_117
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_35'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7328
   ObjPosY=-6168
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_117"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_121
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_34'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6784
   ObjPosY=-6568
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_121"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_123
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_36'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6792
   ObjPosY=-6200
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_123"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=2004
   SizeY=836
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8680
   ObjPosY=-6728
   ObjComment="Sound - Destructible Secrets"
   DrawWidth=2004
   DrawHeight=836
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_7
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Hatch_Teleport'
   InputLinks(0)=(DrawY=-7846,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7846,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-9016,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9064
   ObjPosY=-7880
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_7"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_24
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_OpenDoor_A'
   InputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134'),DrawX=-8152,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-5600
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_24"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_133
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_38'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8200
   ObjPosY=-5504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_133"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_134
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_28'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8024
   ObjPosY=-5504
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_134"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_25
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_OpenDoor_B'
   InputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5566,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133'),DrawX=-7992,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8040
   ObjPosY=-5600
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_25"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_21
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_OpenDoor_B'
   InputLinks(0)=(DrawY=-7782,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7782,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-8104,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8152
   ObjPosY=-7816
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_21"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_23
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_Secrets_OpenDoor_A'
   InputLinks(0)=(DrawY=-7782,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7782,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144'),DrawX=-8240,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8288
   ObjPosY=-7816
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_23"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_143
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_40'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8272
   ObjPosY=-7712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_143"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_144
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_39'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8136
   ObjPosY=-7712
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_144"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_AkPostEvent Name=SeqAct_AkPostEvent_22
   bReplicateToClients=True
   Event=AkEvent'WW_ENV_Netherhold.Play_Netherhold_MetalRoll'
   InputLinks(0)=(DrawY=-8126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-6992,OverrideDelta=26)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7040
   ObjPosY=-8160
   DrawWidth=96
   DrawHeight=61
   Name="SeqAct_AkPostEvent_22"
   ObjectArchetype=SeqAct_AkPostEvent'AkAudio.Default__SeqAct_AkPostEvent'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_57
   ObjValue=TargetPoint'KF-NETHERHOLD.TheWorld:PersistentLevel.TargetPoint_30'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7024
   ObjPosY=-8056
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_57"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_1
   InputLinks(0)=(DrawY=-7678,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7678,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33'),DrawX=-6658,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6696
   ObjPosY=-7712
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_1"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=InterpActor'KF-NETHERHOLD.TheWorld:PersistentLevel.InterpActor_24'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6648
   ObjPosY=-7616
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_8
   Originator=TriggerVolume'KF-NETHERHOLD.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=KFSeqAct_ProgressSeasonalObjective'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.KFSeqAct_ProgressSeasonalObjective_1')),DrawY=-7147,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-7126,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-7105,OverrideDelta=56)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-4138,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4224
   ObjPosY=-7216
   ObjName="TriggerVolume_19 Touch"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_8"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4048
   ObjPosY=-6936
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=KFSeqAct_ProgressSeasonalObjective Name=KFSeqAct_ProgressSeasonalObjective_1
   ObjectiveIndex=2
   EventIndex=3
   InputLinks(0)=(DrawY=-7118,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7118,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-3781,OverrideDelta=77)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3880
   ObjPosY=-7152
   DrawWidth=198
   DrawHeight=61
   Name="KFSeqAct_ProgressSeasonalObjective_1"
   ObjectArchetype=KFSeqAct_ProgressSeasonalObjective'kfgamecontent.Default__KFSeqAct_ProgressSeasonalObjective'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_16
   SizeX=665
   SizeY=442
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4248
   ObjPosY=-7240
   ObjComment="Heartbeat seasonal objective"
   DrawWidth=665
   DrawHeight=442
   Name="SequenceFrame_16"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_2
   InputLinks(0)=(DrawY=-7838,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-7838,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_144',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_143'),DrawX=-7898,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7936
   ObjPosY=-7872
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_2"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_31
   Duration=2.000000
   InputLinks(0)=(DrawY=-7931,OverrideDelta=14)
   InputLinks(1)=(DrawY=-7910,OverrideDelta=35)
   InputLinks(2)=(DrawY=-7889,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_2')),DrawY=-7926,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-7894,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8164,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8216
   ObjPosY=-7968
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_31"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_3
   InputLinks(0)=(DrawY=-8126,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-8126,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_57'),DrawX=-6810,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6848
   ObjPosY=-8160
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_3"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_4
   InputLinks(0)=(DrawY=-5670,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5670,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-8666,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8704
   ObjPosY=-5704
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_4"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqAct_Destroy Name=SeqAct_Destroy_0
   InputLinks(0)=(DrawY=-5694,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-5694,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_133',SeqVar_Object'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_134'),DrawX=-7978,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8016
   ObjPosY=-5728
   DrawWidth=76
   DrawHeight=61
   Name="SeqAct_Destroy_0"
   ObjectArchetype=SeqAct_Destroy'Engine.Default__SeqAct_Destroy'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_3
   Duration=2.000000
   InputLinks(0)=(DrawY=-5723,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5702,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5681,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_0')),DrawY=-5718,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5686,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8132,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8184
   ObjPosY=-5760
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_3"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_37
   Duration=2.000000
   InputLinks(0)=(DrawY=-5731,OverrideDelta=14)
   InputLinks(1)=(DrawY=-5710,OverrideDelta=35)
   InputLinks(2)=(DrawY=-5689,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_4')),DrawY=-5726,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-5694,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-8828,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8880
   ObjPosY=-5768
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_37"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_34
   Duration=2.000000
   InputLinks(0)=(DrawY=-8251,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8230,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8209,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Destroy'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Destroy_3')),DrawY=-8246,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8214,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-6892,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-NETHERHOLD.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=-8288
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_34"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object
