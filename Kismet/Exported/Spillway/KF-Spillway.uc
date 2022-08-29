Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_0
   Bank=AkBank'WW_ENV_Prison.WwiseDefaultBank_WW_ENV_Prison'
   InputLinks(0)=(DrawY=-9044,OverrideDelta=13)
   InputLinks(1)=(DrawY=-9024,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_0')),DrawY=-9034,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3536
   ObjPosY=-9080
   ObjComment="Prison"
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_0"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_0
   InputLinks(0)=(DrawY=-9035,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9013,OverrideDelta=36)
   InputLinks(2)=(DrawY=-8991,OverrideDelta=58)
   InputLinks(3)=(DrawY=-8969,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-9002,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-3235,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-9072
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_0"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_3
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_0')),DrawY=-9043,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9022,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9001,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3816
   ObjPosY=-9112
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_3"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_0
   MaxWidth=136
   OutputLinks(0)=(DrawY=-9667,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9646,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_20')),DrawY=-9625,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9816
   ObjPosY=-9736
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_0"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_2
   SizeX=1412
   SizeY=1196
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9872
   ObjPosY=-9776
   ObjComment="Random Start Location"
   DrawWidth=1412
   DrawHeight=1196
   Name="SequenceFrame_2"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_23
   InputLinks(0)=(DrawY=-9691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9649,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-9670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=-9178,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9127,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9078,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9216
   ObjPosY=-9728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_23"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_20
   InputLinks(0)=(DrawY=-9691,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9670,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9649,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_23',InputLinkIdx=1)),DrawY=-9670,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9418,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9367,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9318,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9456
   ObjPosY=-9728
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_20"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_21
   InputLinks(0)=(DrawY=-9091,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9070,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9049,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9070,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_33',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_32',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_35',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_34',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_31',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_36'),DrawX=-8706,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8655,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8606,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8744
   ObjPosY=-9128
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_21"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_0
   InputLinks(0)=(DrawY=-9003,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8982,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8961,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_21')),DrawY=-8982,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_19',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_20',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_21',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_22',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_23',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_24'),DrawX=-9162,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9111,OverrideDelta=76)
   EventLinks(0)=(DrawX=-9062,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9200
   ObjPosY=-9040
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_0"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_19
   InputLinks(0)=(DrawY=-9523,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9502,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9481,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9502,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_39',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_41',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_37',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_40',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_38',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_42'),DrawX=-8690,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-8639,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8590,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8728
   ObjPosY=-9560
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_19"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_22
   InputLinks(0)=(DrawY=-9499,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9478,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9457,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_19')),DrawY=-9478,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_25',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_26',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_27',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_28',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_29',SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_30'),DrawX=-9098,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-9047,OverrideDelta=76)
   EventLinks(0)=(DrawX=-8998,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9136
   ObjPosY=-9536
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_22"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqAct_RandomSwitch Name=SeqAct_RandomSwitch_0
   LinkCount=3
   IncrementAmount=0
   InputLinks(0)=(DrawY=-9302,OverrideDelta=19)
   InputLinks(1)=(DrawY=-9270,OverrideDelta=51)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_22',InputLinkIdx=1)),DrawY=-9307,OverrideDelta=14)
   OutputLinks(1)=(LinkDesc="Link 2",DrawY=-9286,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_0',InputLinkIdx=1)),LinkDesc="Link 3",DrawY=-9265,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-9500,OverrideDelta=23)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9544
   ObjPosY=-9344
   DrawWidth=89
   DrawHeight=125
   Name="SeqAct_RandomSwitch_0"
   ObjectArchetype=SeqAct_RandomSwitch'Engine.Default__SeqAct_RandomSwitch'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_1
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_RandomSwitch'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_RandomSwitch_0')),DrawY=-9347,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9326,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9305,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9824
   ObjPosY=-9416
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_1"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_25
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_25"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_26
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_26"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_27
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-9368
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_27"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_28
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9168
   ObjPosY=-9296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_28"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_29
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9080
   ObjPosY=-9296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_29"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_30
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8992
   ObjPosY=-9296
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_30"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_24
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9056
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_24"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_23
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_23"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_22
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-8808
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_22"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_21
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_2'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9056
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_21"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_20
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_1'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9144
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_20"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_19
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9232
   ObjPosY=-8880
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_19"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_31
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_31"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_32
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_7'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8688
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_32"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_33
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_33"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_34
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8776
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_34"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_35
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_8'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8600
   ObjPosY=-8960
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_35"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_36
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8600
   ObjPosY=-8888
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_36"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_37
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_37"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_38
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_38"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_39
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8760
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_39"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_40
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8760
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_40"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_41
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8672
   ObjPosY=-9416
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_41"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_42
   ObjValue=KFPlayerStart'KF-SPILLWAY.TheWorld:PersistentLevel.KFPlayerStart_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8584
   ObjPosY=-9344
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_42"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_1
   SizeX=1432
   SizeY=611
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8128
   ObjPosY=-9784
   ObjComment="KF Spawners - Power Distribution"
   DrawWidth=1432
   DrawHeight=611
   Name="SequenceFrame_1"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_10
   SizeX=1412
   SizeY=1196
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5784
   ObjPosY=-9776
   ObjComment="KF Spawners - Power Generators"
   DrawWidth=1412
   DrawHeight=1196
   Name="SequenceFrame_10"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_1
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_19'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_18')),DrawY=-9619,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9598,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9577,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5090,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5176
   ObjPosY=-9688
   ObjName="TriggerVolume_19 Touch"
   ObjComment="Cooling Tower"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_1"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_18
   InputLinks(0)=(DrawY=-9651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9609,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9630,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_1'),DrawX=-4890,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4839,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4790,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4928
   ObjPosY=-9688
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_18"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_1
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_15'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4920
   ObjPosY=-9520
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_1"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_2
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_4'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_2')),DrawY=-9619,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9598,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9577,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5630,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5712
   ObjPosY=-9688
   ObjName="TriggerVolume_4 Touch"
   ObjComment="Front Entry"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_2"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_2
   InputLinks(0)=(DrawY=-9651,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9630,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9609,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9630,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_2'),DrawX=-5450,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5399,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5350,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5488
   ObjPosY=-9688
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_2"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_2
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_14'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5472
   ObjPosY=-9488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_2"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_3
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_9'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_3')),DrawY=-9315,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9294,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9273,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5102,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5184
   ObjPosY=-9384
   ObjName="TriggerVolume_9 Touch"
   ObjComment="Flooded Compartment"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_3"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_3
   InputLinks(0)=(DrawY=-9347,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9326,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9305,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9326,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_4'),DrawX=-4922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4960
   ObjPosY=-9384
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_3"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_4
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_41'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4944
   ObjPosY=-9224
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_4"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_4
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_2'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_4')),DrawY=-9027,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9006,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8985,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5630,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5712
   ObjPosY=-9096
   ObjName="TriggerVolume_2 Touch"
   ObjComment="Rear Entry"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_4"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_4
   InputLinks(0)=(DrawY=-9059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9017,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9038,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_5'),DrawX=-5450,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5399,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5350,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5488
   ObjPosY=-9096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_4"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_5
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_3'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5480
   ObjPosY=-8928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_5"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_5
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_10'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_5')),DrawY=-9315,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9294,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9273,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5626,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5712
   ObjPosY=-9384
   ObjName="TriggerVolume_10 Touch"
   ObjComment="Center Entry"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_5"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_5
   InputLinks(0)=(DrawY=-9347,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9326,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9305,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9326,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_6'),DrawX=-5450,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-5399,OverrideDelta=76)
   EventLinks(0)=(DrawX=-5350,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5488
   ObjPosY=-9384
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_5"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_6
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_4'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5480
   ObjPosY=-9232
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_6"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_6
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_0'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_6')),DrawY=-9027,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9006,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8985,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5110,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5192
   ObjPosY=-9096
   ObjName="TriggerVolume_0 Touch"
   ObjComment="Soda Machines"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_6"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_6
   InputLinks(0)=(DrawY=-9059,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9038,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9017,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9038,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_7'),DrawX=-4922,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4871,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4822,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4960
   ObjPosY=-9096
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_6"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_7
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4960
   ObjPosY=-8928
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_7"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_7
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_20'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_7')),DrawY=-8763,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8742,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8721,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-5114,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-5200
   ObjPosY=-8832
   ObjName="TriggerVolume_20 Touch"
   ObjComment="Generators"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_7"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_8
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_6'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-8664
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_8"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_7
   InputLinks(0)=(DrawY=-8795,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8774,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8753,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-8774,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_8'),DrawX=-4938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-4887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-4838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-4976
   ObjPosY=-8832
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_7"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_9
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_12'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_9')),DrawY=-9675,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9654,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9633,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7538,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7624
   ObjPosY=-9744
   ObjName="TriggerVolume_12 Touch"
   ObjComment="Main Conduit - Lower Section"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_9"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_9
   InputLinks(0)=(DrawY=-9707,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9686,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9665,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9686,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_10'),DrawX=-7362,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7311,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7262,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7400
   ObjPosY=-9744
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_9"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_10
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_12'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7408
   ObjPosY=-9584
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_10"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_11
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_13'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_11')),DrawY=-9379,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9358,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9337,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7986,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-8072
   ObjPosY=-9448
   ObjName="TriggerVolume_13 Touch"
   ObjComment="Rear Entry - Stairs"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_11"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_11
   InputLinks(0)=(DrawY=-9411,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9390,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9369,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9390,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_12'),DrawX=-7802,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-7751,OverrideDelta=76)
   EventLinks(0)=(DrawX=-7702,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7840
   ObjPosY=-9448
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_11"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_12
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_16'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7840
   ObjPosY=-9272
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_12"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_13
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_22'
   MaxTriggerCount=0
   MaxWidth=173
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_13')),DrawY=-9667,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9646,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9625,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7090,OverrideDelta=54)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7176
   ObjPosY=-9736
   ObjName="TriggerVolume_22 Touch"
   ObjComment="Workshop - Rear Section"
   DrawWidth=131
   DrawHeight=176
   Name="SeqEvent_Touch_13"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_13
   InputLinks(0)=(DrawY=-9699,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9678,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9657,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9678,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_14'),DrawX=-6906,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6855,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6806,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6944
   ObjPosY=-9736
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_13"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_14
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_17'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6928
   ObjPosY=-9560
   ObjComment="Parent"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_14"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_Touch Name=SeqEvent_Touch_14
   Originator=TriggerVolume'KF-SPILLWAY.TheWorld:PersistentLevel.TriggerVolume_7'
   MaxTriggerCount=0
   MaxWidth=165
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Toggle'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Toggle_14')),DrawY=-9395,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-9374,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-9353,OverrideDelta=56)
   VariableLinks(0)=(DrawX=-7102,OverrideDelta=50)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7184
   ObjPosY=-9464
   ObjName="TriggerVolume_7 Touch"
   ObjComment="Workshop - Front Section"
   DrawWidth=127
   DrawHeight=176
   Name="SeqEvent_Touch_14"
   ObjectArchetype=SeqEvent_Touch'Engine.Default__SeqEvent_Touch'
End Object

Begin Object Class=SeqAct_Toggle Name=SeqAct_Toggle_14
   InputLinks(0)=(DrawY=-9427,OverrideDelta=14)
   InputLinks(1)=(DrawY=-9406,OverrideDelta=35)
   InputLinks(2)=(DrawY=-9385,OverrideDelta=56)
   OutputLinks(0)=(DrawY=-9406,OverrideDelta=35)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_17'),DrawX=-6938,OverrideDelta=16)
   VariableLinks(1)=(DrawX=-6887,OverrideDelta=76)
   EventLinks(0)=(DrawX=-6838,OverrideDelta=119)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6976
   ObjPosY=-9464
   DrawWidth=173
   DrawHeight=109
   Name="SeqAct_Toggle_14"
   ObjectArchetype=SeqAct_Toggle'Engine.Default__SeqAct_Toggle'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_17
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_10'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6960
   ObjPosY=-9312
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_17"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_0
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_13'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-7728
   ObjPosY=-9272
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_0"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_3
   ObjValue=KFSpawner'KF-SPILLWAY.TheWorld:PersistentLevel.KFSpawner_9'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-6832
   ObjPosY=-9560
   ObjComment="Child"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_3"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_4
   MaxTriggerCount=0
   bClientSideOnly=True
   MaxWidth=207
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkLoadBank'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkLoadBank_1')),DrawY=-8827,OverrideDelta=14)
   OutputLinks(1)=(DrawY=-8806,OverrideDelta=35)
   OutputLinks(2)=(DrawY=-8785,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3816
   ObjPosY=-8896
   DrawWidth=172
   Name="SeqEvent_LevelLoaded_4"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_AkStartAmbientSound Name=SeqAct_AkStartAmbientSound_1
   InputLinks(0)=(DrawY=-8819,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8797,OverrideDelta=36)
   InputLinks(2)=(DrawY=-8775,OverrideDelta=58)
   InputLinks(3)=(DrawY=-8753,OverrideDelta=80)
   OutputLinks(0)=(DrawY=-8786,OverrideDelta=47)
   VariableLinks(0)=(DrawX=-3235,OverrideDelta=55)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3312
   ObjPosY=-8856
   DrawWidth=154
   DrawHeight=133
   Name="SeqAct_AkStartAmbientSound_1"
   ObjectArchetype=SeqAct_AkStartAmbientSound'AkAudio.Default__SeqAct_AkStartAmbientSound'
End Object

Begin Object Class=SeqAct_AkLoadBank Name=SeqAct_AkLoadBank_1
   Bank=AkBank'WW_ENV_EvacuationPoint.WwiseDefaultBank_WW_ENV_EvacuationPoint'
   InputLinks(0)=(DrawY=-8828,OverrideDelta=13)
   InputLinks(1)=(DrawY=-8808,OverrideDelta=33)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_AkStartAmbientSound'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_AkStartAmbientSound_1')),DrawY=-8818,OverrideDelta=23)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3536
   ObjPosY=-8864
   ObjComment="Evacuation Point"
   DrawWidth=111
   DrawHeight=69
   Name="SeqAct_AkLoadBank_1"
   ObjectArchetype=SeqAct_AkLoadBank'AkAudio.Default__SeqAct_AkLoadBank'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_32
   SizeX=918
   SizeY=891
   bDrawBox=True
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-3896
   ObjPosY=-9192
   ObjComment="Level Loaded"
   DrawWidth=918
   DrawHeight=891
   Name="SequenceFrame_32"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SequenceFrame Name=SequenceFrame_0
   SizeX=725
   SizeY=572
   BorderWidth=4
   bDrawBox=True
   FillColor=(B=74,G=0,R=255,A=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=8984
   ObjPosY=-9744
   ObjComment="Benchmark"
   DrawWidth=725
   DrawHeight=572
   Name="SequenceFrame_0"
   ObjectArchetype=SequenceFrame'Engine.Default__SequenceFrame'
End Object

Begin Object Class=SeqEvent_Console Name=SeqEvent_Console_10
   ConsoleEventName="Benchmark"
   MaxWidth=190
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_2'),(LinkedOp=SeqAct_Interp'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_12')),DrawY=-9654,OverrideDelta=11)
   VariableLinks(0)=(DrawX=9111,OverrideDelta=63)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9016
   ObjPosY=-9720
   DrawWidth=115
   DrawHeight=128
   Name="SeqEvent_Console_10"
   ObjectArchetype=SeqEvent_Console'Engine.Default__SeqEvent_Console'
End Object

Begin Object Class=SeqVar_Player Name=SeqVar_Player_2
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9312
   ObjPosY=-9272
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Player_2"
   ObjectArchetype=SeqVar_Player'Engine.Default__SeqVar_Player'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_3
   Commands(0)="endbenchmark"
   InputLinks(0)=(DrawY=-9686,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9686,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=9616,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9552
   ObjPosY=-9720
   ObjComment="endbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_3"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_ConsoleCommand Name=SeqAct_ConsoleCommand_2
   Commands(0)="startbenchmark"
   InputLinks(0)=(DrawY=-9414,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-9414,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_Player'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Player_2'),DrawX=9112,OverrideDelta=42)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9048
   ObjPosY=-9448
   ObjComment="startbenchmark"
   DrawWidth=129
   DrawHeight=61
   Name="SeqAct_ConsoleCommand_2"
   ObjectArchetype=SeqAct_ConsoleCommand'Engine.Default__SeqAct_ConsoleCommand'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_12
   InputLinks(0)=(DrawY=-9666,OverrideDelta=15)
   InputLinks(1)=(DrawY=-9644,OverrideDelta=37)
   InputLinks(2)=(DrawY=-9622,OverrideDelta=59)
   InputLinks(3)=(DrawY=-9600,OverrideDelta=81)
   InputLinks(4)=(DrawY=-9578,OverrideDelta=103)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_ConsoleCommand'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_ConsoleCommand_3')),DrawY=-9650,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-9594,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_18'),DrawX=9343,OverrideDelta=16)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_224'),LinkDesc="NewCameraGroup",MinVars=0,DrawX=9413,OverrideDelta=63)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9312
   ObjPosY=-9704
   DrawWidth=156
   DrawHeight=173
   Name="SeqAct_Interp_12"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_18
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_1
      Name="InterpCurveEdSetup_1"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_1
      Begin Object Class=InterpTrackFloatProp Name=InterpTrackFloatProp_1
         PropertyName="FOVAngle"
         TrackTitle="FOVAngle"
         Name="InterpTrackFloatProp_1"
         ObjectArchetype=InterpTrackFloatProp'Engine.Default__InterpTrackFloatProp'
      End Object
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_1
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=162.509277,Y=1163.031006,Z=5.999756),ArriveTangent=(X=88.563629,Y=25.046173,Z=0.000000),LeaveTangent=(X=88.563629,Y=25.046173,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=593.622070,Y=1188.910034,Z=5.999512),ArriveTangent=(X=22.934113,Y=25.067474,Z=0.000000),LeaveTangent=(X=22.934113,Y=25.067474,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=626.512695,Y=2382.640869,Z=32.999268),ArriveTangent=(X=0.000000,Y=280.650085,Z=0.000000),LeaveTangent=(X=0.000000,Y=280.650085,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=97.956055,Y=2891.042480,Z=26.999023),ArriveTangent=(X=0.000000,Y=242.753510,Z=-4.351482),LeaveTangent=(X=0.000000,Y=242.753510,Z=-4.351482),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,OutVal=(X=335.460938,Y=3596.408447,Z=8.998779),ArriveTangent=(X=78.249916,Y=239.902588,Z=0.000000),LeaveTangent=(X=78.249916,Y=239.902588,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=567.455566,Y=4330.458008,Z=71.998535),ArriveTangent=(X=127.180557,Y=0.000000,Z=3.138778),LeaveTangent=(X=127.180557,Y=0.000000,Z=3.138778),InterpMode=CIM_CurveAutoClamped),(InVal=23.000000,OutVal=(X=1782.321777,Y=4314.975098,Z=77.998291),ArriveTangent=(X=218.398605,Y=-9.443958,Z=3.118692),LeaveTangent=(X=218.398605,Y=-9.443958,Z=3.118692),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=2166.794189,Y=3842.063477,Z=104.998047),ArriveTangent=(X=29.393509,Y=-250.584106,Z=0.000000),LeaveTangent=(X=29.393509,Y=-250.584106,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=27.000000,OutVal=(X=2192.182861,Y=3312.638672,Z=-18.002197),ArriveTangent=(X=0.000000,Y=-219.265289,Z=-0.000229),LeaveTangent=(X=0.000000,Y=-219.265289,Z=-0.000229),InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=(X=1921.904053,Y=2745.737061,Z=-18.002441),ArriveTangent=(X=-114.992271,Y=-191.288162,Z=-0.000204),LeaveTangent=(X=-114.992271,Y=-191.288162,Z=-0.000204),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=1502.229248,Y=2164.909668,Z=-144.002686),ArriveTangent=(X=0.000000,Y=-308.105896,Z=0.000000),LeaveTangent=(X=0.000000,Y=-308.105896,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=2070.498535,Y=829.258545,Z=-24.002930),ArriveTangent=(X=201.617111,Y=-361.385651,Z=0.000000),LeaveTangent=(X=201.617111,Y=-361.385651,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=2711.931885,Y=-3.404297,Z=-42.003174),ArriveTangent=(X=10.905594,Y=0.000000,Z=0.000000),LeaveTangent=(X=10.905594,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=2725.340332,Y=98.610352,Z=-33.003418),ArriveTangent=(X=9.889214,Y=69.571938,Z=4.930381),LeaveTangent=(X=9.889214,Y=69.571938,Z=4.930381),InterpMode=CIM_CurveAutoClamped),(InVal=46.000000,OutVal=(X=3253.190430,Y=1267.433960,Z=-0.004028),ArriveTangent=(X=60.165169,Y=384.023315,Z=0.000000),LeaveTangent=(X=60.165169,Y=384.023315,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=52.000000,OutVal=(X=3429.213379,Y=4055.838623,Z=-15.004028),ArriveTangent=(X=0.001284,Y=0.000854,Z=-0.000214),LeaveTangent=(X=0.001284,Y=0.000854,Z=-0.000214),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=3429.214844,Y=4055.839600,Z=-15.004272),ArriveTangent=(X=0.001610,Y=0.001068,Z=-0.000267),LeaveTangent=(X=0.001610,Y=0.001068,Z=-0.000267),InterpMode=CIM_CurveAutoClamped),(InVal=57.000000,OutVal=(X=3910.400879,Y=4928.391113,Z=-186.004517),ArriveTangent=(X=208.521652,Y=63.144012,Z=0.000000),LeaveTangent=(X=208.521652,Y=63.144012,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=(X=4680.344727,Y=5013.121582,Z=-144.004761),ArriveTangent=(X=0.000000,Y=60.322189,Z=0.000000),LeaveTangent=(X=0.000000,Y=60.322189,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=63.000000,OutVal=(X=4587.189941,Y=5624.148438,Z=-168.005005),ArriveTangent=(X=0.000000,Y=203.722900,Z=-16.580151),LeaveTangent=(X=0.000000,Y=203.722900,Z=-16.580151),InterpMode=CIM_CurveAutoClamped),(InVal=66.000000,OutVal=(X=4671.268066,Y=6235.458984,Z=-312.005249),ArriveTangent=(X=60.780548,Y=164.676437,Z=-29.173820),LeaveTangent=(X=60.780548,Y=164.676437,Z=-29.173820),InterpMode=CIM_CurveAutoClamped),(InVal=69.000000,OutVal=(X=5345.899902,Y=6612.207031,Z=-363.005493),ArriveTangent=(X=0.000000,Y=198.355316,Z=0.000000),LeaveTangent=(X=0.000000,Y=198.355316,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=72.000000,OutVal=(X=5343.529297,Y=7462.518555,Z=-357.005737),ArriveTangent=(X=0.000000,Y=38.574539,Z=4.252102),LeaveTangent=(X=0.000000,Y=38.574539,Z=4.252102),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=6145.396484,Y=7512.053711,Z=-315.005981),ArriveTangent=(X=253.791992,Y=34.788834,Z=0.000000),LeaveTangent=(X=253.791992,Y=34.788834,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=78.000000,OutVal=(X=6866.281250,Y=7839.508789,Z=-333.006226),ArriveTangent=(X=262.805817,Y=0.000000,Z=-3.857213),LeaveTangent=(X=262.805817,Y=0.000000,Z=-3.857213),InterpMode=CIM_CurveAutoClamped),(InVal=82.000000,OutVal=(X=7985.037109,Y=7760.602539,Z=-342.006470),ArriveTangent=(X=270.507813,Y=-46.077156,Z=0.000000),LeaveTangent=(X=270.507813,Y=-46.077156,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=(X=8759.835938,Y=7216.284180,Z=-327.006714),ArriveTangent=(X=322.699707,Y=0.000000,Z=8.753642),LeaveTangent=(X=322.699707,Y=0.000000,Z=8.753642),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=9921.235352,Y=7254.779297,Z=-282.006958),ArriveTangent=(X=319.974060,Y=0.000000,Z=28.237602),LeaveTangent=(X=319.974060,Y=0.000000,Z=28.237602),InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,OutVal=(X=10408.279297,Y=7196.901367,Z=-180.007202),ArriveTangent=(X=205.179886,Y=-1.332737,Z=0.000000),LeaveTangent=(X=205.179886,Y=-1.332737,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=10947.134766,Y=7195.435547,Z=-180.007446),ArriveTangent=(X=191.560547,Y=-1.323944,Z=0.000000),LeaveTangent=(X=191.560547,Y=-1.323944,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,OutVal=(X=11366.082031,Y=7149.143555,Z=-18.007690),ArriveTangent=(X=146.032425,Y=-17.400585,Z=12.736362),LeaveTangent=(X=146.032425,Y=-17.400585,Z=12.736362),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=11677.296875,Y=7108.432617,Z=-3.007935),ArriveTangent=(X=0.000000,Y=-32.617340,Z=0.000000),LeaveTangent=(X=0.000000,Y=-32.617340,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=11541.929688,Y=5900.634766,Z=-3.008179),ArriveTangent=(X=-95.096680,Y=-270.362518,Z=-0.000081),LeaveTangent=(X=-95.096680,Y=-270.362518,Z=-0.000081),InterpMode=CIM_CurveAutoClamped),(InVal=104.000000,OutVal=(X=10645.482422,Y=5400.696289,Z=-3.008423),ArriveTangent=(X=-6.036774,Y=-201.414459,Z=-0.000225),LeaveTangent=(X=-6.036774,Y=-201.414459,Z=-0.000225),InterpMode=CIM_CurveAutoClamped),(InVal=106.000000,OutVal=(X=10639.951172,Y=4893.562500,Z=-189.008667),ArriveTangent=(X=0.000000,Y=-290.752380,Z=-0.000229),LeaveTangent=(X=0.000000,Y=-290.752380,Z=-0.000229),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=11425.759766,Y=3946.934326,Z=-189.008911),ArriveTangent=(X=168.718613,Y=-217.140167,Z=-0.000070),LeaveTangent=(X=168.718613,Y=-217.140167,Z=-0.000070),InterpMode=CIM_CurveAutoClamped),(InVal=113.000000,OutVal=(X=11820.981445,Y=3373.581299,Z=-189.009155),ArriveTangent=(X=184.143173,Y=0.000000,Z=0.000000),LeaveTangent=(X=184.143173,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=13286.593750,Y=3391.200928,Z=-165.009399),ArriveTangent=(X=0.888336,Y=12.884354,Z=15.239872),LeaveTangent=(X=0.888336,Y=12.884354,Z=15.239872),InterpMode=CIM_CurveAutoClamped),(InVal=119.000000,OutVal=(X=13287.482422,Y=4060.718750,Z=-33.009644),ArriveTangent=(X=0.000000,Y=238.122711,Z=7.830164),LeaveTangent=(X=0.000000,Y=238.122711,Z=7.830164),InterpMode=CIM_CurveAutoClamped),(InVal=122.000000,OutVal=(X=13240.310547,Y=4581.814453,Z=-24.009888),ArriveTangent=(X=0.000000,Y=263.570190,Z=3.999919),LeaveTangent=(X=0.000000,Y=263.570190,Z=3.999919),InterpMode=CIM_CurveAutoClamped),(InVal=125.000000,OutVal=(X=13448.242188,Y=5650.851563,Z=-9.010132),ArriveTangent=(X=133.238464,Y=0.000000,Z=12.262898),LeaveTangent=(X=133.238464,Y=0.000000,Z=12.262898),InterpMode=CIM_CurveAutoClamped),(InVal=127.000000,OutVal=(X=13950.312500,Y=5572.134766,Z=104.989624),ArriveTangent=(X=205.118164,Y=-21.593807,Z=10.267710),LeaveTangent=(X=205.118164,Y=-21.593807,Z=10.267710),InterpMode=CIM_CurveAutoClamped),(InVal=129.000000,OutVal=(X=14268.714844,Y=5548.141602,Z=113.989380),ArriveTangent=(X=0.000000,Y=-21.711151,Z=0.000000),LeaveTangent=(X=0.000000,Y=-21.711151,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=134.000000,OutVal=(X=14219.607422,Y=4078.020752,Z=101.989136),ArriveTangent=(X=-23.106043,Y=-281.154633,Z=0.000000),LeaveTangent=(X=-23.106043,Y=-281.154633,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=137.000000,OutVal=(X=13987.431641,Y=3298.904541,Z=119.988892),ArriveTangent=(X=-146.730957,Y=-27.051926,Z=0.000000),LeaveTangent=(X=-146.730957,Y=-27.051926,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=13632.683594,Y=3282.900391,Z=83.988647),ArriveTangent=(X=-296.826813,Y=0.000000,Z=-58.235321),LeaveTangent=(X=-296.826813,Y=0.000000,Z=-58.235321),InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=(X=13096.951172,Y=3357.170166,Z=-162.011597),ArriveTangent=(X=0.000000,Y=0.000000,Z=-22.543396),LeaveTangent=(X=0.000000,Y=0.000000,Z=-22.543396),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=13152.558594,Y=2390.387451,Z=-189.011841),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.000166),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.000166),InterpMode=CIM_CurveAutoClamped),(InVal=147.000000,OutVal=(X=12340.185547,Y=2417.325195,Z=-189.012085),ArriveTangent=(X=-219.059982,Y=0.000000,Z=0.000000),LeaveTangent=(X=-219.059982,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=(X=11619.138672,Y=2392.760742,Z=-174.012329),ArriveTangent=(X=-71.851448,Y=-19.942520,Z=0.000000),LeaveTangent=(X=-71.851448,Y=-19.942520,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=153.000000,OutVal=(X=11518.045898,Y=1299.108765,Z=-183.012695),ArriveTangent=(X=-76.889435,Y=0.000000,Z=0.000000),LeaveTangent=(X=-76.889435,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=(X=11035.386719,Y=1302.464233,Z=-27.012939),ArriveTangent=(X=-205.413818,Y=0.931404,Z=7.170559),LeaveTangent=(X=-205.413818,Y=0.931404,Z=7.170559),InterpMode=CIM_CurveAutoClamped),(InVal=157.000000,OutVal=(X=10696.390625,Y=1303.504395,Z=-21.013184),ArriveTangent=(X=0.000000,Y=1.557419,Z=0.000000),LeaveTangent=(X=0.000000,Y=1.557419,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=158.000000,OutVal=(X=10699.064453,Y=1723.481445,Z=-21.013428),ArriveTangent=(X=4.294082,Y=310.913177,Z=-0.000488),LeaveTangent=(X=4.294082,Y=310.913177,Z=-0.000488),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=10716.716797,Y=2236.243896,Z=-297.013672),ArriveTangent=(X=0.000000,Y=0.000000,Z=-8.121120),LeaveTangent=(X=0.000000,Y=0.000000,Z=-8.121120),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=8883.268555,Y=2209.236572,Z=-306.013916),ArriveTangent=(X=-346.561646,Y=0.000000,Z=-4.782101),LeaveTangent=(X=-346.561646,Y=0.000000,Z=-4.782101),InterpMode=CIM_CurveAutoClamped),(InVal=167.000000,OutVal=(X=8130.739258,Y=2853.179688,Z=-336.014160),ArriveTangent=(X=0.000000,Y=182.205124,Z=-0.000245),LeaveTangent=(X=0.000000,Y=182.205124,Z=-0.000245),InterpMode=CIM_CurveAutoClamped),(InVal=169.000000,OutVal=(X=8153.293945,Y=3302.467285,Z=-336.014404),ArriveTangent=(X=8.759766,Y=230.122925,Z=0.000000),LeaveTangent=(X=8.759766,Y=230.122925,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=171.000000,OutVal=(X=8165.778320,Y=3773.671387,Z=-189.014648),ArriveTangent=(X=0.000000,Y=296.494751,Z=0.000000),LeaveTangent=(X=0.000000,Y=296.494751,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=(X=8157.798828,Y=5208.111816,Z=-189.014893),ArriveTangent=(X=0.000000,Y=222.487442,Z=-0.000166),LeaveTangent=(X=0.000000,Y=222.487442,Z=-0.000166),InterpMode=CIM_CurveAutoClamped),(InVal=178.000000,OutVal=(X=8863.679688,Y=5621.285156,Z=-204.015137),ArriveTangent=(X=0.000000,Y=184.925491,Z=-12.778461),LeaveTangent=(X=0.000000,Y=184.925491,Z=-12.778461),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=8792.191406,Y=6132.739258,Z=-372.015442),ArriveTangent=(X=-14.947843,Y=249.619461,Z=0.000000),LeaveTangent=(X=-14.947843,Y=249.619461,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=184.000000,OutVal=(X=8764.577148,Y=7119.001953,Z=-342.015747),ArriveTangent=(X=-16.581421,Y=201.640137,Z=4.930420),LeaveTangent=(X=-16.581421,Y=201.640137,Z=4.930420),InterpMode=CIM_CurveAutoClamped),(InVal=188.000000,OutVal=(X=7959.920410,Y=7745.860352,Z=-330.015991),ArriveTangent=(X=-214.195862,Y=50.202515,Z=3.374939),LeaveTangent=(X=-214.195862,Y=50.202515,Z=3.374939),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=7051.010254,Y=7841.264648,Z=-315.016235),ArriveTangent=(X=-214.725021,Y=0.000000,Z=0.000000),LeaveTangent=(X=-214.725021,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=(X=6456.845215,Y=6949.666016,Z=-339.016479),ArriveTangent=(X=-44.566216,Y=-315.171600,Z=-0.000249),LeaveTangent=(X=-44.566216,Y=-315.171600,Z=-0.000249),InterpMode=CIM_CurveAutoClamped),(InVal=199.000000,OutVal=(X=6381.937500,Y=5635.063477,Z=-339.016846),ArriveTangent=(X=-47.246101,Y=-164.415588,Z=0.000000),LeaveTangent=(X=-47.246101,Y=-164.415588,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=202.000000,OutVal=(X=5291.944824,Y=5354.662109,Z=-309.017090),ArriveTangent=(X=-273.554626,Y=-14.965256,Z=19.437870),LeaveTangent=(X=-273.554626,Y=-14.965256,Z=19.437870),InterpMode=CIM_CurveAutoClamped),(InVal=204.000000,OutVal=(X=4905.241211,Y=5340.081543,Z=-234.017456),ArriveTangent=(X=-170.378052,Y=-17.535942,Z=36.749878),LeaveTangent=(X=-170.378052,Y=-17.535942,Z=36.749878),InterpMode=CIM_CurveAutoClamped),(InVal=206.000000,OutVal=(X=4610.432617,Y=4899.112793,Z=-162.017578),ArriveTangent=(X=0.000000,Y=-152.638474,Z=44.181080),LeaveTangent=(X=0.000000,Y=-152.638474,Z=44.181080),InterpMode=CIM_CurveAutoClamped),(InVal=209.000000,OutVal=(X=5306.533203,Y=4576.889160,Z=-12.017822),ArriveTangent=(X=219.752121,Y=-165.608475,Z=16.698208),LeaveTangent=(X=219.752121,Y=-165.608475,Z=16.698208),InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=(X=5928.945313,Y=3890.773926,Z=11.981934),ArriveTangent=(X=0.000000,Y=-238.014359,Z=0.000000),LeaveTangent=(X=0.000000,Y=-238.014359,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=(X=5144.927734,Y=3148.802979,Z=-0.018311),ArriveTangent=(X=-32.210213,Y=-367.944702,Z=0.000000),LeaveTangent=(X=-32.210213,Y=-367.944702,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,OutVal=(X=5103.842773,Y=1683.105713,Z=11.981445),ArriveTangent=(X=-32.166481,Y=0.000000,Z=0.000000),LeaveTangent=(X=-32.166481,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=221.000000,OutVal=(X=4337.075195,Y=1772.995850,Z=11.981201),InterpMode=CIM_CurveAutoClamped),(InVal=223.000000,OutVal=(X=4417.104980,Y=1481.272827,Z=17.980957),ArriveTangent=(X=28.603277,Y=-224.566177,Z=0.000000),LeaveTangent=(X=28.603277,Y=-224.566177,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=225.000000,OutVal=(X=4453.861816,Y=862.267090,Z=-189.019287),ArriveTangent=(X=0.000000,Y=-373.459106,Z=0.000000),LeaveTangent=(X=0.000000,Y=-373.459106,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=228.000000,OutVal=(X=4377.822266,Y=-387.771973,Z=-165.019531),InterpMode=CIM_CurveAutoClamped),(InVal=230.000000,OutVal=(X=4377.823242,Y=-387.771973,Z=-165.019775),ArriveTangent=(X=0.001076,Y=0.000000,Z=0.000000),LeaveTangent=(X=0.001076,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=233.000000,OutVal=(X=4626.829590,Y=-1431.596924,Z=-162.020020),ArriveTangent=(X=166.545349,Y=-26.580872,Z=1.499919),LeaveTangent=(X=166.545349,Y=-26.580872,Z=1.499919),InterpMode=CIM_CurveAutoClamped),(InVal=236.000000,OutVal=(X=5888.517578,Y=-1464.696045,Z=-156.020264),ArriveTangent=(X=276.104797,Y=0.000000,Z=0.000000),LeaveTangent=(X=276.104797,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=239.000000,OutVal=(X=6392.107422,Y=-793.136963,Z=-159.020508),ArriveTangent=(X=288.410339,Y=43.525162,Z=0.000000),LeaveTangent=(X=288.410339,Y=43.525162,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=242.000000,OutVal=(X=7818.987305,Y=-735.462158,Z=-132.020752),ArriveTangent=(X=398.542816,Y=40.425613,Z=0.000000),LeaveTangent=(X=398.542816,Y=40.425613,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=(X=8783.364258,Y=-358.765625,Z=-147.020996),ArriveTangent=(X=0.000000,Y=173.045898,Z=0.000000),LeaveTangent=(X=0.000000,Y=173.045898,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=247.000000,OutVal=(X=8757.854492,Y=129.767334,Z=-129.021240),ArriveTangent=(X=0.000000,Y=240.902771,Z=0.000000),LeaveTangent=(X=0.000000,Y=240.902771,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=249.000000,OutVal=(X=8763.772461,Y=604.845459,Z=-348.021484),ArriveTangent=(X=5.818235,Y=0.000000,Z=-0.000233),LeaveTangent=(X=5.818235,Y=0.000000,Z=-0.000233),InterpMode=CIM_CurveAutoClamped),(InVal=252.000000,OutVal=(X=8833.508789,Y=547.256592,Z=-348.021729),ArriveTangent=(X=0.001630,Y=0.000000,Z=-0.000081),LeaveTangent=(X=0.001630,Y=0.000000,Z=-0.000081),InterpMode=CIM_CurveAutoClamped),(InVal=255.000000,OutVal=(X=8833.510742,Y=547.257080,Z=-348.021973),ArriveTangent=(X=0.000000,Y=0.000346,Z=-0.000061),LeaveTangent=(X=0.000000,Y=0.000346,Z=-0.000061),InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=(X=7214.763672,Y=630.236084,Z=-348.022217),ArriveTangent=(X=-302.299927,Y=33.260147,Z=0.000000),LeaveTangent=(X=-302.299927,Y=33.260147,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=264.000000,OutVal=(X=6112.811523,Y=922.421875,Z=-321.022461),ArriveTangent=(X=-313.607971,Y=0.000000,Z=0.000000),LeaveTangent=(X=-313.607971,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=267.000000,OutVal=(X=5019.507813,Y=834.509521,Z=-336.022705),ArriveTangent=(X=-288.615723,Y=-20.377647,Z=0.000000),LeaveTangent=(X=-288.615723,Y=-20.377647,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=270.000000,OutVal=(X=4381.117188,Y=795.970703,Z=-180.022949),ArriveTangent=(X=0.000000,Y=0.000000,Z=51.499920),LeaveTangent=(X=0.000000,Y=0.000000,Z=51.499920),InterpMode=CIM_CurveAutoClamped),(InVal=273.000000,OutVal=(X=4386.715332,Y=1607.166382,Z=-27.023193),ArriveTangent=(X=4.631378,Y=229.835815,Z=14.973341),LeaveTangent=(X=4.631378,Y=229.835815,Z=14.973341),InterpMode=CIM_CurveAutoClamped),(InVal=276.000000,OutVal=(X=5239.658203,Y=2174.985596,Z=-6.023438),ArriveTangent=(X=37.651573,Y=291.598755,Z=0.000000),LeaveTangent=(X=37.651573,Y=291.598755,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=279.000000,OutVal=(X=5287.915039,Y=3381.756592,Z=-18.023682),ArriveTangent=(X=36.044773,Y=374.730835,Z=0.000000),LeaveTangent=(X=36.044773,Y=374.730835,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=282.000000,OutVal=(X=5795.542969,Y=4423.370605,Z=-9.023926),InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=0.000000,Y=0.000000,Z=1.757813),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.000000,Y=0.000000,Z=-0.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.703125),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.703125),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,OutVal=(X=0.000000,Y=0.000000,Z=-2.460938),InterpMode=CIM_CurveAutoClamped),(InVal=12.000000,OutVal=(X=0.000000,Y=0.000000,Z=-1.757813),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.472219),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.472219),InterpMode=CIM_CurveAutoClamped),(InVal=15.000000,ArriveTangent=(X=0.000000,Y=0.000000,Z=0.556641),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.556641),InterpMode=CIM_CurveAutoClamped),(InVal=18.000000,OutVal=(X=0.000000,Y=0.000000,Z=1.582031),InterpMode=CIM_CurveAutoClamped),(InVal=23.000000,OutVal=(X=0.000000,Y=1.757813,Z=-85.605469),ArriveTangent=(X=0.000000,Y=0.000000,Z=-6.360609),LeaveTangent=(X=0.000000,Y=0.000000,Z=-6.360609),InterpMode=CIM_CurveAutoClamped),(InVal=25.000000,OutVal=(X=0.000000,Y=1.757813,Z=-93.515625),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.793251),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.793251),InterpMode=CIM_CurveAutoClamped),(InVal=27.000000,OutVal=(X=0.000000,Y=1.757813,Z=-94.218750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.210938),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.210938),InterpMode=CIM_CurveAutoClamped),(InVal=30.000000,OutVal=(X=0.000000,Y=1.406250,Z=-94.570313),InterpMode=CIM_CurveAutoClamped),(InVal=33.000000,OutVal=(X=0.000000,Y=1.406250,Z=-93.691406),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.556905),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.556905),InterpMode=CIM_CurveAutoClamped),(InVal=36.000000,OutVal=(X=0.000000,Y=1.406250,Z=-90.175781),InterpMode=CIM_CurveAutoClamped),(InVal=39.000000,OutVal=(X=0.000000,Y=1.406250,Z=-90.703125),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.437851),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.437851),InterpMode=CIM_CurveAutoClamped),(InVal=42.000000,OutVal=(X=0.000000,Y=0.878906,Z=-239.414063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-16.694046),LeaveTangent=(X=0.000000,Y=0.000000,Z=-16.694046),InterpMode=CIM_CurveAutoClamped),(InVal=46.000000,OutVal=(X=0.000000,Y=1.406250,Z=-269.648438),InterpMode=CIM_CurveAutoClamped),(InVal=52.000000,OutVal=(X=0.000000,Y=-0.175781,Z=-185.097656),ArriveTangent=(X=0.000000,Y=-0.641580,Z=18.676758),LeaveTangent=(X=0.000000,Y=-0.641580,Z=18.676758),InterpMode=CIM_CurveAutoClamped),(InVal=54.000000,OutVal=(X=0.000000,Y=-4.394531,Z=-120.234375),ArriveTangent=(X=0.000000,Y=0.000000,Z=16.685617),LeaveTangent=(X=0.000000,Y=0.000000,Z=16.685617),InterpMode=CIM_CurveAutoClamped),(InVal=57.000000,OutVal=(X=0.000000,Y=-3.164063,Z=-94.570313),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.476686),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.476686),InterpMode=CIM_CurveAutoClamped),(InVal=60.000000,OutVal=(X=0.000000,Y=-3.164063,Z=-92.636719),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.527344),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.527344),InterpMode=CIM_CurveAutoClamped),(InVal=63.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-91.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.634102),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.634102),InterpMode=CIM_CurveAutoClamped),(InVal=66.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-88.769531),InterpMode=CIM_CurveAutoClamped),(InVal=69.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-89.296875),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.281356),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.281356),InterpMode=CIM_CurveAutoClamped),(InVal=72.000000,OutVal=(X=0.000000,Y=-3.339844,Z=-90.527344),InterpMode=CIM_CurveAutoClamped),(InVal=75.000000,OutVal=(X=0.000000,Y=-2.109375,Z=-90.351563),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.146234),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.146234),InterpMode=CIM_CurveAutoClamped),(InVal=78.000000,OutVal=(X=0.000000,Y=-3.515625,Z=0.703125),InterpMode=CIM_CurveAutoClamped),(InVal=82.000000,OutVal=(X=0.000000,Y=-3.515625,Z=-60.820313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-5.692895),LeaveTangent=(X=0.000000,Y=0.000000,Z=-5.692895),InterpMode=CIM_CurveAutoClamped),(InVal=85.000000,OutVal=(X=0.000000,Y=-3.515625,Z=-69.785156),InterpMode=CIM_CurveAutoClamped),(InVal=88.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-69.433594),InterpMode=CIM_CurveAutoClamped),(InVal=90.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-76.992188),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.394531),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.394531),InterpMode=CIM_CurveAutoClamped),(InVal=93.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-91.406250),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.190285),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.190285),InterpMode=CIM_CurveAutoClamped),(InVal=95.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-91.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.192677),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.192677),InterpMode=CIM_CurveAutoClamped),(InVal=98.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-150.292969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-12.889654),LeaveTangent=(X=0.000000,Y=0.000000,Z=-12.889654),InterpMode=CIM_CurveAutoClamped),(InVal=101.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-173.847656),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.342745),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.342745),InterpMode=CIM_CurveAutoClamped),(InVal=104.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-178.945313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.863281),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.863281),InterpMode=CIM_CurveAutoClamped),(InVal=106.000000,OutVal=(X=0.000000,Y=-2.636719,Z=-183.164063),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.433852),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.433852),InterpMode=CIM_CurveAutoClamped),(InVal=109.000000,OutVal=(X=0.000000,Y=-2.636719,Z=-183.691406),InterpMode=CIM_CurveAutoClamped),(InVal=113.000000,OutVal=(X=0.000000,Y=-2.636719,Z=-181.757813),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.752990),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.752990),InterpMode=CIM_CurveAutoClamped),(InVal=117.000000,OutVal=(X=0.000000,Y=-2.636719,Z=-177.539063),InterpMode=CIM_CurveAutoClamped),(InVal=119.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-179.648438),InterpMode=CIM_CurveAutoClamped),(InVal=122.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-99.492188),InterpMode=CIM_CurveAutoClamped),(InVal=125.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-105.468750),ArriveTangent=(X=0.000000,Y=0.000000,Z=-4.677685),LeaveTangent=(X=0.000000,Y=0.000000,Z=-4.677685),InterpMode=CIM_CurveAutoClamped),(InVal=127.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-139.042969),InterpMode=CIM_CurveAutoClamped),(InVal=129.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-132.539063),InterpMode=CIM_CurveAutoClamped),(InVal=134.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-178.417969),ArriveTangent=(X=0.000000,Y=0.000000,Z=-11.359863),LeaveTangent=(X=0.000000,Y=0.000000,Z=-11.359863),InterpMode=CIM_CurveAutoClamped),(InVal=137.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-223.417969),InterpMode=CIM_CurveAutoClamped),(InVal=138.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-211.816406),ArriveTangent=(X=0.000000,Y=0.000000,Z=11.484375),LeaveTangent=(X=0.000000,Y=0.000000,Z=11.484375),InterpMode=CIM_CurveAutoClamped),(InVal=140.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-188.964844),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.241980),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.241980),InterpMode=CIM_CurveAutoClamped),(InVal=143.000000,OutVal=(X=0.000000,Y=-4.746094,Z=-183.164063),InterpMode=CIM_CurveAutoClamped),(InVal=147.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-273.164063),InterpMode=CIM_CurveAutoClamped),(InVal=150.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-273.164063),InterpMode=CIM_CurveAutoClamped),(InVal=153.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-273.515625),InterpMode=CIM_CurveAutoClamped),(InVal=155.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-270.175781),InterpMode=CIM_CurveAutoClamped),(InVal=157.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-270.175781),InterpMode=CIM_CurveAutoClamped),(InVal=158.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-270.351563),InterpMode=CIM_CurveAutoClamped),(InVal=160.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-268.769531),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.492188),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.492188),InterpMode=CIM_CurveAutoClamped),(InVal=163.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-267.890625),InterpMode=CIM_CurveAutoClamped),(InVal=167.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-271.054688),InterpMode=CIM_CurveAutoClamped),(InVal=169.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-269.824219),InterpMode=CIM_CurveAutoClamped),(InVal=171.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-273.339844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-3.308740),LeaveTangent=(X=0.000000,Y=0.000000,Z=-3.308740),InterpMode=CIM_CurveAutoClamped),(InVal=175.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-358.769531),ArriveTangent=(X=0.000000,Y=0.000000,Z=-25.638950),LeaveTangent=(X=0.000000,Y=0.000000,Z=-25.638950),InterpMode=CIM_CurveAutoClamped),(InVal=178.000000,OutVal=(X=0.000000,Y=-3.164063,Z=-452.812500),InterpMode=CIM_CurveAutoClamped),(InVal=180.000000,OutVal=(X=0.000000,Y=-3.164063,Z=-451.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.410156),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.410156),InterpMode=CIM_CurveAutoClamped),(InVal=184.000000,OutVal=(X=0.000000,Y=-2.812500,Z=-450.351563),ArriveTangent=(X=0.000000,Y=0.195864,Z=0.000000),LeaveTangent=(X=0.000000,Y=0.195864,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=188.000000,OutVal=(X=0.000000,Y=0.703125,Z=-538.945313),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.862939),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.862939),InterpMode=CIM_CurveAutoClamped),(InVal=192.000000,OutVal=(X=0.000000,Y=0.703125,Z=-540.351563),InterpMode=CIM_CurveAutoClamped),(InVal=195.000000,OutVal=(X=0.000000,Y=0.703125,Z=-468.984375),InterpMode=CIM_CurveAutoClamped),(InVal=199.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-631.757813),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.190792),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.190792),InterpMode=CIM_CurveAutoClamped),(InVal=202.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-633.339844),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.449016),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.449016),InterpMode=CIM_CurveAutoClamped),(InVal=204.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-634.042969),InterpMode=CIM_CurveAutoClamped),(InVal=206.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-633.164063),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.784036),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.784036),InterpMode=CIM_CurveAutoClamped),(InVal=209.000000,OutVal=(X=0.000000,Y=-1.757813,Z=-627.714844),InterpMode=CIM_CurveAutoClamped),(InVal=212.000000,OutVal=(X=0.000000,Y=-6.328125,Z=-630.878906),InterpMode=CIM_CurveAutoClamped),(InVal=215.000000,OutVal=(X=0.000000,Y=-3.691406,Z=-630.703125),InterpMode=CIM_CurveAutoClamped),(InVal=218.000000,OutVal=(X=0.000000,Y=-3.691406,Z=-632.636719),ArriveTangent=(X=0.000000,Y=0.000000,Z=-1.570631),LeaveTangent=(X=0.000000,Y=0.000000,Z=-1.570631),InterpMode=CIM_CurveAutoClamped),(InVal=221.000000,OutVal=(X=0.000000,Y=-3.691406,Z=-720.527344),InterpMode=CIM_CurveAutoClamped),(InVal=223.000000,OutVal=(X=0.000000,Y=-3.691406,Z=-718.417969),InterpMode=CIM_CurveAutoClamped),(InVal=225.000000,OutVal=(X=0.000000,Y=-3.691406,Z=-720.351563),InterpMode=CIM_CurveAutoClamped),(InVal=228.000000,OutVal=(X=0.000000,Y=-1.933594,Z=-717.187500),ArriveTangent=(X=0.000000,Y=0.738281,Z=2.800944),LeaveTangent=(X=0.000000,Y=0.738281,Z=2.800944),InterpMode=CIM_CurveAutoClamped),(InVal=230.000000,OutVal=(X=0.000000,Y=0.000000,Z=-655.312500),ArriveTangent=(X=0.000000,Y=0.000000,Z=14.159006),LeaveTangent=(X=0.000000,Y=0.000000,Z=14.159006),InterpMode=CIM_CurveAutoClamped),(InVal=233.000000,OutVal=(X=0.000000,Y=0.000000,Z=-634.570313),ArriveTangent=(X=0.000000,Y=0.000000,Z=3.567898),LeaveTangent=(X=0.000000,Y=0.000000,Z=3.567898),InterpMode=CIM_CurveAutoClamped),(InVal=236.000000,OutVal=(X=0.000000,Y=-1.582031,Z=-628.769531),ArriveTangent=(X=0.000000,Y=-0.307749,Z=4.572952),LeaveTangent=(X=0.000000,Y=-0.307749,Z=4.572952),InterpMode=CIM_CurveAutoClamped),(InVal=239.000000,OutVal=(X=0.000000,Y=-2.109375,Z=-506.953125),ArriveTangent=(X=0.000000,Y=0.000000,Z=28.956739),LeaveTangent=(X=0.000000,Y=0.000000,Z=28.956739),InterpMode=CIM_CurveAutoClamped),(InVal=242.000000,OutVal=(X=0.000000,Y=-2.109375,Z=-451.230469),ArriveTangent=(X=0.000000,Y=0.000000,Z=17.343750),LeaveTangent=(X=0.000000,Y=0.000000,Z=17.343750),InterpMode=CIM_CurveAutoClamped),(InVal=245.000000,OutVal=(X=0.000000,Y=0.703125,Z=-402.890625),InterpMode=CIM_CurveAutoClamped),(InVal=247.000000,OutVal=(X=0.000000,Y=0.703125,Z=-423.808594),InterpMode=CIM_CurveAutoClamped),(InVal=249.000000,OutVal=(X=0.000000,Y=0.703125,Z=-416.777344),ArriveTangent=(X=0.000000,Y=0.000000,Z=7.088909),LeaveTangent=(X=0.000000,Y=0.000000,Z=7.088909),InterpMode=CIM_CurveAutoClamped),(InVal=252.000000,OutVal=(X=0.000000,Y=1.406250,Z=-309.550781),ArriveTangent=(X=0.000000,Y=0.468985,Z=39.140625),LeaveTangent=(X=0.000000,Y=0.468985,Z=39.140625),InterpMode=CIM_CurveAutoClamped),(InVal=255.000000,OutVal=(X=0.000000,Y=4.921875,Z=-181.933594),ArriveTangent=(X=0.000000,Y=0.000000,Z=26.499023),LeaveTangent=(X=0.000000,Y=0.000000,Z=26.499023),InterpMode=CIM_CurveAutoClamped),(InVal=260.000000,OutVal=(X=0.000000,Y=4.921875,Z=-97.558594),ArriveTangent=(X=0.000000,Y=0.000000,Z=4.188612),LeaveTangent=(X=0.000000,Y=0.000000,Z=4.188612),InterpMode=CIM_CurveAutoClamped),(InVal=264.000000,OutVal=(X=0.000000,Y=4.921875,Z=-89.472656),ArriveTangent=(X=0.000000,Y=0.000000,Z=1.521288),LeaveTangent=(X=0.000000,Y=0.000000,Z=1.521288),InterpMode=CIM_CurveAutoClamped),(InVal=267.000000,OutVal=(X=0.000000,Y=3.164063,Z=-86.308594),ArriveTangent=(X=0.000000,Y=0.000000,Z=0.458321),LeaveTangent=(X=0.000000,Y=0.000000,Z=0.458321),InterpMode=CIM_CurveAutoClamped),(InVal=270.000000,OutVal=(X=0.000000,Y=3.164063,Z=-85.605469),InterpMode=CIM_CurveAutoClamped),(InVal=273.000000,OutVal=(X=0.000000,Y=0.878906,Z=-91.582031),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.620069),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.620069),InterpMode=CIM_CurveAutoClamped),(InVal=276.000000,OutVal=(X=0.000000,Y=1.230469,Z=-92.460938),ArriveTangent=(X=0.000000,Y=0.000000,Z=-0.234375),LeaveTangent=(X=0.000000,Y=0.000000,Z=-0.234375),InterpMode=CIM_CurveAutoClamped),(InVal=279.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-92.988281),InterpMode=CIM_CurveAutoClamped),(InVal=282.000000,OutVal=(X=0.000000,Y=-0.351563,Z=-88.066406),InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=4.000000),(Time=6.000000),(Time=10.000000),(Time=12.000000),(Time=15.000000),(Time=18.000000),(Time=23.000000),(Time=25.000000),(Time=27.000000),(Time=30.000000),(Time=33.000000),(Time=36.000000),(Time=39.000000),(Time=42.000000),(Time=46.000000),(Time=52.000000),(Time=54.000000),(Time=57.000000),(Time=60.000000),(Time=63.000000),(Time=66.000000),(Time=69.000000),(Time=72.000000),(Time=75.000000),(Time=78.000000),(Time=82.000000),(Time=85.000000),(Time=88.000000),(Time=90.000000),(Time=93.000000),(Time=95.000000),(Time=98.000000),(Time=101.000000),(Time=104.000000),(Time=106.000000),(Time=109.000000),(Time=113.000000),(Time=117.000000),(Time=119.000000),(Time=122.000000),(Time=125.000000),(Time=127.000000),(Time=129.000000),(Time=134.000000),(Time=137.000000),(Time=138.000000),(Time=140.000000),(Time=143.000000),(Time=147.000000),(Time=150.000000),(Time=153.000000),(Time=155.000000),(Time=157.000000),(Time=158.000000),(Time=160.000000),(Time=163.000000),(Time=167.000000),(Time=169.000000),(Time=171.000000),(Time=175.000000),(Time=178.000000),(Time=180.000000),(Time=184.000000),(Time=188.000000),(Time=192.000000),(Time=195.000000),(Time=199.000000),(Time=202.000000),(Time=204.000000),(Time=206.000000),(Time=209.000000),(Time=212.000000),(Time=215.000000),(Time=218.000000),(Time=221.000000),(Time=223.000000),(Time=225.000000),(Time=228.000000),(Time=230.000000),(Time=233.000000),(Time=236.000000),(Time=239.000000),(Time=242.000000),(Time=245.000000),(Time=247.000000),(Time=249.000000),(Time=252.000000),(Time=255.000000),(Time=260.000000),(Time=264.000000),(Time=267.000000),(Time=270.000000),(Time=273.000000),(Time=276.000000),(Time=279.000000),(Time=282.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_1"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1.InterpTrackMove_1'
      InterpTracks(1)=InterpTrackFloatProp'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1.InterpTrackFloatProp_1'
      GroupName="NewCameraGroup"
      GroupColor=(B=0,G=172,R=167,A=255)
      Name="InterpGroup_1"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   Begin Object Class=InterpGroupDirector Name=InterpGroupDirector_1
      Begin Object Class=InterpTrackDirector Name=InterpTrackDirector_1
         CutTrack(0)=(TargetCamGroup="NewCameraGroup",ShotNumber=10)
         Name="InterpTrackDirector_1"
         ObjectArchetype=InterpTrackDirector'Engine.Default__InterpTrackDirector'
      End Object
      InterpTracks(0)=InterpTrackDirector'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroupDirector_1.InterpTrackDirector_1'
      GroupColor=(B=199,G=133,R=0,A=255)
      Name="InterpGroupDirector_1"
      ObjectArchetype=InterpGroupDirector'Engine.Default__InterpGroupDirector'
   End Object
   InterpLength=283.000000
   InterpGroups(0)=InterpGroup'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroup_1'
   InterpGroups(1)=InterpGroupDirector'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpGroupDirector_1'
   CurveEdSetup=InterpCurveEdSetup'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_18.InterpCurveEdSetup_1'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=283.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9296
   ObjPosY=-9480
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_18"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_224
   ObjValue=CameraActor'KF-SPILLWAY.TheWorld:PersistentLevel.CameraActor_0'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=9408
   ObjPosY=-9488
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_224"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqEvent_LevelLoaded Name=SeqEvent_LevelLoaded_2
   MaxWidth=136
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_Delay'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=-8411,OverrideDelta=14)
   OutputLinks(1)=(Links=((LinkedOp=SeqAct_Interp'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_Delay'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=-8390,OverrideDelta=35)
   OutputLinks(2)=(Links=((LinkedOp=SeqAct_Interp'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_1'),(LinkedOp=SeqAct_Delay'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Delay_0')),DrawY=-8369,OverrideDelta=56)
   ObjInstanceVersion=3
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9728
   ObjPosY=-8480
   DrawWidth=137
   Name="SeqEvent_LevelLoaded_2"
   ObjectArchetype=SeqEvent_LevelLoaded'Engine.Default__SeqEvent_LevelLoaded'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_1
   bLooping=True
   InputLinks(0)=(DrawY=-8394,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8372,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8350,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8328,OverrideDelta=81)
   InputLinks(4)=(DrawY=-8306,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8378,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8322,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_1'),DrawX=-9380,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_11'),LinkDesc="Buoy",MinVars=0,DrawX=-9332,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-8432
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_1"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=InterpData Name=InterpData_1
   Begin Object Class=InterpCurveEdSetup Name=InterpCurveEdSetup_0
      Name="InterpCurveEdSetup_0"
      ObjectArchetype=InterpCurveEdSetup'Engine.Default__InterpCurveEdSetup'
   End Object
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=16.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.000000,Y=24.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=0.000000,Y=24.000000,Z=16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=16.000000,Z=-8.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.006006),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.006006),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.000000,Y=16.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=8.000000,Y=8.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=8.000000,Y=8.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=8.000000,Y=8.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-5.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,ArriveTangent=(X=5.625000,Y=0.000000,Z=0.000000),LeaveTangent=(X=5.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=5.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=0.000000,Y=0.000000,Z=-5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,ArriveTangent=(X=0.000000,Y=0.000000,Z=5.625000),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=2.000000),(Time=3.000000),(Time=4.000000),(Time=5.000000),(Time=6.000000),(Time=7.000000),(Time=8.000000),(Time=9.000000),(Time=10.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0.InterpTrackMove_0'
      GroupName="Buoy"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=10.000000
   InterpGroups(0)=InterpGroup'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpGroup_0'
   CurveEdSetup=InterpCurveEdSetup'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_1.InterpCurveEdSetup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=10.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-8232
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_1"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_11
   ObjValue=InterpActor'KF-SPILLWAY.TheWorld:PersistentLevel.InterpActor_11'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9332
   ObjPosY=-8275
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_11"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=InterpData Name=InterpData_0
   Begin Object Class=InterpGroup Name=InterpGroup_0
      Begin Object Class=InterpTrackMove Name=InterpTrackMove_0
         PosTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,OutVal=(X=0.000000,Y=16.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=0.000000,Y=24.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,OutVal=(X=0.000000,Y=24.000000,Z=16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=0.000000,Y=16.000000,Z=-8.000000),ArriveTangent=(X=0.000000,Y=0.000000,Z=-14.006006),LeaveTangent=(X=0.000000,Y=0.000000,Z=-14.006006),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,OutVal=(X=0.000000,Y=16.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=8.000000,Y=8.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,OutVal=(X=8.000000,Y=8.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=8.000000,Y=8.000000,Z=-16.000000),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped)))
         EulerTrack=(Points=((InterpMode=CIM_CurveAutoClamped),(InVal=1.000000,InterpMode=CIM_CurveAutoClamped),(InVal=2.000000,InterpMode=CIM_CurveAutoClamped),(InVal=3.000000,OutVal=(X=-5.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=4.000000,ArriveTangent=(X=5.625000,Y=0.000000,Z=0.000000),LeaveTangent=(X=5.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=5.000000,OutVal=(X=5.625000,Y=0.000000,Z=0.000000),InterpMode=CIM_CurveAutoClamped),(InVal=6.000000,InterpMode=CIM_CurveAutoClamped),(InVal=7.000000,OutVal=(X=0.000000,Y=0.000000,Z=-5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=8.000000,ArriveTangent=(X=0.000000,Y=0.000000,Z=5.625000),LeaveTangent=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=9.000000,OutVal=(X=0.000000,Y=0.000000,Z=5.625000),InterpMode=CIM_CurveAutoClamped),(InVal=10.000000,InterpMode=CIM_CurveAutoClamped)))
         LookupTrack=(Points=(,(Time=1.000000),(Time=2.000000),(Time=3.000000),(Time=4.000000),(Time=5.000000),(Time=6.000000),(Time=7.000000),(Time=8.000000),(Time=9.000000),(Time=10.000000)))
         MoveFrame=IMF_RelativeToInitial
         Name="InterpTrackMove_0"
         ObjectArchetype=InterpTrackMove'Engine.Default__InterpTrackMove'
      End Object
      InterpTracks(0)=InterpTrackMove'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0.InterpTrackMove_0'
      GroupName="Buoy"
      GroupColor=(B=0,G=84,R=221,A=255)
      Name="InterpGroup_0"
      ObjectArchetype=InterpGroup'Engine.Default__InterpGroup'
   End Object
   InterpLength=10.000000
   InterpGroups(0)=InterpGroup'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_0.InterpGroup_0'
   SelectedFilter=InterpFilter'Engine.Default__InterpData:FilterAll'
   EdSectionEnd=10.000000
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-7920
   DrawWidth=32
   DrawHeight=32
   Name="InterpData_0"
   ObjectArchetype=InterpData'Engine.Default__InterpData'
End Object

Begin Object Class=SeqAct_Interp Name=SeqAct_Interp_0
   bLooping=True
   InputLinks(0)=(DrawY=-8082,OverrideDelta=15)
   InputLinks(1)=(DrawY=-8060,OverrideDelta=37)
   InputLinks(2)=(DrawY=-8038,OverrideDelta=59)
   InputLinks(3)=(DrawY=-8016,OverrideDelta=81)
   InputLinks(4)=(DrawY=-7994,OverrideDelta=103)
   OutputLinks(0)=(DrawY=-8066,OverrideDelta=31)
   OutputLinks(1)=(DrawY=-8010,OverrideDelta=87)
   VariableLinks(0)=(LinkedVariables=(InterpData'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.InterpData_0'),DrawX=-9380,OverrideDelta=37)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=(SeqVar_Object'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqVar_Object_15'),LinkDesc="Buoy",MinVars=0,DrawX=-9332,OverrideDelta=84)
   ObjInstanceVersion=2
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9432
   ObjPosY=-8120
   DrawWidth=154
   DrawHeight=157
   Name="SeqAct_Interp_0"
   ObjectArchetype=SeqAct_Interp'Engine.Default__SeqAct_Interp'
End Object

Begin Object Class=SeqVar_Object Name=SeqVar_Object_15
   ObjValue=InterpActor'KF-SPILLWAY.TheWorld:PersistentLevel.InterpActor_5'
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9364
   ObjPosY=-7943
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Object_15"
   ObjectArchetype=SeqVar_Object'Engine.Default__SeqVar_Object'
End Object

Begin Object Class=SeqAct_Delay Name=SeqAct_Delay_0
   Duration=0.500000
   InputLinks(0)=(DrawY=-8147,OverrideDelta=14)
   InputLinks(1)=(DrawY=-8126,OverrideDelta=35)
   InputLinks(2)=(DrawY=-8105,OverrideDelta=56)
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_Interp'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence.SeqAct_Interp_0')),DrawY=-8142,OverrideDelta=19)
   OutputLinks(1)=(DrawY=-8110,OverrideDelta=51)
   VariableLinks(0)=(DrawX=-9524,OverrideDelta=25)
   ObjInstanceVersion=1
   ParentSequence=Sequence'KF-SPILLWAY.TheWorld:PersistentLevel.Main_Sequence'
   ObjPosX=-9576
   ObjPosY=-8184
   DrawWidth=106
   DrawHeight=109
   Name="SeqAct_Delay_0"
   ObjectArchetype=SeqAct_Delay'Engine.Default__SeqAct_Delay'
End Object
